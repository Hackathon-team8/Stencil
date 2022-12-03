#include <iostream>
#include <assert.h>
#include <vector>
#include <math.h>
#include <sys/time.h>
#include <cstdlib>
#include <arm_sve.h>
#include <omp.h>

using namespace std;

typedef unsigned long long ui64;

static struct timezone tz;
static struct timeval  tv;



double
dml_micros()
{
        gettimeofday(&tv,&tz);
        return((tv.tv_sec*1000000.0)+tv.tv_usec);
}

static const ui64 order = 8;

ui64 DIMX, DIMY, DIMZ, iters;
ui64 MAXX, MAXY, MAXZ;
ui64 xyplane, MATsize;

vector<double> power_17;
vector<size_t> vDIMXYZ;

// retourne un offset dans le centre de la matrice les dimensions sont [0..DIM-1]
inline
ui64 DIMXYZ(ui64 x,ui64 y,ui64 z){
        return((z+8)*xyplane+(y+8)*MAXX+x+8);
}

// retourne un offset dans la matrice les dimensions sont [-order..DIM+order-1] mais en indices de [0..DIM+2*order-1]
inline
ui64 MATXYZ(ui64 x,ui64 y,ui64 z){
        return(x+ y*MAXX+z*xyplane);
}
double *__restrict matA;
double *__restrict matB;
double *__restrict matC;


void init()
{

        // l initialisation ne fait pas partie de l exercise , elle peut etre optimisee mais n est pas mesuree car elle remplie de facon artificielle les matrices
        // les donnees n influent pas sur la performance
	//
	const size_t s = MATsize * sizeof(double);
        // dynamically allocate memory of size DIMX*DIMY*DIMZ+ghost region on 6 faces
        matA = (double*)aligned_alloc(64,s);
        assert( matA!=NULL);
        matB = (double*)aligned_alloc(64,s);
        assert( matB!=NULL);
        matC = (double*)aligned_alloc(64,s);
        assert( matC!=NULL);

        power_17.push_back(1.0);
        for(unsigned int i = 1; i <= order; ++i)
                power_17.push_back(power_17[i-1] * 17);

        for (ui64 z = 0; z < DIMZ; ++z) {
                for (ui64 y = 0; y < DIMY; ++y){
                        for (ui64 x = 0; x < DIMX; ++x){
                                vDIMXYZ.push_back(DIMXYZ(x,y,z));

                                vDIMXYZ.push_back(DIMXYZ(x+1,y,z)); vDIMXYZ.push_back(DIMXYZ(x-1,y,z));
                                vDIMXYZ.push_back(DIMXYZ(x,y+1,z)); vDIMXYZ.push_back(DIMXYZ(x,y-1,z));
                                vDIMXYZ.push_back(DIMXYZ(x,y,z+1)); vDIMXYZ.push_back(DIMXYZ(x,y,z-1));

                                vDIMXYZ.push_back(DIMXYZ(x+2,y,z)); vDIMXYZ.push_back(DIMXYZ(x-2,y,z));
                                vDIMXYZ.push_back(DIMXYZ(x,y+2,z)); vDIMXYZ.push_back(DIMXYZ(x,y-2,z));
                                vDIMXYZ.push_back(DIMXYZ(x,y,z+2)); vDIMXYZ.push_back(DIMXYZ(x,y,z-2));

                                vDIMXYZ.push_back(DIMXYZ(x+3,y,z)); vDIMXYZ.push_back(DIMXYZ(x-3,y,z));
                                vDIMXYZ.push_back(DIMXYZ(x,y+3,z)); vDIMXYZ.push_back(DIMXYZ(x,y-3,z));
                                vDIMXYZ.push_back(DIMXYZ(x,y,z+3)); vDIMXYZ.push_back(DIMXYZ(x,y,z-3));

                                vDIMXYZ.push_back(DIMXYZ(x+4,y,z)); vDIMXYZ.push_back(DIMXYZ(x-4,y,z));
                                vDIMXYZ.push_back(DIMXYZ(x,y+4,z)); vDIMXYZ.push_back(DIMXYZ(x,y-4,z));
                                vDIMXYZ.push_back(DIMXYZ(x,y,z+4)); vDIMXYZ.push_back(DIMXYZ(x,y,z-4));

                                vDIMXYZ.push_back(DIMXYZ(x+5,y,z)); vDIMXYZ.push_back(DIMXYZ(x-5,y,z));
                                vDIMXYZ.push_back(DIMXYZ(x,y+5,z)); vDIMXYZ.push_back(DIMXYZ(x,y-5,z));
                                vDIMXYZ.push_back(DIMXYZ(x,y,z+5)); vDIMXYZ.push_back(DIMXYZ(x,y,z-5));

                                vDIMXYZ.push_back(DIMXYZ(x+6,y,z)); vDIMXYZ.push_back(DIMXYZ(x-6,y,z));
                                vDIMXYZ.push_back(DIMXYZ(x,y+6,z)); vDIMXYZ.push_back(DIMXYZ(x,y-6,z));
                                vDIMXYZ.push_back(DIMXYZ(x,y,z+6)); vDIMXYZ.push_back(DIMXYZ(x,y,z-6));

                                vDIMXYZ.push_back(DIMXYZ(x+7,y,z)); vDIMXYZ.push_back(DIMXYZ(x-7,y,z));
                                vDIMXYZ.push_back(DIMXYZ(x,y+7,z)); vDIMXYZ.push_back(DIMXYZ(x,y-7,z));
                                vDIMXYZ.push_back(DIMXYZ(x,y,z+7)); vDIMXYZ.push_back(DIMXYZ(x,y,z-7));

                                vDIMXYZ.push_back(DIMXYZ(x+8,y,z)); vDIMXYZ.push_back(DIMXYZ(x-8,y,z));
                                vDIMXYZ.push_back(DIMXYZ(x,y+8,z)); vDIMXYZ.push_back(DIMXYZ(x,y-8,z));
                                vDIMXYZ.push_back(DIMXYZ(x,y,z+8)); vDIMXYZ.push_back(DIMXYZ(x,y,z-8));
                        }
                }
        }
        // Initialisation centre et bords
        // Les matrices A et C sont mises a zero
        // A en la matrice d emtree et C la matrice de sortie
        // La matrice B est un stencil constant pour le run
#pragma omp parallel 
	{
                omp_set_dynamic(0);
                const int n_threads = omp_get_num_threads();
                omp_set_num_threads(n_threads);

                #pragma omp for schedule(guided) // test with guided
	for (ui64 z = 0; z < MAXZ; ++z) {
                for (ui64 y = 0; y < MAXY; ++y){
                        for (ui64 x = 0; x < MAXX; ++x){
                                matA[MATXYZ(x,y,z)] = 0.0;
                                matC[MATXYZ(x,y,z)] = 0.0;
                                matB[MATXYZ(x,y,z)] = sin(z*cos(x+0.311)*cos(y+.817)+.613);
                        }
                }
        }
        // Initialisation centre de A qui est la matrice de data
#pragma omp for schedule(guided)
	for (ui64 z = 0; z < DIMZ; ++z) {
                for (ui64 y = 0; y < DIMY; ++y){
                        for (ui64 x = 0; x < DIMX; ++x){
                                matA[DIMXYZ(x,y,z)] = 1.0;
                        }
                }
        }
	}

}

void one_iteration()
{
#pragma omp parallel
        {       
                omp_set_dynamic(0);
                const int n_threads = omp_get_num_threads();
                omp_set_num_threads(n_threads);
                const double val = power_17[1];
                const double val2 = power_17[2];
                const double val3 = power_17[3];
                const double val4 = power_17[4];
                const double val5 = power_17[5];
                const double val6 = power_17[6];
                const double val7 = power_17[7];
                const double val8 = power_17[8];
                ui64 forcond = vDIMXYZ.size();
                #pragma omp for schedule(dynamic, 1) // test with guided
                for (ui64 i = 0; i < forcond; i+= 49) {
                        const ui64 xyz = vDIMXYZ[i];
                        matC[xyz] = matA[vDIMXYZ[i]]*matB[vDIMXYZ[i]] ;
                        matC[xyz]+= (matA[vDIMXYZ[i+1]]*matB[vDIMXYZ[i+1]] + matA[vDIMXYZ[i+2]]*matB[vDIMXYZ[i+2]] + matA[vDIMXYZ[i+3]]*matB[vDIMXYZ[i+3]] + matA[vDIMXYZ[i+4]]*matB[vDIMXYZ[i+4]] + matA[vDIMXYZ[i+5]]*matB[vDIMXYZ[i+5]] + matA[vDIMXYZ[i+6]]*matB[vDIMXYZ[i+6]]) / val;
                        matC[xyz]+= (matA[vDIMXYZ[i+7]]*matB[vDIMXYZ[i+7]]+ matA[vDIMXYZ[i+8]]*matB[vDIMXYZ[i+8]] + matA[vDIMXYZ[i+9]]*matB[vDIMXYZ[i+9]]+ matA[vDIMXYZ[i+10]]*matB[vDIMXYZ[i+10]]+ matA[vDIMXYZ[i+11]]*matB[vDIMXYZ[i+11]]+ matA[vDIMXYZ[i+12]]*matB[vDIMXYZ[i+12]]) / val2;
                        matC[xyz]+= (matA[vDIMXYZ[i+13]]*matB[vDIMXYZ[i+13]] + matA[vDIMXYZ[i+14]]*matB[vDIMXYZ[i+14]] + matA[vDIMXYZ[i+15]]*matB[vDIMXYZ[i+15]] + matA[vDIMXYZ[i+16]]*matB[vDIMXYZ[i+16]] + matA[vDIMXYZ[i+17]]*matB[vDIMXYZ[i+17]] + matA[vDIMXYZ[i+18]]*matB[vDIMXYZ[i+18]]) / val3;
			matC[xyz]+= (matA[vDIMXYZ[i+19]]*matB[vDIMXYZ[i+19]] + matA[vDIMXYZ[i+20]]*matB[vDIMXYZ[i+20]] + matA[vDIMXYZ[i+21]]*matB[vDIMXYZ[i+21]] + matA[vDIMXYZ[i+22]]*matB[vDIMXYZ[i+22]] + matA[vDIMXYZ[i+23]]*matB[vDIMXYZ[i+23]] + matA[vDIMXYZ[i+24]]*matB[vDIMXYZ[i+24]]) / val4;
			matC[xyz]+= (matA[vDIMXYZ[i+25]]*matB[vDIMXYZ[i+25]] + matA[vDIMXYZ[i+26]]*matB[vDIMXYZ[i+26]] + matA[vDIMXYZ[i+27]]*matB[vDIMXYZ[i+27]] + matA[vDIMXYZ[i+28]]*matB[vDIMXYZ[i+28]] + matA[vDIMXYZ[i+29]]*matB[vDIMXYZ[i+29]] + matA[vDIMXYZ[i+30]]*matB[vDIMXYZ[i+30]]) / val5;
	                matC[xyz]+= (matA[vDIMXYZ[i+31]]*matB[vDIMXYZ[i+31]] + matA[vDIMXYZ[i+32]]*matB[vDIMXYZ[i+32]] + matA[vDIMXYZ[i+33]]*matB[vDIMXYZ[i+33]] + matA[vDIMXYZ[i+34]]*matB[vDIMXYZ[i+34]] + matA[vDIMXYZ[i+35]]*matB[vDIMXYZ[i+35]] + matA[vDIMXYZ[i+36]]*matB[vDIMXYZ[i+36]]) / val6;
		        matC[xyz]+= (matA[vDIMXYZ[i+37]]*matB[vDIMXYZ[i+37]] + matA[vDIMXYZ[i+38]]*matB[vDIMXYZ[i+38]] + matA[vDIMXYZ[i+39]]*matB[vDIMXYZ[i+39]] + matA[vDIMXYZ[i+40]]*matB[vDIMXYZ[i+40]] + matA[vDIMXYZ[i+41]]*matB[vDIMXYZ[i+41]] + matA[vDIMXYZ[i+42]]*matB[vDIMXYZ[i+42]]) / val7;
			matC[xyz]+= (matA[vDIMXYZ[i+43]]*matB[vDIMXYZ[i+43]] + matA[vDIMXYZ[i+44]]*matB[vDIMXYZ[i+44]] + matA[vDIMXYZ[i+45]]*matB[vDIMXYZ[i+45]] + matA[vDIMXYZ[i+46]]*matB[vDIMXYZ[i+46]] + matA[vDIMXYZ[i+47]]*matB[vDIMXYZ[i+47]] + matA[vDIMXYZ[i+48]]*matB[vDIMXYZ[i+48]]) / val8;
                }
                // A=C
                #pragma omp for schedule(dynamic, 1) // test with guided
                for(ui64 z = 0; z < DIMZ; z++)
		{
			for(ui64 y = 0; y < DIMY; y++)
			{
				for (ui64 x = 0; x < DIMX; ++x){
                  			matA[DIMXYZ(x,y,z)] = matC[DIMXYZ(x,y,z)];
                		}
			}
		}
         }
}

int main(const int argc,char **argv)
{
        try {
                DIMX  = std::stoi(argv[1]);
                DIMY  = std::stoi(argv[2]);
                DIMZ  = std::stoi(argv[3]);
                iters = std::stoi(argv[4]);
                MAXX=DIMX+2*order;
                MAXY=DIMY+2*order;
                MAXZ=DIMZ+2*order;
                xyplane=MAXX*MAXY;
                MATsize=MAXX*MAXY*MAXZ;
        }

        catch (...) {
                cout << argv[0] << " siseX sizeY sizeZ iters" << endl;
                return -1;
        }

	init();

        //phase1
        for (ui64 i = 0; i < iters; ++i) {
                // calcule 1 iteration Jacobi   C=B@A
                double t1=dml_micros();
                one_iteration();
                double t2=dml_micros();
                printf("_0_ ");
                for(ui64 i=0;i<5;i++)printf(" %18.15lf",matA[DIMXYZ(DIMX/2+i,DIMY/2+i,DIMZ/2+i)]);
                double ns_point=(t2-t1)*1000.0/DIMX/DIMY/DIMZ;
                printf("  %10.0lf  %10.3lf %lld %lld %lld\n",t2-t1,ns_point,DIMX,DIMY,DIMZ);
        }

        free(matA);
        free(matB);
        free(matC);

        return 0;

}

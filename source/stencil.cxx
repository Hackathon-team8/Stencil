#include <iostream>
#include <assert.h>
#include <vector>
#include <math.h>
#include <sys/time.h>
#include <cstdlib>

#include <omp.h>

using namespace std;

typedef unsigned long long ui64;

static struct timezone tz;
static struct timeval  tv;

#define BS 20

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

// retourne un offset dans le centre de la matrice les dimensions sont [0..DIM-1]
inline
ui64 DIMXYZ(ui64 x,ui64 y,ui64 z){
        return((z+order)*xyplane+(y+order)*MAXX+x+order);
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
	size_t s = MATsize * sizeof(double);
	size_t r = s%64;

	if(r)
		s+= 64-r;
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

        // Initialisation centre et bords
        // Les matrices A et C sont mises a zero
        // A en la matrice d emtree et C la matrice de sortie
        // La matrice B est un stencil constant pour le run
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
        for (ui64 z = 0; z < DIMZ; ++z) {
                for (ui64 y = 0; y < DIMY; ++y){
                        for (ui64 x = 0; x < DIMX; ++x){
                                matA[DIMXYZ(x,y,z)] = 1.0;
                        }
                }
        }

}

inline void compute(const ui64 x,
                    const ui64 y, 
                    const ui64 z,
                    const ui64 o){
			const double val = power_17[o];
                        matC[DIMXYZ(x,y,z)]+= matA[DIMXYZ(x+o,y,z)]*matB[DIMXYZ(x+o,y,z)] / val;
                        matC[DIMXYZ(x,y,z)]+= matA[DIMXYZ(x-o,y,z)]*matB[DIMXYZ(x-o,y,z)] / val;
                        matC[DIMXYZ(x,y,z)]+= matA[DIMXYZ(x,y+o,z)]*matB[DIMXYZ(x,y+o,z)] / val;
                        matC[DIMXYZ(x,y,z)]+= matA[DIMXYZ(x,y-o,z)]*matB[DIMXYZ(x,y-o,z)] / val;
                        matC[DIMXYZ(x,y,z)]+= matA[DIMXYZ(x,y,z+o)]*matB[DIMXYZ(x,y,z+o)] / val;
                        matC[DIMXYZ(x,y,z)]+= matA[DIMXYZ(x,y,z-o)]*matB[DIMXYZ(x,y,z-o)] / val;
                    }

void one_iteration()
{

const double val = power_17[1];
const double val2 = power_17[2];
const double val3 = power_17[3];
const double val4 = power_17[4];
const double val5 = power_17[5];
const double val6 = power_17[6];
const double val7 = power_17[7];
const double val8 = power_17[8];
#pragma omp parallel
        {       
                omp_set_dynamic(0);
                const int n_threads = omp_get_num_threads();
                omp_set_num_threads(n_threads);

                #pragma omp for schedule(dynamic, 1) // test with guided
                for (ui64 x = 0; x < DIMX; x+=BS) {
                        for (ui64 y = 0; y < DIMY; y+=BS){
                                for (ui64 z = 0; z < DIMZ; z+=BS){
					for(ui64 zz = z; zz < z+BS; ++zz)
					{
						for(ui64 yy = y; yy < y+BS; ++yy)
						{
							for(ui64 xx = x; xx < x+BS; ++xx)
							{
                                        			matC[DIMXYZ(xx,yy,zz)] = matA[DIMXYZ(xx,yy,zz)]*matB[DIMXYZ(xx,yy,zz)] ;
                        					matC[DIMXYZ(xx,yy,zz)]+= matA[DIMXYZ(xx+1,yy,zz)]*matB[DIMXYZ(xx+1,yy,zz)] / val +  matA[DIMXYZ(xx-1,yy,zz)]*matB[DIMXYZ(xx-1,yy,zz)] / val + matA[DIMXYZ(xx,yy+1,zz)]*matB[DIMXYZ(xx,yy+1,zz)] / val + matA[DIMXYZ(xx,yy-1,zz)]*matB[DIMXYZ(xx,yy-1,zz)] / val + matA[DIMXYZ(xx,yy,zz+1)]*matB[DIMXYZ(xx,yy,zz+1)] / val + matA[DIMXYZ(xx,yy,zz-1)]*matB[DIMXYZ(xx,yy,zz-1)] / val;
                        					matC[DIMXYZ(xx,yy,zz)]+= matA[DIMXYZ(xx+2,yy,zz)]*matB[DIMXYZ(xx+2,yy,zz)] / val2 +  matA[DIMXYZ(xx-2,yy,zz)]*matB[DIMXYZ(xx-2,yy,zz)] / val2 + matA[DIMXYZ(xx,yy+2,zz)]*matB[DIMXYZ(xx,yy+2,zz)] / val2 + matA[DIMXYZ(xx,yy-2,zz)]*matB[DIMXYZ(xx,yy-2,zz)] / val2 + matA[DIMXYZ(xx,yy,zz+2)]*matB[DIMXYZ(xx,yy,zz+2)] / val2 + matA[DIMXYZ(xx,yy,zz-2)]*matB[DIMXYZ(xx,yy,zz-2)] / val2;
                        					matC[DIMXYZ(xx,yy,zz)]+= matA[DIMXYZ(xx+3,yy,zz)]*matB[DIMXYZ(xx+3,yy,zz)] / val3 +  matA[DIMXYZ(xx-3,yy,zz)]*matB[DIMXYZ(xx-3,yy,zz)] / val3 + matA[DIMXYZ(xx,yy+3,zz)]*matB[DIMXYZ(xx,yy+3,zz)] / val3 + matA[DIMXYZ(xx,yy-3,zz)]*matB[DIMXYZ(xx,yy-3,zz)] / val3 + matA[DIMXYZ(xx,yy,zz+3)]*matB[DIMXYZ(xx,yy,zz+3)] / val3 + matA[DIMXYZ(xx,yy,zz-3)]*matB[DIMXYZ(xx,yy,zz-3)] / val3;
                        					matC[DIMXYZ(xx,yy,zz)]+= matA[DIMXYZ(xx+4,yy,zz)]*matB[DIMXYZ(xx+4,yy,zz)] / val4 +  matA[DIMXYZ(xx-4,yy,zz)]*matB[DIMXYZ(xx-4,yy,zz)] / val4 + matA[DIMXYZ(xx,yy+4,zz)]*matB[DIMXYZ(xx,yy+4,zz)] / val4 + matA[DIMXYZ(xx,yy-4,zz)]*matB[DIMXYZ(xx,yy-4,zz)] / val4 + matA[DIMXYZ(xx,yy,zz+4)]*matB[DIMXYZ(xx,yy,zz+4)] / val4 + matA[DIMXYZ(xx,yy,zz-4)]*matB[DIMXYZ(xx,yy,zz-4)] / val4;
                        					matC[DIMXYZ(xx,yy,zz)]+= matA[DIMXYZ(xx+5,yy,zz)]*matB[DIMXYZ(xx+5,yy,zz)] / val5 +  matA[DIMXYZ(xx-5,yy,zz)]*matB[DIMXYZ(xx-5,yy,zz)] / val5 + matA[DIMXYZ(xx,yy+5,zz)]*matB[DIMXYZ(xx,yy+5,zz)] / val5 + matA[DIMXYZ(xx,yy-5,zz)]*matB[DIMXYZ(xx,yy-5,zz)] / val5 + matA[DIMXYZ(xx,yy,zz+5)]*matB[DIMXYZ(xx,yy,zz+5)] / val5 + matA[DIMXYZ(xx,yy,zz-5)]*matB[DIMXYZ(xx,yy,zz-5)] / val5;
                        					matC[DIMXYZ(xx,yy,zz)]+= matA[DIMXYZ(xx+6,yy,zz)]*matB[DIMXYZ(xx+6,yy,zz)] / val6 +  matA[DIMXYZ(xx-6,yy,zz)]*matB[DIMXYZ(xx-6,yy,zz)] / val6 + matA[DIMXYZ(xx,yy+6,zz)]*matB[DIMXYZ(xx,yy+6,zz)] / val6 + matA[DIMXYZ(xx,yy-6,zz)]*matB[DIMXYZ(xx,yy-6,zz)] / val6 + matA[DIMXYZ(xx,yy,zz+6)]*matB[DIMXYZ(xx,yy,zz+6)] / val6 + matA[DIMXYZ(xx,yy,zz-6)]*matB[DIMXYZ(xx,yy,zz-6)] / val6;
                        					matC[DIMXYZ(xx,yy,zz)]+= matA[DIMXYZ(xx+7,yy,zz)]*matB[DIMXYZ(xx+7,yy,zz)] / val7 +  matA[DIMXYZ(xx-7,yy,zz)]*matB[DIMXYZ(xx-7,yy,zz)] / val7 + matA[DIMXYZ(xx,yy+7,zz)]*matB[DIMXYZ(xx,yy+7,zz)] / val7 + matA[DIMXYZ(xx,yy-7,zz)]*matB[DIMXYZ(xx,yy-7,zz)] / val7 + matA[DIMXYZ(xx,yy,zz+7)]*matB[DIMXYZ(xx,yy,zz+7)] / val7 + matA[DIMXYZ(xx,yy,zz-7)]*matB[DIMXYZ(xx,yy,zz-7)] / val7;
                        					matC[DIMXYZ(xx,yy,zz)]+= matA[DIMXYZ(xx+8,yy,zz)]*matB[DIMXYZ(xx+8,yy,zz)] / val8 +  matA[DIMXYZ(xx-8,yy,zz)]*matB[DIMXYZ(xx-8,yy,zz)] / val8 + matA[DIMXYZ(xx,yy+8,zz)]*matB[DIMXYZ(xx,yy+8,zz)] / val8 + matA[DIMXYZ(xx,yy-8,zz)]*matB[DIMXYZ(xx,yy-8,zz)] / val8 + matA[DIMXYZ(xx,yy,zz+8)]*matB[DIMXYZ(xx,yy,zz+8)] / val8 + matA[DIMXYZ(xx,yy,zz-8)]*matB[DIMXYZ(xx,yy,zz-8)] / val8;
						}
					}
                                }
                        }
                }
		}
                //  A=C
                #pragma omp for schedule(dynamic, 1) // test with guided
                for (ui64 z = 0; z < DIMZ; ++z) {
                        for (ui64 y = 0; y < DIMY; ++y){
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

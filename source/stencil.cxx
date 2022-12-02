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
#pragma omp parallel
        {       
                omp_set_dynamic(0);
                const int n_threads = omp_get_num_threads();
                omp_set_num_threads(n_threads);

                #pragma omp for schedule(dynamic, 1) // test with guided
                for (ui64 z = 0; z < DIMZ; z+=BS) {
                        for (ui64 y = 0; y < DIMY; y+=BS){
                                for (ui64 x = 0; x < DIMX; x+=BS){
					for(ui64 zz = 0; zz < BS; ++zz)
					{
						for(ui64 yy = 0; yy < BS; ++yy)
						{
							for(ui64 xx = 0; xx < BS; ++xx)
							{
                                        			matC[DIMXYZ(xx,yy,zz)] = matA[DIMXYZ(xx,yy,zz)]*matB[DIMXYZ(xx,yy,zz)] ;
								compute(xx, yy, zz, 4);
                        					matC[DIMXYZ(x,y,z)]+= matA[DIMXYZ(x+1,y,z)]*matB[DIMXYZ(x+1,y,z)] / val +  matA[DIMXYZ(x-1,y,z)]*matB[DIMXYZ(x-1,y,z)] / val + matA[DIMXYZ(x,y+1,z)]*matB[DIMXYZ(x,y+1,z)] / val + matA[DIMXYZ(x,y-1,z)]*matB[DIMXYZ(x,y-1,z)] / val matA[DIMXYZ(x,y,z+1)]*matB[DIMXYZ(x,y,z+1)] / val + matA[DIMXYZ(x,y,z-1)]*matB[DIMXYZ(x,y,z-1)] / val;
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

#include <iostream>
#include <fstream>
#include <iomanip>
#include <cstdio>
#include <ctime>
#include <cstdlib>
#include <cstring>


using namespace std;
#define POP_SIZE 10

int main(int argc, char *argv[]){
    argc=4;
ifstream inputfile (argv[1]);
char protein[3000][3000];
char buffer[6000];

if (!inputfile){
    cout<<"Unable to open the file!\n"<<endl;
    exit(1);
}

int rnaseq[6000][6000];
int n=0,m=POP_SIZE,j=0;
while (!inputfile.eof())
{
    inputfile.getline (buffer,6000);
    int b=strlen(buffer);
	for (int i=0;i<m;i++)
    {
		for (int k=n;k<n+b;k++)
		{
			rnaseq[i][k]=buffer[k-n];
		}
	}
	n=n+b;
}
cout<<"Base Numbers:"<<n<<"\t"<<"Amino Acid Numbers:"<<n/3<<endl;

srand ((unsigned)time(NULL));
double random=0;
for (int i=1;i<m;i++)
{
    for (int k=0;k<n;k++)
    {
        random=(double)(rand()%1000)/1000;
        if (random<0.001)
        {
            int ran=rand()%3;
            if (rnaseq[i][k]==65||rnaseq[i][k]==97)
            {
                if (ran==0) rnaseq[i][k]+=2;
                else if (ran==1) rnaseq[i][k]+=6;
                else if (ran==2) rnaseq[i][k]+=19;
            }
            else if (rnaseq[i][k]==67||rnaseq[i][k]==99)
            {
                if (ran==0) rnaseq[i][k]+=4;
                else if (ran==1) rnaseq[i][k]+=17;
                else if (ran==2) rnaseq[i][k]-=2;
            }
            else if (rnaseq[i][k]==71||rnaseq[i][k]==103)
            {
                if (ran==0) rnaseq[i][k]+=13;
                else if (ran==1) rnaseq[i][k]-=6;
                else if (ran==2) rnaseq[i][k]-=4;
            }
            else if (rnaseq[i][k]==84||rnaseq[i][k]==116)
            {
                if (ran==0) rnaseq[i][k]-=19;
                else if (ran==1) rnaseq[i][k]-=17;
                else if (ran==2) rnaseq[i][k]-=13;
            }
        }
    }
}

ofstream rnafile(argv[2],ios::out);
for (int i=0;i<m;i++)
{
    for (int k=0;k<n;k++)
    {
        rnafile<<(char)rnaseq[i][k];
    }
    rnafile<<endl;
}


if (!(n%3))
{
    for (int i=0;i<m;i++)
    {
	for (int k=0,j=0;k<=n-3;k+=3,j++)
	{
	    if (rnaseq[i][k]==97||rnaseq[i][k]==65)
	    {
		if (rnaseq[i][k+1]==97||rnaseq[i][k+1]==65)
		{
		    if (rnaseq[i][k+2]==99||rnaseq[i][k+2]==67||rnaseq[i][k+2]==116||rnaseq[i][k+2]==84)
			protein[i][j]='N';
		    else if (rnaseq[i][k+2]==97||rnaseq[i][k+2]==65||rnaseq[i][k+2]==103||rnaseq[i][k+2]==71)
                        protein[i][j]='K';
		}
	    	else if (rnaseq[i][k+1]==99||rnaseq[i][k+1]==67) protein[i][j]='T';
	    	else if (rnaseq[i][k+1]==103||rnaseq[i][k+1]==71)
		{
                    if (rnaseq[i][k+2]==99||rnaseq[i][k+2]==67||rnaseq[i][k+2]==116||rnaseq[i][k+2]==84)
                        protein[i][j]='S';
                    else if (rnaseq[i][k+2]==97||rnaseq[i][k+2]==65||rnaseq[i][k+2]==103||rnaseq[i][k+2]==71)
                        protein[i][j]='R';
                }
                else if (rnaseq[i][k+1]==116||rnaseq[i][k+1]==84)
                {
                    if (rnaseq[i][k+2]==103||rnaseq[i][k+2]==71)
                        protein[i][j]='M';
                    else if (rnaseq[i][k+2]==97||rnaseq[i][k+2]==65||rnaseq[i][k+2]==99||rnaseq[i][k+2]==67||rnaseq[i][k+2]==116||rnaseq[i][k+2]==84)
                        protein[i][j]='I';
                }
            }
            else if (rnaseq[i][k]==99||rnaseq[i][k]==67)
            {
                if (rnaseq[i][k+1]==97||rnaseq[i][k+1]==65)
                {
                    if (rnaseq[i][k+2]==99||rnaseq[i][k+2]==67||rnaseq[i][k+2]==116||rnaseq[i][k+2]==84)
                        protein[i][j]='H';
                    else if (rnaseq[i][k+2]==97||rnaseq[i][k+2]==65||rnaseq[i][k+2]==103||rnaseq[i][k+2]==71)
                        protein[i][j]='Q';
                }
                else if (rnaseq[i][k+1]==99||rnaseq[i][k+1]==67) protein[i][j]='P';
                else if (rnaseq[i][k+1]==103||rnaseq[i][k+1]==71) protein[i][j]='R';
                else if (rnaseq[i][k+1]==116||rnaseq[i][k+1]==84) protein[i][j]='L';
            }
            else if (rnaseq[i][k]==103||rnaseq[i][k]==71)
            {
                if (rnaseq[i][k+1]==97||rnaseq[i][k+1]==65)
                {
                    if (rnaseq[i][k+2]==99||rnaseq[i][k+2]==67||rnaseq[i][k+2]==116||rnaseq[i][k+2]==84)
                        protein[i][j]='D';
                    else if (rnaseq[i][k+2]==97||rnaseq[i][k+2]==65||rnaseq[i][k+2]==103||rnaseq[i][k+2]==71)
                        protein[i][j]='E';
                }
                else if (rnaseq[i][k+1]==99||rnaseq[i][k+1]==67) protein[i][j]='A';
                else if (rnaseq[i][k+1]==103||rnaseq[i][k+1]==71) protein[i][j]='G';
                else if (rnaseq[i][k+1]==116||rnaseq[i][k+1]==84) protein[i][j]='V';
            }
            else if (rnaseq[i][k]==116||rnaseq[i][k]==84)
            {
                if (rnaseq[i][k+1]==99||rnaseq[i][k+1]==67) protein[i][j]='S';
                else if (rnaseq[i][k+1]==116||rnaseq[i][k+1]==84)
                {
                    if (rnaseq[i][k+2]==99||rnaseq[i][k+2]==67||rnaseq[i][k+2]==116||rnaseq[i][k+2]==84)
                        protein[i][j]='F';
                    else if (rnaseq[i][k+2]==97||rnaseq[i][k+2]==65||rnaseq[i][k+2]==103||rnaseq[i][k+2]==71)
                        protein[i][j]='L';
                }
                else if (rnaseq[i][k+1]==97||rnaseq[i][k+1]==65)
                {
                    if (rnaseq[i][k+2]==99||rnaseq[i][k+2]==67||rnaseq[i][k+2]==116||rnaseq[i][k+2]==84)
                        protein[i][j]='Y';
                    else if (rnaseq[i][k+2]==97||rnaseq[i][k+2]==65||rnaseq[i][k+2]==103||rnaseq[i][k+2]==71)
                        protein[i][j]='X';
                }
                else if (rnaseq[i][k+1]==103||rnaseq[i][k+1]==71)
                {
                    if (rnaseq[i][k+2]==99||rnaseq[i][k+2]==67||rnaseq[i][k+2]==116||rnaseq[i][k+2]==84)
                        protein[i][j]='C';
                    else if (rnaseq[i][k+2]==103||rnaseq[i][k+2]==71)
                        protein[i][j]='W';
                    else if (rnaseq[i][k+2]==97||rnaseq[i][k+2]==65)
                        protein[i][j]='X';
                }
            }
        }
    }
}

ofstream newfile(argv[3],ios::out);
for (int i=0;i<m;i++)
{
    for (j=0;j<n/3;j++)
    {
        newfile<<(char)protein[i][j];
    }
    newfile<<endl;
}
inputfile.close();
return 0;
}

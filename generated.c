#include<stdio.h>
#include<string.h>

void main()
{
int i,j,k;

 int A[2][3];
 int B[3][3];
 int C[2][3];
 int P[2][3];

 for (i=0;i<2;i++)
{
 for (j=0;j<3;j++)
{
 scanf("%d",&A[i][j]);
}
}

 for (i=0;i<3;i++)
{
 for (j=0;j<3;j++)
{
 scanf("%d",&B[i][j]);
}
}

 for (i=0;i<2;i++)
{
 for (j=0;j<3;j++)
{
 scanf("%d",&C[i][j]);
}
}

 for (i=0;i<2;i++)
{
 for (j=0;j<3;j++)
{
 C[i][j] = A[i][j] + C[i][j];
}
}

 for (i=0;i<2;i++)
{
 for (j=0;j<3;j++)
{
 for (k=0;j<3;j++)
{
 P[i][j] += A[i][k] * B[k][j];
}
}
}

 for (i=0;i<2;i++)
{
 for (j=0;j<3;j++)
{
 printf("%d",C[i][j]);
}printf("\n");
}

 for (i=0;i<2;i++)
{
 for (j=0;j<3;j++)
{
 printf("%d",P[i][j]);
}printf("\n");
}

}
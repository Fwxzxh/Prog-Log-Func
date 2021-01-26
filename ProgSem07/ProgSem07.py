import numpy as np
from itertools import permutations


def Fill():
    N = int(input("ingrese las dimenciones de la matriz, recuerede que la matriz es NxN: "))
    Mat = np.empty((N,N))
    print("ingrese la matriz elemento por elemento")
    for i in range(0,N):
        for j in range(0,N):
            Mat[i,j] = int(input())
    P = list(permutations(range(1,N+1)))
    print(Mat)
    return Mat,P

def Det(Mat,P):
    Mul=[]
    Elem=[]
    Per=[]
    Imat=[]
    suma=0
    for x in range(len(P)):#por cada Permutación
        for j in range(len(P[0])):#Por cada elemento de la Permutación
            Per.append(P[x][j])
    for _ in range(len(P)):
        for i in range(len(Mat[:,0])):#indices de la matriz
            Imat.append(i)
    for i in range(len(Imat)):
        x1=Imat[i]
        x2=Per[i]
        Elem.append(Mat[x1,x2-1])            #WOOOSH! magic :stars:
    sign = Sig(P)
    while len(Elem)!=0:
        buf=Elem.pop(0)
        buf=buf*Elem.pop(0)
        buf=buf*Elem.pop(0)
        Mul.append(buf)
    resp=list(map(lambda x,y : x*y,Mul,sign))
    for i in range(len(resp)):
        suma+=resp[i]
    return suma

def Sig(P):
    flag=True
    dx=0#num de pos
    cx=0#num de neg
    ax=2#num de la iteración
    sign=[]
    for _ in range(len(P)):
        if flag:
            sign.append(1)
            dx+=1
            if dx==ax/2:
                dx=0
                flag=False
        else:
            sign.append(-1)
            cx+=1
            if cx==ax/2:
                cx=0
                ax=ax+2
                flag=True
    return sign

#generar permutaciónes con del 1 a n, siendo una matriz de nxn
#Hacer la permutación de signos
#hacer los productos y las sumas
if __name__ == "__main__":
    Mat, P = Fill()
    print("El Deternante es: ")
    print(Det(Mat,P))

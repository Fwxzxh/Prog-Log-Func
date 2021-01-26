def Sintax(cadena):
    if len(cadena)%2 == 0:
        raise Exception("Error: expresión par")
    else:
        Stack(cadena)

def Stack(cadena):
    variables = []
    expreciones = []
    for i in range(len(cadena)):
        if i%2 == 0:
            variables.append(cadena[i])
        else:
            expreciones.append(cadena[i])
    evaluacion(variables,expreciones)

def evaluacion(variables,expreciones):
    num_Var = len(variables)
    expreciones.reverse()
    table = []
    respuestas = []
    ev = []
    while len(table) < num_Var:
        table.append([0]*(2**num_Var))
    table = fill(table,variables)
    print(table)
    for i in range(len(table[0])):#columnas
        cx=0
        iexp=0
        oper = expreciones.copy()
        for j in range(len(table)):#filas
            if cx==0:                       #Oh no!
                ev.append(table[j][i])
                cx+=1
            elif cx==1:
                ev.append(table[j][i])
                cx+=1
            if cx==2:
                res = switch(ev.pop(), ev.pop(), oper.pop())
                ev.append(res)
                iexp+=1
                cx=1
        respuestas.append(res)
    print(respuestas)

def fill(table, variables):         # BAD BAD BAD!!!!
    unos=int(2**len(table))
    for i in range(len(table)):             #fila
        ceros=1
        ceros0=0
        cx=0
        unos=int(unos/2)
        for j in range(len(table[0])):      #columna
            if variables[i].isupper():#TODO: pensar en una mejor manera
                if ceros0<=(unos-1):
                    ceros0=ceros0+1
                elif cx<=(unos-1):
                    table[i][j]=1
                    cx=cx+1
                else:
                    ceros0=1
                    cx=0
            else:
                if cx<=(unos-1):
                    table[i][j]=1
                    cx=cx+1
                elif ceros<=(unos-1):
                    ceros=ceros+1
                else:
                    ceros=1
                    cx=0
    return table

def switch(valorA,valorP,op):
    if op=='+':
        return valorA or valorP
    if op=='*':
        return valorA and valorP
    if op=='>':
        return False if valorA==1 and valorP==0 else True
    if op=='=':
        return valorA==valorP
    else:
        raise Exception("ERROR: operador lógico no identificado")

if __name__ == "__main__":
    exp = input("Ingrese la expreción\n")
    Sintax(exp)

def llenar():
    conjunto = input("ingrese los valores del conjunto separados por comas \n")
    conjunto = conjunto.split(',')
    for i in range(len(conjunto)):
        conjunto[i] = int(conjunto[i])
    return conjunto

def completar(e, t):
    for s in t:
        s += [e]
    return t

def conjuntoP(conjunto):
        if not conjunto: return [[]] #ty prolog
        e = conjunto[0]
        t = conjunto[1:]
        return conjuntoP(t) + completar(e, conjuntoP(t))

if __name__ == '__main__':
    print(conjuntoP(llenar()))

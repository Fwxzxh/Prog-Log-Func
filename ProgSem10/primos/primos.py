
def eratosthenes2(n):
    multiples = set()
    for i in range(2, n+1):
        if i not in multiples:
            yield i
            multiples.update(range(i*i, n+1, i))

if __name__=="__main__":
    print("Programa que calcula la Sierva de Erathostanes \n")
    n = input("Ingrese el número hasta el cual desea calcular los primos: ")
    print(list(eratosthenes2(int(n))))

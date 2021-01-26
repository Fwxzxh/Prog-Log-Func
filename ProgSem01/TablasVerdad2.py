from TablasVerdad1 import fill,switch

def Sintax(cadena):
    if len(cadena)%2 == 0:
        raise Exception("Error: expresión par")
    else:
        Stack(cadena)

if __name__ == "__main__":
    exp = input("Ingrese la expreción\n")
    Sintax(exp)

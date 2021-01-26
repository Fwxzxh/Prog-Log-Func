
resultado = ''

def read():
    entrada = ""
    buff = ""
    while (True):
        entrada = input()
        if entrada == '#':
            break
        buff += entrada+":"
    return buff

def analisis(exp):
    #iteramos sobre la lista de expresiones
    for i in exp:
        lexer(i)
        pass

def lexer(expresion):
    #buscamos que es Variable y evaluamos la matemaica
    pass

def start():
    entrada = read()
    expresiones = entrada.split(':')
    analisis(expresiones)

if __name__ == '__main__':
    start()

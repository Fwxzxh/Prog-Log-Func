import pygame
import numpy as np
import time

pygame.init()   #iniciamos el modulo

# propiedades de la pantalla
width, height = 1000, 1000
screen = pygame.display.set_mode((width, height))   # propiedades de la pantalla y el nombre de la pantalla
# color de fondo
bg = 25,25,25
screen.fill(bg)

nxC, nyC = 50, 50   # numero de celdas

# tamaño de celdas con respecto al numero de celdas
dimCW = width / nxC
dimCH = height / nyC

# creamos una matriz de 0 (celdas muertas) del tamaño de nuestra cuadricula
gameState = np.zeros((nxC, nyC))

#estado de pausa
pauseExect = False

# bucle de ejecucion
while 1:
    # creamos una copia del estado anterior en cada iteracción
    newGameState = np.copy(gameState)

    #limpiamos la pantalla en cada iteracion para que no se sobre ponga el estado anterior
    screen.fill(bg)
    time.sleep(0.1) # alentamos cada ejecucion para que no sea tan rapida

    #eventos de teclado y ratón.
    ev = pygame.event.get()

    for event in ev:
        if event.type == pygame.KEYDOWN:
            pauseExect = not pauseExect

        mouseClick = pygame.mouse.get_pressed()
        if sum(mouseClick) > 0:
            posX, posY = pygame.mouse.get_pos()
            celX, celY = int(np.floor(posX / dimCW)), int(np.floor(posY / dimCH))
            newGameState[celX, celY] = not mouseClick[2]

    for y in range(0, nxC):
        for x in range(0, nyC):
            if not pauseExect:

                # calculamos el numero de vecinos cercanos TODO: optimizar esto
                n_neigh =   gameState[(x-1) % nxC, (y-1) % nyC] + \
                            gameState[(x) % nxC, (y-1) % nyC] + \
                            gameState[(x+1) % nxC, (y-1) % nyC] + \
                            gameState[(x-1) % nxC, (y) % nyC] + \
                            gameState[(x+1) % nxC, (y) % nyC] + \
                            gameState[(x-1) % nxC, (y+1) % nyC] + \
                            gameState[(x) % nxC, (x+1) % nyC] + \
                            gameState[(x+1) % nxC, (y+1) % nyC]

                # TODO: revisar reglas, automata palo no funciona :c
                # regla 1: una célula muerta con exactamente 3 vecinas vivas "revive"
                if gameState[x, y] == 0 and n_neigh == 3:
                    newGameState[x, y] = 1

                # regla 2: una célula viva con menos de 2 o más de 3 vecinas vivas, "muere"
                elif gameState[x, y ] == 1 and (n_neigh < 2 or n_neigh > 3):
                    newGameState[x, y] = 0

            # creamos los poligonos para cada celda lamda
            poly = [
                ((x) * dimCW, (y) * dimCH),
                ((x+1) * dimCW, (y) * dimCH),
                ((x+1) * dimCW, (y+1) * dimCH),
                ((x) * dimCW, (y+1) * dimCH)
            ]

            # dibujamos cada celda para cada par de x,y
            if newGameState[x, y] == 0:
                pygame.draw.polygon(screen, (128,128,128), poly, 1)    # dibujamos los poligonos
            else:
                pygame.draw.polygon(screen, (255,255,255), poly, 0)    # ´ ´

    # Actualizamos el estado del juego
    gameState = np.copy(newGameState)

    pygame.display.flip()

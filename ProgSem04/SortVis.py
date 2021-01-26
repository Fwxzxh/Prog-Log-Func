import random
import os
import time
import matplotlib.pyplot as plt
import matplotlib.animation as animation

from Sort import *

if __name__=="__main__":
    N = int(input("Ingrese el numero de elementos a ordernar: "))
    metodo = input("Ingrese el método que desea: \n(b)ubble\n(i)nserción\n(m)erge \
        \n(q)uick\n(s)elección\n")

    A = [x + 1 for x in range(N)]
    random.seed(time.time())
    random.shuffle(A)

    if metodo == "b":
        title = "Bubble sort"
        generator = bubblesort(A)
    elif metodo == "i":
        title = "Insertion sort"
        generator = insertionsort(A)
    elif metodo == "m":
        title = "Merge sort"
        generator = mergesort(A, 0, N - 1)
    elif metodo == "q":
        title = "Quicksort"
        generator = quicksort(A, 0, N - 1)
    else:
        title = "Selection sort"
        generator = selectionsort(A)

    fig, ax = plt.subplots()
    ax.set_title(title)
    bar_rects = ax.bar(range(len(A)), A, align="edge")
    ax.set_xlim(0, N)
    ax.set_ylim(0, int(1.07 * N))
    text = ax.text(0.02, 0.95, "", transform=ax.transAxes)
    iteration = [0]

    def update_fig(A, rects, iteration):
        for rect, val in zip(rects, A):
            rect.set_height(val)
        iteration[0] += 1
        text.set_text("# of operations: {}".format(iteration[0]))

    anim = animation.FuncAnimation(fig, func=update_fig,
                                   fargs=(bar_rects, iteration), frames=generator, interval=1,
                                   repeat=False)
    plt.show()

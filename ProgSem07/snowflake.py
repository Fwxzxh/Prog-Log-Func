import turtle

def koch_curve(t, iterations, length, shortening_factor, angle):

  if iterations == 0:
    t.forward(length)
  else:
    iterations = iterations - 1
    length = length / shortening_factor

    koch_curve(t, iterations, length, shortening_factor, angle)
    t.left(angle)
    koch_curve(t, iterations, length, shortening_factor, angle)
    t.right(angle * 2)
    koch_curve(t, iterations, length, shortening_factor, angle)
    t.left(angle)
    koch_curve(t, iterations, length, shortening_factor, angle)

if __name__ == "__main__":
    n = int(input("Numero de iteraciones: "))
    t = turtle.Turtle()
    t.hideturtle()

    for i in range(3):
        koch_curve(t, n, 200, 3, 60)
        t.right(120)

    turtle.mainloop()

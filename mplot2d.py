#!/usr/bin/env python

"""Matplotlib 2D plotting example

Demonstrates plotting with matplotlib.
"""

import numpy as np
import matplotlib.pyplot as plt
import sys

from src.sym_sample import sample

from sympy import sqrt, Symbol
from sympy.core.compatibility import is_sequence
from sympy.external import import_module


def mplot2d(f, var, *, show=True):
    """
    Plot a 2d function using matplotlib/Tk.
    """

    import warnings
    warnings.filterwarnings("ignore", r"Could not match \S")

    if not is_sequence(f):
        f = [f, ]

    for f_i in f:
        x, y = sample(f_i, var)
        print(x)
        plt.plot(x, y)

    plt.show()


if __name__ == "__main__":
    x = Symbol('x')

    # mplot2d(log(x), (x, 0, 2, 100))
    # mplot2d([sin(x), -sin(x)], (x, float(-2*pi), float(2*pi), 50))
    mplot2d([sqrt(x), -sqrt(x), sqrt(-x), -sqrt(-x)], (x, -40.0, 40.0, 80))

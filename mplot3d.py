#!/usr/bin/env python

"""Matplotlib 3D plotting example

Demonstrates plotting with matplotlib.
"""

import numpy as np
import matplotlib.pyplot as plt
import sys

from src.sym_sample import sample
from src.base import plot3d

from sympy import Symbol
from sympy.external import import_module


def mplot3d(f, var1, var2, *, show=True):
    """
    Plot a 3d function using matplotlib/Tk.
    """

    import warnings
    warnings.filterwarnings("ignore", r"Could not match \S")

    p = import_module('pylab')
    # Try newer version first
    p3 = import_module('mpl_toolkits.mplot3d',
                       import_kwargs={'fromlist': ['something']}) or import_module('matplotlib.axes3d')
    if not p or not p3:
        sys.exit("Matplotlib is required to use mplot3d.")

    x, y, z = sample(f, var1, var2)

    obj = plot3d()

    # ax.plot_surface(x, y, z, rstride=2, cstride=2)
    obj.axs.plot_wireframe(x, y, z)
    obj.SavePng()


def main():
    x = Symbol('x')
    y = Symbol('y')

    mplot3d(x**2 - y**2, (x, -10.0, 10.0, 20), (y, -10.0, 10.0, 20))
    # mplot3d(x**2+y**2, (x, -10.0, 10.0, 20), (y, -10.0, 10.0, 20))
    # mplot3d(sin(x)+sin(y), (x, -3.14, 3.14, 10), (y, -3.14, 3.14, 10))


if __name__ == "__main__":
    main()

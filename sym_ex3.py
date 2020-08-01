import numpy as np
import matplotlib.pyplot as plt
import sympy as sym
import sys
import os
import time
from optparse import OptionParser

from sympy.plotting import plot
from sympy import symbols
from sympy import lambdify

sys.path.append(os.path.join("./"))
from src.base import plot2d

import logging
logging.getLogger('matplotlib').setLevel(logging.ERROR)

if __name__ == '__main__':
    argvs = sys.argv
    parser = OptionParser()
    parser.add_option("--dir", dest="dir", default="./")
    parser.add_option("--pxyz", dest="pxyz",
                      default=[0.0, 0.0, 0.0], type="float", nargs=3)
    opt, argc = parser.parse_args(argvs)
    print(opt, argc)

    x, a, b, c = sym.symbols("x a b c")
    f = a * x**2 + b * x + c

    args = (x, a, b, c)
    func = sym.lambdify(args, f, "numpy")

    xx = np.linspace(-1, 1, 100)

    obj = plot2d(aspect="auto")
    obj.axs.plot(xx, func(xx, 1, -0.5, 0), label="func1")
    obj.axs.plot(xx, func(xx, 2, +0.5, 0), label="func2")
    obj.axs.legend()
    obj.SavePng()

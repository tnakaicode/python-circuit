import numpy as np
import matplotlib.pyplot as plt
import sympy as sym
import sys
import os
import time
from optparse import OptionParser

from sympy.plotting import plot

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

    a, b, c, x, y = sym.symbols("a b c x y")
    f = sym.Function('f')
    g = sym.Function('g')
    expr = x**2 - 12 * x + 8

    print(expr)
    sym.plot(expr, (x, -20, 20))

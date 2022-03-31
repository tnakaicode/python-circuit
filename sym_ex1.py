import numpy as np
import matplotlib.pyplot as plt
import sympy as sym
import sys
import os
import time
import argparse

from sympy.plotting import plot

sys.path.append(os.path.join("./"))
from src.base import plot2d

import logging
logging.getLogger('matplotlib').setLevel(logging.ERROR)

if __name__ == '__main__':
    argvs = sys.argv
    parser = argparse.ArgumentParser()
    parser.add_argument("--dir", dest="dir", default="./")
    parser.add_argument("--pxyz", dest="pxyz",
                      default=[0.0, 0.0, 0.0], type="float", nargs=3)
    opt = parser.parse_args()
    print(opt, argvs)

    a, b, c, x, y = sym.symbols("a b c x y")
    f = sym.Function('f')
    g = sym.Function('g')
    expr = x**2 - 12 * x + 8

    print(expr)
    sym.plot(expr, (x, -20, 20))

import numpy as np
import matplotlib.pyplot as plt
import sympy as sym
import sys
import os
import time
import argparse

from sympy.plotting import plot
from sympy import symbols
from sympy import lambdify

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

    t = symbols('t')
    x = 0.05 * t + 0.2 / ((t - 5)**2 + 2)
    print(x)
    lam_x = lambdify(t, x, modules=['numpy'])
    print(lam_x)

    px = np.linspace(0, 10, 100)
    py = lam_x(px)

    obj = plot2d(aspect="auto")
    obj.axs.plot(px, py)
    obj.SavePng()

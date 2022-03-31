import numpy as np
import matplotlib.pyplot as plt
import sympy as sym
import sys
import os
import time
import argparse

sys.path.append(os.path.join("./"))
from src.base import plot2d

import logging
logging.getLogger('matplotlib').setLevel(logging.ERROR)

if __name__ == '__main__':
    argvs = sys.argv
    parser = argparse.ArgumentParser()
    parser.add_argument("--dir", dest="dir", default="./")
    parser.add_argument("--pxyz", dest="pxyz",
                      default=[0.0, 0.0, 0.0], type=float, nargs=3)
    opt = parser.parse_args()
    print(opt, argvs)

    R, L, t, V = sym.symbols("R L t V")
    i = sym.Function('i')
    q = sym.Function('q')
    eq1 = sym.Eq(R * i(t) + L * i(t).diff(t, 1), V)

    R0 = 100
    L0 = 100
    V0 = 100000
    C0 = 0.01
    eq1 = sym.Eq(R0 * i(t) + L0 * i(t).diff(t, 1), V0)
    eq2 = sym.Eq(R0 * i(t) + sym.integrate(1 / C0 * i(t), t), V0)
    eq3 = sym.Eq(R0 * q(t).diff(t, 1) + 1 / C0 * q(t), V0)
    an1 = sym.dsolve(eq1, ics={i(0): 0})
    an3 = sym.dsolve(eq3, ics={q(0): 0})
    an3_i = (1.0 - 1.0 * sym.exp(-1.0 * t)).diff(t, 1)
    #an1_i = (1.0 - 1.0*exp(-1.0*t)).diff(t, 1)
    print(t, i(0))
    print(an1)
    # print(an1.i(0))

    #pt = np.linspace(0,10, 100)
    #px = sym.lambdify(pt, an1)

    sym.plot(an3_i, (t, 0, 10))

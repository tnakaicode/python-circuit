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
                      default=[0.0, 0.0, 0.0], type="float", nargs=3)
    opt = parser.parse_args()
    print(opt, argvs)

    px = np.linspace(-1, 1, 100) * 100 + 50
    py = np.linspace(-1, 1, 200) * 100 - 50
    mesh = np.meshgrid(px, py)

    a = sym.Symbol("a")
    x, y = sym.symbols("x y")
    theta, gamma = sym.symbols(r"\theta \gamma")
    r = sym.Symbol("r", positive=True)
    q = sym.Symbol("q", real=True)
    f0 = (x + y)**3
    f1 = sym.sin(x) / x
    f2 = 3 * x**2 * y + x * y**2
    eq = sym.Eq(2 * x + 5 * y, -1)
    an = sym.solve(eq, x)

    print(a**2 + x - theta)
    print(a**2 / a)
    print((x + y)**3)
    print(f2.diff(x))
    print(*an)

    func = sym.lambdify((x, y), f2, "numpy")

    obj = plot2d(aspect="auto")
    obj.axs.plot(px, func(px, 1.0))
    obj.axs.plot(px, func(px, 0.5))
    obj.SavePng()

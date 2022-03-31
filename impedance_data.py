import numpy as np
import matplotlib.pyplot as plt
import sys
import os
import time
from impedance import preprocessing
from impedance.models.circuits import CustomCircuit
from impedance.visualization import plot_nyquist
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

    obj = plot2d()
    frequencies, Z = preprocessing.readCSV('impedance_data.csv')

    circuit = 'R0-p(R1,C1)-p(R2-Wo1,C2)'
    initial_guess = [.01, .01, 100, .01, .05, 100, 1]

    circuit = CustomCircuit(circuit, initial_guess=initial_guess)
    Z_fit = circuit.predict(frequencies)
    plot_nyquist(obj.axs, Z)
    plot_nyquist(obj.axs, Z_fit)
    obj.SavePng()

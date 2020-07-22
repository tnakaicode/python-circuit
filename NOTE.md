---
title: Steady circuit analysis with Python
---

## Series Resonance Circuit

Series RLC Circuit
$$ Z = R + j\omega L + \frac{1}{j\omega C} = R + j (\omega L - \frac{1}{\omega C}) $$

- $\omega L < 1/\omega C$
  - 容量性インピーダンス
  - Zの虚部が負となりRC直列回路と類似した特性を持つ
- $\omega L > 1/\omega C$
  - 誘導性インピーダンス
  - ZはRL直列回路に類似する
- $\omega L = 1/\omega C$
  - 直列共振
  - ZはR抵抗分のみとなる
- $1/\sqrt{2}$倍は-3db

$$ \omega_0 = \frac{1}{\sqrt{LC}} $$

$$ f_0 = \frac{\omega_0}{2\pi} = \frac{1}{2\pi\sqrt{LC}} $$

$$ |I| = |\frac{E_s}{Z}| = \frac{|E_s|}{\sqrt{R^2 + (\omega L - \frac{1}{\omega C})^2}} $$

$$ Q_s = \frac{\omega_0}{2CR / 2LC} = \frac{\omega_0L}{R} = \frac{1}{R}\sqrt{\frac{L}{C}} $$

## Parallel Resonance Circuit

Parallel RLC Circuit
$$ Y = R + \frac{1}{j\omega L} + j\omega C = R + j (\omega C - \frac{1}{\omega L}) $$

$$ \omega_0 = \frac{1}{\sqrt{LC}} $$

$$ f_0 = \frac{\omega_0}{2\pi} = \frac{1}{2\pi\sqrt{LC}} $$

$$ Q_p = \frac{\omega_0}{1/R} = RC\omega_0 = R \sqrt{\frac{C}{L}} $$

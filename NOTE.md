---
title: Steady circuit analysis with Python
---

## Series Resonance Circuit

Series RLC Circuit
$$ Z = R + j\omega L + \frac{1}{j\omega Cs} = R + j (\omega L - \frac{1}{\omega C}) $$

- $\omega L < 1/\omega C$
  - 容量性インピーダンス
  - Zの虚部が負となりRC直列回路と類似した特性を持つ
- $\omega L > 1/\omega C$
  - 誘導性インピーダンス
  - ZはRL直列回路に類似する
- $\omega L = 1/\omega C$
  - 直列共振
  - ZはR抵抗分のみとなる

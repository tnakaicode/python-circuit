---
title: Steady circuit analysis with Python
---

## 1. Series Resonance Circuit

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

## 2. Parallel Resonance Circuit

Parallel RLC Circuit
$$ Y = R + \frac{1}{j\omega L} + j\omega C = R + j (\omega C - \frac{1}{\omega L}) $$

$$ \omega_0 = \frac{1}{\sqrt{LC}} $$

$$ f_0 = \frac{\omega_0}{2\pi} = \frac{1}{2\pi\sqrt{LC}} $$

$$ Q_p = \frac{\omega_0}{1/R} = RC\omega_0 = R \sqrt{\frac{C}{L}} $$

## 3. Three-phase AC circuit

- $Y$結線と$\Delta$結線
- 対称$Y$形起電力 - $Y$形平衡負荷
- 対称$Y$形起電力 - $\Delta$形平衡負荷
- 平衡負荷と$\Delta-Y$変換
- $Y$形起電力 - 不平衡$Y$形負荷
- $\Delta$形起電力 - 不平衡$\Delta$形負荷
- 不平衡負荷と$\Delta-Y$変換
- $V$結線

## 4. Distributed constant circuit and S matrix

使用する周波数が高くなると回路素子は集中定数阻止として扱うことができなくなる。  
素子が空間的に分布した状態になる。  
回路内の電圧・電流は時間のみの関数ではなく、距離を含む形となり、時間経過とともに伝搬する波として扱う必要がある。

2端子対回路の1次側・2次側にそれぞれ特性Impedance W1, W2である無損失伝送回路を接続し、定常正弦派交流で駆動する。
2端子対回路の両端には入射波aと反射波bが存在する。$\sqrt{W_1}$と$\sqrt{W_2}$で正規化したa->bへの変換行列をS-Marixと呼ぶ。

S-Matrix (Scattering Matrix)

S-Matrixは回路に無損失回路を接続した場合の、入射・反射・透過によって決まる量であり、開放・短絡でも存在する。

## 5. 2-type element circuit

## 6. Shadow parameters

## 7. Frequency conversion and operating characteristics theory

## 8. Strain exchange and line spectrum

## 9. Frequency response and signal transmission

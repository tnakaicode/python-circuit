import schemdraw
from schemdraw import elements as elm
from schemdraw import logic

V1 = elm.SourceV().label('5V')
S1 = elm.SwitchSpdt2(action='close').up().anchor('b').label('$t=0$', loc='rgt')
R1 = elm.Resistor().down().label('$100\Omega$').label(
    ['+', '$v_o$', '-'], loc='bot')
# C1 = elm.Capacitor().at(S1.a).toy(V1.start).label('1$\mu$F').dot()
# C1 = elm.Capacitor().label('1$\mu$F').dot()

print(V1.anchors)

d = schemdraw.Drawing()
d.add(V1)
d.add(elm.Line().right(d.unit * .75))
d.add(S1)
d.add(elm.Line().right(d.unit * .75).at(S1.c))
d.add(R1)
d.add(elm.Line().to(V1.start))
C1 = elm.Capacitor().at(S1.a).toy(V1.start).label('1$\mu$F').dot()
d.add(C1)

d.save("draw_capacitor.png", transparent=False)
d.draw()

d = schemdraw.Drawing()
d.config(unit=0.5)
d += (X1 := logic.Xor())
d += (A := logic.Line().left(d.unit * 2).at(X1.in1).idot().label('A', 'left'))
d += (B := logic.Line().left().at(X1.in2).dot())
d += logic.Line().left().label('B', 'left')

d += logic.Line().right().at(X1.out).idot()
d += (X2 := logic.Xor().anchor('in1'))
d += (C := logic.Line().down(d.unit * 2).at(X2.in2))
d.push()
d += logic.Dot().at(C.center)
d += logic.Line().tox(A.end).label('C$_{in}$', 'left')
d.pop()

d += (A1 := logic.And().right().anchor('in1'))
d += logic.Wire('-|').at(A1.in2).to(X1.out)
d.move_from(A1.in2, dy=-d.unit * 2)
d += (A2 := logic.And().right().anchor('in1'))
d += logic.Wire('-|').at(A2.in1).to(A.start)
d += logic.Wire('-|').at(A2.in2).to(B.end)
d.move_from(A1.out, dy=-(A1.out.y - A2.out.y) / 2)
d += (O1 := logic.Or().right().label('C$_{out}$', 'right'))
d += logic.Line().at(A1.out).toy(O1.in1)
d += logic.Line().at(A2.out).toy(O1.in2)
d += logic.Line().at(X2.out).tox(O1.out).label('S', 'right')

d.save("draw_logic.png", transparent=False)
d.draw()

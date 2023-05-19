import schemdraw
from schemdraw import elements as elm
from schemdraw import logic

with schemdraw.Drawing() as d:
    d += (V1 := elm.SourceV().label('5V'))
    d += elm.Line().right(d.unit * .75)
    d += (S1 := elm.SwitchSpdt2(action='close').up().anchor('b').label('$t=0$', loc='rgt'))
    d += elm.Line().right(d.unit * .75).at(S1.c)
    d += elm.Resistor().down().label('$100\Omega$').label(
        ['+', '$v_o$', '-'], loc='bot')
    d += elm.Line().to(V1.start)
    d += elm.Capacitor().at(S1.a).toy(V1.start).label('1$\mu$F').dot()

    d.save("draw_capaciter.png", transparent=False)
    d.draw()

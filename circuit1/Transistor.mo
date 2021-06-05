class Transistor
  Modelica.Electrical.Analog.Basic.Resistor rtc(R = 0.1) annotation(
    Placement(visible = true, transformation(extent = {{40, 0}, {60, 20}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor rtb(R = 0.05) annotation(
    Placement(visible = true, transformation(extent = {{-80, -10}, {-60, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor ct(C = 1e-10) annotation(
    Placement(visible = true, transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Interfaces.Pin c annotation(
    Placement(visible = true, transformation(extent = {{90, 50}, {110, 70}}, rotation = 0), iconTransformation(extent = {{90, 50}, {110, 70}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.Pin b annotation(
    Placement(visible = true, transformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0), iconTransformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(
    Placement(visible = true, transformation(extent = {{-50, -80}, {-30, -60}}, rotation = 0)));
  Modelica.Electrical.Analog.Semiconductors.NPN Tr(Bf = 50, Br = 0.1, Ccs = 1e-12, Cjc = 0.5e-12, Cje = 0.4e-12, Gbc = 1e-15, Gbe = 1e-15, Is = 1e-16, Mc = 0.333, Me = 0.4, Phic = 0.8, Phie = 0.8, Tauf = 0.12e-9, Taur = 5e-9, UIC = true, Vak = 0.02, Vt = 0.02585) annotation(
    Placement(visible = true, transformation(extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.Pin e annotation(
    Placement(visible = true, transformation(extent = {{90, -70}, {110, -50}}, rotation = 0), iconTransformation(extent = {{90, -70}, {110, -50}}, rotation = 0)));
equation
  connect(b, rtb.p) annotation(
    Line(points = {{-100, 0}, {-80, 0}}));
  connect(Tr.C, rtc.p) annotation(
    Line(points = {{20, 10}, {40, 10}}));
  connect(rtb.n, Tr.B) annotation(
    Line(points = {{-60, 0}, {-20, 0}}));
  connect(rtb.n, ct.p) annotation(
    Line(points = {{-60, 0}, {-40, 0}, {-40, -20}}));
  connect(ct.n, Ground1.p) annotation(
    Line(points = {{-40, -40}, {-40, -60}}));
  connect(Tr.E, e) annotation(
    Line(points = {{20, -10}, {80, -10}, {80, -60}, {100, -60}}));
  connect(rtc.n, c) annotation(
    Line(points = {{60, 10}, {80, 10}, {80, 60}, {100, 60}}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Diagram(graphics = {Text(lineColor = {0, 0, 255}, extent = {{-76, 82}, {-2, 54}}, textString = "Transistor")}));
end Transistor;

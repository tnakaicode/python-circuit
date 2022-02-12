model Circuite2
  import SI = Modelica.Units.SI; // #1 (Try to avoid renaming imports!)
  parameter SI.Inductance l1=1.304 "Filter coefficient I1";
  parameter SI.Inductance l2=0.8586 "Filter coefficient I2";
  parameter SI.Capacitance c1=1.072 "Filter coefficient c1";
  parameter SI.Capacitance c2=1/(1.704992^2*l1) "Filter coefficient c2";
  parameter SI.Capacitance c3=1.682 "Filter coefficient c3";
  parameter SI.Capacitance c4=1/(1.179945^2*l2) "Filter coefficient c4";
  parameter SI.Capacitance c5=0.7262 "Filter coefficient c5";

  Modelica.Electrical.Analog.Basic.Ground G annotation(
    Placement(visible = true, transformation(extent = {{-110, -70}, {-90, -50}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor L2(L = l2, i(fixed = true, start = 0)) annotation(
    Placement(visible = true, transformation(extent = {{20, 46}, {40, 66}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor C1(C = c1, v(fixed = true, start = 0)) annotation(
    Placement(visible = true, transformation(origin = {-60, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Capacitor C4(C = c4) annotation(
    Placement(visible = true, transformation(extent = {{20, 20}, {40, 40}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor C2(C = c2) annotation(
    Placement(visible = true, transformation(extent = {{-40, 20}, {-20, 40}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor R1(R = 1) annotation(
    Placement(visible = true, transformation(extent = {{-92, 20}, {-72, 40}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor C3(C = c3, v(fixed = true, start = 0)) annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Sources.StepVoltage V(V = 1, offset = 0, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-100, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Inductor L1(L = l1, i(fixed = true, start = 0)) annotation(
    Placement(visible = true, transformation(extent = {{-40, 48}, {-20, 68}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor C5(C = c5, v(fixed = true, start = 0)) annotation(
    Placement(visible = true, transformation(origin = {60, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Resistor R2(R = 1) annotation(
    Placement(visible = true, transformation(origin = {100, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
equation
  connect(R1.n, C1.p) annotation(
    Line(points = {{-72, 30}, {-60, 30}, {-60, 0}}, color = {0, 0, 255}));
  connect(L1.n, C2.n) annotation(
    Line(points = {{-20, 58}, {-20, 30}}, color = {0, 0, 255}));
  connect(C4.n, C5.p) annotation(
    Line(points = {{40, 30}, {60, 30}, {60, 0}}, color = {0, 0, 255}));
  connect(C2.n, L2.p) annotation(
    Line(points = {{-20, 30}, {20, 30}, {20, 56}}, color = {0, 0, 255}));
  connect(L2.n, C4.n) annotation(
    Line(points = {{40, 56}, {40, 30}}, color = {0, 0, 255}));
  connect(C4.n, R2.p) annotation(
    Line(points = {{40, 30}, {100, 30}, {100, 0}}, color = {0, 0, 255}));
  connect(C2.n, C3.p) annotation(
    Line(points = {{-20, 30}, {0, 30}, {0, 0}}, color = {0, 0, 255}));
  connect(R2.n, C1.n) annotation(
    Line(points = {{100, -20}, {100, -50}, {-60, -50}, {-60, -20}}, color = {0, 0, 255}));
  connect(L1.p, C1.p) annotation(
    Line(points = {{-40, 58}, {-40, 30}, {-60, 30}, {-60, 0}}, color = {0, 0, 255}));
  connect(C1.n, C3.n) annotation(
    Line(points = {{-60, -20}, {-60, -50}, {0, -50}, {0, -20}}, color = {0, 0, 255}));
  connect(C2.n, C4.p) annotation(
    Line(points = {{-20, 30}, {20, 30}}, color = {0, 0, 255}));
  connect(C1.n, C5.n) annotation(
    Line(points = {{-60, -20}, {-60, -50}, {60, -50}, {60, -20}}, color = {0, 0, 255}));
  connect(V.n, G.p) annotation(
    Line(points = {{-100, -20}, {-100, -50}}, color = {0, 0, 255}));
  connect(L1.p, C2.p) annotation(
    Line(points = {{-40, 58}, {-40, 30}}, color = {0, 0, 255}));
  connect(R1.p, V.p) annotation(
    Line(points = {{-92, 30}, {-100, 30}, {-100, 0}}, color = {0, 0, 255}));
  connect(C1.n, G.p) annotation(
    Line(points = {{-60, -20}, {-60, -50}, {-100, -50}}, color = {0, 0, 255}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Diagram(graphics = {Rectangle(lineColor = {0, 0, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-2, -48}, {2, -52}}), Rectangle(lineColor = {0, 0, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid, extent = {{58, 32}, {62, 28}}), Rectangle(lineColor = {0, 0, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-2, 28}, {2, 32}}), Text(lineColor = {0, 0, 255}, extent = {{-120, 100}, {120, 80}}, textString = "CauerLowPassAnalog"), Rectangle(lineColor = {0, 0, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-62, -48}, {-58, -52}}), Rectangle(lineColor = {0, 0, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-62, 32}, {-58, 28}}), Rectangle(lineColor = {0, 0, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid, extent = {{58, -48}, {62, -52}})}));
end Circuite2;

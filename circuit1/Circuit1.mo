model Circuit1
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-86, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor R0(R = 1e+3) annotation(
    Placement(visible = true, transformation(origin = {-6, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor C0(C = 1e-5)  annotation(
    Placement(visible = true, transformation(origin = {80, -2}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Ideal.IdealGTOThyristor gto(off(fixed = true, start = true))  annotation(
    Placement(visible = true, transformation(origin = {26, 4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(period = 0.1, startTime = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {26, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor R1(R = 100e+3) annotation(
    Placement(visible = true, transformation(origin = {26, -28}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sources.RampVoltage PS(V = 100, duration = 0.25)  annotation(
    Placement(visible = true, transformation(origin = {-60, 74}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 10e+3) annotation(
    Placement(visible = true, transformation(origin = {80, -36}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(R0.n, gto.p) annotation(
    Line(points = {{4, 24}, {26, 24}, {26, 14}}, color = {0, 0, 255}));
  connect(gto.n, R1.p) annotation(
    Line(points = {{26, -6}, {26, -18}}, color = {0, 0, 255}));
  connect(R1.n, ground.p) annotation(
    Line(points = {{26, -38}, {26, -54}, {-86, -54}, {-86, -80}}, color = {0, 0, 255}));
  connect(R0.n, C0.p) annotation(
    Line(points = {{4, 24}, {80, 24}, {80, 8}}, color = {0, 0, 255}));
  connect(booleanPulse.y, gto.fire) annotation(
    Line(points = {{37, 68}, {60, 68}, {60, -6}, {38, -6}}, color = {255, 0, 255}));
  connect(PS.n, ground.p) annotation(
    Line(points = {{-70, 74}, {-86, 74}, {-86, -80}}, color = {0, 0, 255}));
  connect(PS.p, R0.p) annotation(
    Line(points = {{-50, 74}, {-34, 74}, {-34, 24}, {-16, 24}}, color = {0, 0, 255}));
  connect(C0.n, resistor.p) annotation(
    Line(points = {{80, -12}, {80, -26}}, color = {0, 0, 255}));
  connect(resistor.n, ground.p) annotation(
    Line(points = {{80, -46}, {80, -54}, {-86, -54}, {-86, -80}}, color = {0, 0, 255}));  protected
  annotation(
    uses(Modelica(version = "4.0.0")),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.001),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Circuit1;

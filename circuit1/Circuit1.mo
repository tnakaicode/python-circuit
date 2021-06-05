model Circuit1
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-86, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 100e+3) annotation(
    Placement(visible = true, transformation(origin = {28, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor(C = 1e-3) annotation(
    Placement(visible = true, transformation(origin = {70, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Ideal.IdealGTOThyristor gto annotation(
    Placement(visible = true, transformation(origin = {-16, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 100)  annotation(
    Placement(visible = true, transformation(origin = {-60, 74}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(period = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {44, 74}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(capacitor.n, ground.p) annotation(
    Line(points = {{80, 24}, {88, 24}, {88, -54}, {-86, -54}, {-86, -80}}, color = {0, 0, 255}));
  connect(resistor.n, ground.p) annotation(
    Line(points = {{38, 24}, {50, 24}, {50, -54}, {-86, -54}, {-86, -80}}, color = {0, 0, 255}));
  connect(resistor.n, capacitor.p) annotation(
    Line(points = {{38, 24}, {60, 24}}, color = {0, 0, 255}));
  connect(constantVoltage.n, ground.p) annotation(
    Line(points = {{-70, 74}, {-86, 74}, {-86, -80}}, color = {0, 0, 255}));
  connect(constantVoltage.p, gto.p) annotation(
    Line(points = {{-50, 74}, {-40, 74}, {-40, 24}, {-26, 24}}, color = {0, 0, 255}));
  connect(gto.n, resistor.p) annotation(
    Line(points = {{-6, 24}, {18, 24}}, color = {0, 0, 255}));
  connect(booleanPulse.y, gto.fire) annotation(
    Line(points = {{33, 74}, {-6, 74}, {-6, 36}}, color = {255, 0, 255}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.001),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Circuit1;

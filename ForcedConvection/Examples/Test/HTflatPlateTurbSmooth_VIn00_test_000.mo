within HeatTransferComponents.ForcedConvection.Examples.Test;

model HTflatPlateTurbSmooth_VIn00_test_000
  extends Modelica.Icons.Example;
  //----------
  //replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //redeclare package Medium = liquid1
  replaceable package gas1 = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = gas1
  //----------
  parameter Real valMinTContour=250;
  parameter Real valMaxTContour=600;
  //----------
  Modelica.Fluid.Valves.ValveLinear valveLinear(redeclare package Medium = gas1, dp_nominal(displayUnit = "kPa") = 400000, m_flow_nominal = 2) annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = gas1, T = 288.15, nPorts = 1, p = 500*1000) annotation(
    Placement(visible = true, transformation(origin = {-80, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = gas1, T = 288.15, nPorts = 1, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {76, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation(
    Placement(visible = true, transformation(origin = {-10, -37}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Tsurf(duration = 1, height = 0, offset = 400, startTime = 20) annotation(
    Placement(visible = true, transformation(origin = {-30, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-86, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_valve(duration = 1, height = 0, offset = 0.5, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {50, 44}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HeatTransferComponents.ForcedConvection.HTflatPlateTurbSmooth_VIn00 hTflatPlate(redeclare package Medium = gas1) annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -8}, {10, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_V(duration = 1, height = 10, offset = 50, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-30, 54}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HeatTransferComponents.Sensors.TemperatureDispColor00 temperature_wall(valMax = valMaxTContour, valMin = valMinTContour)  annotation(
    Placement(visible = true, transformation(origin = {-10, -14}, extent = {{-10, -4}, {10, 4}}, rotation = 0)));
  FluidSystemComponents.Sensor.TemperatureDispColor00 temperature_fluidport1(redeclare package Medium = gas1, valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {-38, 2}, extent = {{-10, -6}, {10, 6}}, rotation = 0)));
  FluidSystemComponents.Sensor.TemperatureDispColor00 temperature_fluidport2(redeclare package Medium = gas1, valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {18, 2}, extent = {{-10, -6}, {10, 6}}, rotation = 0)));
equation
  connect(valveLinear.port_b, boundary1.ports[1]) annotation(
    Line(points = {{60, 10}, {66, 10}}, color = {0, 127, 255}));
  connect(ramp_Tsurf.y, prescribedTemperature.T) annotation(
    Line(points = {{-19, -70}, {-10.5, -70}, {-10.5, -49}, {-10, -49}}, color = {0, 0, 127}));
  connect(ramp_valve.y, valveLinear.opening) annotation(
    Line(points = {{50, 33}, {50, 17}}, color = {0, 0, 127}));
  connect(boundary.ports[1], hTflatPlate.port_1) annotation(
    Line(points = {{-70, 10}, {-20, 10}}, color = {0, 127, 255}));
  connect(hTflatPlate.port_2, valveLinear.port_a) annotation(
    Line(points = {{0, 10}, {40, 10}}, color = {0, 127, 255}));
  connect(hTflatPlate.heatPort, prescribedTemperature.port) annotation(
    Line(points = {{-10, 2}, {-10, -27}}, color = {191, 0, 0}));
  connect(ramp_V.y, hTflatPlate.u_V) annotation(
    Line(points = {{-30, 44}, {-30, 13}, {-20, 13}}, color = {0, 0, 127}));
  connect(temperature_wall.heatPort, hTflatPlate.heatPort) annotation(
    Line(points = {{-20, -14}, {-20, -4}, {-10, -4}, {-10, 2}}, color = {191, 0, 0}));
  connect(hTflatPlate.port_1, temperature_fluidport1.port) annotation(
    Line(points = {{-20, 10}, {-48, 10}, {-48, 2}}, color = {0, 127, 255}));
  connect(hTflatPlate.port_2, temperature_fluidport2.port) annotation(
    Line(points = {{0, 10}, {8, 10}, {8, 2}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.01),
    Diagram);
end HTflatPlateTurbSmooth_VIn00_test_000;

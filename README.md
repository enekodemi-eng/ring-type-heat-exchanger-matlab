Ring-Type Heat Exchanger Calculator
MATLAB implementation of a thermal design calculation for a ring-type (annular) heat exchanger, developed as part of a Heat Transfer course during an Industrial Technology Engineering degree.
What it does
Calculates the thermal performance of a counterflow ring-type heat exchanger using an iterative approach. The code determines outlet temperatures, heat transfer coefficients and overall thermal efficiency using the NTU-effectiveness method.
Method
The calculation uses two nested convergence loops. The outer loop iterates on the cold fluid outlet temperature. The inner loop iterates on the wall surface temperatures. At each iteration, fluid properties are evaluated at the local mean temperature using auxiliary functions for water density, specific heat, thermal conductivity, viscosity and Prandtl number. The Sieder-Tate correlation is applied for both laminar and turbulent flow regimes. The overall heat transfer coefficient accounts for oxide and steel wall resistances.
Parameters

Hot fluid: water at 76°C, mass flow 1.4 kg/s
Cold fluid: water at 20°C, mass flow 2.54 kg/s
Heat exchanger length: 5 m with 10 passes
Wall materials: steel and oxide layer

Technologies
MATLAB

Context
University project. Not intended for industrial use without validation.

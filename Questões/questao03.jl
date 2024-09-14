include("../Methods/metodoDeRunge-Kutta.jl")
using .RungeKuttaModule

#constante b (taxa de crescimento)
global b = 2.9 * 10^(-2)
global k = 1.4 * 10^(-7)
global p0 = 50976
global t0 = 0

#Função especificada na questão
function P(t, p)
  return b*p - k*(p^2)
end

RungeKuttaModule.RkMethod4ord(P, t0, p0, 1, 5)

include("../Methods/metodoDeHunge-Kutta.jl")
using .HungeKuttaModule

#constante b (taxa de crescimento)
global b = 2.9 * 10^(-2)
global k = 1.4 * 10^(-7)
global p0 = 50976
global t0 = 0

#Função especificada na questão
function P(t, p)
  return b*p - k*(p^2)
end

HungeKuttaModule.HkMethod4ord(P, t0, p0, 1, 5)

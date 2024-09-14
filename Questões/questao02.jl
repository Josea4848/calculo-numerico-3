include("../Methods/metodoDeRunge-Kutta.jl")
using .RungeKuttaModule

global k = 0.002 #Coeficiente de atrito
global g = 9.8 #Gravidade
global m = 0.11 #Massa
global v0 = 8 #Valor da velocidade inicial
global t0 = 0.1 #Tempo inicial
global tn = 1 #tempo final
global h = 0.1 #Passo

function f_t_v(v,t)
    return (m*g - k*g*t*abs(g*t))/m
end

RungeKuttaModule.RkMethod4ord(f_t_v, t0, v0, h, tn)
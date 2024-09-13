include("../Methods/metodoDeHunge-Kutta.jl")
using .HungeKuttaModule

function f_t_v(v,t)
    k = 0.002 #Coeficiente de atrito
    g = 9.8 #Gravidade
    m = 0.11 #Massa

    return (mg - k*v*abs(g*t))/m
end

v0 = 8 #Valor da velocidade inicial
t0 = 0.1 #Tempo inicial
tn = 1 #tempo final
h = 0.1 #Passo

HungeKuttaModule.HkMethod4ord(f_t_v, t0, v0, h, tn)
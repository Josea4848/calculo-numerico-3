using Pkg
Pkg.add("Printf")
using Printf

include("../Methods/metodoDeHunge-Kutta.jl")
using .HungeKuttaModule
include("../Methods/metodoDeEuler.jl")
using .eulerMethodModule

#Função f'
function f_x_y(x,y)
    return x^3 - y
end

#Solução exata
function f(x)
    return x^3 - 3*x^2 + 6*x - 6 + 8*2.718^(-x) 
end

x0 = 0 # X inicial
y0 = 2 # Y incial
h = 0.25 # Passo
xn = 1 # X final

println("========== Método de Euler ================")

#Erro absoluto com método de Euler
erro_euler = abs(f(1) - eulerMethodModule.eulerMethod(f_x_y, x0, y0, h, xn))

@printf("Erro absoluto: %f\n", erro_euler)
println()

println("========== Método de Runge-Kutta ==========")

#Erro absoluto com método de Runge-Kutta
erro_hk = abs(f(1) - HungeKuttaModule.HkMethod3ord(f_x_y, x0, y0, h, xn))

@printf("Erro absoluto: %f\n", erro_hk)
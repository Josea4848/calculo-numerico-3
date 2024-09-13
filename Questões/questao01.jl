using Pkg
Pkg.add("Printf")
using Printf

include("../Methods/metodoDeHunge-Kutta.jl")
using .HungeKuttaModule
include("../Methods/metodoDeEuler.jl")
using .eulerMethodModule

global x0 = 0 # X inicial
global y0 = 1 # Y incial
global h = 0.2 # Passo
global xn = 1 # X final

#Função f'
function f_x_y(x,y)
    return ((y^2) - (2x))/y
end

#Solução exata
function f(x)
    return sqrt(2x + 1)
end

println("========== Método de Euler ================")

#Erro absoluto com método de Euler
erro_euler = abs(f(1) - eulerMethodModule.eulerMethod(f_x_y, x0, y0, h, xn))

@printf("Erro absoluto: %f\n", erro_euler)
println()

println("========== Método de Runge-Kutta ==========")

#Erro absoluto com método de Runge-Kutta
erro_hk = abs(f(1) - HungeKuttaModule.HkMethod3ord(f_x_y, x0, y0, h, xn))

@printf("Erro absoluto: %f\n", erro_hk)
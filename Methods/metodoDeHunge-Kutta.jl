module HungeKuttaModule

export HkMethod3ord, HkMethod4ord

using Pkg
Pkg.add("Printf")
using Printf

#Método de Hunge-Kutta de 3° ordem
function HkMethod3ord(f_x_y, x0, y0, h, xn)
    n = (xn - x0)/h

    yn = y0
    xn = x0

    for i in 0:n
      k1 = h*f_x_y(xn, yn)
      k2 = h*f_x_y(xn + h/2, yn + k1/2)
      k3 = h*f_x_y(xn + h, yn - k1 - 2*k2)

      @printf("i = %d | xn = %f | yn = %f | k1 = %f | k2 = %f | k3 = %f\n", i, xn, yn, k1, k2, k3)

      yn = yn + (k1 + 4*k2 +k3)/6
      xn += h
    end
  
    return yn
end

#Método de Hunge-Kutta de 4° ordem
function HkMethod4ord(f_x_y, x0, y0, h, xn) 
  n = (xn - x0)/h #cálculo de n

  yn = y0
  xn = x0

  #iterações para cálculo do Yn
  for i in 0:n
    k1 = h*f_x_y(xn, yn)
    k2 = h*f_x_y(xn + h/2, yn + k1/2)
    k3 = h*f_x_y(xn + h/2, yn + k2/2)
    k4 = h*f_x_y(xn + h, yn + k3)

    #println("$i\t $xn\t $yn\t $k1\t $k2\t $k3\t $k4\t")
    @printf("n = %d | xn = %f | yn = %f | k1 = %f | k2 = %f | k3 = %f | k4 = %f\n", i, xn, yn, k1, k2, k3, k4)


    yn = yn + (k1 + 2k2 +2k3 +k4)/6
    xn += h
  end

  return yn
end

end
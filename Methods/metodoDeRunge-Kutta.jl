module RungeKuttaModule

export RkMethod3ord, RkMethod4ord

using Pkg
Pkg.add("Printf")
using Printf

#Método de Runge-Kutta de 3° ordem de Nystrom
function RkMethod3ord(f_x_y, x0, y0, h, xn)
    n = (xn - x0)/h
    i = 0
    yn = y0
    xn = x0
    while true
      k1 = f_x_y(xn, yn) #cálculo do k1
      k2 = f_x_y(xn + h/3, yn + h*k1/3) #cálculo do k2
      k3 = f_x_y(xn + 2*h/3, yn + 2*h*k2/3) #cálculo do k3
      @printf("i = %d | xn = %f | yn = %f | k1 = %f | k2 = %f | k3 = %f\n", i, xn, yn, k1, k2, k3)

      #fim da iteração 
      if i == n
        break
      end
      #cálculo de yn+1
      yn = yn + h*(k1 + 3k3)/4
      xn += h
      i += 1
    end
  
    return yn
end

#Método de Runge-Kutta de 4° ordem
function RkMethod4ord(f_x_y, x0, y0, h, xn) 
  n = (xn - x0)/h #cálculo de n
  i = 0
  yn = y0
  xn = x0

  #iterações para cálculo do Yn
  while true
    k1 = h*f_x_y(xn, yn)
    k2 = h*f_x_y(xn + h/2, yn + k1/2)
    k3 = h*f_x_y(xn + h/2, yn + k2/2)
    k4 = h*f_x_y(xn + h, yn + k3)

    #println("$i\t $xn\t $yn\t $k1\t $k2\t $k3\t $k4\t")
    @printf("n = %d | xn = %f | yn = %f | k1 = %f | k2 = %f | k3 = %f | k4 = %f\n", i, xn, yn, k1, k2, k3, k4)

    #fim da iteração 
    if i == n
      break
    end

    yn = yn + (k1 + 2k2 +2k3 +k4)/6
    xn += h
    i += 1
  end

  return yn
end

end
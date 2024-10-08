module eulerMethodModule
export eulerMethod
using Pkg
Pkg.add("Printf")
using Printf

#Solução numérica para EDO utilizando método de Euler
"""
  eulerMethod(f_x_y, x0, y0, h, x)
  
"""
function eulerMethod(f_x_y, x0, y0, h, xn)
  n = (xn - x0)/h #cálculo do n que determinará a quantidade de iterações
  i = 0
  yn = y0 #inicialmente temos y0
  xn = x0 #incialmente temos x0

  #Iterações para cálculo de fn+1
  while true
    @printf("n = %d | Xn = %f | Yn = %f\n", i, xn, yn)
    
    if i == n
      break
    end

    yn = yn + h*f_x_y(xn, yn) #yn+1 = yn + h*f(x,y)
    xn += h #xn
    i += 1
  end

  return yn
end

function myFunction(x, y)
  return x^3 - y
end

end
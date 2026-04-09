## Function that approximates zero of a function using newton algorithm starting from a given point
# Inputs:
# f - function
# x0 - starting point
# max_iters - maximal number of iterations that the function goes through, default = 20
# x_prec - minimal precision of the approximation of the argument, default = 0.001
# y_prec - minimal precision of the function value at the approximated argument, default = 0.001
#
# Outputs:
# zero - the aproximated argument
# fzero - value at the aproximated argument
# iters - the number of iterations the function went though before reaching given precision
# info - information explaining the outcome of the function
# prec - exact precision of the approximated argument
# fprec - exact precision of the function at the approximated argument

function [zero, fzero, iters, info, prec, fprec] = newton(f,x0, max_iters = 20, x_prec=0.001, y_prec=0.001)
  syms x;
  df = matlabFunction(diff(f(x),x))
  clear x;
  fx0 = f(x0);
  if fx0 < y_prec
    info = "Reached given precision of the function at the approximated argument";
    zero = x0;
    fzero = fx0;
    iters = 0;
    prec = NaN;
    fprec = abs(fx0)
  endif
  for k = 1:max_iters
    x1 = x0 - f(x0)/df(x0);
    fx1 = f(x1);
    if abs(x1-x0) < x_prec
      info = "Reached given precision of the approximated argument";
      zero = x1;
      fzero = fx1;
      iters = k;
      prec = abs(x1-x0);
      fprec = abs(f(x1));
      return;
    endif
    if abs(f(x0)) < y_prec
      info = "Reached given precision of the function at the approximated argument";
      zero = x1;
      fzero = fx1;
      iters = k;
      prec = abs(x1-x0);
      fprec = abs(f(x1));
      return;
    endif
    prec = abs(x0-x1);
    x0=x1;
  endfor
  info = "Reached the maximal number of iterations";
  zero = x1;
  fzero = fx1;
  iters = k;
  prec = prec;
  fprec = abs(f(x1));
endfunction

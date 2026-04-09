## Function that approximates zero of a function using secant algorithm starting from two given points
# Inputs:
# f - function
# x0,x1 - starting points
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

function [zero, fzero, iters, info, prec, fprec] = secant(f,x0,x1, max_iters = 20, x_prec=0.001, y_prec=0.001)
  fx0 = f(x0);
  fx1 = f(x1);
  if fx0 < y_prec
    info = "Reached given precision of the function at the approximated argument";
    zero = x0;
    fzero = fx0;
    iters = 0;
    prec = abs(x0-x1);
    fprec = abs(fx0)
  endif
  if fx1 < y_prec
    info = "Reached given precision of the function at the approximated argument";
    zero = x1;
    fzero = fx1;
    iters = 0;
    prec = abs(x0-x1);
    fprec = abs(fx1);
  endif
  for k=2:max_iters
    if abs(fx0)>abs(fx1)
      temp = x0;
      x0 = x1;
      x1 = temp;
      temp = fx0;
      fx0 = fx1;
      fx1 = temp;
    endif
    s = (x1-x0)/(fx1-fx0);
    x1 = x0;
    fx1 = fx0;
    x0 = x0 - s*fx0;
    fx0 = f(x0);
     if abs(x1-x0) < x_prec
      info = "Reached given precision of the approximated argument";
      zero = x0;
      fzero = fx0;
      iters = k;
      prec = abs(x1-x0);
      fprec = abs(f(x1));
      return;
    endif
    if abs(f(x0)) < y_prec
      info = "Reached given precision of the function at the approximated argument";
      zero = x0;
      fzero = fx0;
      iters = k;
      prec = abs(x1-x0);
      fprec = abs(f(x1));
      return;
    endif
  endfor
  info = "Reached the maximal number of iterations";
  zero = x0;
  fzero = fx0;
  iters = k;
  prec = abs(x1-x0);
  fprec = abs(f(x0));
endfunction

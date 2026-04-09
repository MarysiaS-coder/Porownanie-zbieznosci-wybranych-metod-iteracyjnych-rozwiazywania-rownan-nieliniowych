## Function that approximates zero of a function using bisection algorithm on a given interval [a,b]
# Inputs:
# f - function
# a - left end of the interval
# b - right end of the interval
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

function [zero, fzero, iters, info, prec, fprec] = bisection(f, a, b, max_iters = 20, x_prec=0.001, y_prec=0.001)
   if a>b
    temp = a
    a = b
    b = temp
  endif
  fa = f(a);
  fb = f(b);
  len = b - a;
  if sign(fa) == sign(fb)
    info = "No change of the sign of function value at the ends of given interval";
    zero = NaN;
    fzero = NaN;
    iters = 0;
    prec = NaN;
    fprec = NaN;
    return;
  endif
  for k = 1:max_iters
    len = len/2;
    mid = a + len;
    fmid = f(mid);
    if abs(len)<x_prec
      info = "Reached given precision of the approximated argument";
      zero = mid;
      fzero = fmid;
      iters = k;
      prec = abs(len);
      fprec = abs(fmid);
      return;
    endif
    if abs(fmid) < y_prec
      info = "Reached given precision of the function at the approximated argument";
      zero = mid;
      fzero = fmid;
      iters = k;
      prec = abs(len);
      fprec = abs(fmid);
      return;
    endif
    if sign(fa)==sign(fmid)
      a = mid;
      fa = fmid;
    else
      b = mid;
      fb = fmid;
    endif
  endfor
  info = "Reached the maximal number of iterations";
  zero = mid;
  fzero = fmid;
  iters = k;
  prec = abs(len);
  fprec = abs(fmid);
endfunction



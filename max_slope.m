initial = @(x) (c * atan(b * a.^x).^d + e)
slope = @(x) ((a.^x * b * c * d * atan(a.^x * b).^(d-1) * log(a))/(1 + a.^(2*x) * b.^2))

[minx, minSlope] = fminbnd(slope, -10, 10)

intercept = initial(minx) - minSlope * minx

stoppingPotential = (e - intercept)/minSlope

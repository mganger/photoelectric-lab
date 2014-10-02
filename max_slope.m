initial = @(x) (c * atan(b * a.^x).^d + e)
inverse = @(x) (log(tan(((x-e)/c).^(1/d))/b)/log(a))
slope = @(x) ((a.^x * b * c * d * atan(a.^x * b).^(d-1) * log(a))/(1 + a.^(2*x) * b.^2))
h = (pi/2).^d * c
target = percent*h + c

[minx, minSlope] = fminbnd(slope, -10, 10)

intercept = initial(minx) - minSlope * minx

stoppingPotential = (e - intercept)/minSlope

leftBound = minx
rightBound = abs(abs(inverse(target)))

uncertainty = (rightBound + leftBound)/2

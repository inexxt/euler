function [exit] = problem317()

NUMSEC = 0.3;
NUMFUNC = 100000;
stepsize = 0.0001;
V = 20;
g = 9.81;
startheight = 100;
% res = zeros(NUMFUNC, round(NUMSEC*stepsize));


% alpha = rand(NUMFUNC,1)*2*pi - pi;
alpha = rand(NUMFUNC,1)*2*pi - pi;

% res = repmat(linspace(0,NUMSEC,NUMSEC*stepsize), NUMFUNC, 1);
x = linspace(0, 3000, 3000);
k = round(NUMSEC/stepsize);
Y = zeros(NUMFUNC, k);

% arrayfun(@(x)position(x, alpha, V, g, startheight), x, 'UniformOutput', 'false');
%y = xtg(a) - 9.81/(2(20*cos(a))*x^2
for t=1:(NUMSEC/stepsize)
    Y(:, t) = position(t*stepsize, alpha, V, g, startheight);
end
figure
plot(Y');
hold on;

y = max(Y);
plot(x, y, 'o', 'MarkerSize', 1);
exit = 1;

end

function y = position(t, alpha, V, g, startheight)
   ts = (t*1*V)./cos(alpha);
   ts = ts;
   y = (sin(alpha) .* V) .* ts - (g*ts.^2)/2 + startheight;
   y(y<0) = 0;
end
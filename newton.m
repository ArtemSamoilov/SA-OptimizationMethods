% Function for Newton Method
% J(u) = 1/2<Au,u>-<f,u> -> inf
function res = newton(f, grad, hess, x0)
    epsilon = 0.001;
    alpha = 0.1;
    n = length(x0);
    prev_x = x0;
    x = x0 + 1;
    maxn = 1000;
    res = zeros(n, maxn);
    res(:, 1) = x0;
    while norm(prev_x - x) > epsilon
        n = n + 1;
        prev_x = x;
        x_opt = iteration(hess(prev_x),(-grad(x)),prev_x) + prev_x;
        x = prev_x + alpha*(x_opt - prev_x);
        res(:, n) = x;
    end
    res(:, n+1:size(res, 2)) = [];
    res = fliplr(res);
    disp(['Number of iterations: ', num2str(n - 1)]);
end














% f3 = @(x) sin(x(1)) + sin(x(2));
% f_cos3 = @(x,y) sin(x) + sin(y);
% grad3 = @(x) [cos(x(1)); cos(x(2))];
% hess3 = @(x) [-sin(x(1)), 0; 0, -sin(x(2))];

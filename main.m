% Samoilov Artem, 04.06.2021
% Programming task for System Analysis Optimization methods practicum
% Unauthorizd use of creator's intellectual property is strictly forbidden
%% Newton Method 2D
clear
clc

clc;
f = @(x) x.^3-6*x.^2+4.*x+11;
grad2 = @(x) 3*x.^2-12*x+4;
hess2 = @(x) 6*x-12;
x0 = 5;
z = newton(f, grad2, hess2, x0);

t = linspace(0, 6, 100);
plot(t, f(t),'b', z, f(z), 'ro');
xlabel('x')
ylabel('f(x)')

%% Newton Method 3D
clear
clc

f3 = @(x) x(1).^2+x(2).^2 + (x(1) + x(2))^2;
f = @(x,y) x.^2+y.^2 + (y + x).^2;
grad3 = @(x) [2*x(1)+2*(x(1)+x(2)); 2*x(2)+2*(x(1)+x(2))];
hess3 = @(x) [4, 2; 4, 2];
x0 = [1; 1];
z = newton(f3, grad3, hess3, x0);
sz = 100;

[X, Y] = meshgrid(linspace(-4, 4, sz));
figure();
plot(z(1, :), z(2, :), '*-m');
xlabel('x')
ylabel('y')
hold on;
contour(X, Y, f(X, Y), f(z(1,:), z(2, :)), '-');
hold off
figure();
surf(X,Y,f(X,Y));
hold on
plot3(z(1,1), z(2,1), f(z(1,1),z(2,1)), 'o', 'MarkerSize', 10, 'MarkerFaceColor','Green');
hold on
plot3(z(1,:), z(2,:), f(z(1,:),z(2,:)), 'o', 'MarkerSize', 5, 'MarkerFaceColor','Red');
xlabel('x')
ylabel('y')
zlabel('f(x,y)')
hold off

%% Conjugate Gradients Method
clc
clear

A = [2 -1; 0 1];
c = [1; -3];
u_0 = [1; 1]
epsilon=0.001;
[u_min, J_min] = conj_grad(A, c, u_0, epsilon);

%% Simplex Method
clc
clear

A = [1 0 4 1 -1;1 1 6 2 0;0 0 1 10 0];
b = [1; -1; 1];
c = [1;1;-1;0;1];
z0 = [3; 0; 11; -1; 9];
[u, J] = simplex(A, b, c, z0);
disp("J = ");
disp(J);
disp("u = ");
disp(u);






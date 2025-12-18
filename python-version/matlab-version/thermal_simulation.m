L = 1;
nx = 50;
dx = L / nx;
alpha = 1.11e-4; % Copper
dt = 0.25 * dx^2 / alpha;
nt = 300;

T = zeros(nx,1);
T(1) = 100;

for n = 1:nt
    Tnew = T;
    for i = 2:nx-1
        Tnew(i) = T(i) + alpha * dt / dx^2 * ...
                 (T(i+1) - 2*T(i) + T(i-1));
    end
    T = Tnew;
end

x = linspace(0, L, nx);
plot(x, T, 'LineWidth', 2)
xlabel('Length (m)')
ylabel('Temperature (°C)')
title('Heat Transfer in Copper')
grid on

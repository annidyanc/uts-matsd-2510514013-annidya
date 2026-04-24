%==========================================================================
% UTS Matematika Sains Data - Semester Genap 2025/2026
% Soal Nomor 5 - Konvergensi Costumer Lifetime Value dan Kekontinuan Biaya 
% -------------------------------------------------------------------------
% Nama      : Annidya Nazwa Chiloschista
% NIM       : 2510514013
% Parameter : N=13, a=1, b=3, K=5, theta0=45, alpha=0.004
% Tanggal   : 24-04-2026
% =========================================================================

clc; clear; close all;

% Parameter personalisasi
N = 13; a = 1; b = 3; K = 5;
theta0 = 45; % derajat
alpha_lr = 0.004;

% Variabel simbolik
syms x

% Verifikasi perhitungan limit
% Definisi fungsi
f = (x^2-K^2)/(x-K);
g = (sqrt(x+(K+1)^2)-(K+1))/x;
h = ((a+2)*x^3+b*x+7)/(x^3-x+K);

% Menghitung limit
L1 = limit(f, x, K);
fprintf('limit f(x) saat (x → K) = %s\n', char(L1));
L2 = limit(g, x , 0);
fprintf('limit g(x) saat (x → 0) = %s\n', char(L2));
L3 = limit(h, x, Inf);
fprintf('limit h(x) saat (x → ∞) = %s\n', char(L3));

% Plot fungsi biaya piecewise C(x)
% Nilai p dan q agar kontinu (berdasarkan hasil analisis f)
p = 2 * K;
q = K * (2 - a);

% Potongan fungsi C(x)
C1 = (x^2-K^2)/(x-K); % x<K
C2 = p; % x=K
C3 = a*x + q; % x>K

% Visualisasi 
% Membuat Figure
figure('Color', 'w');
hold on;

% Plot potongan pertama [0, K]
fplot(C1, [0 K], 'LineWidth', 2, 'Color', 'b');

% Plot potongan kedua untuk titik sambungan di x=K
plot(K, p, 'ro', 'MarkerFaceColor', 'r', 'DisplayName', 'Titik Kontinu');

% Plot potongan ketiga [K, 2K]
fplot(C3, [K 2*K], 'LineWidth', 2, 'Color', 'g');

% Garis vertikal tipis di x=K
xline(K, '--k', 'LineWidth', 0.5, 'Alpha', 0.5);

% Grafik
grid on;
title(['Plot Fungsi Biaya Piecewise C(x) Kontinu (K = ', num2str(K), ')']);
xlabel('x');
ylabel('C(x)');
legend('x < K', 'x = K', 'x > K', 'Garis Sambungan');

% Menampilkan nilai p dan q di Command Window
fprintf('Nilai agar kontinu:\n');
fprintf('p = %.2f\n', p);
fprintf('q = %.2f\n', q);
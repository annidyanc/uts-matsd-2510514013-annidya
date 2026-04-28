%==============================================================================
% UTS Matematika Sains Data - Semester Genap 2025/2026
% Soal Nomor 7 - Forecasting Penjualan dengan barisan, Deret, dan Notasi Sigma
% -----------------------------------------------------------------------------
% Nama      : Annidya Nazwa Chiloschista
% NIM       : 2510514013
% Parameter : N=13, a=1, b=3, K=5, theta0=45, alpha=0.004
% Tanggal   : 28-04-2026
% =============================================================================

clc; clear; close all;

% Parameter personalisasi
N = 13; a = 1; b = 3; K = 5;
theta0 = 45; % derajat
alpha_lr = 0.004;

syms x

% Data penjualan
n = 1:12; % 12 bulan
S = 50 + (K*n) + (-1).^n * (a+1);

% Total penjualan 12 bulan
%  T₁ = Σₙ₌₁¹² Sₙ  
T1 = sum(S);
fprintf('Verifikasi Sigma\n');
fprintf('T1 = %d\n', T1);

% Sum of squares - untuk oerhitungan varians
%  T₂ = Σₙ₌₁¹² Sₙ²  
T2 = sum(S.^2);
fprintf('T2 = %d\n', T2);

% Tren garis linear
p = polyfit(n, S, 1);
slope = p(1);
interscept = p(2);
fprintf('\nTren linear\n');
fprintf('Slope (kemiringan) = %.4f\n', slope);
fprintf('Interscept = %.4f\n', interscept);

% Prediksi S13 sampai S18
n_prediksi = 13:18;
% Rumus tren = slope * n + interscept
S_prediksi = polyval(p, n_prediksi);
fprintf('Prediksi S13 sampai S18:\n');
for i = 1:length(n_prediksi)
    fprintf('S%d = %.2f\n', n_prediksi(i), S_prediksi(i));
end

% Plotting
figure('Color', 'W');
hold on;
grid on;

plot(n, S, 'bo', 'MarkerFaceColor', 'b', 'DisplayName', 'Data Historis');
n_seluruhnya = 1:18;
S_seluruh_trend = polyval(p, n_seluruhnya);
plot(n_seluruhnya, S_seluruh_trend, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Garis Tren Linear');
plot(n_prediksi, S_prediksi, 'g^', 'MarkerSize', 8, 'MarkerFaceColor', 'g', 'DisplayName', 'Prediksi 6 Bulan');

xlabel('Bulan (n)');
ylabel('Penjualan (Juta Rupiah)');
title('Forecasting Penjualan dengan Tren Linear');
legend('Location', 'northwest');
axis([0 19 min(S)-5 max(S_prediksi)+5]);
hold off;
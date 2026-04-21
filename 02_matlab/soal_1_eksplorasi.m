% ========================================================
% UTS Matematika Sains Data - Semester Genap 2025/2026
% Soal Nomor 1 - Eksplorasi Awal dan Profil Data Transaksi
% --------------------------------------------------------
% Nama      : Annidya Nazwa Chiloschista
% NIM       : 2510514013
% Parameter : N=13, a=1, b=3, K=5, theta0=45, alpha=0.004
% Tanggal   : 21-04-2026
% ========================================================

clc; clear; close all;

% Parameter personalisasi
N = 13; a = 1; b = 3; K = 5;
theta0 = 45; % derajat
alpha_lr = 0.004;

% Rumus pembentukan 7 data toko
i = 1:7;
D_i = 20+(K*i)+(mod(a*i, 7))-(mod(b*i, 5));
fprintf('Data toko D_1 sampai D_7:\n');
for i = 1:length(D_i)
    fprintf('D_%d = %d\n', i, D_i(i));
end

% Data 7 toko hasil perhitungan
% Menghitung mean
rata_rata = mean(D_i);
fprintf('mean = %.2f\n', rata_rata);

% Mencari median
median = median(D_i);
fprintf('median = %d\n', median);

% Mencari modus
modus = mode(D_i);
fprintf('modus = %d\n', modus);

% Menghitung range
range = range(D_i);
fprintf('range = %.2f\n', range);

% Standar deviasi
standar_deviasi = std(D_i, 1);
fprintf('standar deviasi = %.2f\n', standar_deviasi);

% Diagram batang penjualan
figure;
hold on;
x_axis = 1:7;
bar(x_axis, D_i, 'FaceColor', [0.2 0.6 0.8]); % Batang
% Garis rata-rata horizontal
yline(rata_rata, 'r--', 'LineWidth', 2, 'Label', ['Mean: ' num2str(rata_rata)]);
title ('Diagram Penjualan 7 Toko Minggu Pertama (2510514013)');
xlabel('Toko');
ylabel('Penjualan (Juta Rupiah)');
xticks(1:7);
grid on;
hold off;
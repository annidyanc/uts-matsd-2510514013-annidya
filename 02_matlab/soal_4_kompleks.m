%===================================================================
% UTS Matematika Sains Data - Semester Genap 2025/2026
% Soal Nomor 4 - Bilangan Kompleks Fasor Penjualan 
% ------------------------------------------------------------------
% Nama      : Annidya Nazwa Chiloschista
% NIM       : 2510514013
% Parameter : N=13, a=1, b=3, K=5, theta0=45, alpha=0.004
% Tanggal   : 24-04-2026
% ==================================================================

clc; clear; close all;

% Parameter personalisasi
N = 13; a = 1; b = 3; K = 5;
theta0 = 45; % derajat
alpha_lr = 0.004;

i = -1;

% Fasor penjualan
% z1 = (a+2) + (b+1)i = (1+2) + (3+1)i = 3 + 4i
z1 = 3 + 4i;

% z2 = (b+1) - (a+2)i = (3+1) - (1+2)i = 4 - 3i
z2 = 4 -3i;

% Verifikasi perhitungan
% z1 + z2
z_penjumlahan = z1 + z2;
fprintf('z1 + z2 = (%g + %gi) + (%g + %gi) = %g + %gi\n', real(z1), imag(z1), real(z2), imag(z2), real(z_penjumlahan), imag(z_penjumlahan));

% z1 * z2
z_perkalian = z1 * z2;
fprintf('z1 * z2 = (%g + %gi) * (%g + %gi) = %g + %gi\n', real(z1), imag(z1), real(z2), imag(z2), real(z_perkalian), imag(z_perkalian));

% z1 / z2
z_pembagian = z1 / z2;
fprintf('z1 / z2 = (%g + %gi) / (%g + %gi) = %g + %gi\n', real(z1), imag(z1), real(z2), imag(z2), real(z_pembagian), imag(z_pembagian)');

% |z1 - z2|
z_pengurangan = z1 - z2;
fprintf('z1 - z2 = (%g + %gi) - (%g + %gi) = %g - %gi\n', real(z1), imag(z1), real(z2), imag(z2), real(z_pengurangan), imag(z_pengurangan)');
r = abs(z_pengurangan);
fprintf('|z1 - z2| = sqrt(%g^2 + %g^2) = %.4f\n', real(z_pengurangan), imag(z_pengurangan), r);

% Akar kubik di bidang argand
% w = 8 * cis(theta) = 8 * cis(45)
r = 8; % Dari si w nya
n = 3; % Akar kubik
theta_rad = deg2rad(theta0); % Untuk theta bentuk radian
akar = zeros(1, n);
for k = 0:n-1
    theta_k = (theta_rad + 2*pi*k)/n;
    akar(k+1) = r^(1/n) * exp(1i * theta_k);
    fprintf('z_%d = %.4f + %.4fi (0=%.2f)\n', k, real(akar(k+1)), imag(akar(k+1)), rad2deg(theta_k));
end

% Visualisasi di bidang argand
figure('Name','Akar Kubik -8i'); 
theta_lingkaran = linspace(0, 2*pi, 200); 
plot(r^(1/n)*cos(theta_lingkaran), r^(1/n)*sin(theta_lingkaran),'b--'); 
hold on; grid on; axis equal; 
plot(real(akar), imag(akar),'ro','MarkerFaceColor','r','MarkerSize',10);
plot([akar, akar(1)], 'LineWidth', 2); % Menghubungkan titik akar
for k=1:n 
    text(real(akar(k))+0.1, imag(akar(k))+0.1, sprintf('z_%d',k-1),'FontSize',10); 
end 
xline(0,'k'); yline(0,'k'); 
title('Plot ketiga akar kubid di bidang Argand'); xlabel('Re'); ylabel('Im'); 
hold off; 
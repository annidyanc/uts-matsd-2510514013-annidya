%===================================================================
% UTS Matematika Sains Data - Semester Genap 2025/2026
% Soal Nomor 6 - Optimasi Harga Produk Via Gradient Descent Manual
% ------------------------------------------------------------------
% Nama      : Annidya Nazwa Chiloschista
% NIM       : 2510514013
% Parameter : N=13, a=1, b=3, K=5, theta0=45, alpha=0.004
% Tanggal   : 27-04-2026
% ==================================================================

clc; clear; close all;

% Parameter personalisasi
N = 13; a = 1; b = 3; K = 5;
theta0 = 45; % derajat
alpha_lr = 0.004;

syms x

% Fungsi model profit 
pi_x_sym = -(a+1)*x^3 + (b+5)*K*x^2 + 100*x - (K^2*10);

% Turunan pertama
gradient_sym = diff(pi_x_sym, x);

% Mencari x kritis dengan nilai turunan pertama = 0
x_kritis = double(solve(gradient_sym == 0, x));

% Gradient descent
x0 = 1; % Titik awal
fprintf('x0 = %d\n', x0);
iterasi =500; % Banyaknya iterasi

% Analisis sensitivitas
alpha_percobaan = [alpha_lr, 10* alpha_lr, 0.1*alpha_lr];
colors = {'b-', 'r--', 'g-.'};
labels = {'\alpha asli', '\alpha diperbesar', '\alpha diperkecil'};

figure(1);
hold on;

% Loop optimasi masing-masing alpha
for idx = 1:length(alpha_percobaan)
    a = alpha_percobaan(idx);
    x_curr = x0;
    pi_iterasi = zeros(1, iterasi);

    for k = 1:iterasi
        pi_iterasi(k) = double(subs(pi_x_sym, x, x_curr)); % Nilai profit saat ini
        gradient_val = double(subs(gradient_sym, x, x_curr)); % Gradient di titik x_curr
        x_curr = x_curr + a * gradient_val; % Update rule
    end

    % Plot hasil konvergensi
    plot(1:iterasi, pi_iterasi, colors{idx}, 'LineWidth', 2);

    % Hasil akhir alpha asli
    if a == alpha_lr
        x_gradientdescent = x_curr;
        pi_max_gd = pi_iterasi(end);
    end
end

% Grafik
grid on;
xlabel('Iterasi(k)');
ylabel('Analisis Konvergensi dan Sensitivitas Gradient Descent');
legend(labels);

% Output
fprintf('Hasil Optimasi\n');
fprintf('Solusi Analitik (x*): %.6f\n', x_kritis)
fprintf('Solusi gradient descent (x*): %.6f\n', x_gradientdescent);
fprintf('Profit maksimum: Rp %.2f\n', pi_max_gd);
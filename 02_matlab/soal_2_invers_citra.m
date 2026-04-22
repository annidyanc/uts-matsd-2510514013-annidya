%===================================================================
% UTS Matematika Sains Data - Semester Genap 2025/2026
% Soal Nomor 2 -  Enkripsi Citra Logo Toko dengan Invers Matriks 3x3
% ------------------------------------------------------------------
% Nama      : Annidya Nazwa Chiloschista
% NIM       : 2510514013
% Parameter : N=13, a=1, b=3, K=5, theta0=45, alpha=0.004
% Tanggal   : 22-04-2026
% ==================================================================

clc; clear; close all;

% Parameter personalisasi
N = 13; a = 1; b = 3; K = 5;
theta0 = 45; % derajat
alpha_lr = 0.004;

A = [a+1 b 2; 1  a+2 b; b 1 a+3]; % Matriks A
P = [120 (50+N) 200; 80 a+2 (10+N); (30+N) 90 170]; % Blok piksel asli P (3x3)
 
n = size(A, 1); 
C = zeros(n); 
 
% Hitung matriks kofaktor 
for i = 1:n 
    for j = 1:n 
        sub = A; 
        sub(i,:) = []; 
        sub(:,j) = []; 
        C(i,j) = ((-1)^(i+j)) * det(sub); 
    end 
end 
 
disp('Matriks Kofaktor C ='); disp(C); 
 
AdjA = C'; 
disp('Matriks Adjoin Adj(A) ='); disp(AdjA); 
 
detA = det(A); 
fprintf('det(A) = %.4f\n', detA); 

if abs(detA) < 1e-10 
    disp('SINGULAR — invers tidak ada'); 
else 
    format rat; % Format untuk pecahan
    A_inv_manual = AdjA / detA; 
    disp('A^-1 (manual) ='); disp(sym(A_inv_manual)); 
    disp('A^-1 (inv) ='); disp(sym(inv(A))); 

    format short; % Format untuk kembali ke desimal
    disp('Selisih (harus ~0):'); disp(A_inv_manual - inv(A)); 
    disp('Verifikasi A * A^-1 ='); disp(round(A * A_inv_manual)); 

    % Error frobenius
    error_fro = norm(A_inv_manual - inv(A), 'fro');
    fprintf('Norma Error Forbenius: %.2e\n', error_fro);

    if error_fro < 1e-10
        disp('Perhitungan manual sesuai dengan inv(A)');
    else
        disp('Terdapat selisih dalam perhitungan');
    end
    
    disp('Verifikasi A * A^-1 =');
    disp(round(A * A_inv_manual)); 
end 

% Visualisasi citra
fprintf('Matriks piksel asli:\n');
disp(P);

% Enkripsi 
E = A * P;
fprintf('Matriks asil enkripsi:\n');
disp(E);

% Dekripsi
P_aksen = A_inv_manual * E;
fprintf('Matriks hasil dekripsi:\n');
disp(P_aksen);

% Figure citra
figure('Name', 'Visualisasi Citra 3x3', 'NumberTitle', 'off');

% Matriks asli P
subplot(1, 2, 1);
imshow(P, []);
title('Blok Piksel Asli P');
colorbar; % Skala warna 

% Matriks E
subplot(1, 2, 2);
imshow(E, []);
title('Blok Piksel Enkripsi E');
colorbar; % Skala warna
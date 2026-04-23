%===================================================================
% UTS Matematika Sains Data - Semester Genap 2025/2026
% Soal Nomor 3 - Segmentasi Pelanggan dan komposisi fungsi harga 
% ------------------------------------------------------------------
% Nama      : Annidya Nazwa Chiloschista
% NIM       : 2510514013
% Parameter : N=13, a=1, b=3, K=5, theta0=45, alpha=0.004
% Tanggal   : 23-04-2026
% ==================================================================

clc; clear; close all;

% Parameter personalisasi
N = 13; a = 1; b = 3; K = 5;
theta0 = 45; % derajat
alpha_lr = 0.004;

% Definisi himpunan pelanggan
A = [N N+2 N+4 N+7 N+10 N+13 N+15]; % Pelanggan dari media sosial n(A)=7
fprintf('Pelanggan media sosial:\n');
fprintf('%d ', A);
B = [N+3 N+5 N+7 N+10 N+12 N+18]; % Pelanggan dari referral n(B)=6
fprintf('\nPelanggan dari refferal:\n');
fprintf('%d ', B);
C = [N+1 N+7 N+10 N+11 N+17 N+20]; % Pelanggan dari loyalty program n(C)=6
fprintf('\nPelanggan dari royalty program:\n');
fprintf('%d ', C);

%  |A ∪ B ∪ C|
AUBUC = union(A, union(B, C));
kardinalitas_AUBUC = numel(AUBUC);
fprintf('\n\nA ∪ B ∪ C:\n');
fprintf('%d ', AUBUC);
fprintf('\n|A ∪ B ∪ C| = %d\n', kardinalitas_AUBUC);

%  |A ∩ B ∩ C|
AnBnC = intersect(A, intersect(B, C));
kardinalitas_AnBnC = numel(AnBnC);
fprintf('\nA ∩ B ∩ C:\n');
fprintf('%d ', AnBnC);
fprintf('\n|A ∩ B ∩ C| = %d\n', kardinalitas_AnBnC);

%  |(A ∪ B) ∩ C′|
AUB = union(A, B); % Mencari anggota yang di dalam kurung dulu
C_aksen = setdiff(AUB, C); % Mencari anggota C'
AUBnCaksen = intersect(AUB, C_aksen);
fprintf('\n(A ∪ B) ∩ C′:\n');
fprintf('%d ', AUBnCaksen);
kardinalitas_AUBnCaksen = numel(AUBnCaksen); % Kardinalitas final
fprintf('\n|(A ∪ B) ∩ Caksen| = %d\n', kardinalitas_AUBnCaksen);

%  |A ⊕ B|  (simetris difference = (A ∪ B) − (A ∩ B))
simmetris_difference = setxor(A, B);
fprintf('\nA ⊕ B:\n');
fprintf('%d ', simmetris_difference);
kardinalitas_sim_diff = numel(simmetris_difference);
fprintf('\n|A ⊕ B| = %d\n', kardinalitas_sim_diff);

% Fungsi f^-1(x)
syms x;
f = K * x + (a+b);
f_invers = finverse(f);
fprintf('f^-1(x) = %s\n', char(f_invers));

% Pendapatan total satu pelanggan
pendapatan = K*100+a+b;
fprintf('\nPendapatan total satu pelanggan = Rp %d ribu\n', pendapatan);

% Volume pembelian. Substitusi pendapatan ke f^-1
volume = subs(f_invers, x, pendapatan);
fprintf('Volume pembelian x = %d\n', volume);
fungsi_solve = solve(f == pendapatan, x);
fprintf('Volume pembelian x dengan fungsi solve = %d\n', fungsi_solve);

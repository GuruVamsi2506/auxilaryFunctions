function [ bxxx, bppp, bpxx, bxpp ] = bispectrum( wt_1, wt_2, freqarr )
%BISPECTRUM Summary of this function goes here
bxxx = zeros(length(freqarr));
bppp = zeros(length(freqarr));
bpxx = zeros(length(freqarr));
bxpp = zeros(length(freqarr));
wt_1(isnan(wt_1)) = 0;
wt_2(isnan(wt_2)) = 0;
wt_1 = abs(wt_1);
wt_2 = abs(wt_2);
h = waitbar(0,'Please wait...');
tic
for i = 1:length(freqarr)
    for j = 1:length(freqarr)        
        bxxx(i, j) = trapz(freqarr, wt_1(:,i).*wt_1(:,j).*conj(wt_1(:,i+j)), 1);  
        bppp(i, j) = trapz(freqarr, wt_2(:,i).*wt_2(:,j).*conj(wt_2(:,i+j)), 1);
        bxpp(i, j) = trapz(freqarr, wt_1(:,i).*wt_2(:,j).*conj(wt_2(:,i+j)), 1);
        bpxx(i, j) = trapz(freqarr, wt_2(:,i).*wt_1(:,j).*conj(wt_1(:,i+j)), 1);
    end
    waitbar(i / length(freqarr));
end
close(h); 
toc
end


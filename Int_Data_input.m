%%%%%%%%%%%%%%%
bit_rate = 9.7656e5;

%%%%encoder%%%%%%%%%%%%%%%%%%%%%
num = xlsread('data',1);
arr_bit = dec2bin(num,8)';
[a b] = size(arr_bit);
tran_bit = reshape(arr_bit,1,a*b);
%packed 100bit data, 10bit alarm
A = [];
for i = 0:floor(length(tran_bit)/100)-1
    A = [A [dec2bin(1023,10) tran_bit(1+100*i:100*(i+1))]];
end
for j = 1:length(A)
    B(j) = bin2dec(A(j));
end
%truyen 100khung tuong ung voi 33s
data.time = (0:length(B)-1)*1/100';
data.signals.values = double(int8(B'));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
data.signals.values = B';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%decoder%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dec_bit = data_out.Data;
for i = 1:length(dec_bit)
    if(dec_bit(i:i+9) == ones(10,1))
        index = i;
        break
    end
end
rec_bit = dec_bit(index:end)';
R = [];
for k = 0:floor(length(rec_bit)/110)-1
    R = [R rec_bit(11+110*k:110*(k+1))];
end
%convert to binary
for ii = 1:length(R)
    Rx(ii) = dec2bin(R(ii));
end
%conver to dec
for j = 0:floor(length(Rx)/8)-1
    RR(j+1) = bin2dec(Rx(1+8*j:8*(j+1)));
end

cd('C:\Users\Administrator\Desktop')

in = data.signals.values;
[a1 b1 c1] = size(in);
in = reshape(in,1,max(max(a1,b1),c1));

dec_bit = in;
index = 0;
for i = 1:length(dec_bit)
    if(sum(abs(dec_bit(i:i+9)-ones(10,1)'))+sum(abs(dec_bit(i+330:i+9+330)-ones(10,1)')) == 0)
        index = i;
        break
    end
end
rec_bit = dec_bit(index:end);
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
RR1 = RR';
xlswrite('data',RR1,2,'A')


in = data_out.signals.values;
[a1 b1 c1] = size(in);
in = reshape(in,1,max(max(a1,b1),c1));

dec_bit = in;
index = 0;
for i = 1:length(dec_bit)
    if(sum(abs(dec_bit(i:i+9)-ones(10,1)'))+sum(abs(dec_bit(i+330:i+9+330)-ones(10,1)')) == 0)
        index = i;
        break
    end
end
rec_bit = dec_bit(index:end);
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
RR2 = RR';
xlswrite('data',RR2,2,'B')
error = double((RR1-RR2~=0));
xlswrite('data',error,2,'C')
cd('D:\z_WORKSPACE\UWB\uwb_implementation_final_kintex_final')
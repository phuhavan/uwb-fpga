load('cm1_imr_new.mat')
a = randi([1,100],1);
kenh = cm1_new{a};
%kenh = int32(cm1_new{a}*2^16);
save kenh 'kenh'

Gdelay = randi([10000,20000],1);
%Gdelay = 0;
delay.time = [];
delay.signals.values = Gdelay;


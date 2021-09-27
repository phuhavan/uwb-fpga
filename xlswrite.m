filename = 'data.xls'
A = floor(200*rand(4000,1));
xlswrite(filename,A,1,'A')
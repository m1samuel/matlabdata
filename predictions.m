%Logistic regression

B = mnrfit(data(:,1:end-1),categorical(data(:,end)));
correct = 0;
for i=1:310
    res = mnrval(B,data(i,1:end-1));
    result = res(1) < res(2);
    if (result == data(i,end))
        correct = correct + 1;
    end
end
correct/310

%with normalization
%


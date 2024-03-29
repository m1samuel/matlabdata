

load('data.mat');
data = data(randperm(size(data,1)),:);
train = data(floor(1:.75*size(data,1)),:);
test = data(ceil((.75*size(data,1))):end,:);


%Logistic regression
B = mnrfit(train(:,1:end-1),categorical(train(:,end)));
correct = 0;
for i=1:size(test,1)
    res = mnrval(B,test(i,1:end-1));
    result = res(1) > .5;
    if (result == test(i,end))
        correct = correct + 1;
    end
end
correct/size(test,1)

%normalization

for i=1:310
    x_max = max(data(i,1:end-1));
    x_min = min(data(i,1:end-1));
    data(i,1:end-1) = (data(i,1:end-1) - x_min)/(x_max-x_min);
end


train = data(floor(1:.75*size(data,1)),:);
test = data(ceil((.75*size(data,1))):end,:);

B = mnrfit(train(:,1:end-1),categorical(train(:,end)));
correct = 0;

for i=1:size(test,1)
    res = mnrval(B,test(i,1:end-1));
    result = res(1) > .5;
    if (result == test(i,end))
        correct = correct + 1;
    end
end
correct/size(test,1)

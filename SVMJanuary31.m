%%% SVM 1/17/2016
clear
%%% Initial Stuff
load indep.mat
load dep.mat
x=ones(size(dep,1),1);					
indepx=[indep,x];

%% scaling
% indep_scaled
    [maxV, I] = max(indep);
    [minV, I] = min(indep);
    [R, C] = size(indep);
    scaled = (indep-ones(R, 1)*minV).*(ones(R, 1)*((1-0)*ones(1, C)./(maxV-minV))) +0;

    for i = 1:size(indep, 2)
        if (all(isnan(scaled(:, i))))
            scaled(:, i) = 0;
        end
    end
    indep_scaled = scaled;
% dep_scaled
    [maxV, I] = max(dep);
    [minV, I] = min(dep);
    [R, C] = size(dep);
    scaled = (dep-ones(R, 1)*minV).*(ones(R, 1)*((1-0)*ones(1, C)./(maxV-minV))) +0;

    for i = 1:size(dep, 2)
        if (all(isnan(scaled(:, i))))
            scaled(:, i) = 0;
        end
    end
    dep_scaled = scaled;
    
%% Parameter selection
param.s = 3;					% should do epsilon #3 and nu SVR #4 both
param.t = 2;					% RBF kernel
param.Cset = 2.^[-15:15];       % C (Should change this to 2^-5, 2^-3, ..., 2^15)
param.gset = 2.^[-15:15];		% Range of the gamma parameter
param.eset = [0:.01:5];         % Range of epsilon parameter
%param.nuset = [0:.05:1];       % Range of nu parameter

for r = 1:72:864; %location of first sample for each panelist
	 pnlstindep = indep_scaled(r:r+71,:); %get panelist data from indep and dep
	 pnlstdep = dep_scaled(r:r+71,:);  
	 pnlstvarindep{(r+71)/72}=pnlstindep; %store pnlst info as vector in an array
	 pnlstvardep{(r+71)/72}=pnlstdep; %store pnlst info as vector in a matrix	
end

for A = 1:1:12
    for AA = 1:1:20
    trn.X=[pnlstvarindep{A}(:,:)]; %EtOH, Tannin, Fructose (Instance Matrix)
    trn.Y=[pnlstvardep{A}(:,AA)]; %Attribute (Label Vector)
     MSE = zeros(length(param.gset), length(param.eset)); %preallocation
     kevin_error = zeros(length(param.gset), length(param.eset)); %preallocation
        for j = 1:length(param.gset);
            param.g = param.gset(j);
            for jj = 1:length(param.Cset);
                param.C = param.Cset(jj)
                 for k = 1:length(param.eset);
                     y_hat = zeros(72,1); %preallocation
                     param.e = param.eset(k);
                     param.libsvm = ['-s ', num2str(param.s), ' -t ', num2str(param.t), ' -c ', num2str(param.C), ' -g ', num2str(param.g), ' -p ', num2str(param.e)];
                    for i = 1:72;
                    tst.X = trn.X([i]); %test instance
                    tst.Y = trn.Y([i]); %test label
                    array.X = trn.X([1:i-1, i+1:72],:); %training instance matrix
                    array.Y = trn.Y([1:i-1, i+1:72],:); %training label vector
                    model = svmtrain(array.Y, array.X, param.libsvm); %svmtrain
                    [y_hat(i),acc,prediction] = svmpredict(tst.Y,tst.X,model); %svmpredict
                    MSE(j,k) = MSE(j,k) + abs((y_hat(i)-tst.Y).^2); %Mean Squared Error
                    kevin_error(j,k)=dot(y_hat/norm(y_hat),trn.Y/norm(trn.Y)); %Kevin requested error
                    end
                 end
            end
        end
MSE = MSE ./ 71; %Degrees of freedom
[v1, i1] = max(kevin_error); %Minumum Error
[v2, i2] = min(v1); %Minimum Error
[v3, i3] = min(v2)
optparam = param;
optparam.g = param.gset( i1(i2) ); %Optimized Parameter Gamma
optparam.e = param.eset(i2); %Optimized parameter Epsilon
optparam.C = param.Cset(i3); %Optimized C
optparam.libsvm = ['-s ', num2str(optparam.s), ' -t ', num2str(optparam.t), ...
		' -c ', num2str(optparam.C), ' -g ', num2str(optparam.g), ...
		' -p ', num2str(optparam.e)];
    
%% Optimized output 
optimal_kevin_error{A}{AA} = kevin_error(i1(i2),i2); %Optimal Error captured and reported
%% Run model with optimized parameters
model = svmtrain(trn.Y, trn.X, optparam.libsvm); %Using all data for training
[y_hat, Acc, projection] = svmpredict(trn.Y, trn.X, model); %Testing on all, (note Trn.Y & Trn.X & model)
predvstrue{A,AA} = [y_hat,trn.Y]; %Optimized Prediction vs True
    end
end

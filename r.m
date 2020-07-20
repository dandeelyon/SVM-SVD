clear
load 'optimal_kevin_error.mat'
load 'rsquare_SVD.mat'
for A=1:12
    optimal_kevin_error{A}; %Error from SVR
    form2=permute(rsquare(:,A,:),[3,1,2]); %Error from SVD
    form1=cell2mat(optimal_kevin_error{A});
    scores{A}=[form2,form1'];%SVD results are first three columns, SVR is last one
end

figure
subplot(3,4,1)
x=scores{1}(:,1);
y=scores{1}(:,4);
plot(x,':.b')
hold on
plot(y,'--dr')
title('Panelst 1 SVD vs. SVR')
legend('SVD','SVR','Location','southwest')
xlabel('Attribute')
ylabel('1-Error')

subplot(3,4,2)
x=scores{2}(:,1);
y=scores{2}(:,4);
plot(x,':.b')
hold on
plot(y,'--dr')
title('Panelist 2 SVD vs. SVR')
legend('SVD','SVR','Location','southwest')
xlabel('Attribute')
ylabel('1-Error')

subplot(3,4,3)
x=scores{3}(:,1);
y=scores{3}(:,4);
plot(x,':.b')
hold on
plot(y,'--dr')
title('Panelist 3 SVD vs. SVR')
legend('SVD','SVR','Location','southwest')
xlabel('Attribute')
ylabel('1-Error')

subplot(3,4,4)
x=scores{4}(:,1);
y=scores{4}(:,4);
plot(x,':.b')
hold on
plot(y,'--dr')
title('Panelist 4 SVD vs. SVR')
legend('SVD','SVR','Location','southwest')
xlabel('Attribute')
ylabel('1-Error')

subplot(3,4,5)
x=scores{5}(:,1);
y=scores{5}(:,4);
plot(x,':.b')
hold on
plot(y,'--dr')
title('Panelist 5 SVD vs. SVR')
legend('SVD','SVR','Location','southwest')
xlabel('Attribute')
ylabel('1-Error')

subplot(3,4,6)
x=scores{6}(:,1);
y=scores{6}(:,4);
plot(x,':.b')
hold on
plot(y,'--dr')
title('Panelist 6 SVD vs. SVR')
legend('SVD','SVR','Location','southwest')
xlabel('Attribute')
ylabel('1-Error')

subplot(3,4,7)
x=scores{7}(:,1);
y=scores{7}(:,4);
plot(x,':.b')
hold on
plot(y,'--dr')
title('Panelist 7 SVD vs. SVR')
legend('SVD','SVR','Location','southwest')
xlabel('Attribute')
ylabel('1-Error')

subplot(3,4,8)
x=scores{8}(:,1);
y=scores{8}(:,4);
plot(x,':.b')
hold on
plot(y,'--dr')
title('Panelist 8 SVD vs. SVR')
legend('SVD','SVR','Location','southwest')
xlabel('Attribute')
ylabel('1-Error')

subplot(3,4,9)
x=scores{9}(:,1);
y=scores{9}(:,4);
plot(x,':.b')
hold on
plot(y,'--dr')
title('Panelist 9 SVD vs. SVR')
legend('SVD','SVR','Location','southwest')
xlabel('Attribute')
ylabel('1-Error')

subplot(3,4,10)
x=scores{10}(:,1);
y=scores{10}(:,4);
plot(x,':.b')
hold on
plot(y,'--dr')
title('Panelist 10 SVD vs. SVR')
legend('SVD','SVR','Location','southwest')
xlabel('Attribute')
ylabel('1-Error')

subplot(3,4,11)
x=scores{11}(:,1);
y=scores{11}(:,4);
plot(x,':.b')
hold on
plot(y,'--dr')
title('Panelist 11 SVD vs. SVR')
legend('SVD','SVR','Location','southwest')
xlabel('Attribute')
ylabel('1-Error')

subplot(3,4,12)
x=scores{12}(:,1);
y=scores{12}(:,4);
plot(x,':.b')
hold on
plot(y,'--dr')
title('Panelist 12 SVD vs. SVR')
legend('SVD','SVR','Location','southwest')
xlabel('Attribute')
ylabel('1-Error')
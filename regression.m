%Author: Michael Giancola
%Linear and Polynomial Regression

%load training data and plot it
trainingx = load('hw1xtr.dat');
trainingy = load('hw1ytr.dat');
scatter(trainingx, trainingy)
title('Training Data Plot')
xlabel('x Training Data')
ylabel('y Training Data')

%load test data and plot it
testx = load('hw1xte.dat');
testy = load('hw1yte.dat');
figure 
scatter(testx, testy)
title('Test Data Plot')
xlabel('x Test Data')
ylabel('y Test Data')

%create a column vector of 1's to the features 
A = ones(length(trainingx),1);
training_appended_x = [trainingx A];

%calculate linear regression slope and y-int using the formula (weight parameters)
w1 = ((inv((training_appended_x.')*(training_appended_x)))*(training_appended_x.'))*trainingy;

%plot the linear regression line and training data on same graph
figure 
scatter(trainingx, trainingy)
hold on
refline(-0.7934, 4.3589)
title('Training Data with Linear Regression Line Plot')
xlabel('x Training Data')
ylabel('y Training Data')

%initialize Z to 0 and compute average error on training set
Z = 0;
for i=1:length(training_appended_x)
    Z = Z + (((w1.')*((training_appended_x(i,:)).')) - trainingy(i,:))^2;
end

order1_training_err = (1/length(training_appended_x))*Z

%plot regression line and test data on same graph
figure 
scatter(testx, testy)
hold on 
refline(-0.7934, 4.3589)
title('Test Data with Linear Regression Line Plot')
xlabel('x Test Data')
ylabel('y Test Data')

%plug test data into 1st order polynomial and compute average error 
%the mean-squared error can be found using the Matlav immse function
%this function is the same as using Eq.1 as previously used
y_test = polyval(w1.',testx);
order1_test_err = immse(y_test, testy)

%2nd ORDER POLYNOMIAL REGRESSION
%add new features x^2 to the inputs 
feature_2 = (trainingx).^2;
order2_train_appended_x = [feature_2 trainingx A];

%calculate polynomial constants for 2nd-order regression
w2 = ((inv((order2_train_appended_x.')*(order2_train_appended_x)))*(order2_train_appended_x.'))*trainingy;

%plot the regression curve on the training data
figure
scatter(trainingx, trainingy)
hold on
refcurve(w2.')
title('Training Data with 2nd-order Polynomial Regression Line Plot')
xlabel('x Training Data')
ylabel('y Training Data')

%slove for average error on training set for 2nd-order
Z = 0;
for i=1:length(order2_train_appended_x)
    Z = Z + (((w2.')*((order2_train_appended_x(i,:)).')) - trainingy(i,:))^2;
end

order2_train_err = (1/length(order2_train_appended_x))*Z

%plot the regression curve on the test data
figure
scatter(testx, testy)
hold on
refcurve(w2.')
title('Test Data with 2nd-order Polynomial Regression Line Plot')
xlabel('x Test Data')
ylabel('y Test Data')

%slove for average error on test set for 2nd-order
y_test_order2 = polyval(w2.',testx);
order2_test_err = immse(y_test_order2, testy)

%3rd ORDER POLYNOMIAL REGRESSION
%add new features x^3 to the inputs 
feature_3 = (trainingx).^3;
order3_train_appended_x = [feature_3 feature_2 trainingx A];

%calculate polynomial constants for 3rd-order regression
w3 = ((inv((order3_train_appended_x.')*(order3_train_appended_x)))*(order3_train_appended_x.'))*trainingy;

%plot the regression curve on the training data
figure
scatter(trainingx, trainingy)
hold on
refcurve(w3.')
title('Training Data with 3rd-order Polynomial Regression Line Plot')
xlabel('x Training Data')
ylabel('y Training Data')

%slove for average error on training set for 3rd-order
Z = 0;
for i=1:length(order2_train_appended_x)
    Z = Z + (((w3.')*((order3_train_appended_x(i,:)).')) - trainingy(i,:))^2;
end

order3_train_err = (1/length(order3_train_appended_x))*Z

%plot the regression curve on the test data
figure
scatter(testx, testy)
hold on
refcurve(w3.')
title('Test Data with 3rd-order Polynomial Regression Line Plot')
xlabel('x Test Data')
ylabel('y Test Data')

%slove for average error on test set for 3rd-order
y_test_order3 = polyval(w3.',testx);
order3_test_err = immse(y_test_order3, testy)

%4th ORDER POLYNOMIAL REGRESSION
%add new features x^4 to the inputs 
feature_4 = (trainingx).^4;
order4_train_appended_x = [feature_4 feature_3 feature_2 trainingx A];

%calculate polynomial constants for 4th-order regression
w4 = ((inv((order4_train_appended_x.')*(order4_train_appended_x)))*(order4_train_appended_x.'))*trainingy;

%plot the regression curve on the training data
figure
scatter(trainingx, trainingy)
hold on
refcurve(w4.')
title('Training Data with 4th-order Polynomial Regression Line Plot')
xlabel('x Training Data')
ylabel('y Training Data')

%slove for average error on training set for 4th-order
Z = 0;
for i=1:length(order4_train_appended_x)
    Z = Z + (((w4.')*((order4_train_appended_x(i,:)).')) - trainingy(i,:))^2;
end

order4_train_err = (1/length(order4_train_appended_x))*Z

%plot the regression curve on the test data
figure
scatter(testx, testy)
hold on
refcurve(w4.')
title('Test Data with 4th-order Polynomial Regression Line Plot')
xlabel('x Test Data')
ylabel('y Test Data')

%slove for average error on test set for 4th-order
y_test_order4 = polyval(w4.',testx);
order4_test_err = immse(y_test_order4, testy)

function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
matrix=[0,0,0];
for i = C
	for j = sigma
	model= svmTrain(X, y, i, @(x1, x2) gaussianKernel(x1, x2, j));
	%model= svmTrain(X, y, 0.01, @(x1, x2) gaussianKernel(x1, x2, 0.01));
	predictions = svmPredict(model, Xval);
	error=mean(double(predictions ~= yval));
	matrix=[matrix;error,i,j];
	%matrix=[matrix;error,0.01,0.01];
		
	end
end	
matrix=matrix(2:end,:);
[min_val,min_ind]=min(matrix);

C=matrix(min_ind:min_ind,2:2);
sigma=matrix(min_ind:min_ind,3:3);



% =========================================================================

end

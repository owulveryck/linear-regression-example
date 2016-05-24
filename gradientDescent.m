function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
    %GRADIENTDESCENT Performs gradient descent to learn theta
    %   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
    %   taking num_iters gradient steps with learning rate alpha
    % Initialize some useful values
    m = length(y); % number of training examples
    J_history = zeros(num_iters, 1);

    for iter = 1:num_iters
        % Perform a single gradient step on the parameter vector theta
        % Hint: While debugging, it can be useful to print out the values
        %       of the cost function (computecost) and gradient here.
        theta = theta - (alpha/m) * (X' * (hypothese(X,theta) - y));

        % save the cost j in every iteration    
        j_history(iter) = computeCost(X, y, theta);
    end
%%
%%    % Initialize some useful values
%%    m = length(y); % number of training examples
%%    J_history = zeros(num_iters, 1);
%%    for iter = 1:num_iters
%%        myiter = [0 0 0];
%%        theta1=theta(1);
%%        theta2=theta(2);
%%        theta3=theta(3);
%%        XX=[X,ones(m,1)];
%%        for j=1:3
%%            for i=1:m
%%                myiter(j) = myiter(j) + (theta1*X(i,1)+theta2*X(i,2)^(1/3)+theta3*X(i,2)^(1/5)-y(i))*XX(i,j);
%%            endfor
%%            theta(j) = theta(j) - (alpha/m)*myiter(j);
%%        endfor
%%
%%        % ============================================================
%%
%%        % Save the cost J in every iteration    
%%        J_history(iter) = computeCost(X, y, theta);
%%    end
end



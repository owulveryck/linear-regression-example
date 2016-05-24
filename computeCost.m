function J = computeCost(X,y,theta)

    J=0;
    m = length(y); % number of training examples
    h = hypothese(X,theta);


    J = (1/(2*m)) * (h - y)' * (h - y);
end

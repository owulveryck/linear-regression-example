% This is an octave calculus to find the linear regression for the function
% Here h(theta) = theta0 + theta1*x(^quotien) + theta2*x^(quotien)

clear; close all; clc
% At first load the data and plot them
examples = { "solution1.csv"; "solution2.csv"; "solution3.csv"; "solution4.csv"  };
for e = 1:length(examples)
    ex = examples{e};
    fprintf('Analysing %s:',ex);

    data = load(ex); % read comma separated data
    X = data(:, 1); y = data(:, 2);
    m = length(y);

    % Evaluate the global score
    score = (1/m)*sum(X);
    fprintf('%0.2f/3\n',score);

    %% plot(X, y, 'rx', 'MarkerSize', 10); % Plot the data
    ylabel('Effort'); % Set the y􀀀axis label
    xlabel('Fonctionnalité'); % Set the x􀀀axis label

    fprintf('Running gradient descent...\n');

    %X= [ones(m,1), data(:,1)]; % Add a column of ones to X to compute theta0
    theta = zeros(2,1); % Initialize fitting parameters

    % gradient descent settings
    iterations = 2000;
    alpha= 0.05;
    X=[ones(size(X)(1),1),X];
    quotien = 1/5;
    function h = hypothese(X,theta)
        quotien = 1/5;
        h=zeros(size(X)(1));
        h=X(:,1)*theta(1)+(X(:,2).^(quotien))*theta(2);
    end

    % compute and display initial cose
    computeCost(X,y,theta);

    % Acutally run the gradient descent
    theta = gradientDescent(X,y,theta,alpha,iterations);

    % print theta
    fprintf('Theta found by gradient descent: ');
    for i=1:size(theta)
        fprintf('%f ',theta(i));
    end
    fprintf('\n');
    %pause;

    %plot the linear fittinghold on;
    %% hold on;
    mfunc = @(t) theta(1)+theta(2)*t.^(quotien);
    %% %% fplot(mfunc,[0,3]);
    %% legend('Training data','linear regression')
    %% hold off
    %% fprintf('Prediction for x=0 ; %f\n', theta(1)+theta(2)*0^(quotien));
    %% fprintf('Prediction for x=1 ; %f\n', theta(1)+theta(2)*1^(quotien));

    zeroeff = theta(1)+theta(2)*0^(quotien);
    eff = theta(1)+theta(2)*score^(quotien);
    maxeff  = theta(1)+theta(2)*3^(quotien);
    fprintf('Prediction for x=%f ; %f\n', score, eff);
    fprintf('Prediction for x=3 ; %f\n', maxeff);
    fprintf('Effort (scaled to 10): %f\n\n', (eff-maxeff)*10/zeroeff);
end

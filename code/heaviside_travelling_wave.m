c = 2; % Wave speed
x = -5:0.01:9; % Region defined
a = 4;
dt = 0.01; % Time step
start_time = 0; % Initial time
end_time = 2; % End time
range = [0, 1.2]; % Axis range

% Initialising figure
Figure1 = figure(1);
axis_left = x(1);
axis_right = x(end);
axis_top = range(1);
axis_bottom = range(2);
% exportgraphics(gcf,'Travelling_wave_q2.gif');
for t=start_time:dt:end_time
    % clf(1);
    
    
    % Initialise function size
    phi1=zeros(size(x));
    phi2=zeros(size(x));

    % Travelling wave
    phi1(x-c*t>0) = 1/2*(heaviside(x(x-c*t>0)-c*t+a) - heaviside(x(x-c*t>0)-c*t-a));
    phi2(x+c*t>0) = 1/2*(heaviside(x(x+c*t>0)+c*t+a) - heaviside(x(x+c*t>0)+c*t-a));
    % Superposition of waves
    y = phi1+phi2+0.01;

    % Plotting the waves
    
    plot(x,y,'k',LineWidth=2)
    hold on
    plot(x,phi1,'g',LineWidth=2)
    plot(x,phi2,'b',LineWidth=3)
    

    axis([axis_left axis_right axis_top axis_bottom]);
    ylabel("u(x,t)")
    xlabel("x")
    blue_labels = [sprintf("-a-%1.2fc",t), sprintf("-a+%1.2fc",t)];
    green_end = sprintf("a+%1.2fc",t);
    xticks([ -a-c*t+a , 2  , a+c*t ]);
    xticklabels({blue_labels(1) , 0 , green_end})
    

    hold off
    

    % Adding time to plot
    time_string = sprintf("t=%1.2f",round(t,2));
    text(5,1,time_string);

    % Creating animation
    drawnow;
    

    % Create gif
    % exportgraphics(gcf,'heaviside_travelling_wave.gif','Append',true);
% 
end
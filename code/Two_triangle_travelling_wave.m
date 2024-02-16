c = 2; % Wave speed
x = -4:0.01:4; % Region defined
a = 2;
b = -3;
dt = 0.01; % Time step
start_time = 0; % Initial time
end_time = 2; % End time
range = [0, 2]; % Axis range

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
    phi1_1=zeros(size(x));
    phi1_2=zeros(size(x));
    phi2_1=zeros(size(x));
    phi2_2=zeros(size(x));
    y3=zeros(size(x));

    % Travelling wave
    phi1_1(abs(x-a-c*t)<1) = 1*(1-abs(x(abs(x-a-c*t)<1)-a-c*t));
    phi1_2(abs(x-a+c*t)<1) = 1*(1-abs(x(abs(x-a+c*t)<1)-a+c*t));

    phi2_1(abs(x-b-c*t)<1) = 1/3*(1-abs(x(abs(x-b-c*t)<1)-b-c*t));
    phi2_2(abs(x-b+c*t)<1) = 1/3*(1-abs(x(abs(x-b+c*t)<1)-b+c*t));
    % Superposition of waves
    % y1 = phi1_1+phi1_2;
    % y2 = phi2_1+phi2_2;
    % y3(abs(x-a+c*t)<1 & (abs(x-b-c*t)<1)) = phi2_1(abs(x-a+c*t)<1 & (abs(x-b-c*t)<1)) ...
    %     + phi1_2(abs(x-a+c*t)<1 & (abs(x-b-c*t)<1));
    y = phi1_1 + phi1_2 + phi2_1 + phi2_2 + 0.01;

    % Plotting the waves
    plot(x,phi1_1,'g',LineWidth=3)
    hold on
    plot(x,phi1_2,'b',LineWidth=3)

    plot(x,phi2_1,'g',LineWidth=3)
    plot(x,phi2_2,'b',LineWidth=3)

    plot(x,y,'k',LineWidth=2);

    axis([axis_left axis_right axis_top axis_bottom]);
    ylabel("u(x,t)")
    xlabel("x")
    % xticks([axis_left axis_left/2 0 axis_right/2 axis_right])
    % xticklabels({'x=-4pi','x = -2pi','x = 0','x = 2pi','x = 4pi'})

    hold off
    

    % Adding time to plot
    time_string = sprintf("t=%1.2f",round(t,2));
    text(pi,0.9,time_string);

    % Creating animation
    drawnow;
    

    % Create gif
    % exportgraphics(gcf,'two_triangle_travelling_wave_diff_height.gif','Append',true);
% 
end
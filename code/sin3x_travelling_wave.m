c = 4; % Wave speed
x = -4*pi:0.01*pi:4*pi; % Region defined
dt = 0.01; % Time step
start_time = 0; % Initial time
end_time = pi/c; % End time
range = [-1, 1]; % Axis range

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
    phi1(abs(x-c*t)<pi) = 1/2*sin(3*(x(abs(x-c*t)<pi)-c*t));
    phi2(abs(x+c*t)<pi) = 1/2*sin(3*(x(abs(x+c*t)<pi)+c*t));
    % Superposition of waves
    y = phi1+phi2+0.01;

    % Plotting the waves
    plot(x,y,'k',LineWidth=3)
    hold on
    plot(x,phi1,'g',LineWidth=3)
    plot(x,phi2,'m',LineWidth=3)

    axis([axis_left axis_right axis_top axis_bottom]);
    ylabel("u(x,t)")
    xlabel("x")
    xticks([axis_left axis_left/2 0 axis_right/2 axis_right])
    xticklabels({'x=-4pi','x = -2pi','x = 0','x = 2pi','x = 4pi'})

    hold off
    

    % Adding time to plot
    time_string = sprintf("t=%1.2f",round(t,2));
    text(pi,0.9,time_string);

    % Creating animation
    drawnow;
    

    % Create gif
    % exportgraphics(gcf,'Travelling_wave_q2.gif','Append',true);

end
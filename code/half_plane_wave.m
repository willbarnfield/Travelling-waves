c = 1; % Wave speed
x = -4*pi:0.01*pi:5*pi; % Region defined
dt = 0.05; % Time step
start_time = 0; % Initial time
end_time = 12; % End time
range = [1.2, -1.2]; % Axis range

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
    y=zeros(size(x));

    % Travelling wave
    % phi1(pi<(x-c*t+pi)<2*pi) = (sin(x(pi<(x-c*t+pi)<2*pi)-c*t+pi));
    % phi2(-2*pi<(x-c*t-pi)<-pi) = (sin(x(-2*pi<(x-c*t+pi)<-pi)-c*t-pi));
    % phi1_1((x+c*t)>pi & (x+c*t)<2*pi) = 1/2*sin(x((x+c*t)>pi & (x+c*t)<2*pi)+c*t+pi);
    % phi1_2((x-c*t)>pi & (x-c*t)<2*pi) = 1/2*sin(x((x-c*t)>pi & (x-c*t)<2*pi)-c*t+pi);
    % phi2_1((x-c*t)>-2*pi & (x-c*t)<-pi) = 1/2*sin(x((x-c*t)>-2*pi & (x-c*t)<-pi)-c*t-pi);
    % phi2_2((x+c*t)>-2*pi & (x+c*t)<-pi) = 1/2*sin(x((x+c*t)>-2*pi & (x+c*t)<-pi)+c*t-pi);

    phi1_1((x+c*t)>pi & (x+c*t)<2*pi) = 1/2*(2*sin(3*(x((x+c*t)>pi & (x+c*t)<2*pi)+c*t+pi)) - sin(1*(x((x+c*t)>pi & (x+c*t)<2*pi)+c*t+pi)));
    phi1_2((x-c*t)>pi & (x-c*t)<2*pi) = 1/2*(2*sin(3*(x((x-c*t)>pi & (x-c*t)<2*pi)-c*t+pi)) - sin(1*(x((x-c*t)>pi & (x-c*t)<2*pi)-c*t+pi)));
    phi2_1((x-c*t)>-2*pi & (x-c*t)<-pi) = 1/2*(2*sin(3*(x((x-c*t)>-2*pi & (x-c*t)<-pi)-c*t-pi)) - sin(1*(x((x-c*t)>-2*pi & (x-c*t)<-pi)-c*t-pi)));
    phi2_2((x+c*t)>-2*pi & (x+c*t)<-pi) = 1/2*(2*sin(3*(x((x+c*t)>-2*pi & (x+c*t)<-pi)+c*t-pi)) - sin(1*(x((x+c*t)>-2*pi & (x+c*t)<-pi)+c*t-pi)));

    % Superposition of waves
    y = phi1_1 + phi1_2 + phi2_1 + phi2_2;

    % Plotting the waves
    fill([-4*pi, -4*pi, 0, 0], [-1.2, 1.2, 1.2, -1.2], [0.8,0.8,0.8])
    hold on
    % plot(x,phi1_1,'g',LineWidth=3)
    % plot(x,phi1_2,'b',LineWidth=3)
    % plot(x,phi2_1,'b',LineWidth=3)   
    % plot(x,phi2_2,'g',LineWidth=3)   
    plot(x,y,'k',LineWidth=2);
    line([0 0], [-1.2 1.2], color="cyan",LineWidth=2)
    

    axis([-3*pi 5*pi -3 3]);
    ylabel("u(x,t)")
    xlabel("x")
    % xticks([axis_left axis_left/2 0 axis_right/2 axis_right])
    % xticklabels({'x=-4pi','x = -2pi','x = 0','x = 2pi','x = 4pi'})

    hold off
    % 

    % Adding time to plot
    time_string = sprintf("t=%1.2f",round(t,2));
    text(7.5,1,time_string);

    % Creating animation
    drawnow;
    

    % Create gif
    % exportgraphics(gcf,'half_plane_wave_halfplane.gif','Append',true);
% 
end
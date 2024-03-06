% x=-2:0.01:2;
% x=0;
dt = 0.005;

% Initialise function size
% psi=zeros(size(x));

% Travelling wave
% t=1/4;
figure(1)
clf(1)
% hold on
for t = 0:0.01:2
    xt = [];
    u = [];
    for x=-4:dt:4
        % a = -1:dt*t:1;
        % b = x-t:dt*t:x+t;
        % intersection = intersect(a, b);
        % if intersection
        %     xt = [xt, x];
        %     u = [u, 1/4*(intersection(end) - intersection(1))];
        % end   
        minu = -1; maxu = 1;
        if (-1 <= x-t) && (x-t <= 1)
            minu = x-t;
        end
        if (-1 <= x+t) && (x+t <= 1)
            maxu = x+t;
        end
        if (-1 >= x+t)
            maxu = 0; minu = 0;
        elseif (1 <= x-t)
            maxu = 0; minu = 0;
        end

        u = [u, 1/4*(maxu - minu)];
        xt = [xt, x];
    end 
    % if u
    %     plot_list = [];
    %     plot_list = [plot_list, 0, u(max(u) == u) ,0];
    %     x_list = [];
    %     x_list = [x_list, xt(1), xt(max(u) == u), xt(end)];
    %     plot(x_list,plot_list,'k')
    
       plot(xt,u,'k',LineWidth=2)
       time_string = sprintf("t=%1.2f",round(t,2));
       text(2,0.7,time_string);
    
    axis([-4 4 0 1]);
    % hold off
    drawnow;

    % exportgraphics(gcf,'hammer_wave.gif','Append',true);
end

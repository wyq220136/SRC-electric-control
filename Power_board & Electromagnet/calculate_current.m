L = [0.05, 0.075, 0.1, 0.125,  0.15, 0.175, 0.2];  
colors = lines(length(L)); 
  
figure; 
hold on;
  
for j = 1:length(L)
    u1 = 220; u2 = 2.58;  
    i2 = 0.506; i3 = 0.506; i4 = 0; i5 = 0;  
    i1 = i2 + i5;  
    t = 0:0.0000005:0.0127; 
    I = zeros(size(t)); % 初始化I数组  
  
    for i = 1:length(t)  
        dt = 0.0000005;
  
        du1 = i1 * dt / (-4.40044 / 1000);
        di5 = (u1 - 1.6 * i5) * dt / L(j);
        du2 = i4 * 100000000 * dt;
        di3 = du2 / 5100;
        di2 = (du1 - du2) / 430000;
        di4 = di2 - di3;
        di1 = di5 + di2;


        i1 = i1 + di1;
        i2 = i2 + di2;
        i3 = i3 + di3;
        i4 = i4 + di4;
        i5 = i5 + di5;
        u1 = u1 + du1;
        u2 = u2 + du2; 
  

        I(i) = i5;  
    end  
  
    plot(t, I, 'LineWidth', 1.7, 'Color', colors(j,:));  
end  
  
plot(t, 15*ones(size(t)), '--k', 'LineWidth', 1.5);
  
xlabel('t(s)');  
ylabel('I(A)');  
title('I change overtime');  
legend(arrayfun(@(x) sprintf('L = %.4f H', L(x)), 1:length(L), 'UniformOutput', false), 'Location', 'best'); % 添加图例，包括参考线  
hold off;  


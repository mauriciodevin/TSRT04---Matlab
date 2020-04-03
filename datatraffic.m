clc
clear
close all

load datatraffic.mat

averagetraffic = traffic*(1e6)/(9.7e7); %divided per population times 1e6 to convert to gigabyte

for i = 1:size(years)
    totaltraffic(i) = sum(traffic(i,:)); %Calculation of the total amount of data
end
averagetotaltraffic = totaltraffic*(1e6)/(9.7e7);

%Turning the array in a column
totaltraffic = (totaltraffic)';
%Add the array with the total amount of data as a column of the matrix traffic
traffic( :, end+1 ) = totaltraffic'; 

%Calculation of the tendency line
t = 0:5;
forecast = totaltraffic(1)*(1.35.^t);

%Linear graphic of the amount of data traffic for different types of data 
% as a function of time
figure(1)
hold on
grid on
plot(years, traffic(:,4), 'g', 'LineWidth', 3)
plot(years, forecast, 'm- ', 'LineWidth', 3); %Tendency line of the amount of data
plot(years, traffic(:,1), 'r-*', 'LineWidth', 3)
plot(years, traffic(:,3), 'k--', 'LineWidth', 3)
plot(years, traffic(:,2), 'b-o', 'LineWidth', 3)
title('Data Traffic in Sweden [LINE]')
xlabel('Time (Years)')
ylabel('Amount of data (Pentabytes)')
legend('Total Traffic','Tendency Line', 'Video Streaming', 'Web and Other', 'File transfer')

%Bar graphic of the amount of data traffic for different types of data 
% as a function of time
figure(2)
grid on
hold on
bar(years, traffic)
%bar(years, traffic, 'stacked') %stacked graph 
title('Data Traffic in Sweden [BAR]')
xlabel('Time (Years)')
ylabel('Amount of data (Pentabytes)')
legend('Video Streaming', 'File transfer', 'Web and Other','Total Traffic')

%Linear graphic of Average Data Traffic per Person in Sweden 
% as a function of time
figure(3)
hold on
grid on
plot(years, averagetotaltraffic, 'g', 'LineWidth', 3)
plot(years, averagetraffic(:,1), 'r-*', 'LineWidth', 3)
plot(years, averagetraffic(:,3), 'k--', 'LineWidth', 3)
plot(years, averagetraffic(:,2), 'b-o', 'LineWidth', 3)
title('Average Data Traffic per Person in Sweden [LINE]')
xlabel('Time (Years)')
ylabel('Amount of data per Person (Gigabytes)')
legend('Total Traffic','Video Streaming', 'Web and Other', 'File transfer')



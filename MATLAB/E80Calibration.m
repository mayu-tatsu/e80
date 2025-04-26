%calibration for E80 Robot
clear
datafile = load('datalog.csv'); %rename to the proper file
%line 1 is time

%line 2 is  nan

%line 3 is ph var2 
%line 4 is vmin pin3 
%line 5 is vmax pin4
%line 6 is temp var5

%line 7 is NAN 
%line 8 is NAN
%line 9 is NAN
%line 10 is NAN

datafile = datafile(:,1:1000);
%datafile = table2array(datafile);


x0 = 1:10:height(datafile); %%change name when running code%%%%
time = reshape(datafile(x0,:).',1,[]); %microseconds
time = 10^-6*time; %change from sample number to seconds?

x1= 2:10:height(datafile); %steals every tenth column starting with the second
var1 = reshape(datafile(x1,:) ,1,[]); %reshapes into vector
var1= 0.9*var1/275.5; %converts to volts
%same 3 steps for all variables

x2= 3:10:height(datafile);
var2 = reshape(datafile(x2,:).' ,1,[]);
var2= 3.3*var2/1024;

x3= 4:10:height(datafile);
var3 = reshape(datafile(x3,:).' ,1,[]);
var3= 3.3*var3/1024;

x4= 5:10:height(datafile);
var4 = reshape(datafile(x4,:).' ,1,[]);
var4= 3.3*var4/1024;

x5= 6:10:height(datafile);
var5 = reshape(datafile(x5,:).' ,1,[]);
var5= 0.9*var5/275.5;

x6= 7:10:height(datafile);
var6 = reshape(datafile(x6,:).' ,1,[]);
var6= 0.9*var6/275.5;

x7= 8:10:height(datafile);
var7 = reshape(datafile(x7,:).' ,1,[]);
var7= 0.9*var7/275.5;

x8= 9:10:height(datafile);
var8 = reshape(datafile(x8,:).' ,1,[]);
var8= 0.9*var8/275.5;

x9= 10:10:height(datafile);
var9 = reshape(datafile(x9,:).' ,1,[]);
var9= 0.9*var9/275.5;



%PH calibration -0.824*PH + 8.86 = Voltages
%comment in this section w/ correct var names
figure;
ph = (var2-8.86)./(-0.824);
plot(time,smoothdata(smoothdata(smoothdata(ph))))
title("PH With Respect to Time")
xlabel('Time (Secs)')
ylabel("PH")


%temperature Calibration -0.0477*temperature + 2.84 = voltages
figure;
temp = (var5-4.09)./(-0.165);
plot(time,temp)
title("Temperature With Respect to Time")
xlabel('Time (Secs')
ylabel("Temperature (C)")

%Salinity Calibration
figure;
vmin= var3;
vmax = var4;

salinity = 2.65+0.0153.*vmax+1.64*10^-4*(vmax).^2;
plot(time, salinity)
title("Salinity With Respect to Time")
xlabel('Time (Secs)')
ylabel("Salinity (ppt)")



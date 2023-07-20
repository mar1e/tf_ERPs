x=importdata('ERPdata.csv');
disp(x);
% disp(x.data);

% x1=csvread('ERPdata.csv');
y=importdata('mergedTrialData.csv');
disp(y);

% make the 1st subject ERPs
subj1=x.data(1:9216,:);
% make the ERPs for every subject, we have 81 subjects * 9216 = 746496
for i=1:81
    subj{i}=x.data((9216*i)+1:9216*(i+1),:);
end
%
%make Cz ERPs arrays, a and b epoch, to test easier the tfest
subj1a=subj1(1537:2237,5);
subj1b=subj1(4609:5309,5);
for i=1:81
    cz_erps_a{i}=subj{1,i}(1537:2237,5);
    cz_erps_b{i}=subj{1,i}(4609:5309,5);
end
%
%filters now
Fs=1024;
% 
% gaussian
window = 10;
h = normpdf( -window:window, 0, fix((2*window+1)/6) );
ynew4 = filter(h, 1, subj46a);
subplot(2,1,1);plot(subj46a);subplot(2,1,2);plot(ynew4);
% 
% lowpass Butterworth filter
% 
Fs=1024;
% 
fNorm = 10 / (Fs/2);               % normalized cutoff frequency
[b,a] = butter(1, fNorm, 'low');  % 10th order filter
ynew = filtfilt(b, a, subj47a);
subplot(2,1,1);plot(subj47a);subplot(2,1,2);plot(ynew);
title('butterworth')
%
%the following system approach will be after a butterworth filter and with trigger of delta function (name butzeros)
%
%try to process automatically every ERP from Cz electrode, filter it and
%find the modeling TF 
%
% lowpass Butterworth filter
% 
Fs=1024;
Ts=0.001;
% 
fNorm = 10 / (Fs/2);               % normalized cutoff frequency
[b,a] = butter(1, fNorm, 'low');  % 10th order filter
%try gauss filter as well
window = 10;
h = normpdf( -window:window, 0, fix((2*window+1)/6) );
%define different "dirac" inputs for best fits, then by hand fix 1st value
%to be 1 or 1000
% input=ones(701,1);
% input2=zeros(701,1);
%
for i=1:80
    subj_filtbutter_erp_a{i}=filtfilt(b, a,cz_erps_a{1,i});
%     subj_filtgauss_erp_a{i}=filter(h, 1, cz_erps_a{1,i});
    data_butzer_a{i}=iddata(subj_filtbutter_erp_a{1,i},input,Ts);
%   data_butones_a{i}=iddata(subj_filtbutter_erp_a{1,i},input2,Ts);
%     data_gauszer_a{i}=iddata(subj_filtgauss_erp_a{1,i},input,Ts);
%     data_gausones_a{i}=iddata(subj_filtgauss_erp_a{1,i},input2,Ts);
    sys1_a{i} = tfest(data_butzer_a{1,i},12,12);
    sys2_a{i} = tfest(data_butones_a{1,i},12,12);
end
%
% %
% for i=1:80
     sys3_a{i}=tfest(data_butzero_a{1,i},12,10,Ts);
     sys4_a{i}=tfest(data_butzero_a{1,i},12,8,Ts);
     sys5_a{i}=tfest(data_butzero_a{1,i},12,6,Ts);
  end
%
% for i=1:80
     fitmatr{1,i}=syszer_a{1,i}.Report.Fit.FitPercent;
  end
%%%%
%Feature extraction now
for i=1:length(controls)
    %[r[],p[],k[]] = residue(controls{1,i}.Numerator,controls{1,i}.Denominator);
    poles_contr{i}=pole(controls{1,i});
end
%
for i=1:length(schiz)
    %[r[],p[],k[]] = residue(controls{1,i}.Numerator,controls{1,i}.Denominator);
    poles_schiz{i}=pole(schiz{1,i});
end
%now extract the poles characteristics, magnitude, imaginary, real part
for i=1:length(poles_contr)
    real_contr{i}=real(poles_contr{1,i});
    imag_contr{i}=imag(poles_contr{1,i});
    abs_contr{i}=abs(poles_contr{1,i});
end
%
for i=1:length(poles_schiz)
    real_schiz{i}=real(poles_schiz{1,i});
    imag_schiz{i}=imag(poles_schiz{1,i});
    abs_schiz{i}=abs(poles_schiz{1,i});
end
%
% for j=1:length(abs_contr)
%     magn_contr(j)=horzcat(abs_contr{1,j},abs_contr{1,j+1));
% end
%
%
%clear data of features 
%remove low frequencies of poles imaginary part and the corresponding
%magnitude and real part of these poles removed as well, in order to remove "noise"
featschimagnitude(abs(featschiimaginary)<=24)=[];
featschireal(abs(featschiimaginary)<=24)=[];
featschiimaginary(abs(featschiimaginary)<=24)=[];
featconreal(abs(featconimag)<=24)=[];
featconmagn(abs(featconimag)<=24)=[];
featconimag(abs(featconimag)<=24)=[];
%I could get abs(imag) but used it without abs to remove negative
%duplicates as well
% response3=zeros(1,216);
% response3(217:527)=1;
% feat1=horzcat(featconmagn,featschimagnitude);
% feat2=horzcat(featconimag,featschiimaginary);
% feat3=horzcat(featconreal,featschireal);
% features123=vertcat(feat1,feat2,feat3,response3);
response3=zeros(1,434);
response3(435:1060)=1;
feat1=horzcat(featconmagn,featschimagnitude);
feat2=horzcat(featconimag,featschiimaginary);
feat3=horzcat(featconreal,featschireal);
features123=vertcat(feat1,feat2,feat3,response3);
%


    

    
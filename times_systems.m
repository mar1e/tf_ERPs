%time characteristics of the
%simulated dynamic system
%
%t=0:1/1000:2;
%y1=exp(-3.6*t).*[-126.4*2*cos(77.82*t)-51.02*2*sin(77.82*t)]+exp(-28.75*t).*[-377.65*2*cos(58.15*t)+1667.7*2*sin(58.15*t)]+exp(-4.05*t).*[-571.8*2*cos(57.12*t)-1425.4*2*sin(57.12*t)]+exp(-2.69*t).*[-242.5*2*cos(36.77*t)+1579.6*sin(36.77*t)]+exp(-5.2*t).*[-1377.3*2*cos(18.157*t)-4600*2*sin(18.157*t)]+exp(-0.677*t).*[2695.7*2*cos(1.35*t)-4275*sin(1.35*t)];
%y2=exp(-23.42*t).*[0.2882*2*cos(192.4*t)+0.766*2*sin(192.4*t)]+exp(-7.6*t).*[0.2237*2*cos(97.136*t)+0.0913*2*sin(97.136*t)]+exp(-4.896*t).*[-0.6777*2*cos(57.973*t)+1.1977*2*sin(57.973*t)]+[exp(-54.837*t)*14.4112]+exp(-4.0707*t).*[1.8499*2*cos(36.5194*t)+1.5988*2*sin(36.5194*t)]+exp(-2.518*t).*[-2.5252*2*cos(15.471*t)+2.1464*2*sin(15.471*t)]+[exp(-13.2231*t)*(-12.729)];
%
% for i=1:length(schiz)
%       [yschiz{i},tschiz{i}]=impulse(schiz{i});
%       schiz_pot{i}=lsiminfo(yschiz{i},tschiz{i});
%       N100_schiz(i)=schiz_pot{1,i}.Min;
%       N100time_schiz(i)=schiz_pot{1,i}.MinTime;
%       P200_schiz{i}=schiz_pot{1,i}.Max;
%       P200time_schiz{i}=schiz_pot{1,i}.MaxTime;
%       setltime_schiz{i}=schiz_pot{1,i}.SettlingTime;
% end
% %
% for i=1:length(schiz_b)
%      [yschizb{i},tschizb{i}]=impulse(schiz_b{i});
%      schiz_pot_b{i}=lsiminfo(yschizb{i},tschizb{i});
%      N100_schiz_b(i)=schiz_pot_b{1,i}.Min;
%      N100time_schizb(i)=schiz_pot_b{1,i}.MinTime;
%      P200_schiz_b{i}=schiz_pot_b{1,i}.Max;
%      P200time_schizb{i}=schiz_pot_b{1,i}.MaxTime;
%      setltime_schizb{i}=schiz_pot_b{1,i}.SettlingTime;
% end
% %
% for i=1:length(controls)
%      [ycon{i},tcon{i}]=impulse(controls{i});
%      con_pot{i}=lsiminfo(ycon{i},tcon{i});
%      N100_con(i)=con_pot{1,i}.Min;
%      N100time_con(i)=con_pot{1,i}.MinTime;
%      P200_con{i}=con_pot{1,i}.Max;
%      P200time_con(i)=con_pot{1,i}.MaxTime;
%      setltime_con{i}=con_pot{1,i}.SettlingTime;
% end
% %
% for i=1:length(controls_b)
%     [yconb{i},tconb{i}]=impulse(controls_b{i});
%     con_pot_b{i}=lsiminfo(yconb{i},tconb{i});
%     N100_con_b(i)=con_pot_b{1,i}.Min;
%     N100time_conb(i)=con_pot_b{1,i}.MinTime;
%     P200_con_b{i}=con_pot_b{1,i}.Max;
%     P200time_conb(i)=con_pot_b{1,i}.MaxTime;
%     setltime_conb{i}=con_pot_b{1,i}.SettlingTime;
% end
%
%P200time_schiz=cell2double(P200time_schiz);
% setltime_schiz=cell2mat(setltime_schiz)';
% setltime_con=cell2mat(setltime_con)';
% setltime_conb=cell2mat(setltime_conb)';
% setltime_schizb=cell2mat(setltime_schizb)';
%
%calculate N100_amplitudes based on N100_times
%
for i=1:length(N100_times_con_a)
    idx{i}=find(tcon{1,i}<=N100_times_con_a(i,1));
    lengths{i}=length(idx{i});
    N100_con_ampl{i}=min(ycon{1,i}(2:lengths{i}+20));
end
%
N100_con_ampl=cell2mat(N100_con_ampl)';

for i=1:length(N100_times_con_b)
    idx_b{i}=find(tconb{1,i}<=N100_times_con_b(i,1));
    lengths_b{i}=length(idx_b{i});
    N100_con_ampl_b{i}=min(yconb{1,i}(2:lengths_b{i}+20));
end
%
N100_con_ampl_b=cell2mat(N100_con_ampl_b)';
%
for i=1:length(N100_times_schiz_b)
    idx_sz_b{i}=find(tschizb{1,i}<=N100_times_schiz_b(i,1));
    lengths_sz_b{i}=length(idx_sz_b{i});
    N100_sz_ampl_b{i}=min(yschizb{1,i}(2:lengths_sz_b{i}+20));
end
%
N100_sz_ampl_b=cell2mat(N100_sz_ampl_b)';
%
for i=1:length(N100_times_schiz_a)
    idx_sz{i}=find(tschiz{1,i}<=N100_times_schiz_a(i,1));
    lengths_sz{i}=length(idx_sz{i});
    N100_sz_ampl{i}=min(yschiz{1,i}(2:lengths_sz{i}+20));
end
%
N100_sz_ampl=cell2mat(N100_sz_ampl)';
%
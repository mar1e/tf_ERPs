%make Cz pseudotrial epoch arrays, a and b epoch, to test whether there is
%the same behavior in frequencies' coherence
subj1a_ps=subj1(500:1500,5);
subj1b_ps=subj1(3500:4500,5);
for i=1:81
    pseudo_cz_erps_a{i}=subj{1,i}(500:1500,5);
    pseudo_cz_erps_b{i}=subj{1,i}(3500:4500,5);
end
for i=1:23
    ps_con1_a{i}=pseudo_cz_erps_a{1,i};
end
ps_con1_a=cell2mat(ps_con1_a);
%
for i=58:65
    ps_con2_a{i}=pseudo_cz_erps_a{1,i};
end
ps_con2_a=cell2mat(ps_con2_a);
%
for i=24:57
    ps_schiz1_a{i}=pseudo_cz_erps_a{1,i};
end
ps_schiz1_a=cell2mat(ps_schiz1_a);
%
for i=66:80
    ps_schiz2_a{i}=pseudo_cz_erps_a{1,i};
end
ps_schiz2_a=cell2mat(ps_schiz2_a);
%
%
for i=1:23
    ps_con1_b{i}=pseudo_cz_erps_b{1,i};
end
ps_con1_b=cell2mat(ps_con1_b);
%
for i=58:65
    ps_con2_b{i}=pseudo_cz_erps_b{1,i};
end
ps_con2_b=cell2mat(ps_con2_b);
%
for i=24:57
    ps_schiz1_b{i}=pseudo_cz_erps_b{1,i};
end
ps_schiz1_b=cell2mat(ps_schiz1_b);
%
for i=66:80
    ps_schiz2_b{i}=pseudo_cz_erps_b{1,i};
end
ps_schiz2_b=cell2mat(ps_schiz2_b);
%
ps_con_a=horzcat(subj1a_ps,ps_con1_a,ps_con2_a);
ps_con_b=horzcat(subj1b_ps,ps_con1_b,ps_con2_b);
ps_schiz_a=horzcat(ps_schiz1_a,ps_schiz2_a);
ps_schiz_b=horzcat(ps_schiz1_b,ps_schiz2_b);
ps_con_a_eps=reshape(ps_con_a,32032,1);
ps_con_b_eps=reshape(ps_con_b,32032,1);
ps_sz_a_eps=reshape(ps_schiz_a,49049,1);
ps_sz_b_eps=reshape(ps_schiz_b,49049,1);


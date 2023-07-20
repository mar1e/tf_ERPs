for i=1:24
    for j=25:58
      d_con_sz_a1{i,j}=dtw(subj_filtbutter_erp_a{1,i},subj_filtbutter_erp_a{1,j});
      dist_con_sz_a1{i,j}=finddelay(subj_filtbutter_erp_a{1,i},subj_filtbutter_erp_a{1,j});
    end
end
%
d_con_sz_a1=cell2mat(d_con_sz_a1);
dist_con_sz_a1=cell2mat(dist_con_sz_a1);
%
for k=1:24
    for l=67:81
      d_con_sz_a2{k,l}=dtw(subj_filtbutter_erp_a{1,k},subj_filtbutter_erp_a{1,l});
      dist_con_sz_a2{k,l}=finddelay(subj_filtbutter_erp_a{1,k},subj_filtbutter_erp_a{1,l});
    end
end
%
d_con_sz_a2=cell2mat(d_con_sz_a2);
dist_con_sz_a2=cell2mat(dist_con_sz_a2);
%
for i=59:66
    for j=25:58
      d_con_sz_a3{i,j}=dtw(subj_filtbutter_erp_a{1,i},subj_filtbutter_erp_a{1,j});
      dist_con_sz_a3{i,j}=finddelay(subj_filtbutter_erp_a{1,i},subj_filtbutter_erp_a{1,j});
    end
end
%
d_con_sz_a3=cell2mat(d_con_sz_a3);
dist_con_sz_a3=cell2mat(dist_con_sz_a3);
%
for k=59:66
    for l=67:81
      d_con_sz_a4{k,l}=dtw(subj_filtbutter_erp_a{1,k},subj_filtbutter_erp_a{1,l});
      dist_con_sz_a4{k,l}=finddelay(subj_filtbutter_erp_a{1,k},subj_filtbutter_erp_a{1,l});
    end
end
%
d_con_sz_a4=cell2mat(d_con_sz_a4);
dist_con_sz_a4=cell2mat(dist_con_sz_a4);
%
d_con_sz_a_al=horzcat(d_con_sz_a1,d_con_sz_a2);
d_con_sz_a_al2=horzcat(d_con_sz_a3,d_con_sz_a4);
d_con_sz_a_all=vertcat(d_con_sz_a_al,d_con_sz_a_al2);
dist_con_sz_a_al=horzcat(dist_con_sz_a1,dist_con_sz_a2);
dist_con_sz_a_al2=horzcat(dist_con_sz_a3,dist_con_sz_a4);
dist_con_sz_a_all=vertcat(dist_con_sz_a_al,dist_con_sz_a_al2);
%
subplot(2,1,1);contour(d_con_sz_a_all);set(gca,'ydir','reverse');
subplot(2,1,2);imagesc(dist_con_sz_a_all);
%convert to 1d column arrays to work with spss 
dtw_con_sz=d_con_sz_a_all(:);
timedist_con_sz=dist_con_sz_a_all(:);
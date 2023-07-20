[X,Y,T,AUC,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(response,validationScores(:,2),'1');
[X2,Y2,T2,AUC2,OPTROCPT2,SUBY2,SUBYNAMES2] = perfcurve(response2,validationScores2(:,2),'1');
[X3,Y3,T3,AUC3,OPTROCPT3,SUBY3,SUBYNAMES3] = perfcurve(response3,validationScores3(:,2),'1');
plot(X,Y,OPTROCPT(1),OPTROCPT(2),'r*');hold on;plot(X2,Y2,OPTROCPT2(1),OPTROCPT2(2),'g*');hold on;plot(X3,Y3,OPTROCPT3(1),OPTROCPT3(2),'b*')
%
%hint for classification matrix : C = confusionmat(response,validationPredictions);
%CP = classperf(response,validationPredictions);
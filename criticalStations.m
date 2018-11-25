%station=stations_weekload('stations_week.mat');
listStations_week=stations_week;%station.stations_week;
%station_end=load('stations_weekend.mat');
listStations_weekend=stations_weekend;%station_end.stations_weekend;
accuStations_week=zeros([2,24]);
for i=1:size(listStations_week,1)
    mat=listStations_week{i,2};
    accuStations_week=accuStations_week+mat;
end
meanStations_week=accuStations_week(2,:)./accuStations_week(1,:);

accuStations_weekend=zeros([2,24]);
for i=1:size(listStations_weekend,1)
    mat=listStations_weekend{i,2};
    accuStations_weekend=accuStations_weekend+mat;
end
meanStations_weekend=accuStations_weekend(2,:)./accuStations_weekend(1,:);

% figure;
% subplot(221);
% plot(0:23,accuStations_week(1,:),'ro-');
% title('Average number of daily changes (laborable)');
% xlabel('Time [hours]');
% ylabel('Number of transfers');
% subplot(222);
% plot(0:23,meanStations_week/60,'ro-');
% xlabel('Time [hours]');
% ylabel('Waiting time [min]');
% title('Average daily waiting time/transfer (laborable)');
% subplot(223);
% plot(0:23,accuStations_weekend(1,:),'ro-');
% title('Average number of daily changes (weekend)');
% ylabel('Number of transfers');
% xlabel('Time [hours]');
% subplot(224);
% plot(0:23,meanStations_weekend/60,'ro-');
% title('Average daily waiting time/transfer (weekend)');
% ylabel('Waiting time [min]');
% xlabel('Time [hours]');




means_week=[];

for i=1:size(listStations_week,1)
    mat=listStations_week{i,2};
    num_morning=mat(1,5:8);
    tm_morning=mat(2,5:8);
    num_afternoon=mat(1,14:17);
    tm_afternoon=mat(2,14:17);
    mor_mean=zeros([4,1]);
    aft_mean=zeros([4,1]);
    for j=1:4
        if(num_morning(1,j)~=0)
            mor_mean(j)=tm_morning(1,j)/num_morning(1,j);
        end
        if(num_afternoon(1,j)~=0)
            aft_mean(j)=tm_afternoon(1,j)/num_afternoon(1,j);
        end
    end
    morning_mean=mean(mor_mean);
    afternoon_mean=mean(aft_mean);
    iii=listStations_week{i,1};
    iiii=iii(:,1);
    means_week=[means_week;iiii,morning_mean,afternoon_mean,sum(num_morning),sum(num_afternoon)];
end
means_weekend=[];
for i=1:size(listStations_weekend,1)
    mat=listStations_weekend{i,2};
    num_w=mat(1,6:21);
    tm_w=mat(2,6:21);
    w_mean=zeros([16,1]);
    for j=1:16
        if(num_w(1,j)~=0)
            w_mean(j)=tm_w(1,j)/num_w(1,j);
        end
    end
    m_mean=mean(w_mean);
    iii=listStations_weekend{i,1};
    iiii=iii(:,1);
    means_weekend=[means_weekend;iiii,m_mean,sum(num_w)];
    
end


[sorted,idx]=sort(means_week(:,4),'Descend');
morning_week=[means_week(idx,1),means_week(idx,2),means_week(idx,4)];


[sorted,idx]=sort(means_week(:,5),'Descend');
afternoon_week=[means_week(idx,1),means_week(idx,3),means_week(idx,5)];

[sorted,idx]=sort(means_weekend(:,3),'Descend');
day_weekend=means_weekend(idx,1:3);

morning_week = [morning_week, morning_week(:,2).*morning_week(:,3)];
afternoon_week = [afternoon_week, afternoon_week(:,2).*afternoon_week(:,3)];
day_weekend = [day_weekend, day_weekend(:,2).*day_weekend(:,3)];

[sorted,idx]=sort(morning_week(:,4),'Descend');
morning_week2=morning_week(idx,1:4);

[sorted,idx]=sort(afternoon_week(:,4),'Descend');
afternoon_week2=afternoon_week(idx,1:4);

[sorted,idx]=sort(day_weekend(:,4),'Descend');
day_weekend2=day_weekend(idx,1:4);



% 
% figure;
% subplot(131);
% histogram(morning_week(:,2)/60);
% title({'Histogram for laborable morning'});
% xlabel('Waiting times/transfer');
% subplot(132);
% histogram(afternoon_week(:,2)/60);
% title({'Histogram fo laborable afternoon'});
% xlabel('Waiting times/transfer');
% subplot(133);
% histogram(day_weekend(:,2)/60);
% title({'Histogram for weekend'});
% xlabel('Waiting times/transfer');






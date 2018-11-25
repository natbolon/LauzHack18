diff=[];
count=0;
idtr=[];
differentparada=0;
matDiffId=[];
data_sel=[];
days=[];
nameStation=[];
timeFrame=[];
total_delay=0;
num_transfer=0;

for j=1:length(val)
        try
        firstStart=val(j).segments(1).startAt;
        d=split(firstStart,'T');
        dd=split(d{1},'-');
        day=str2num(dd{3});

        for i=2:length(val(j).segments)
                    
                %if (val(j).segments(i).route.id~=val(j).segments(i-1).route.id)
                  if ( ~strcmp(val(j).segments(i-1).route.name,val(j).segments(i).route.name))
            %if (val(j).segments(i).route.id~=val(j).segments(i-1).route.id)
                    num_transfer=num_transfer+1;
                endtime=val(j).segments(i-1).endAt;
                end2=split(endtime,'T');
                end3=split(end2{2},'.');
                end4=split(end3{1},':');
                endnum=str2num(end4{1,1})*3600+str2num(end4{2,1})*60+str2num(end4{3,1});%datenum( end3{1}, 'HH:MM:SS' );
                begtime=val(j).segments(i).startAt;
                beg2=split(begtime,'T');
                beg3=split(beg2{2},'.');
                beg4=split(beg3{1},':');
                begnum=str2num(beg4{1,1})*3600+str2num(beg4{2,1})*60+str2num(beg4{3,1});
                diff=[diff;begnum-endnum];
                diffsel=begnum-endnum;
                total_delay=total_delay+diffsel;
                if(diffsel<60*60 && diffsel>0)
                    idtr=[idtr;val(j).segments(i).startStation.id];
                    matDiffId=[matDiffId;diffsel];  
                    days=[days;day];
                    nameStation=[nameStation;{val(j).segments(i).startStation.name}];
                    timeFrame=[timeFrame;str2num(end4{1,1})];
                    if(str2num(val(j).segments(i).startStation.id)==8577807)
                    num_total=num_total+1;
                    end
                end
                
        

            end   
    end
    catch
            count=count+1;
    end
end


mat=[str2num(idtr),matDiffId,days,timeFrame]; %estacio,diferencia de temps, dia, timefram

mm=unique(mat(:,1));
meantimes=[];
vartimes=[];
[iii,uniqi,~]=unique(str2num(idtr));
names_uniq=[num2cell(iii) nameStation(uniqi)];


weekend=[];
week=[];
for i=1:size(mat,1)
    if(days(i)==24 || days(i)==25)
        weekend=[weekend;mat(i,:)];
    
    else
        week=[week;mat(i,:)];
    end 
end

idsunique_week=unique(week(:,1));
stations_week=[];
for i=1:length(idsunique_week) %station id

    hores=zeros([2,24,5]);
    for j=1:size(week,1) %transfer
        
        if(week(j,1)==idsunique_week(i)) 
           %diesSetmana(week(:,3)-19,1)=diesSetmana(week(:,3)-19,1)+1;
           hores(1,week(j,4)+1,week(j,3)-18)=hores(1,week(j,4)+1,week(j,3)-18)+1;
           hores(2,week(j,4)+1,week(j,3)-18)=hores(2,week(j,4)+1,week(j,3)-18)+week(j,2);
           
        end
%         if(week(j,1)==8577807)
%                num_week=num_week+1;
%         end
        
    end
    tm=zeros([5,24]);
    numTran=zeros([5,24]);
    for k=1:5
        numTran(k,:)=hores(1,:,k);
        for z=1:24
            if(numTran(k,z)==0)
            tm(k,z)=0;
            else
            tm(k,z)=hores(2,z,k)./numTran(k,z);
            end
        end
        
    end
    
   stations_week=[stations_week;{idsunique_week(i)},{[mean(numTran,1);mean(tm,1)]}]; 

end
%%

num_end=0;
idsunique_weekend=unique(weekend(:,1));
stations_weekend=[];
for i=1:length(idsunique_weekend) %station id

    hores=zeros([2,24,2]);
    for j=1:size(weekend,1) %transfer
        
        if(weekend(j,1)==idsunique_weekend(i)) 
           %diesSetmana(week(:,3)-19,1)=diesSetmana(week(:,3)-19,1)+1;
           hores(1,weekend(j,4)+1,weekend(j,3)-23)=hores(1,weekend(j,4)+1,weekend(j,3)-23)+1;
           hores(2,weekend(j,4)+1,weekend(j,3)-23)=hores(2,weekend(j,4)+1,weekend(j,3)-23)+weekend(j,2);
           
        end
        
        
    end
    tm=zeros([2,24]);
    numTran=zeros([2,24]);
    for k=1:2
        numTran(k,:)=hores(1,:,k);
        for z=1:24
            if(numTran(k,z)==0)
            tm(k,z)=0;
            else
            tm(k,z)=hores(2,z,k)./numTran(k,z);
            end
        end
        
    end
    
   stations_weekend=[stations_weekend;{idsunique_weekend(i)},{[mean(numTran,1);mean(tm,1)]}]; 

end

num_week=0;
num_end=0;
num_t=0;
for j=1:size(week,1)
    if(week(j,1)==8577807)
               num_week=num_week+1;
           end
end
for j=1:size(weekend,1)
    if(weekend(j,1)==8577807)
               num_end=num_end+1;
           end
end

for j=1:size(mat,1)
     if(mat(j,1)==8577807)
               num_t=num_t+1;
           end
end

% num3=0;
% idsunique_weekend=unique(weekend(:,1));
% stations_weekend=[];
% for i=1:length(idsunique_weekend) %station id
%     hores=zeros([2,24,2]);
%     for j=1:size(weekend,1) %transfer
%         if(weekend(j,1)==idsunique_weekend(i)) 
%            %diesSetmana(weekend(:,3)-19,1)=diesSetmana(weekend(:,3)-19,1)+1;
%            hores(1,weekend(j,4)+1,weekend(j,3)-23)=hores(1,weekend(j,4)+1,weekend(j,3)-23)+1;
%            hores(2,weekend(j,4)+1,weekend(j,3)-23)=hores(2,weekend(j,4)+1,weekend(j,3)-23)+weekend(j,2);
%         end
%         if(weekend(j,1)==8577807)
%                num3=num3+1;
%            end
%         
%     end
%     num3
%     tm=zeros([2,24]);
%     numTran=zeros([2,24]);
%     for k=1:2
%         numTran(k,:)=hores(1,:,k);
%           for z=1:24
%             if(numTran(k,z)==0)
%             tm(k,z)=0;
%             else
%             tm(k,z)=hores(2,z,k)./numTran(k,z);
%             end
%         end
%     end
%     
%    stations_weekend=[stations_weekend;{idsunique_weekend(i)},{[mean(numTran,1);mean(tm,1)]}]; 
% 
% end

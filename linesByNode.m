function [ adj_matrix,adj_matrix_times,routes ] = linesByNode(nodeIDs,val)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
routes=[];
%types_routes=[];
for j=1:length(val)
        try
        for i=2:length(val(j).segments)
            if(ismember(str2num(val(j).segments(i).startStation.id),nodeIDs))
                    nameA={val(j).segments(i-1).route.name};
                    nameB={val(j).segments(i).route.name};
                %if (val(j).segments(i).route.id~=val(j).segments(i-1).route.id)
                  if ( ~strcmp(val(j).segments(i-1).route.name,val(j).segments(i).route.name))
                    
                    if(~any(strcmp(routes,nameA)))
                        routes=[routes;nameA];
                       % types_routes=[types_routes;val(j).segments(i-1).route.vehicleType];
                    end
                     if(~any(strcmp(routes,nameB)))
                        routes=[routes;nameB];
                       % types_routes=[types_routes;val(j).segments(i).route.vehicleType];
                    end
                end
            end
        end
        catch

        end
end
adj_matrix=zeros([length(routes),length(routes)]);
adj_matrix_times=zeros([length(routes),length(routes)]);
for j=1:length(val)
        try
        for i=2:length(val(j).segments)
            if(ismember(str2num(val(j).segments(i).startStation.id),nodeIDs))
            % || str2num(val(j).segments(i-1).endStation.id)==nodeID)
                nameA=val(j).segments(i-1).route.name;
                    nameB=val(j).segments(i).route.name;
                %if (val(j).segments(i).route.id~=val(j).segments(i-1).route.id)
                  if ( ~strcmp(nameA,nameB))
                               
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
                diffsel=begnum-endnum;
                    start_idx=0;
                    fin_idx=0;
                  if ( diffsel>0 && diffsel<60*60)
                   % nameA=val(j).segments(i-1).route.name;
                   % nameB=val(j).segments(i).route.name;
                    for k=1:size(routes,1)
                        nombre=routes{k,1};
                        if(strcmp(nameA,nombre))
                            start_idx=k;
                        end
              
                    end
                    for k=1:size(routes,1)
                        nombre=routes{k,1};
                        if(strcmp(nameB,nombre))
                            fin_idx=k; 
                        end
                    end
                    
                    if(start_idx==fin_idx)
                        fin_idx
                    end
                    adj_matrix(start_idx,fin_idx)=adj_matrix(start_idx,fin_idx)+1;
                    adj_matrix_times(start_idx,fin_idx)=adj_matrix_times(start_idx,fin_idx)+diffsel;
                    end
                end
                end
           
        end
        catch
            
        end
end


end


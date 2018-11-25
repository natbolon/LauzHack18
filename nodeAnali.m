% 
% %critical2=[8589161;8587255;8504086;8577810;8593280;8504769];
critical_central=[8592374;8504100;8504881];
[ adj_matrix,adj_matrix_times,routes]=linesByNode(critical_central,val);

transicio={};
num_pass=[];
temps_mig=[];

[row,col]=find(adj_matrix==max(max(adj_matrix)));
ids_station(1,1)=8592374;
num_pass(1,1)=adj_matrix(row(1),col(1));
temps_mig(1,1)=adj_matrix_times(row(1),col(1));
transicio{1,1}=routes{row(1)};
transicio{1,2}=routes{col(1)};

adj_matrix(row(1),col(1))=0;
[row,col]=find(adj_matrix==max(max(adj_matrix)));
num_pass(1,2)=adj_matrix(row(1),col(1));
temps_mig(1,2)=adj_matrix_times(row(1),col(1));
transicio{1,3}=routes{row(1)};
transicio{1,4}=routes{col(1)};

adj_matrix(row(1),col(1))=0;
[row,col]=find(adj_matrix==max(max(adj_matrix)));
num_pass(1,3)=adj_matrix(row(1),col(1));
temps_mig(1,3)=adj_matrix_times(row(1),col(1));
transicio{1,5}=routes{row(1)};
transicio{1,6}=routes{col(1)};


critical_noncentral=[8589161;8587255;8504086;8577810;8593280];
for i=1:size(critical_noncentral,1)
    ids_station(i+1,1)=critical_noncentral(i);
    [ adj_matrix,adj_matrix_times,routes]=linesByNode(critical_noncentral(i),val);
    [row,col]=find(adj_matrix==max(max(adj_matrix)));
    num_pass(i+1,1)=adj_matrix(row(1),col(1));
    temps_mig(i+1,1)=adj_matrix_times(row(1),col(1));
    transicio{i+1,1}=routes{row(1)};
    transicio{i+1,2}=routes{col(1)};
    
    adj_matrix(row(1),col(1))=0;
    [row,col]=find(adj_matrix==max(max(adj_matrix)));
    num_pass(i+1,2)=adj_matrix(row(1),col(1));
    temps_mig(i+1,2)=adj_matrix_times(row(1),col(1));
    transicio{i+1,3}=routes{row(1)};
    transicio{i+1,4}=routes{col(1)};
 
    adj_matrix(row(1),col(1))=0;
    [row,col]=find(adj_matrix==max(max(adj_matrix)));
    num_pass(i+1,3)=adj_matrix(row(1),col(1));
    temps_mig(i+1,3)=adj_matrix_times(row(1),col(1));
    transicio{i+1,5}=routes{row(1)};
    transicio{i+1,6}=routes{col(1)};
end

% sols afternoon
i=i+2;
critical_afternoon=8504769;
[ adj_matrix,adj_matrix_times,routes]=linesByNode(critical_afternoon,val);
[row,col]=find(adj_matrix==max(max(adj_matrix)));
ids_station(i)=critical_afternoon;
num_pass(i)=adj_matrix(row(1),col(1));
temps_mig(i)=adj_matrix_times(row(1),col(1));
transicio{i,1}=routes{row(1)};
transicio{i,2}=routes{col(1)};

    adj_matrix(row(1),col(1))=0;
    [row,col]=find(adj_matrix==max(max(adj_matrix)));
    num_pass(i,2)=adj_matrix(row(1),col(1));
    temps_mig(i,2)=adj_matrix_times(row(1),col(1));
    transicio{i,3}=routes{row(1)};
    transicio{i,4}=routes{col(1)};
 
    adj_matrix(row(1),col(1))=0;
    [row,col]=find(adj_matrix==max(max(adj_matrix)));
    num_pass(i,3)=adj_matrix(row(1),col(1));
    temps_mig(i,3)=adj_matrix_times(row(1),col(1));
    transicio{i,5}=routes{row(1)};
    transicio{i,6}=routes{col(1)};


% sols morning
i=i+1;
critical_morning=8504023;
ids_station(i)=critical_morning;
[ adj_matrix,adj_matrix_times,routes]=linesByNode(critical_morning,val);
[row,col]=find(adj_matrix==max(max(adj_matrix)));
num_pass(i)=adj_matrix(row(1),col(1));
temps_mig(i)=adj_matrix_times(row(1),col(1));
transicio{i,1}=routes{row(1)};
transicio{i,2}=routes{col(1)};



    adj_matrix(row(1),col(1))=0;
    [row,col]=find(adj_matrix==max(max(adj_matrix)));
    num_pass(i,2)=adj_matrix(row(1),col(1));
    temps_mig(i,2)=adj_matrix_times(row(1),col(1));
    transicio{i,3}=routes{row(1)};
    transicio{i,4}=routes{col(1)};
 
    adj_matrix(row(1),col(1))=0;
    [row,col]=find(adj_matrix==max(max(adj_matrix)));
    num_pass(i,3)=adj_matrix(row(1),col(1));
    temps_mig(i,3)=adj_matrix_times(row(1),col(1));
    transicio{i,5}=routes{row(1)};
    transicio{i,6}=routes{col(1)};
    
    % nomes weekend
i=i+1;
critical_weekend=8577725;
ids_station(i)=critical_weekend;
[ adj_matrix,adj_matrix_times,routes]=linesByNode(critical_weekend,val);
[row,col]=find(adj_matrix==max(max(adj_matrix)));
num_pass(i)=adj_matrix(row(1),col(1));
temps_mig(i)=adj_matrix_times(row(1),col(1));
transicio{i,1}=routes{row(1)};
transicio{i,2}=routes{col(1)};
  adj_matrix(row(1),col(1))=0;
    [row,col]=find(adj_matrix==max(max(adj_matrix)));
    num_pass(i,2)=adj_matrix(row(1),col(1));
    temps_mig(i,2)=adj_matrix_times(row(1),col(1));
    transicio{i,3}=routes{row(1)};
    transicio{i,4}=routes{col(1)};
 
    adj_matrix(row(1),col(1))=0;
    [row,col]=find(adj_matrix==max(max(adj_matrix)));
    num_pass(i,3)=adj_matrix(row(1),col(1));
    temps_mig(i,3)=adj_matrix_times(row(1),col(1));
    transicio{i,5}=routes{row(1)};
    transicio{i,6}=routes{col(1)};

% nomes weekend
i=i+1;
critical_weekend=8504138;
ids_station(i)=critical_weekend;
[ adj_matrix,adj_matrix_times,routes]=linesByNode(critical_weekend,val);
[row,col]=find(adj_matrix==max(max(adj_matrix)));
num_pass(i)=adj_matrix(row(1),col(1));
temps_mig(i)=adj_matrix_times(row(1),col(1));
transicio{i,1}=routes{row(1)};
transicio{i,2}=routes{col(1)};

  adj_matrix(row(1),col(1))=0;
    [row,col]=find(adj_matrix==max(max(adj_matrix)));
    num_pass(i,2)=adj_matrix(row(1),col(1));
    temps_mig(i,2)=adj_matrix_times(row(1),col(1));
    transicio{i,3}=routes{row(1)};
    transicio{i,4}=routes{col(1)};
 
    adj_matrix(row(1),col(1))=0;
    [row,col]=find(adj_matrix==max(max(adj_matrix)));
    num_pass(i,3)=adj_matrix(row(1),col(1));
    temps_mig(i,3)=adj_matrix_times(row(1),col(1));
    transicio{i,5}=routes{row(1)};
    transicio{i,6}=routes{col(1)};

%critical2_afternoon=[8589161;8587255;8504086;8577810;8593280];%sols afternoon 8504769
%critical2_morning=[8504086;8593280;8589161;8587255;8577810];% sols morning 8504023
%critical_weekend=[8504086;8593280;8589161;85872558577810];% sols weekend 8593280;8504023;8577725;8504138];

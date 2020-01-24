function variable_initialization()
classification_performed = 0;
applied_Radon = 0; 
selected_image = 1;
filter_order = [8,6];
area_threshold = [40,12];
cutoff_frequency = [5,14];
means_of_models(:,1)=[7.0559   29.6];
means_of_models(:,2)=[8.0772  16.8];
means_of_models(:,3)=[5.3542    4.8];
means_of_models(:,4)=[2.649    1];
means_of_models(:,5)=[ 0.4569        0];
covariance_of_models(:,:,1)=[0.303   0.51; 0.51   58.8];
covariance_of_models(:,:,2)=[2.0521    2.8049;  2.8049    9.700];
covariance_of_models(:,:,3)=[2.552   2.4250; 2.4250   5.700];
covariance_of_models(:,:,4)=[0.1043   -0.1462; -0.1462    1.5];
covariance_of_models(:,:,5)=[0.4293   2e-11; 2e-11    0.31];
display_response=1;
assignment=nan;
number_of_images=[];
area_and_difference=[];
save variables_and_flags
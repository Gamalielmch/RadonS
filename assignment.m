function Vars_and_flags=assignment(x,Vars_and_flags)

for part=1:size(x,1)
    F(1) = mvnpdf([x(part,1) x(part,2)],Vars_and_flags.means_of_models(:,1)',Vars_and_flags.covariance_of_models(:,:,1));
    F(2) = mvnpdf([x(part,1) x(part,2)],Vars_and_flags.means_of_models(:,2)',Vars_and_flags.covariance_of_models(:,:,2));
    F(3) = mvnpdf([x(part,1) x(part,2)],Vars_and_flags.means_of_models(:,3)',Vars_and_flags.covariance_of_models(:,:,3));
    F(4) = mvnpdf([x(part,1) x(part,2)],Vars_and_flags.means_of_models(:,4)',Vars_and_flags.covariance_of_models(:,:,4));
    F(5) = mvnpdf([x(part,1) x(part,2)],Vars_and_flags.means_of_models(:,5)',Vars_and_flags.covariance_of_models(:,:,5));
    [~,Vars_and_flags.assignment(part)]=max(F);   %assigned to a roundness class
end
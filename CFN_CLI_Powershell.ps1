aws cloudformation describe-stack-events --stack-name check-output
aws cloudformation delete-stack --stack-name check-output 

aws cloudformation create-stack --stack-name check-output `
--template-body file://C://......../AWS_CloudFormation_Introduction/code/6-outputs/0-create-ssh-security-group.yaml

aws cloudformation describe-stacks --stack-name check-output

aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE
aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE | select-string StackName

aws cloudformation list-stacks --stack-status-filter DELETE_COMPLETE
aws cloudformation list-stacks --stack-status-filter DELETE_COMPLETE | select-string StackName
aws cloudformation list-stacks --stack-status-filter DELETE_COMPLETE | select-string StackName | Where-Object {$_ -Like  "*lambda*"}


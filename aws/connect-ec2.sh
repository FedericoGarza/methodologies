ID_EC2=`aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" --query 'Reservations[].Instances[].InstanceId' --output text`
IP_EC2=`aws ec2 describe-instances --instance-ids "$ID_EC2" --query 'Reservations[*].Instances[*].PublicIpAddress' --output text`
ssh -i ~/.ssh/megafaas.pem ubuntu@$IP_EC2

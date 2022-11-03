ID_EC2=`aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" --query 'Reservations[].Instances[].InstanceId' --output text`
aws ec2 ${2:-start}-instances --instance-ids "$ID_EC2"
aws ec2 describe-instances --instance-ids "$ID_EC2" --query 'Reservations[*].Instances[*].PublicIpAddress' --output text

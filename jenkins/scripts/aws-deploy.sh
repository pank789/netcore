aws ecs create-cluster --cluster-name ${CLUSTER_NAME} --region us-east-1

aws ecs register-task-definition --cli-input-json file://fargate-task.json --region us-east-1

aws ecs list-task-definitions --region us-east-1

aws ecs create-service --region us-east-1 --cluster ${CLUSTER_NAME} --service-name fargate-service --task-definition cgiprofessionalnetcoreservices --desired-count 1 --launch-type "FARGATE" --network-configuration "awsvpcConfiguration={subnets=[subnet-0abccc56],securityGroups=[sg-86f451c1],assignPublicIp=ENABLED}"


aws sts assume-role --role-arn arn:aws:iam::085395249379:role/sreekanth-role-delete-me --role-session-name demouser > demouser.json

export AWS_ACCESS_KEY_ID=$(jq -r ".Credentials.AccessKeyId" <demouser.json)
export AWS_SESSION_TOKEN=$(jq -r ".Credentials.SessionToken" <demouser.json)
export AWS_SECRET_ACCESS_KEY=$(jq -r ".Credentials.SecretAccessKey" <demouser.json)

aws sts get-caller-identity

aws-auth upsert --maproles --rolearn arn:aws:iam::976261016405:role/cluster_creator --username demouser

kubectl apply -f aws-auth.yaml

unset AWS_ACCESS_KEY_ID
unset AWS_SESSION_TOKEN
unset AWS_SECRET_ACCESS_KEY

rm -rf demouser.json

aws eks update-kubeconfig --region us-east-2 --name complyscan-cluster

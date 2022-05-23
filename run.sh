kubectl apply -f sa.yaml
kubectl apply -f crb.yaml

printf "\nUse this token to login:\n"

kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"

printf "\n\n"

printf "Visit this URL to see the K8S UI:\n"
printf "http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/workloads?namespace=default"
printf "\n\n"

kubectl proxy 

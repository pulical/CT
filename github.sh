source region.sh

function get_latest_commit_hash() {

curl -s "$DOCKERFILE_URL" | head -n 1 | cut -d ' ' -f 3

}

LATEST_COMMIT_HASH=$(get_latest_commit_hash)

echo "Latest commit hash: $LATEST_COMMIT_HASH"

IMAGE=$(docker images | grep "$IMAGE_NAME " | awk '{print $3}')

echo "Image: $IMAGE"

if [ "$IMAGE" == "$LATEST_COMMIT_HASH" ]; then

    echo "Image is already up to date"

    exit 0

fi

aws ecr get-login-password --region $region | docker login --username AWS --password-stdin aws_account_id.dkr.ecr.$region.amazonaws.com

# Build the image

docker build -t "$IMAGE_NAME" "$DOCKERFILE_URL"

if kubectl get pods | grep $IMAGE_NAME &> /dev/null

then

    echo "Docker image is already pushed to the kubernetes cluster."

    exit

fi

# push the image
docker push $IMAGE.dkr.ecr.$region.amazonaws.com/my-docker-image:latest


chmod +x tempauth.sh
source /tempauth.sh

# Add the helm repo
helm repo add $helm_repo_url

# Update the helm repo
helm repo update


if [ "$helm_name" = "frontend"]

        cd $helm_name

        helm upgrade $helm_name -f values.yaml -f deployment.yaml <foldername>/$helm_name

        exit

fi

if [ "$helm_name" = "dynamo"]

        cd $helm_name

        helm upgrade $helm_name -f values.yaml -f deployment.yaml <foldername>/$helm_name

        exit
 fi

if [ "$helm_name" = "license"]

        cd $helm_name

        helm upgrade $helm_name -f values.yaml -f deployment.yaml <foldername>/$helm_name

        exit
fi

if [ "$helm_name" = "server"]

        cd $helm_name

        helm upgrade $helm_name -f values.yaml -f deployment.yaml <foldername>/$helm_name

        exit
fi

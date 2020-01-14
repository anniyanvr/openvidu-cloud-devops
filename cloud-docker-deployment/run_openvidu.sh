
source parameters.sh

# Get KMS version
export KMS_VERSION=$(
    curl --silent https://oudzlg0y3m.execute-api.eu-west-1.amazonaws.com/v1/ov_kms_matrix?ov=$OPENVIDU_VERSION |
    grep -Po '"kms":.*\"' |
    cut -d' ' -f2 |
    sed 's/\"//g'
)

docker-compose up
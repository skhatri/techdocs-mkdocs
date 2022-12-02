cd /opt/app/techdocs
echo "generate techdocs"

techdocs-cli generate --no-docker --verbose 
if [[ -z "${ENTITY_PATH}" ]];
then
   echo "Pass s3 store path as ENTITY_PATH"
   exit 1;
fi;
if [[ -z ${AWS_ENDPOINT_URL} ]];
then
  echo "AWS ENDPOINT URL is required"
  exit 1;
fi;

if [[ -z ${AWS_S3_BUCKET_NAME} ]];
then
  echo "pass s3 bucket name as AWS_S3_BUCKET_NAME"
fi;

techdocs-cli publish --publisher-type awsS3 \
  --storage-name ${AWS_S3_BUCKET_NAME} \
  --entity ${ENTITY_PATH} \
  --awsEndpoint ${AWS_ENDPOINT_URL} --awsS3ForcePathStyle 


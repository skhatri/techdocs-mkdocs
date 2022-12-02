### techdocs
docker compose which runs a minio as s3 backend, a minio bucket creator and tech doc publisher using mkdocs

#### Init
creates a techdocs bucket

```
export AWS_ACCESS_KEY_ID=minioadmin
export AWS_SECRET_ACCESS_KEY=minioadmin 
export AWS_REGION=ap-southeast-1
aws s3 mb s3://techdocs --endpoint-url http://minio:9000
```


#### Publisher
publisher runs the following

```
export ENTITY_PATH=allapps/app
export AWS_ACCESS_KEY_ID=minioadmin
export AWS_SECRET_ACCESS_KEY=minioadmin
export AWS_REGION=ap-southeast-1

techdocs-cli generate --no-docker --verbose 
techdocs-cli publish --publisher-type awsS3 \
  --storage-name techdocs \
  --entity ${ENTITY_PATH} \
  --awsEndpoint http://minio:9000 --awsS3ForcePathStyle 
```


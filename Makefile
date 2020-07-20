PJT_NAME = $(notdir $(PWD))
GCP_PROJECT = sample-283906
GCP_ZONE = asia-northeast1-a
GCP_SDK_KEY = ~/Downloads/sample-283906-b14a96d99b8c.json
SVC = bot

up:
	docker-compose up -d

down:
	docker-compose down

logs:
	docker logs -f --tail 100 $(PJT_NAME)_$(SVC)_1

exec:
	docker-compose exec $(SVC) sh

gcloud:
	docker run -it --rm --name gcloud -w /work \
	-v $(PWD):/work \
	-v $(GCP_SDK_KEY):/credentials.json \
	-e CLOUDSDK_CORE_PROJECT=$(GCP_PROJECT) \
	-e CLOUDSDK_COMPUTE_ZONE=$(GCP_ZONE) \
	ezio1119/cloud-sdk-kubectl-helm sh -c " \
	gcloud auth activate-service-account --key-file=/credentials.json && \
	sh"

terra:
	docker run -it --rm --name terra --entrypoint sh -w /terraform \
	-v $(PWD)/terraform:/terraform \
	-v $(GCP_TERRA_KEY):/credentials.json \
	-e GOOGLE_APPLICATION_CREDENTIALS=/credentials.json \
	hashicorp/terraform:light
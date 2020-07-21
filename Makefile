PJT_NAME = $(notdir $(PWD))
GCP_TERRA_KEY = ~/Downloads/sample-283906-b14a96d99b8c.json
SVC = bot

up:
	docker-compose up -d

down:
	docker-compose down

logs:
	docker logs -f --tail 100 $(PJT_NAME)_$(SVC)_1

exec:
	docker-compose exec $(SVC) sh

terra:
	docker run -it --rm --name terra --entrypoint sh -w /terraform \
	-v $(PWD)/terraform:/terraform \
	-v $(GCP_TERRA_KEY):/credentials.json \
	-e GOOGLE_APPLICATION_CREDENTIALS=/credentials.json \
	hashicorp/terraform:light

ngork:
	docker run -it --rm --name ngrok wernight/ngrok \
	
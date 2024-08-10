.PHONY: protoc push

# Устанавливаем переменные
TAG = v0.0.4

# Цель для запуска генерации proto
protoc:
	@echo "Go protoc..."
	@protoc -I proto proto/api/api.proto --go_out=./gen/go --go_opt=paths=source_relative --go-grpc_out=./gen/go/ --go-grpc_opt=paths=source_relative

# Цель для пуша в git
push:
	@echo "Pushing in git with tag ($(TAG))..."
	@git tag $(TAG)
	@git push origin $(TAG)
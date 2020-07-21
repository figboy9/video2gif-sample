package main

import (
	"log"

	function "app"

	"github.com/GoogleCloudPlatform/functions-framework-go/funcframework"
)

const (
	port = "8080"
)

func main() {
	funcframework.RegisterHTTPFunction("/", function.RecieveEvent)

	if err := funcframework.Start(port); err != nil {
		log.Fatalf("funcframework.Start: %v\n", err)
	}
}

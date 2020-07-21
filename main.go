package main

import (
	"log"
	"net/http"

	"github.com/ezio1119/video2gif-sample/function"
)

func main() {
	http.HandleFunc("/", function.RecieveEvent)

	log.Fatal(http.ListenAndServe(":8080", nil))
}

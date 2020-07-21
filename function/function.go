package function

import (
	"encoding/json"
	"io"
	"log"
	"net/http"

	"github.com/davecgh/go-spew/spew"
	"github.com/ezio1119/video2gif-sample/models"
)

// var (
// 	slackToken string
// )

// func init() {
// 	if slackToken = os.Getenv("SLACK_CLIENT_TOKEN"); slackToken == "" {
// 		log.Fatal("SLACK_CLIENT_TOKEN is required")
// 	}
// }

func VerifyURLEvent(w http.ResponseWriter, r *http.Request) {
	var e models.VerifyURL
	if err := json.NewDecoder(r.Body).Decode(&e); err != nil {
		log.Println("unexpected event type, expected url_verification event")
	}

	io.WriteString(w, e.Challenge)
}

func RecieveEvent(w http.ResponseWriter, r *http.Request) {
	var e models.FileCreated
	if err := json.NewDecoder(r.Body).Decode(&e); err != nil {
		log.Println("unexpected event type, expected file_created event")
	}

	spew.Dump(e)
}

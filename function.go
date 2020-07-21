package function

import (
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net/http"

	"app/models"

	"github.com/davecgh/go-spew/spew"
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
		return
	}

	io.WriteString(w, e.Challenge)
}

func RecieveEvent(w http.ResponseWriter, r *http.Request) {
	fmt.Println("きたよ")
	var e models.MessageChannels
	if err := json.NewDecoder(r.Body).Decode(&e); err != nil {
		log.Println("unexpected event type, expected file_created event")
		fmt.Println("やばい")
		return
	}

	spew.Dump()
}

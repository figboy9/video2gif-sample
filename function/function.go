package function

import (
	"encoding/json"
	"io"
	"log"
	"net/http"
)

// var (
// 	slackToken string
// )

type slackURLVerify struct {
	Type      string
	Token     string
	Challenge string
}

// func init() {
// 	if slackToken = os.Getenv("SLACK_CLIENT_TOKEN"); slackToken == "" {
// 		log.Fatal("SLACK_CLIENT_TOKEN is required")
// 	}
// }

func HelloHTTP(w http.ResponseWriter, r *http.Request) {
	var v slackURLVerify
	if err := json.NewDecoder(r.Body).Decode(&v); err != nil {
		log.Println("slack url verification format is different")
	}

	io.WriteString(w, v.Challenge)
}

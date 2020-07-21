package function

import (
	"io"
	"net/http"
)

// var (
// 	slackToken string
// )

// func init() {
// 	if slackToken = os.Getenv("SLACK_CLIENT_TOKEN"); slackToken == "" {
// 		log.Fatal("SLACK_CLIENT_TOKEN is required")
// 	}
// }

func HelloHTTP(w http.ResponseWriter, r *http.Request) {
	p := r.URL.Query().Get("challenge")
	io.WriteString(w, p)
}

package function

import (
	"encoding/json"
	"fmt"
	"html"
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
	var d struct {
		Name string `json:"name"`
	}
	if err := json.NewDecoder(r.Body).Decode(&d); err != nil {
		fmt.Fprint(w, "Hello, World!")
		return
	}
	if d.Name == "" {
		fmt.Fprint(w, "Hello, World!")
		return
	}
	fmt.Fprintf(w, "Hello, %s!", html.EscapeString(d.Name))
}

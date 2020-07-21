package models

type VerifyURL struct {
	Type      string
	Token     string
	Challenge string
}

type FileCreated struct {
	Type   string
	FileID string
}

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

type MessageChannels struct {
	event Event
}

type Event struct {
	Type        string
	Channel     string
	User        string
	Text        string
	Ts          string
	EventTs     string
	ChannelType string
}

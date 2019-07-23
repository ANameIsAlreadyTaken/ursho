package storage

type Service interface {
	Save(string) (string, error)
	Load(string) (string, error)
	LoadInfo(string) (*Item, error)
	DeleteOldData()
	Close() error
}

type Item struct {
	URL      string `json:"url"`
	Visited  bool   `json:"visited"`
	Count    int    `json:"count"`
	DateTime int64  `json:"datetime"`
}
//	CREATE TABLE timestamp_demo (ts TIMESTAMP, tstz TIMESTAMPTZ);

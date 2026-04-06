module github.com/greeneg/ca-certificates/plugins/certbundle

go 1.26.1

require (
	github.com/greeneg/ca-certificates/configuration v0.0.0
	github.com/greeneg/ca-certificates/logger v0.0.0
	github.com/greeneg/ca-certificates/pluginUtils v0.0.0
)

require github.com/MakeNowJust/heredoc v1.0.0 // indirect

replace github.com/greeneg/ca-certificates/configuration => ../../configuration

replace github.com/greeneg/ca-certificates/logger => ../../logger

replace github.com/greeneg/ca-certificates/pluginUtils => ../../pluginUtils

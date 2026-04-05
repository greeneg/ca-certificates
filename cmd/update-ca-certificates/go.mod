module github.com/greeneg/ca-certificates/cmd/update-ca-certificates

go 1.26.1

require github.com/greeneg/ca-certificates/configuration v0.0.0

require github.com/greeneg/ca-certificates/pluginUtils v0.0.0

require github.com/MakeNowJust/heredoc v1.0.0 // indirect

replace github.com/greeneg/ca-certificates/configuration => ../../configuration

replace github.com/greeneg/ca-certificates/pluginUtils => ../../pluginUtils

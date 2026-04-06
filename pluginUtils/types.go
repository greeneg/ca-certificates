package pluginUtils

type PluginUtils struct {
	RequiredTools []string
}

func NewPluginUtils() PluginUtils {
	p := PluginUtils{
		RequiredTools: []string{"trust"},
	}
	return p
}

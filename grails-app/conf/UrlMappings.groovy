class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        "/connectors/jqueryFileTree"(view:"/connectors/jqueryFileTree")

		"/"(
                controller:"home",
                action: { "index" }
        )
		"500"(view:'/error')
	}
}

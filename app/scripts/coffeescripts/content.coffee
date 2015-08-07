# Content script
do ($=jQuery) ->
	if not settings of window
		window.alert "ERROR! Must set settings.js -- see README"
		throw "ERROR! Must set settings.js -- see README"
	# jQuery.hotkeys.options.filterInputAcceptingElements = false
	# jQuery.hotkeys.options.filterContentEditable = false
	# jQuery.hotkeys.options.filterContentEditable = false
	settings = window.settings
	nytUrl = "#{settings.nytPrefix}#{settings.nytKey}"
	$(window).bind "keydown", settings.tabBind, (e) ->
		$.getJSON nytUrl, (response) ->
			chrome.storage.local.get {visited: []}, (object) ->
				if chrome.runtime.lastError
					window.alert "getStorage ERROR! => #{chrome.runtime.lastError}"
				else
					visited = object.visited
					for entry in response.results
						url = entry.url
						if $.inArray(url, visited) == -1
							visited.push(url)
							setStorage(visited)
							chrome.runtime.sendMessage {url: url}
							break
		return false # to prevent default action

	$(window).bind "keydown", "ctrl+e", (e) ->
		chrome.storage.local.remove "visited", () ->
			if chrome.runtime.lastError
				window.alert "remove ERROR! => #{chrome.runtime.lastError}"
			else
				window.alert "Removed \"visited\" from local storage"
		return false

	# $(window).bind "keydown", "ctrl+r", (e) ->
	# 	chrome.storage.local.clear()
	# 	window.alert "Cleared all local storage"
	# 	return false

	# url = "https://sandbox.feedly.com"
	# auth = "/v3/auth/auth"
	# clientid = "sandbox"
	# clientSecret = "YNXZHOH3GPYO6DF7B43K"
	# redirectURI = encodeURI("http://localhost")
	# params = {
	# 	response_type: "code",
	# 	client_id: clientid,
	# 	redirect_uri: redirectURI,
	# 	scope: "https://cloud.feedly.com/subscriptions"
	# }
	# $(window).bind "keydown", "meta+i", (e) ->
	# 	$.get "#{url}#{auth}", params, (data, textStatus) ->

	# 		console.log data
	# 		console.log textStatus


	setStorage = (data) ->
		chrome.storage.local.set {visited: data}, () ->
			if chrome.runtime.lastError
				window.alert "setStorage ERROR! => #{chrome.runtime.lastError}"
# Content script
do ($=jQuery) ->
	if not settings of window
		window.alert "ERROR! Must set settings.js"
		throw "ERROR! Must set settings.js"
	nytKey = window.settings.nytKey

	$(window).bind "keydown", "meta+e", (e) ->
		$.getJSON "https://api.nytimes.com/svc/topstories/v1/home.json?api-key=#{nytKey}", (response) ->
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

	setStorage = (data) ->
		chrome.storage.local.set {visited: data}, () ->
			if chrome.runtime.lastError
				window.alert "setStorage ERROR! => #{chrome.runtime.lastError}"
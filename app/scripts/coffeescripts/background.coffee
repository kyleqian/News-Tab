# Background script
chrome.runtime.onMessage.addListener (request, sender) ->
	chrome.tabs.create {url: request.url}
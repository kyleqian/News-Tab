do ($=jQuery) ->
	document.addEventListener "DOMContentLoaded", ->
		url = "https://cloud.feedly.com"
		auth = "/v3/auth/auth"
		subs = "/v3/subscriptions"
		mix = "/v3/mixes/contents?streamId=" + encodeURIComponent("feed/http://feeds.feedburner.com/TechCrunch/")
		clientid = "sandbox"
		clientSecret = "YNXZHOH3GPYO6DF7B43K"
		redirectURI = encodeURI("http://localhost")
		params = {
			headers: {
				Authorization: "OAuth AlmGg7p7ImEiOiJGZWVkbHkgRGV2ZWxvcGVyIiwiZSI6MTQ0Njc1ODQ4MjIwMSwiaSI6IjFlYjk2NjE4LTFmYmItNDUwYS04NjhlLWM1ZDg4MzRjMjBhYiIsInAiOjYsInQiOjEsInYiOiJwcm9kdWN0aW9uIiwidyI6IjIwMTUuMzEiLCJ4Ijoic3RhbmRhcmQifQ:feedlydev"
			}
			success: (data, textStatus) ->
				for entry in data.items
					$(".test").append "#{entry.originId}<br>"
			# response_type: "code",
			# client_id: clientid,
			# redirect_uri: redirectURI,
			# scope: "https://cloud.feedly.com/subscriptions"
		}
		$(window).bind "keydown", "meta+i", (e) ->
			$.ajax "#{url}#{mix}", params
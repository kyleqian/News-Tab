// Generated by CoffeeScript 1.9.3
(function() {
  (function($) {
    return document.addEventListener("DOMContentLoaded", function() {
      var auth, clientSecret, clientid, mix, params, redirectURI, subs, url;
      url = "https://cloud.feedly.com";
      auth = "/v3/auth/auth";
      subs = "/v3/subscriptions";
      mix = "/v3/mixes/contents?streamId=" + encodeURIComponent("feed/http://feeds.feedburner.com/TechCrunch/");
      clientid = "sandbox";
      clientSecret = "YNXZHOH3GPYO6DF7B43K";
      redirectURI = encodeURI("http://localhost");
      params = {
        headers: {
          Authorization: "OAuth AlmGg7p7ImEiOiJGZWVkbHkgRGV2ZWxvcGVyIiwiZSI6MTQ0Njc1ODQ4MjIwMSwiaSI6IjFlYjk2NjE4LTFmYmItNDUwYS04NjhlLWM1ZDg4MzRjMjBhYiIsInAiOjYsInQiOjEsInYiOiJwcm9kdWN0aW9uIiwidyI6IjIwMTUuMzEiLCJ4Ijoic3RhbmRhcmQifQ:feedlydev"
        },
        success: function(data, textStatus) {
          var entry, i, len, ref, results;
          ref = data.items;
          results = [];
          for (i = 0, len = ref.length; i < len; i++) {
            entry = ref[i];
            results.push($(".test").append(entry.originId + "<br>"));
          }
          return results;
        }
      };
      return $(window).bind("keydown", "meta+i", function(e) {
        return $.ajax("" + url + mix, params);
      });
    });
  })(jQuery);

}).call(this);

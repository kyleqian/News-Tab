# document.addEventListener('DOMContentLoaded', function() {
#   var checkPageButton = document.getElementById('checkPage');
#   checkPageButton.addEventListener('click', function() {
 
#     chrome.tabs.getSelected(null, function(tab) {
#       d = document;
 
#       var f = d.createElement('form');
#       f.action = 'http://gtmetrix.com/analyze.html?bm';
#       f.method = 'post';
#       var i = d.createElement('input');
#       i.type = 'hidden';
#       i.name = 'url';
#       i.value = tab.url;
#       f.appendChild(i);
#       d.body.appendChild(f);
#       f.submit();
#     });
#   }, false);
# }, false);

# document.addEventListener "DOMContentLoaded", ->
#   console.log "HELLO WORLD"
#   checkPageButton = document.getElementById("checkPage")
#   checkPageButton.addEventListener "click", ->
#     chrome.tabs.getSelected null, (tab) ->
#       d = document
#       f = d.createElement("form")
#       f.action = "http://gtmetrix.com/analyze.html?bm"
#       f.method = "post"
#       i = d.createElement("input")
#       i.type = "hidden"
#       i.name = "url"
#       i.value = tab.url
#       f.appendChild(i)
#       d.body.appendChild(f)
#       f.submit()
#   , false
# , false

document.addEventListener "DOMContentLoaded", ->
  console.log "HELLO WORLD"

# chrome.runtime.sendMessage({redirect: "http://google.com"})

# chrome.tabs.onCreated.addListener (tab) ->
#   console.log "WAT"
#   chrome.tabs.create({"url":"http://www.google.com"})
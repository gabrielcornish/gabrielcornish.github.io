//==[ 2a. HISTORIC POSTS ARRAY ]==

/* If you already have an existing pre-RSS posts array that you'd like to preserve
   in your blog's archive, copy that array below. The RSS posts will be added to it later. */
let postsArray = [];

//==[ 2b. FETCH RSS ]==

// the name of the rss feed: this should match what is defined in feed.html
var rssFeedName = "feed.xml";

// create the rss feed url
var rssFeedUrl = (window.location.pathname.includes("posts/") ? ".." : ".")
  + "/"
  + rssFeedName;

// this function will be used to fetch the rss feed
var feedText = null;
function rss(url, onReady) {
  if (feedText) {
    onReady(feedText);
  }
  else {
    fetch(url)
      .then(function(request) {
        request.text().then(function(text) {
          feedText = text;
          onReady(feedText);
        });
      });
  }
}

// fetch the rss feed: the rest of the page setup will happen after the feed is loaded
rss(rssFeedUrl, function(rssFeedText) {

//-----------------------------

//==[ 2c. MAKE POSTS ARRAY FROM RSS ]==

/*Instead of updating the postsArray by hand when making a new post,
  we will automatically read the post info from the RSS feed.*/
var rssPostsArray = [];

// parse the rss feed into an XML object
var rssXmlParser = new DOMParser();
var rssFeedXml = rssXmlParser.parseFromString(rssFeedText, "text/xml");

function getElementsOrEmptyArray(xmlElement, tagName) {
  return (xmlElement != null) ? xmlElement.getElementsByTagName(tagName) : [];
}

function getFirstElementOrNull(xmlElement, tagName) {
  var elements = getElementsOrEmptyArray(xmlElement, tagName);
  return (elements.length) > 0 ? elements[0] : null;
}

function getTextContentOrEmptyString(xmlElement) {
  return (xmlElement != null) ? xmlElement.textContent : "";
}

// get the rss feed items for each post and other feed information
var rssRoot = getFirstElementOrNull(rssFeedXml, "rss");
var rssLink = getFirstElementOrNull(rssFeedXml, "link");
var rssChannel = getFirstElementOrNull(rssRoot, "channel");
var rssItems = getElementsOrEmptyArray(rssChannel, "item");

var blogRoot = getTextContentOrEmptyString(rssLink);
var postsDirectory = blogRoot + "posts/";

// fill the posts array from the rss feed items
for (var id in rssItems) {
  var item = rssItems[id];

  if (item.getElementsByTagName) {
    var itemTitle = getFirstElementOrNull(item, "title");
    var itemLink = getFirstElementOrNull(item, "link");

    // only include items from the posts directory in the posts array
    var itemLinkText = getTextContentOrEmptyString(itemLink);
    if (itemLinkText.indexOf(postsDirectory) === 0) {
      var relativeLink = itemLinkText.replace(blogRoot, "");
      rssPostsArray.push([relativeLink, getTextContentOrEmptyString(itemTitle)]);
    }
  }
}

//==[ 2d. COMBINE WITH HISTORIC POSTS ARRAY ]==

// this line adds the RSS posts to the historic posts array
postsArray = rssPostsArray.concat(postsArray);

//-----------------------------
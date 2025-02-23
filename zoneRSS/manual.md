# zoneRSS manual

[zoneRSS](https://adamledoux.net/zoneRSS/) is a [Zonelets](https://zonelets.net)-compatible RSS feed and posting tool.

Read this manual to learn how to install and use zoneRSS, either as a companion tool for Zonelets, or as a standalone microblog.

Contents:
1. Installation and setup
2. Posting with zoneRSS
3. Post options
4. Zonelets integration
	- Modifying script.js
	- Preserving old Zonelets posts
5. zoneRSS *without* Zonelets
6. Extra features
7. Alternatives to zoneRSS
8. FAQ
	- Why do I need to refresh `feed.html` each time I make a new post?
	- I already have an existing RSS feed - can I use that with zoneRSS?
9. About

## Installation and setup

To install zoneRSS, first unzip `zoneRSS.zip` somewhere on your computer.

Inside you should see a handful of files. Copy the files `feed.xml` and `feed.html` into the root directory of your blog. These are, respectively, the RSS feed itself and a webpage for viewing and editing that feed. If you are using Zonelets, they should go right next to `index.html`, `about.html`, `script.js`, etc. If you are *not* using Zonelets, simply place them in whichever directory you want to be the home of your blog.

That's it - zoneRSS is now installed! But before you begin posting, you need to give your RSS feed a name and description, and link it to your blog.

Start by navigating to the address for your new `feed.html` page in your browser. For example, if your blog's address is `https://example.com/blog/` you would go to `https://example.com/blog/feed.html`. The feed page acts as both a timeline of all the posts on your blog and as a tool for authoring the posts themselves. When you first visit, it will be empty. That's because you haven't added anything to your RSS feed yet!

We'll do that soon, but first, add the URL parameter `?post=profile` to the address in your browser and reload the page. In our example, the full address would be `https://example.com/blog/feed.html?post=profile`. After the page reloads, you should see the profile editor. Choose a name and description for your blog, and then fill in the links to your blog's feed and to the blog itself. In our example, the feed would be `https://example.com/blog/feed.xml` but you should replace that with the actual address of your feed.

Once you're happy with your feed's profile settings, click the "save rss feed" button to download an updated `feed.xml` file. Copy this file back into your blog's root directory to replace the old version and update your feed. You're now ready to begin posting!

## Posting with zoneRSS

Time to add your first post to your RSS feed!

(NOTE: Before opening the post editor, make sure to reload `feed.html` so it can load your updated RSS feed, and changes you made to your `feed.xml` in the previous step don't get lost. See the FAQ for more details.)

To open the post editor, replace the `?post=profile` URL parameter in your browser's address bar with `?post=new`. In our example, the full address is now `https://example.com/blog/feed.html?post=new`. Reload the page and you should see the post editor. (You may want to bookmark this address to make it easy to get to in the future.)

The post editor has two main fields, a title and a body. The title is where you write the title of your post. The body is where you write HTML for the main text of your post. There is also a link field that shows where you should upload the HTML file for your post in order to publish it.

Fill in the post title and body for your first post. Then click the "save rss feed" button to download an updated `feed.xml` file. After that click the "save html page" to download the HTML page for your blog post. (If you are *not* using Zonelets, you'll need to do some extra work to tell zoneRSS where to find the template for your HTML pages - see "zoneRSS without Zonelets" below for more information.)

Once again, copy the updated `feed.xml` into your blog's root directory to replace the old version and update your feed. Then copy the blog post's HTML page in your `posts/` directory. Refresh the posts feed and you should see your post - you've published your first post to your RSS feed!

Note: If you are using Zonelets, you will *also* need to update the `postsArray` in your `script.js` file so that your post will show up in your Recent Posts and Archive pages. If you want to set things up so you can skip this step, continue on to the "Zonelets integration" section to learn how. If not, you can stop here - you're all set!

## Post options

Before we move on from the post editor, you may have noticed there is an "options" dropdown containing two checkboxes. These options give you some additional flexibility in how you post.

- **RSS-only**. Enabling this checkbox allows you to make a post that exists in your RSS feed and can be viewed in feed readers, but does *not* have its own HTML page. It will still be visible on your `feed.html`, since that page is itself effectively a feed reader (one that only is subscribed to your blog). Using this option is a simple way to post using zoneRSS without using Zonelets.
- **Custom link**. Enabling this checkbox allows you to manually type in the URL you want to share on your RSS feed. One possible use of this option is as a way to reblog posts from other blogs that you'd like to share with people subscribed to your feed.

## Zonelets integration

As mentioned earlier, if you are using Zonelets, each time you post you will need to do an extra step and update the `postsArray` in your `script.js` file so that your post appears in your Recent Posts and Archive.

But all that data already exists in your RSS feed! So why not just have `script.js` read that from the RSS feed?

To do that you'll need to make some changes to your `script.js`.

(NOTE: Before we do that, if you already have a history of Zonelets posts that you want to preserve, you should copy your existing `postsArray` into a backup .txt file now. We will return to those after modifying the Zonelets script.)

### Modifying script.js

In the folder where you unzipped the zoneRSS files, you should see two script files: `zonelets-patch-start.js` and `zonelets-patch-end.js`. Open your `script.js` and find section 2 ("Posts Array"). Delete everything in that section and replace it with the contents of `zonelets-patch-start.js`. Then scroll all the way to the bottom of `script.js`. Copy the contents of `zonelets-patch-end.js` and add it to the end of the file.

From now on, Zonelets will get your posts directly from your RSS feed - you won't need to update `script.js` anymore!

There are a few additional ways you can further integrate zoneRSS into Zonelets:
- Add links to your feed in the `<head>` of pages on your blog. This helps browser plugins and other tools find your feed from your webpages.
	- For `index.html`, add: `<link href="./feed.xml" rel="alternate" type="application/rss+xml" title="NAME OF YOUR BLOG">`
	- For your post template, add: `<link href="../feed.xml" rel="alternate" type="application/rss+xml" title="NAME OF YOUR BLOG">`
- Replace the Archive page with your `feed.html` to make it easier for people to see your rss-only posts or reblogs.
	- To do this, open `script.js` again and replace the two instances of "archive.html" with "feed.html".
- If you find this tool useful, consider adding a link back to zoneRSS!
	- In `script.js` find where `footerHTML` is defined and add `and posted with <a href='https://adamledoux.net/zoneRSS/">zoneRSS</a>!` to the end of the footer.

### Preserving old Zonelets posts

If you already have a history of Zonelets posts that you want to keep in your Archive, you'll need to add them back into the modified `script.js` file. Find section 2a ("HISTORIC POSTS ARRAY") of your modified script file. Replace the empty `postsArray` with your old array. This will now be combined with the posts loaded from RSS, preserving your existing posts in the Archive and for previous / next navigation. (Your old posts will *not* be included in your RSS feed though.)

## zoneRSS *without* Zonelets

Although zoneRSS is designed to be compatible with Zonelets, it is also possible to use it on its own.

The easiest way to do that is to use zoneRSS as an RSS-only microblog. To do that, just use the "rss-only" option when posting (see "Post options" above for details). Instead of uploading both `feed.xml` and an HTML page, you'll just update the RSS feed and use `feed.html` as the main page of your blog.

A more involved option is to use zoneRSS with your own HTML page template. To do this, you'll need to open `feed.html` and find section 1 ("Basic Configuration"). Edit `postDirectory` and `postTemplateName` to point at the file you want to use as your template.

## Extra features

zoneRSS comes with a couple of extra features that are disabled by default. To enable them, open `feed.html` and find section 2 ("Optional Configuration").

- **Email replies.** If you set `emailAddress` to your email address (instead of the empty string `""`), zoneRSS will add a "reply" link to the bottom of your posts in `feed.html`.
- **Status message.** If you set `showFeedDescriptionAsStatus` to `true`, your RSS feed's description (edited using the profile editor at `?post=profile`) will be displayed at the top of your feed as a status message.

## Alternatives to zoneRSS

If zoneRSS isn't quite what you're looking for, consider these alternatives:
- [Zonelets Buddy](https://zonelets-buddy.neocities.org/) - Try this if you are hosting a Zonelets blog on Neocities and want a tool that uploads posts automatically. Not an RSS feed generator.
- [RuSShdown](https://chaiaeran.github.io/RuSShdown/) - Try this if you are looking for an RSS feed generator that supports markdown. Not Zonelets specific.

## FAQ

- Q. Why do I need to refresh `feed.html` each time I make a new post?
	- A. When `feed.html` is loaded it downloads a copy of your `feed.xml`. When you make a new post, the data for that post is added to that copy of your RSS feed. If you make multiple posts (or changes to your feed settings) without reloading `feed.html` in between, it will be making those changes to the outdated copy it has in memory, effectively overwriting the last change you made. Because of this, it is important to reload `feed.html` each time you make a post. (To be extra safe, clear your browser's cache or put your browser in private / "incognito" mode.)
- Q. I already have an existing RSS feed - can I use that with zoneRSS?
	- A. zoneRSS expects your `feed.xml` to be formatted in a particular way, so it is likely if you try to use it with an existing RSS feed it will break. It is possible to modify your existing feed to be compatible with zoneRSS, but you will need to read the RSS parsing code in `feed.html` to understand what it expects.

## About

zoneRSS is made by [Adam Le Doux](https://adamledoux.net)
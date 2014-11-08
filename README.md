comic-rocket-api
================

A repository collating all of the information on the internal Comic Rocket API. This information has been extracted from the Comic Rocket android app. Since this information is provided by a third party, the Comic Rocket API may change without warning.


# Endpoints

## ALL_MARKED_COMICS_API_CALL

Returns all of the comics a user is following along with the current page.

```
https://www.comic-rocket.com/api/1/marked/
```

Example result:
```json
[{
  "rating": "PG",
  "genres": [],
  "name": "CommitStrip (English)",
  "idx": 569,
  "uri": "http://www.commitstrip.com/en/2014/11/07/coders-nostalgia/",
  "max_idx": 570,
  "banner_url": "",
  "slug": "commitstrip-english"
}, ...]
```


## GENRE_LIST_API_CALL

Returns a list of genres.

```
https://www.comic-rocket.com/api/1/genre/
```

Example result:
```json
[{
  "slug": "abject-nonsense",
  "name": "Abject nonsense"
}, {
  "slug": "abstract",
  "name": "Abstract"
}, {
  "slug": "action",
  "name": "Action"
}, {
  "slug": "action-comedy",
  "name": "Action Comedy"
}, {
  "slug": "action-dramedy",
  "name": "Action Dramedy"
}, ...]
```

## LOGIN_CHECK_API_CALL

A way to check whether a user is logged in or not.

```
https://www.comic-rocket.com/api/1/login_check/
```

Returns `Accepted` or `Status 401: Unauthorized`.

## Login Page

A page for the user to log into the website.

```
https://www.comic-rocket.com/login?next=/api/1/login_check/
```

## LOGOUT_API_CALL

Logs the user out of the site.

```
https://www.comic-rocket.com/logout
```

## NEW_PAGES_API_CALL

While this endpoint appears in the android app, it doesn't actually exist.
You should use ALL_MARKED_COMICS_API_CALL instead.

```
https://www.comic-rocket.com/api/1/marked/to_read/
```

## PAGE_URL_API_CALL

Returns the url of a comic page.

```
https://www.comic-rocket.com/api/1/serial/%s/%d/
```

`%s` is the slug of the comic.

`%d` is the page number. Indexing starts at 1.

Example response:
```json
{
  "url": "http://www.commitstrip.com/en/2012/02/22/interview/",
  "slug": "commitstrip-english"
}
```


## POPULAR_API_CALL

Returns a list of popular comics.

```
https://www.comic-rocket.com/api/1/browse/popular/
```

Example response:
```json
[{
  "rating": "PG",
  "genres": [ ],
  "name": "XKCD",
  "idx": 0,
  "uri": "http://xkcd.com/1/",
  "max_idx": 1443,
  "banner_url": "https://www.comic-rocket.com/public/banner/xkcd_1.png",
  "slug": "xkcd"
}, {
  "rating": "R",
  "genres": [ ],
  "name": "Questionable Content",
  "idx": 0,
  "uri": "http://www.questionablecontent.net/view.php?comic=1",
  "max_idx": 2830,
  "banner_url": "https://www.comic-rocket.com/public/banner/questionable-content.PNG",
  "slug": "questionable-content"
}, {
  "rating": "R",
  "genres": [ ],
  "name": "Penny Arcade",
  "idx": 0,
  "uri": "http://penny-arcade.com/comic/1998/11/18",
  "max_idx": 2462,
  "banner_url": "",
  "slug": "penny-arcade"
}, ...]
```

## RECOMMENDATIONS_API_CALL

This seems to only return an empty array. Potentially it could return a list of comics that you might be interested in.

```
https://www.comic-rocket.com/api/1/recommendations/
```

Example response:
```json
[]
```

## RECOMMENDED_API_CALL

Returns a list of "picks" by Comic Rocket. The format is the same as POPULAR_API_CALL.

```
https://www.comic-rocket.com/api/1/browse/picks/
```

## SEARCH_API_CALL

Returns a list of matching comics. The format is the same as POPULAR_API_CALL.

```
https://www.comic-rocket.com/api/1/search/?q=
```


## SERIALS_IN_GENRE_API_CALL

Returns a list of matching comics. The format is the same as POPULAR_API_CALL.

```
https://www.comic-rocket.com/api/1/genre/%s/
```

`%s` is a genre id that can be found at https://www.comic-rocket.com/api/1/genre/.


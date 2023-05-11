# NewsPulse

[![wakatime](https://wakatime.com/badge/user/18368562-fe00-4dd1-a78f-9403210fea47/project/248d20e1-d7e6-45be-81e0-4c337089b8e0.svg)](https://wakatime.com/@musfique113/projects/hywubafihn?start=2023-05-05&end=2023-05-11)

NewsPulse is a simple news app built using Flutter and the [NewsAPI](https://newsapi.org/) web API. The app allows users to browse and read news articles from various sources and categories.

## Features

- Browse news articles by category (e.g. business, sports, technology, etc.) or by source (e.g. CNN, BBC, TechCrunch, etc.)
- Search for news articles by keyword
- View detailed information about each news article, including a headline, image and description



## Packages

NewsPulse uses the following packages:

- `http`: Used to make API requests to the NewsAPI web API.
- `carousel_slider`: Used to create the image slider on the home screen.
- `url_launcher`: Used to launch URLs to the source website or share articles.

## How it works

NewsPulse retrieves news articles from the NewsAPI web API, which provides a list of articles in JSON format. The app uses the `http` package to make requests to the API and parse the JSON response into Dart objects.

The app uses a `ListView` to display the list of articles, and a `Card` widget to display each article's headline, image, and source. When the user taps on an article, the app navigates to a new screen that displays the full article details, including the headline, image, source, published date, and description.

The app also includes a search bar that allows users to search for articles by keyword. When the user enters a search query, the app sends a new API request to retrieve articles that match the query.

~~Finally, users can share articles with others by tapping on the share icon on each article card. The app uses the `url_launcher` package to launch the article URL in the user's preferred browser or share the article via email or other apps.~~

## Screenshots

<img src="https://github.com/musfique113/NewsPulse/assets/53111065/928c93a9-f3c7-4b3e-b3f0-5eee9d5a36f3" alt="s,2" width="200" height="400"> <img src="https://github.com/musfique113/NewsPulse/assets/53111065/083141ea-3a91-47a5-a3ff-5065b3a921cc" alt="ss 1" width="200" height="400">
<img src="https://github.com/musfique113/NewsPulse/assets/53111065/c72fbc13-2da1-4644-b50e-83f456950b3a" alt="ss 4" width="200" height="400"> <img src="https://github.com/musfique113/NewsPulse/assets/53111065/fd5a0a87-94ba-4897-a5f2-916146f505d8" alt="ss 3" width="200" height="400">

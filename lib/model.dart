class NewsQueryModel {
  late String newsHead;
  late String newsDes;
  late String newsImg;
  late String newsUrl;

  // late String newsTitle;
  // late String newsImage_url;
  // late String newsLink;
  // late String newsDescription;

  NewsQueryModel(
      {this.newsHead = "NEWS HEADLINE",
      this.newsDes = "SOME NEWS",
      this.newsImg = "SOME URL",
      this.newsUrl = "SOME URL",
      // this.newsDescription = "SOME DESC",
      // this.newsImage_url = "Link on ing",
      // this.newsLink = "LINK OF THE NEWS",
      // this.newsTitle = "NEWS TITLE"
      });

  factory NewsQueryModel.fromMap(Map news) {
    return NewsQueryModel(
        newsHead: news["title"],
        newsDes: news["description"],
        newsImg: news["urlToImage"],
        newsUrl: news["url"]
    );

  // newsLink: news["link"],
  // newsDescription: news["description"],
  // newsImage_url: news["image_url"],
  // newsTitle: news["title"]

  }
}

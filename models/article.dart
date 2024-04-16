class Article{
    String? title;
    String? content;
    String? author;
    String? urlToImage;
    String? publishedAt;
    String? description;
    String? url;

    Article({
        required this.title,
        required this.content,
        required this.author,
        required this.urlToImage,
        required this.publishedAt,
        required this.description,
        required this.url
    });

    Article.fromJson(Map<String,dynamic>json){
        title = json["title"];
        author = json["author"];
        content = json["content"];
        description = json["description"];
        url = json["url"];
        publishedAt = json["publishedAt"];
        urlToImage = json["urlToImage"];
    }



    // factory Article.fromJson(Map<String,dynamic>json){
    //   return switch(json){
    //     //case1
    //       {
    //         "title":String title,
    //         "author":String author,
    //         "urlToImage":String urlToImage,
    //         "publishedAt":String publishedAt,
    //         "content":String content,
    //         "description":String description,
    //         "url":String url
    //       } => Article(title:title,author: author,content: content,description: description,publishedAt: publishedAt, urlToImage: urlToImage,url: url),
    //       _=> throw const FormatException("failed to load article from factory")
    //   };
    // }




}
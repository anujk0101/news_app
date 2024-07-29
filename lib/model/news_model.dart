class SourceModel {
  String? id, name;

  SourceModel({required this.id, required this.name});

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(id: json['id'], name: json['name']);
  }
}

class ArticleModel {
  String? author, title, description, url, urlToImage, publishedAt, content;
  SourceModel? source;

  ArticleModel(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.content,
      required this.publishedAt,
      required this.urlToImage,
      required this.source});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        content: json['content'],
        publishedAt: json['publishedAt'],
        urlToImage: json['urlToImage'],
        source: SourceModel.fromJson(json['source']));
  }
}

class NewsModel{
  int? totalResults;
  String? status;
  List<ArticleModel>? articles;

  NewsModel({required this.status,required this.totalResults,required this.articles});

  factory NewsModel.fromJson(Map<String,dynamic> json){
  List<ArticleModel> data=[];
    for(Map<String,dynamic> eachData in json['articles']){
      data.add(ArticleModel.fromJson(eachData));
    }
    return NewsModel(status: json['status'], totalResults: json['totalResults'], articles: data);
  }

}
class Articles{

  List<Article> items = new List();

  Articles();

  Articles.fromJsonList(List<dynamic> jsonList){
    
    if (jsonList == null) return;

    for(var item in jsonList){

      final article = new Article.fromJsonMap(item);
      items.add(article);
      
    }

  }

}

class Article {

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Article.fromJsonMap(Map<String, dynamic> json){

    source          =   Source.fromJson(json['source']);
    author          =   json['author'] == null ? null : json['author'];
    title           =   json['title'];
    description     =   json['description'];
    url             =   json['url'];
    urlToImage      =   json['urlToImage'];
    publishedAt     =   DateTime.parse(json['publishedAt']);
    content         =   json['content'] == null ? null : json['content'];

  }

  getImgArticle(){
    return '$urlToImage';
  }

  getAutorArticle(){
    return '$author';
  }

  getTitleArticle(){
    return '$title';
  }
  getDescriptionArticle(){
    return '$description';
  }
  getPublishedAtArticle(){
    return '$publishedAt';
  }
  getContentArticle(){
    return '$content';
  }
  
}

class Source {

  String id;
  String name;

  Source({this.id,this.name});

    

  Source.fromJson(Map<String, dynamic> json){
    id    = json['id'] == null ? null : json["id"];
    name  = json['name'];
  }

  Map<String, dynamic> toJson() => {
      'id': id == null ? null : id,
      'name': name,
  };
  

}
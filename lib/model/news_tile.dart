class NewsTileModel {
  final String? title;
  final String? channel;
  final String? url;
  final String? img;

  NewsTileModel({
    required this.url,
    required this.title,
    required this.channel,
    required this.img,
  });

  factory NewsTileModel.fromJson(articles) {
    return NewsTileModel(
        title: articles['title'],
        channel: articles['source']['name'],
        img: articles['urlToImage'],
        url: articles['url']);
  }
}

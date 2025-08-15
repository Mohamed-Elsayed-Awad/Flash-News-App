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
        title: articles['title'] ?? "This is a title",
        channel: articles['source']['name'] ?? "Unknown Channel",
        img: articles['urlToImage'],
        url: articles['url']);
  }
}

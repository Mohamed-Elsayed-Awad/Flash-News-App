class NewsTileModel {
  final String? title;
  final String? content;
  final String? channel;
  final String? url;
  final String? img;
  final String? category;

  NewsTileModel({
    required this.content,
    required this.category,
    required this.url,
    required this.title,
    required this.channel,
    required this.img,
  });

  factory NewsTileModel.fromJson(articles, String category) {
    return NewsTileModel(
        content: articles['content'] ?? '',
        category: category,
        title: articles['title'] ?? "This is a title",
        channel: articles['source']['name'] ?? "Unknown Channel",
        img: articles['urlToImage'],
        url: articles['url']);
  }
}

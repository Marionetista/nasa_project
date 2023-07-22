class AstroPicture {
  factory AstroPicture.fromJson(Map<String, dynamic> json) => AstroPicture(
        title: json['title'],
        date: json['date'],
        explanation: json['explanation'],
        url: json['url'],
      );

  AstroPicture({
    required this.title,
    required this.date,
    required this.explanation,
    required this.url,
  });

  final String title;
  final String date;
  final String explanation;
  final String url;

  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'explanation': explanation,
        'url': url,
      };
}

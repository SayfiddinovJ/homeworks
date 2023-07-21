class OrganicModel{
  final String title;
  final String link;
  final String snippet;
  final String date;
  OrganicModel({
    required this.title,
    required this.link,
    required this.snippet,
    required this.date,
  });
  factory OrganicModel.fromJson(Map<String, dynamic> json){
    return OrganicModel(title: json['title'] ?? '', link: json['link'] ?? '', snippet: json['snippet'] ?? '',date: json['date'] ?? '');
  }
}
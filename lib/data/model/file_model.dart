import 'package:equatable/equatable.dart';

class FileModel extends Equatable {
  final String name;
  final String url;
  final double progress;
  final String? image;

  const FileModel({
    required this.name,
    required this.url,
    required this.progress,
    this.image,
  });

  FileModel copyWith({
    String? name,
    String? url,
    double? progress,
    String? image,
  }) =>
      FileModel(
        name: name ?? this.name,
        url: url ?? this.url,
        progress: progress ?? this.progress,
        image: image ?? this.image,
      );

  @override
  List<Object?> get props => [
        name,
        url,
        progress,
        image,
      ];
}

List<FileModel> filesData = [
  const FileModel(
    name: "Alisher Navoiy - Qaro ko'zim",
    url: "https://www.kapwing.com/videos/64f99d903817950011d3b30c",
    progress: 0.0,
    image:
        'https://miro.medium.com/v2/resize:fit:1104/1*0IeHtOdotFDaTav8wZweWA.png',
  ),
  const FileModel(
    progress: 0.0,
    name: "Alexander Sergeyevich Pushkin",
    url: "http://testuser7.narod.ru/Philipok/Pushkin_Skazki.pdf",
  ),
  const FileModel(
    progress: 0.0,
    name: "Sabyan ya Rohman",
    url:
        "https://muzzona.kz/upload/files/2020-12/sabyan-gambus-rohman-ya-rohman_(muzzona.kz).mp3",
  ),
  const FileModel(
    progress: 0.0,
    name: "Najot Ta'lim",
    url:
        "https://topish.uz/uploads/user/photo-2020-07-27-15-23-13_1634640957.jpg",
  ),
  const FileModel(
    progress: 0.0,
    name: "Informatika Test",
    url:
        "https://foydali-fayllar.uz/wp-content/uploads/2021/04/informatika-test.doc.zip",
  ),
];

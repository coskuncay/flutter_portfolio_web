// To parse this JSON data, do
//
//     final repoModel = repoModelFromMap(jsonString);

import 'dart:convert';

class RepoModel {
  RepoModel({
    this.owner,
    this.repo,
    this.link,
    this.description,
    this.image,
    this.language,
    this.languageColor,
    this.stars,
    this.forks,
    this.website,
  });

  String? owner;
  String? repo;
  String? link;
  String? description;
  String? image;
  String? language;
  String? languageColor;
  dynamic stars;
  dynamic forks;
  String? website;

  factory RepoModel.fromJson(String str) => RepoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RepoModel.fromMap(Map<String, dynamic> json) => RepoModel(
        owner: json["owner"],
        repo: json["repo"],
        link: json["link"],
        description: json["description"],
        image: json["image"],
        language: json["language"],
        languageColor: json["languageColor"],
        stars: json["stars"],
        forks: json["forks"],
        website: json["website"],
      );

  Map<String, dynamic> toMap() => {
        "owner": owner,
        "repo": repo,
        "link": link,
        "description": description,
        "image": image,
        "language": language,
        "languageColor": languageColor,
        "stars": stars,
        "forks": forks,
        "website": website,
      };

  static RepoModel fromJsonModel(Map<String, dynamic> map) =>
      RepoModel.fromMap(map);
}

import 'package:utilities/utilities.dart';

class VoteCreateUpdateDto {
  VoteCreateUpdateDto({
    this.productId,
    this.votes,
  });

  final String? productId;
  final List<Vote>? votes;

  factory VoteCreateUpdateDto.fromJson(String str) => VoteCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VoteCreateUpdateDto.fromMap(Map<String, dynamic> json) => VoteCreateUpdateDto(
        productId: json["productId"] == null ? null : json["productId"],
        votes: json["votes"] == null ? null : List<Vote>.from(json["votes"].map((x) => Vote.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "productId": productId == null ? null : productId,
        "votes": votes == null ? null : List<dynamic>.from(votes!.map((x) => x.toMap())),
      };
}

class Vote {
  Vote({
    this.score,
    this.voteFieldId,
  });

  final double? score;
  final String? voteFieldId;

  factory Vote.fromJson(String str) => Vote.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Vote.fromMap(Map<String, dynamic> json) => Vote(
        score: json["score"] == null ? null : json["score"],
        voteFieldId: json["voteFieldId"] == null ? null : json["voteFieldId"],
      );

  Map<String, dynamic> toMap() => {
        "score": score == null ? null : score,
        "voteFieldId": voteFieldId == null ? null : voteFieldId,
      };
}

class VoteFieldCreateUpdateDto {
  VoteFieldCreateUpdateDto({
    this.voteFields,
    this.productId,
  });

  final List<VoteField>? voteFields;
  final String? productId;

  factory VoteFieldCreateUpdateDto.fromJson(String str) => VoteFieldCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VoteFieldCreateUpdateDto.fromMap(Map<String, dynamic> json) => VoteFieldCreateUpdateDto(
        voteFields: json["voteFields"] == null ? null : List<VoteField>.from(json["voteFields"].map((x) => VoteField.fromMap(x))),
        productId: json["productId"] == null ? null : json["productId"],
      );

  Map<String, dynamic> toMap() => {
        "voteFields": voteFields == null ? null : List<dynamic>.from(voteFields!.map((x) => x.toMap())),
        "productId": productId == null ? null : productId,
      };
}

class VoteField {
  VoteField({
    this.id,
    this.title,
    this.score,
  });

  final String? id;
  final String? title;
  final double? score;

  factory VoteField.fromJson(String str) => VoteField.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VoteField.fromMap(Map<String, dynamic> json) => VoteField(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        score: json["score"] == null ? null : json["score"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "score": score == null ? null : score,
      };
}

class VoteReadDto {
  VoteReadDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.score,
    this.user,
  });

  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final double? score;
  final UserReadDto? user;

  factory VoteReadDto.fromJson(String str) => VoteReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VoteReadDto.fromMap(Map<String, dynamic> json) => VoteReadDto(
    id: json["id"] == null ? null : json["id"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
    deletedAt: json["deletedAt"] == null ? null : json["deletedAt"],
    score: json["score"] == null ? null : json["score"],
    user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "createdAt": createdAt == null ? null : createdAt,
    "updatedAt": updatedAt == null ? null : updatedAt,
    "deletedAt": deletedAt == null ? null : deletedAt,
    "score": score == null ? null : score,
    "user": user == null ? null : user!.toMap(),
  };
}

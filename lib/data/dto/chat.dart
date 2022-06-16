import 'package:utilities/utilities.dart';

class ChatReadDto {
  ChatReadDto({
    this.id,
    this.userId,
    this.messageText,
    this.fullName,
    this.dateTime,
    this.profileImage,
    this.send,
  });

  final String? id;
  final String? userId;
  final String? messageText;
  final String? fullName;
  final String? dateTime;
  final String? profileImage;
  final bool? send;

  factory ChatReadDto.fromJson(String str) => ChatReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatReadDto.fromMap(Map<String, dynamic> json) => ChatReadDto(
    id: json["id"] == null ? null : json["id"],
    userId: json["userId"] == null ? null : json["userId"],
    messageText: json["messageText"] == null ? null : json["messageText"],
    fullName: json["fullName"] == null ? null : json["fullName"],
    dateTime: json["dateTime"] == null ? null : json["dateTime"],
    profileImage: json["profileImage"] == null ? null : json["profileImage"],
    send: json["send"] == null ? null : json["send"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "userId": userId == null ? null : userId,
    "messageText": messageText == null ? null : messageText,
    "fullName": fullName == null ? null : fullName,
    "dateTime": dateTime == null ? null : dateTime,
    "profileImage": profileImage == null ? null : profileImage,
    "send": send == null ? null : send,
  };
}

class ChatCreateDto {
  ChatCreateDto({
    this.userId,
    this.messageId,
    this.messageText,
  });

  final String? userId;
  final String? messageId;
  final String? messageText;

  factory ChatCreateDto.fromJson(String str) => ChatCreateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatCreateDto.fromMap(Map<String, dynamic> json) => ChatCreateDto(
    userId: json["userId"] == null ? null : json["userId"],
    messageId: json["messageId"] == null ? null : json["messageId"],
    messageText: json["messageText"] == null ? null : json["messageText"],
  );

  Map<String, dynamic> toMap() => {
    "userId": userId == null ? null : userId,
    "messageId": messageId == null ? null : messageId,
    "messageText": messageText == null ? null : messageText,
  };
}
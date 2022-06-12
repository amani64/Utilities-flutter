import 'package:utilities/utilities.dart';

class FolowersReadDto {
  FolowersReadDto({
    this.followers,
  });

  final List<Follower>? followers;

  factory FolowersReadDto.fromJson(String str) => FolowersReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FolowersReadDto.fromMap(Map<String, dynamic> json) => FolowersReadDto(
    followers: json["followers"] == null ? null : List<Follower>.from(json["followers"].map((x) => Follower.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "followers": followers == null ? null : List<dynamic>.from(followers!.map((x) => x.toMap())),
  };
}

class Follower {
  Follower({
    this.token,
    this.id,
    this.fullName,
    this.phoneNumber,
    this.userName,
    this.bio,
    this.appUserName,
    this.appPhoneNumber,
    this.appEmail,
    this.type,
    this.firstName,
    this.lastName,
    this.headline,
    this.website,
    this.wallet,
    this.showContactInfo,
    this.isAdmin,
    this.suspend,
    this.birthDate,
    this.media,
    this.colors,
    this.specialties,
    this.favorites,
    this.identityType,
    this.licenceType,
    this.isBusinessAccount,
    this.mobileConfirmationCode,
  });

  final String? token;
  final String? id;
  final String? fullName;
  final String? phoneNumber;
  final String? userName;
  final String? bio;
  final String? appUserName;
  final String? appPhoneNumber;
  final String? appEmail;
  final String? type;
  final String? firstName;
  final String? lastName;
  final String? headline;
  final String? website;
  final int? wallet;
  final bool? showContactInfo;
  final bool? isAdmin;
  final bool? suspend;
  final String? birthDate;
  final List<MediaReadDto>? media;
  final List<IdTitleReadDto>? colors;
  final List<IdTitleReadDto>? specialties;
  final List<IdTitleReadDto>? favorites;
  final int? identityType;
  final int? licenceType;
  final bool? isBusinessAccount;
  final String? mobileConfirmationCode;

  factory Follower.fromJson(String str) => Follower.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Follower.fromMap(Map<String, dynamic> json) => Follower(
    token: json["token"] == null ? null : json["token"],
    id: json["id"] == null ? null : json["id"],
    fullName: json["fullName"] == null ? null : json["fullName"],
    phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
    userName: json["userName"] == null ? null : json["userName"],
    bio: json["bio"] == null ? null : json["bio"],
    appUserName: json["appUserName"] == null ? null : json["appUserName"],
    appPhoneNumber: json["appPhoneNumber"] == null ? null : json["appPhoneNumber"],
    appEmail: json["appEmail"] == null ? null : json["appEmail"],
    type: json["type"] == null ? null : json["type"],
    firstName: json["firstName"] == null ? null : json["firstName"],
    lastName: json["lastName"] == null ? null : json["lastName"],
    headline: json["headline"] == null ? null : json["headline"],
    website: json["website"] == null ? null : json["website"],
    wallet: json["wallet"] == null ? null : json["wallet"],
    showContactInfo: json["showContactInfo"] == null ? null : json["showContactInfo"],
    isAdmin: json["isAdmin"] == null ? null : json["isAdmin"],
    suspend: json["suspend"] == null ? null : json["suspend"],
    birthDate: json["birthDate"] == null ? null :json["birthDate"],
    media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
    colors: json["colors"] == null ? null : List<IdTitleReadDto>.from(json["colors"].map((x) => IdTitleReadDto.fromMap(x))),
    specialties: json["specialties"] == null ? null : List<IdTitleReadDto>.from(json["specialties"].map((x) => IdTitleReadDto.fromMap(x))),
    favorites: json["favorites"] == null ? null : List<IdTitleReadDto>.from(json["favorites"].map((x) => IdTitleReadDto.fromMap(x))),
    identityType: json["identityType"] == null ? null : json["identityType"],
    licenceType: json["licenceType"] == null ? null : json["licenceType"],
    isBusinessAccount: json["isBusinessAccount"] == null ? null : json["isBusinessAccount"],
    mobileConfirmationCode: json["mobileConfirmationCode"] == null ? null : json["mobileConfirmationCode"],
  );

  Map<String, dynamic> toMap() => {
    "token": token == null ? null : token,
    "id": id == null ? null : id,
    "fullName": fullName == null ? null : fullName,
    "phoneNumber": phoneNumber == null ? null : phoneNumber,
    "userName": userName == null ? null : userName,
    "bio": bio == null ? null : bio,
    "appUserName": appUserName == null ? null : appUserName,
    "appPhoneNumber": appPhoneNumber == null ? null : appPhoneNumber,
    "appEmail": appEmail == null ? null : appEmail,
    "type": type == null ? null : type,
    "firstName": firstName == null ? null : firstName,
    "lastName": lastName == null ? null : lastName,
    "headline": headline == null ? null : headline,
    "website": website == null ? null : website,
    "wallet": wallet == null ? null : wallet,
    "showContactInfo": showContactInfo == null ? null : showContactInfo,
    "isAdmin": isAdmin == null ? null : isAdmin,
    "suspend": suspend == null ? null : suspend,
    "birthDate": birthDate == null ? null : birthDate,
    "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
    "colors": colors == null ? null : List<dynamic>.from(colors!.map((x) => x.toMap())),
    "specialties": specialties == null ? null : List<dynamic>.from(specialties!.map((x) => x.toMap())),
    "favorites": favorites == null ? null : List<dynamic>.from(favorites!.map((x) => x.toMap())),
    "identityType": identityType == null ? null : identityType,
    "licenceType": licenceType == null ? null : licenceType,
    "isBusinessAccount": isBusinessAccount == null ? null : isBusinessAccount,
    "mobileConfirmationCode": mobileConfirmationCode == null ? null : mobileConfirmationCode,
  };
}

class ToggleBookmark {
  ToggleBookmark({
    this.productId,
    this.projectId,
    this.tutorialId,
    this.eventId,
    this.adId,
    this.companyId,
    this.tenderId,
    this.serviceId,
    this.magazineId,
    this.tagId,
    this.specialityId,
    this.colorId,
  });

  final String? productId;
  final String? projectId;
  final String? tutorialId;
  final String? eventId;
  final String? adId;
  final String? companyId;
  final String? tenderId;
  final String? serviceId;
  final String? magazineId;
  final String? tagId;
  final String? specialityId;
  final String? colorId;

  factory ToggleBookmark.fromJson(String str) => ToggleBookmark.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ToggleBookmark.fromMap(Map<String, dynamic> json) => ToggleBookmark(
    productId: json["productId"] == null ? null : json["productId"],
    projectId: json["projectId"] == null ? null : json["projectId"],
    tutorialId: json["tutorialId"] == null ? null : json["tutorialId"],
    eventId: json["eventId"] == null ? null : json["eventId"],
    adId: json["adId"] == null ? null : json["adId"],
    companyId: json["companyId"] == null ? null : json["companyId"],
    tenderId: json["tenderId"] == null ? null : json["tenderId"],
    serviceId: json["serviceId"] == null ? null : json["serviceId"],
    magazineId: json["magazineId"] == null ? null : json["magazineId"],
    tagId: json["tagId"] == null ? null : json["tagId"],
    specialityId: json["specialityId"] == null ? null : json["specialityId"],
    colorId: json["colorId"] == null ? null : json["colorId"],
  );

  Map<String, dynamic> toMap() => {
    "productId": productId == null ? null : productId,
    "projectId": projectId == null ? null : projectId,
    "tutorialId": tutorialId == null ? null : tutorialId,
    "eventId": eventId == null ? null : eventId,
    "adId": adId == null ? null : adId,
    "companyId": companyId == null ? null : companyId,
    "tenderId": tenderId == null ? null : tenderId,
    "serviceId": serviceId == null ? null : serviceId,
    "magazineId": magazineId == null ? null : magazineId,
    "tagId": tagId == null ? null : tagId,
    "specialityId": specialityId == null ? null : specialityId,
    "colorId": colorId == null ? null : colorId,
  };
}

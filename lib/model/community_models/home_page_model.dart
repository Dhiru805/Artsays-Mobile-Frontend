class HomePageModel {
  late bool success;
  late String message;

  late List<PostsModel> posts;

  HomePageModel(this.success, this.message, this.posts);

  factory HomePageModel.fromJson(Map<String, dynamic> json) {
    return HomePageModel(
      json['success'] ?? false,
      json['message'] ?? '',
      (json['posts'] as List?)
              ?.map((i) => PostsModel.fromJson(i))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'posts': posts.map((e) => e.toJson()).toList(),
  };
}

class PostsModel {
  late String id;
  late UserModel user;
  late String caption;
  late String location;
  late List<CollaboratorsModel> collaborators;
  late List<String> images;
  late List<String> likes;
  late List<String> hashTags;
  late PromotionalDetailsModel promotionalDetails;
  late bool isPromoted;
  late List<String> targetAudience;

  late List<CommentModel> comments;
  late String createdAt;
  late String updatedAt;

  /// TODO: ask this
  // late _v;
  late bool isSaved;
  late bool canComment;
  late bool isAd;
  late bool showFollowButton;

  PostsModel(
    this.id,
    this.user,
    this.caption,
    this.location,
    this.collaborators,
    this.images,
    this.likes,
    this.hashTags,
    this.promotionalDetails,
    this.isPromoted,
    this.targetAudience,
    this.comments,
    this.createdAt,
    this.updatedAt,
    this.isSaved,
    this.canComment,
    this.isAd,
    this.showFollowButton,
  );

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      json['_id'] ?? json['_id'] ?? '',
      UserModel.fromJson(json['user'] ?? {}),
      json['caption'] ?? '',
      json['location'] ?? '',
      (json['collaborators'] as List?)
              ?.map((i) => CollaboratorsModel.fromJson(i))
              .toList() ??
          [],
      List<String>.from(json['images'] ?? []),
      List<String>.from(json['likes'] ?? []),
      List<String>.from(json['hashTags'] ?? []),
      PromotionalDetailsModel.fromJson(json['promotionalDetails'] ?? {}),
      json['isPromoted'] ?? false,
      List<String>.from(json['targetAudience'] ?? []),
      (json['comments'] as List?)
              ?.map((i) => CommentModel.fromJson(i))
              .toList() ??
          [],
      json['createdAt'] ?? '',
      json['updatedAt'] ?? '',
      json['isSaved'] ?? false,
      json['canComment'] ?? false,
      json['isAd'] ?? false,
      json['showFollowButton'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'user': user.toJson(),
    'caption': caption,
    'location': location,
    'collaborators': collaborators.map((e) => e.toJson()).toList(),
    'images': images,
    'likes': likes,
    'hashTags': hashTags,
    'promotionalDetails': promotionalDetails.toJson(),
    'isPromoted': isPromoted,
    'targetAudience': targetAudience,
    'comments': comments.map((e) => e.toJson()).toList(),
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'isSaved': isSaved,
    'canComment': canComment,
    'isAd': isAd,
    'showFollowButton': showFollowButton,
  };
}

class UserModel {
  late String? id;
  late String? name;
  late String? lastName;
  late String? userName;
  late String? profilePhoto;
  late String? website;
  late List<VerifyModel>? verified;

  UserModel(
    this.id,
    this.name,
    this.lastName,
    this.userName,
    this.profilePhoto,
    this.website,
    this.verified,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json['_id'] ?? json['id'],
      json['name'],
      json['lastname'],
      json['username'],
      json['profilePhoto'],
      json['website'],
      (json['verified'] as List?)
          ?.map((i) => VerifyModel.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'lastName': lastName,
    'userName': userName,
    'profilePhoto': profilePhoto,
    'website': website,
    'verified': verified?.map((e) => e.toJson()).toList(),
  };
}

class CollaboratorsModel {
  late String id;
  late String userName;

  CollaboratorsModel(this.id, this.userName);

  factory CollaboratorsModel.fromJson(Map<String, dynamic> json) {
    return CollaboratorsModel(
      json['_id'] ?? json['id'] ?? '',
      json['userName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'userName': userName,
  };
}

class PromotionalDetailsModel {
  late String? status;
  late String? paymentStatus;
  late String? category;
  late String? goal;
  late double? dailyBudget;
  late int? durationDays;
  late double? totalBudget;
  late double? gstAmount;
  late String? estimatedReach;
  late String? website;
  late String? startDate;
  late String? endDate;
  late String? easebuzzTxnId;

  PromotionalDetailsModel(
    this.status,
    this.paymentStatus,
    this.category,
    this.goal,
    this.dailyBudget,
    this.durationDays,
    this.totalBudget,
    this.gstAmount,
    this.estimatedReach,
    this.website,
    this.startDate,
    this.endDate,
    this.easebuzzTxnId,
  );

  factory PromotionalDetailsModel.fromJson(Map<String, dynamic> json) {
    return PromotionalDetailsModel(
      json['status'],
      json['paymentStatus'],
      json['category'],
      json['goal'],
      (json['dailyBudget'] as num?)?.toDouble(),
      json['durationDays'] as int?,
      (json['totalBudget'] as num?)?.toDouble(),
      (json['gstAmount'] as num?)?.toDouble(),
      json['estimatedReach'],
      json['website'],
      json['startDate'],
      json['endDate'],
      json['easebuzzTxnId'],
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'paymentStatus': paymentStatus,
    'category': category,
    'goal': goal,
    'dailyBudget': dailyBudget,
    'durationDays': durationDays,
    'totalBudget': totalBudget,
    'gstAmount': gstAmount,
    'estimatedReach': estimatedReach,
    'website': website,
    'startDate': startDate,
    'endDate': endDate,
    'easebuzzTxnId': easebuzzTxnId,
  };
}

class CommentModel {
  late String id;
  late UserModel user;
  late String text;
  late String createdAt;

  CommentModel(this.id, this.user, this.text, this.createdAt);

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      json['_id'] ?? json['id'] ?? '',
      UserModel.fromJson(json['user'] ?? {}),
      json['text'] ?? '',
      json['createdAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'user': user.toJson(),
    'text': text,
    'createdAt': createdAt,
  };
}

class VerifyModel {
  late String id;
  late String badgeName;
  late String badgeImage;

  VerifyModel(this.id, this.badgeName, this.badgeImage);

  factory VerifyModel.fromJson(Map<String, dynamic> json) {
    return VerifyModel(
      json['_id'] ?? json['id'] ?? '',
      json['badgeName'] ?? '',
      json['badgeImage'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'badgeName': badgeName,
    'badgeImage': badgeImage,
  };
}

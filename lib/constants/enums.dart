enum UserType { Artist, Buyer, Seller }

extension UserTypeExtension on UserType {
  static UserType? fromString(String? value) {
    if (value == null) return null;
    return UserType.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => UserType.Artist, // default if needed
    );
  }
}

enum Status { Verifies, Unverified, Rejected }

extension StatusExtension on Status {
  static Status? fromString(String? value) {
    if (value == null) return null;
    return Status.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => Status.Unverified,
    );
  }
}

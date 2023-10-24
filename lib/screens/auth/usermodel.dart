class User {
  final int id; // Unique identifier for the user
  final String name;
  final String email;
  final String password;
  final int phoneNumber;
  final String profileImage; // URL or path to the user's profile image

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.profileImage,
  });
  // Convert User object to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phone_number': phoneNumber,
      'profile_image': profileImage,
    };
  }
}

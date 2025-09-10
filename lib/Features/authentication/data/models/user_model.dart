class UserModel {
  final String role;
  final String firstName;
  final String lastName;
  final String email;
  final String? avatarFile;
  final String? token;
  final String gender;
  final List<String>? addresses;

  UserModel(
      {required this.role,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.avatarFile,
      this.token,
      required this.gender,
      required this.addresses});

  factory UserModel.fromJson(Map<String, dynamic> json, {String? token}) {
    final userData = json['data']?['updatedUser'] ??
        json['data']?['user'] ??
        json['data']?['userWithoutSensitiveData'] ??
        json;

    return UserModel(
      addresses: userData['addresses'] != null
          ? List<String>.from(userData['addresses'])
          : null,
      gender:
          userData['gender'] ?? '', // Pass gender or provide a default value
      role: userData['role'] ?? '',
      firstName: userData['firstName'] ?? '',
      lastName: userData['lastName'] ?? '',
      email: userData['email'] ?? '',
      avatarFile: (userData['avatarFile'] != null &&
              userData['avatarFile'].toString().trim().isNotEmpty)
          ? userData['avatarFile']
          : null,
      token: token,
    );
  }
}

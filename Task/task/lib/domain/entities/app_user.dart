enum UserRole { admin, customer }

class AppUser {
  final String uid;
  final String email;
  final String? name;
  final UserRole role;

  const AppUser({
    required this.uid,
    required this.email,
    this.name,
    required this.role,
  });

  Map<String, dynamic> toMap() => {
        'email': email,
        'name': name,
        'role': role.name,
      };
}

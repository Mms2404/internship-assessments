class Company {
  final String name;
  final String email;
  final String phone;
  final String vat;
  final String country;

  Company({
    required this.name,
    required this.email,
    required this.phone,
    required this.vat,
    required this.country,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      vat: json['vat'] ?? '',
      country: json['country'] ?? '',
    );
  }
}

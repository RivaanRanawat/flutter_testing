import 'dart:convert';

class User {
  final String email;
  final String name;
  final int id;
  final String website;
  User({
    required this.email,
    required this.name,
    required this.id,
    required this.website,
  });

  User copyWith({
    String? email,
    String? name,
    int? id,
    String? website,
  }) {
    return User(
      email: email ?? this.email,
      name: name ?? this.name,
      id: id ?? this.id,
      website: website ?? this.website,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'name': name});
    result.addAll({'id': id});
    result.addAll({'website': website});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      id: map['id']?.toInt() ?? 0,
      website: map['website'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(email: $email, name: $name, id: $id, website: $website)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.email == email &&
        other.name == name &&
        other.id == id &&
        other.website == website;
  }

  @override
  int get hashCode {
    return email.hashCode ^ name.hashCode ^ id.hashCode ^ website.hashCode;
  }
}

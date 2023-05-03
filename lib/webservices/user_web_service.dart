class UserWebService {
  String? name;
  String? userName;
  String? email;

  UserWebService({
    required this.name,
    required this.userName,
    required this.email
  });

  factory UserWebService.fromJson(Map<String, dynamic> json) {
    return UserWebService(
        name: json['name'] is String ? json['name'] : null,
        userName: json['username'] is String ? json['username'] : null,
        email: json['email'] is String ? json['email'] : null);
  }

  @override
  String toString() {
    return 'user : {name: $name}';
  }
}

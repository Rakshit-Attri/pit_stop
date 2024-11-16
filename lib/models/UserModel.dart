class User {
  String email;
  String id;
  String password;
  bool emailOtpVerified;
  bool resetOtpVerified;



  User({
    required this.email,
    required this.id,
    required this.password,
    this.emailOtpVerified = false,
    this.resetOtpVerified = false,


  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] ?? '',
      id: json['_id'] ?? '',
      password: json['password'] ?? '',
      emailOtpVerified: json['emailOtpVerified'] ?? false,
      resetOtpVerified: json['resetOtpVerified'] ?? false,


    );
  }
}

class ManagedUser {
  String id;
  String firstName;
  String lastName;
  String email;
  List<String> images;
  String city;
  String country;

  ManagedUser({
    this.id = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.images = const [],
    this.city = '',
    this.country = '',
  });

  factory ManagedUser.fromJson(Map<String, dynamic> json) {
    return ManagedUser(
      id: json['_id'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      city: json['city'] ?? '',
      country: json['country'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'images': images,
      'city': city,
      'country': country,
    };
  }
}

class Wallet {
  double balance;

  Wallet({this.balance = 0.0});

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(balance: (json['balance'] ?? 0).toDouble());
  }

  Map<String, dynamic> toJson() {
    return {
      'balance': balance,
    };
  }
}

class SignupUser {
  String name = '';

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}

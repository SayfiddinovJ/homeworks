class UserState {
  final String username;
  final String email;
  final String password;

  UserState({
    this.username = "",
    this.email = "",
    this.password = '',
  });

  UserState copyWith({
    String? username,
    String? email,
    String? password,
  }) =>
      UserState(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  @override
  String toString() {
    return '''
    Username: $username
    Email: $email
    Password: $password
    ''';
  }
}

class AuthModel {
  final String id;
  final bool isLoggedIn;

  AuthModel({
    required this.id,
    required this.isLoggedIn,
  });

  factory AuthModel.empty() {
    return AuthModel(id: '', isLoggedIn: false);
  }
}

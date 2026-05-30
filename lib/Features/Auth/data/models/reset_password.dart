class ResetPassword {
  String message;
  int userId;
  int code;

  ResetPassword({
    required this.message,
    required this.userId,
    required this.code,
  });

  @override
  String toString() {
    return 'ResetPassord(message: $message, userId: $userId, code: $code)';
  }

  factory ResetPassword.fromJson(Map<String, dynamic> json) => ResetPassword(
    message: json['message'] as String,
    userId: json['user_id'] as int,
    code: json['code'] as int,
  );

  Map<String, dynamic> toJson() => {
    'message': message,
    'user_id': userId,
    'code': code,
  };
}

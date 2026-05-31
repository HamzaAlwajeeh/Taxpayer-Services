class File {
  int? id;
  int? userId;
  String? tradeName;
  String? fileType;

  File({this.id, this.userId, this.tradeName, this.fileType});

  @override
  String toString() {
    return 'File(id: $id, userId: $userId, tradeName: $tradeName, fileType: $fileType)';
  }

  factory File.fromJson(Map<String, dynamic> json) => File(
    id: json['id'] as int?,
    userId: json['user_id'] as int?,
    tradeName: json['trade_name'] as String?,
    fileType: json['file_type'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'trade_name': tradeName,
    'file_type': fileType,
  };
}

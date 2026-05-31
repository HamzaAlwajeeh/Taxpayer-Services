class TaxPayer {
  int? id;
  int? userId;
  String? tradeName;
  String? fileType;

  TaxPayer({this.id, this.userId, this.tradeName, this.fileType});

  @override
  String toString() {
    return 'TaxPayer(id: $id, userId: $userId, tradeName: $tradeName, fileType: $fileType)';
  }

  factory TaxPayer.fromJson(Map<String, dynamic> json) => TaxPayer(
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

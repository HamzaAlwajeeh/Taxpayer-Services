class File {
  int? id;
  int? userId;
  String? tradeName;
  String? fileType;
  String? taxNumber;
  String? inventoryNumber;
  String? activityStartDate;
  String? fileStatus;
  String? paymentType;
  String? activityType;

  File({
    this.id,
    this.userId,
    this.tradeName,
    this.fileType,
    this.taxNumber,
    this.inventoryNumber,
    this.activityStartDate,
    this.fileStatus,
    this.paymentType,
    this.activityType,
  });

  @override
  String toString() {
    return 'File(id: $id, userId: $userId, tradeName: $tradeName, fileType: $fileType, taxNumber: $taxNumber, inventoryNumber: $inventoryNumber, activityStartDate: $activityStartDate, fileStatus: $fileStatus, paymentType: $paymentType, activityType: $activityType)';
  }

  factory File.fromJson(Map<String, dynamic> json) => File(
    id: json['id'] as int?,
    userId: json['user_id'] as int?,
    tradeName: json['trade_name'] as String?,
    fileType: json['file_type'] as String?,
    taxNumber: json['tax_number']?.toString(),
    inventoryNumber: json['inventory_number']?.toString(),
    activityStartDate: json['activity_start_date'] as String?,
    fileStatus: json['file_status'] as String?,
    paymentType: json['payment_type'] as String?,
    activityType: json['activity_type'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'trade_name': tradeName,
    'file_type': fileType,
    'tax_number': taxNumber,
    'inventory_number': inventoryNumber,
    'activity_start_date': activityStartDate,
    'file_status': fileStatus,
    'payment_type': paymentType,
    'activity_type': activityType,
  };
}

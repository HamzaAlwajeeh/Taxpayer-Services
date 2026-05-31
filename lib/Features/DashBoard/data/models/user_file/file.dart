class File {
  int? id;
  String? taxNumber;
  String? inventoryNumber;
  String? activityStartDate;
  String? fileStatus;
  String? paymentType;
  String? activityType;

  File({
    this.id,
    this.taxNumber,
    this.inventoryNumber,
    this.activityStartDate,
    this.fileStatus,
    this.paymentType,
    this.activityType,
  });

  @override
  String toString() {
    return 'File(id: $id, taxNumber: $taxNumber, inventoryNumber: $inventoryNumber, activityStartDate: $activityStartDate, fileStatus: $fileStatus, paymentType: $paymentType, activityType: $activityType)';
  }

  factory File.fromJson(Map<String, dynamic> json) => File(
    id: json['id'] as int?,
    taxNumber: json['tax_number'] as String?,
    inventoryNumber: json['inventory_number'] as String?,
    activityStartDate: json['activity_start_date'] as String?,
    fileStatus: json['file_status'] as String?,
    paymentType: json['payment_type'] as String?,
    activityType: json['activity_type'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'tax_number': taxNumber,
    'inventory_number': inventoryNumber,
    'activity_start_date': activityStartDate,
    'file_status': fileStatus,
    'payment_type': paymentType,
    'activity_type': activityType,
  };
}

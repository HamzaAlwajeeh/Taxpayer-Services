class TaxInformation {
  int? id;
  String? taxAmount;
  String? lastPayment;
  dynamic attachment;

  TaxInformation({this.id, this.taxAmount, this.lastPayment, this.attachment});

  @override
  String toString() {
    return 'TaxInformation(id: $id, taxAmount: $taxAmount, lastPayment: $lastPayment, attachment: $attachment)';
  }

  factory TaxInformation.fromJson(Map<String, dynamic> json) {
    return TaxInformation(
      id: json['id'] as int?,
      taxAmount: json['tax_amount'] as String?,
      lastPayment: json['last_payment'] as String?,
      attachment: json['attachment'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'tax_amount': taxAmount,
    'last_payment': lastPayment,
    'attachment': attachment,
  };
}

class TaxInformation {
  int? id;
  String? taxAmount;
  String? lastPayment;
  String? attachment;

  TaxInformation({this.id, this.taxAmount, this.lastPayment, this.attachment});

  @override
  String toString() {
    return 'TaxInformation(id: $id, taxAmount: $taxAmount, lastPayment: $lastPayment, attachment: $attachment)';
  }

  factory TaxInformation.fromJson(Map<String, dynamic> json) {
    return TaxInformation(
      id: json['id'] as int?,
      taxAmount: json['tax_amount']?.toString(),
      lastPayment: json['last_payment']?.toString(),
      attachment: json['attachment']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'tax_amount': taxAmount,
    'last_payment': lastPayment,
    'attachment': attachment,
  };
}

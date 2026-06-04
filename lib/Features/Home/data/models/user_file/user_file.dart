import 'file.dart';
import 'tax_information.dart';
import 'tax_payer.dart';

class UserFile {
  TaxPayer? taxPayer;
  List<TaxInformation>? taxInformations;
  File? file;

  UserFile({this.taxPayer, this.taxInformations, this.file});

  @override
  String toString() {
    return 'UserFile(taxPayer: $taxPayer, taxInformations: $taxInformations, file: $file)';
  }

  factory UserFile.fromJson(Map<String, dynamic> json) => UserFile(
    taxPayer:
        json['taxPayer'] == null
            ? null
            : TaxPayer.fromJson(json['taxPayer'] as Map<String, dynamic>),
    taxInformations:
        (json['tax_informations'] as List<dynamic>?)
            ?.map((e) => TaxInformation.fromJson(e as Map<String, dynamic>))
            .toList(),
    file:
        json['file'] == null
            ? null
            : File.fromJson(json['file'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'taxPayer': taxPayer?.toJson(),
    'tax_informations': taxInformations?.map((e) => e.toJson()).toList(),
    'file': file?.toJson(),
  };
}

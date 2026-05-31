import 'file.dart';

class Files {
  File? file;

  Files({this.file});

  @override
  String toString() => 'Files(file: $file)';

  factory Files.fromJson(Map<String, dynamic> json) => Files(
    file:
        json['file'] == null
            ? null
            : File.fromJson(json['file'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {'file': file?.toJson()};
}

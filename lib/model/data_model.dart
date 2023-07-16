import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String age;

  @HiveField(3)
  String mobileNumber;

  @HiveField(4)
  String images;

  @HiveField(5)
  String parentName;

  StudentModel({
    this.id,
    required this.name,
    required this.age,
    required this.mobileNumber,
    required this.images,
    required this.parentName,
  });
}

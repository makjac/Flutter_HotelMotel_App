import 'package:hive/hive.dart';

part 'search_model.g.dart';

@HiveType(typeId: 0)
class Search extends HiveObject {
  @HiveField(0)
  late String location;

  @HiveField(1)
  late DateTime start;

  @HiveField(2)
  late DateTime end;

  @HiveField(3)
  late int rooms;

  @HiveField(4)
  late int adults;

  @HiveField(5)
  late int kids;
}

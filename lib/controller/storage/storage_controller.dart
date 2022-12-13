import 'package:hotel_motel/repository/firebase/storage/storage_repository.dart';
import 'package:hotel_motel/locator.dart';

class StorageController {
  final StorageRepository _storageRepo = locator.get<StorageRepository>();
}

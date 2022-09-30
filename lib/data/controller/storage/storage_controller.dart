import 'package:hotel_motel/data/controller/storage/base_storage_controller.dart';
import 'package:hotel_motel/data/repository/firebase/storage/storage_repository.dart';
import 'package:hotel_motel/locator.dart';

class StorageController extends BaseStorageController {
  final StorageRepository _storageRepo = locator.get<StorageRepository>();
}

import 'package:hotel_motel/locator.dart';

import '../../service/storage/storage_service.dart';

class StorageController {
  final StorageService _storageRepo = locator.get<StorageService>();
}

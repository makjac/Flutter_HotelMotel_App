import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hotel_motel/data/hive_models/search_model.dart';
import 'package:path_provider/path_provider.dart';

setupHiveAdapters() async {
  Directory dir = await getApplicationDocumentsDirectory();
  Hive.initFlutter(dir.path);
  Hive.registerAdapter(SearchAdapter());
}

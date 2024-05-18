import 'package:device_preview_minus/device_preview_minus.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'Views/App/app.dart';

//please use emulator for evaluation some packages don't support web.
//I have provided device_preview
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String storageLocation = (await getApplicationDocumentsDirectory()).path;
  await FastCachedImageConfig.init(subDir: storageLocation, clearCacheAfter: const Duration(days: 2));
  runApp(DevicePreview(builder: (context)=> const MyApp()));
}

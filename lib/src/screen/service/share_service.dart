import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ShareService {
  static Future<void> shareImage(Uint8List bytes) async {
    final directory = await getTemporaryDirectory();

    final file = File("${directory.path}/qr.png");

    await file.writeAsBytes(bytes);

    await Share.shareXFiles([
      XFile(file.path),
    ], text: "Generated using Flutter QR Generator");
  }
}

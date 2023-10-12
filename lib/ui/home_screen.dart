import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:homeworks/ui/widgets/my_button.dart';
import 'package:homeworks/ui/widgets/my_check.dart';
import 'package:homeworks/ui/widgets/string_converter.dart';
import 'package:homeworks/utlis/extension.dart';
import 'package:homeworks/utlis/permission_util.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey containerKey = GlobalKey();

  Uint8List? imageBytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Share my check')),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          const Text('Operation completed',
              style: TextStyle(color: Colors.green)),
          const SizedBox(height: 20),
          MyButton(
            onTap: () async {
              String a = await saveToGallery();
              XFile? xFile =
                  await StringToXFileConverter.convert(convertFilePath(a));
              if (xFile != null) {
                await _share(convertFilePath(a));
              } else {
                debugPrint('ERROR xFile is null');
              }
            },
          ),
          const SizedBox(height: 20),
          RepaintBoundary(
            key: containerKey,
            child: const MyCheck(),
          ),
        ],
      ),
    );
  }

  _takeScreenshot<Uint8List>() async {
    RenderRepaintBoundary boundary = containerKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    var im = await boundary.toImage();
    var byteData = await im.toByteData(format: ImageByteFormat.png);
    setState(() {
      imageBytes = byteData!.buffer.asUint8List();
    });
    return byteData!.buffer.asUint8List();
  }

  saveToGallery() async {
    await PermissionUtil.requestAll();
    var pngBytes = await _takeScreenshot();
    var t = await ImageGallerySaver.saveImage(pngBytes);
    debugPrint(t["filePath"]);
    return t["filePath"];
  }

  Future<void> _share(String path) async {
    try {
      // ignore: deprecated_member_use
      await Share.shareFiles([path], text: 'Sharing Image');
    } catch (e) {
      debugPrint('Error sharing: $e');
    }
  }
}

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ImageShare extends StatefulWidget {
  ImageShare(this.imgText);

  final String imgText;

  @override
  State<ImageShare> createState() => _ImageShareState();
}

Image? img;

class _ImageShareState extends State<ImageShare> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _onPressedButton,
      icon: Icon(Icons.share),
    );
  }

  getCanvasImage(String str) async {
    var builder = ParagraphBuilder(ParagraphStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      textAlign: TextAlign.center,
    ));
    builder.addText(str);
    Paragraph paragraph = builder.build();
    paragraph.layout(const ParagraphConstraints(width: 100));

    final recorder = PictureRecorder();
    var newCanvas = Canvas(recorder);

    newCanvas.drawParagraph(paragraph, Offset.zero);

    final picture = recorder.endRecording();
    var res = await picture.toImage(100, 100);
    ByteData? data = await res.toByteData(format: ImageByteFormat.png);

    if (data != null) {
      img = Image.memory(Uint8List.view(data.buffer));
    }

    return data;
  }

  Future<void> _onPressedButton() async {
    ByteData? imgData = await getCanvasImage(widget.imgText);
    if (imgData != null) {
      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/shared_image.png';
      final imageFile = File(imagePath);
      await imageFile.writeAsBytes(imgData.buffer.asUint8List());

      final result = await Share.shareXFiles([XFile(imagePath)]);
      if (result.status == ShareResultStatus.success) {
        print('Imagem compartilhada!');
      }
    }
  }
}

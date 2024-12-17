import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ImageShare extends StatefulWidget {
  //Texto da imagem, captado da AppBar (que capta da main)
  final String imgText;
  //Cor de fundo da imagem, captado da AppBar (que capta da main)
  final Color backgroundColor;

  ImageShare(
    this.imgText,
    this.backgroundColor,
  );

  @override
  State<ImageShare> createState() => _ImageShareState();
}

class _ImageShareState extends State<ImageShare> {
  Image? img;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _onPressedButton,
      icon: const Icon(
        Icons.share,
        color: Colors.white,
      ),
    );
  }

  Future<ByteData?> getCanvasImage(String str) async {
    // Dimensões da imagem que vai ser gerada
    const double width = 400;
    const double height = 400;
    const double padding = 20;

    // Configurações de estilo
    const double fontSize = 30;
    final Color bgColor = widget.backgroundColor;
    const Color textColor = Colors.black;

    // Criar parágrafo de texto
    var builder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        textAlign: TextAlign.center,
      ),
    )
      ..pushStyle(ui.TextStyle(color: textColor))
      ..addText(str);

    ui.Paragraph paragraph = builder.build();
    paragraph.layout(const ui.ParagraphConstraints(width: width - 2 * padding));

    // Criar PictureRecorder e Canvas
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder, Rect.fromLTWH(0, 0, width, height));

    // Desenhar fundo
    final paint = Paint()..color = bgColor;
    canvas.drawRect(Rect.fromLTWH(0, 0, width, height), paint);

    // Desenhar texto centralizado dentro da área com padding
    final textOffset = Offset(
      (width - paragraph.width) / 2,
      (height - paragraph.height) / 2,
    );
    canvas.drawParagraph(paragraph, textOffset);

    // Finalizar gravação e converter para imagem
    final picture = recorder.endRecording();
    final img = await picture.toImage(width.toInt(), height.toInt());
    ByteData? data = await img.toByteData(format: ui.ImageByteFormat.png);

    if (data != null) {
      setState(() {
        this.img = Image.memory(Uint8List.view(data.buffer));
      });
    }

    return data;
  }

  // Função para compartilhar a imagem
  Future<void> _onPressedButton() async {
    ByteData? imgData = await getCanvasImage(widget.imgText);
    if (imgData != null) {
      // Gerando um diretório temporário para armazenar a imagem (SharePlus não compartilha imagem diretamente)
      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/shared_image.png';
      final imageFile = File(imagePath);
      await imageFile.writeAsBytes(imgData.buffer.asUint8List());

      // Compartilhando a imagem no diretório
      final result = await Share.shareXFiles([XFile(imagePath)]);
      if (result.status == ShareResultStatus.success) {
        print('Imagem compartilhada!');
      }
    }
  }
}

import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: Text('Nenhuma imagem!'),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).primaryColor,
            ),
            label: Text("Tirar foto"),
            icon: Icon(Icons.camera),
          ),
        ),
      ],
    );
  }
}

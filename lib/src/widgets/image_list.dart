import 'package:flutter/material.dart';
import '/src/models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  const ImageList(this.images, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) => buildImage(images[index]),
    );
  }

  Widget buildImage(ImageModel imageModel) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(158, 158, 158, .7),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Image.network(imageModel.url),
          ),
          Text(imageModel.title),
        ],
      ),
    );
  }
}

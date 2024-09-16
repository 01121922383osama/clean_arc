import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String image;
  final int index;
  final String description;
  const Details({super.key, required this.image, required this.description, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: image,
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.fitHeight,
                height: 350,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

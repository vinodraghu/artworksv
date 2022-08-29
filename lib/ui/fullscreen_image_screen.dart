
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenImageScreen extends StatelessWidget {
  final String? url;

  const FullScreenImageScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey.withOpacity(0.5),
              child: PhotoView(
                imageProvider:  NetworkImage(
                  url ?? "",
                ),
              )),


        ],
      ),
    );
  }
}

import 'package:article_finder/data/artworks_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArtWorksListItem extends StatelessWidget {
  const ArtWorksListItem({
    required this.artwork,
    Key? key,
  }) : super(key: key);
  final Data? artwork;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4), // border color
          shape: BoxShape.rectangle,
        ),
        child: Stack(
          children: [
            const Center(
                child: Icon(Icons.image,size: 100,color: Colors.black26,)
            ),
            Positioned(
              bottom: 5,
              left: 5,
              child: Text(
                artwork?.title ?? '',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,

              ),
            ),
          ],
        ),
      ),
    );
  }


}

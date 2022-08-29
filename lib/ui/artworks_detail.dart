
import 'package:article_finder/data/artwork_detils_model.dart';
import 'package:article_finder/ui/fullscreen_image_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArtWorksDetail extends StatelessWidget {
  final ArtWorkDetilsModel artwork;

  ArtWorksDetail(this.artwork);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (artwork.data?.imageId != null) ...[
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenImageScreen(url: "https://www.artic.edu/iiif/2/${artwork.data?.imageId}/full/843,/0/default.jpg",),
                      ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                    imageUrl: "https://www.artic.edu/iiif/2/${artwork.data?.imageId}/full/843,/0/default.jpg",
                  ),
                ),
              ),
            ],
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      artwork.data?.artistDisplay ?? "",
                     // style: textTheme.subtitle2,
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),

      ],
    );
  }
}

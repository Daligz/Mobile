import 'package:app_ui/components/item_album.dart';
import 'package:app_ui/models/album.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AlbumCarousel extends StatelessWidget {

  List<Album> albums;

  AlbumCarousel(this.albums);

  @override
  Widget build(final BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enableInfiniteScroll: false,
        reverse: false,
        viewportFraction: 0.86,
        height: 230.0
      ),
      items: this.albums.map((e) => ItemAlbum(e, true)).toList()
    );
  }
}
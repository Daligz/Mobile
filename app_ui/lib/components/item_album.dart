import 'package:app_ui/models/album.dart';
import 'package:flutter/material.dart';

class ItemAlbum extends StatefulWidget {

  Album album;
  bool themeDark;

  ItemAlbum(this.album, [this.themeDark = true]);

  @override
  State<StatefulWidget> createState() => _ItemAlbumState();
}
  class _ItemAlbumState extends State<ItemAlbum> {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 15.0, bottom: 20.0, top: 20.0),
        child: Container(
            decoration: _boxDecoration(context),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _companyLogo(),
                          _favIcon()
                        ],
                      ),
                      _infoAlbumTexts(context)
                    ],
                  )
                ],
              ),
            )
        )
      );
    }

  BoxDecoration _boxDecoration(final BuildContext context) {
    return BoxDecoration(
      color: this.widget.themeDark ? Theme.of(context).primaryColor : Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: const <BoxShadow> [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(4.0, 4.0),
          blurRadius: 10.0
        )
      ]
    );
  }

  Widget _companyLogo() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.network(
          this.widget.album.image,
          width: 60.0,
        )
      ),
    );
  }

  Widget _favIcon() {
    return GestureDetector(
        child: Icon(
          this.widget.album.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: this.widget.themeDark ? Colors.white : Colors.grey,
        ),
      onTap: () {
          setState(() {
            this.widget.album.isFavorite = !this.widget.album.isFavorite;
          });
      },
    );
  }

  Widget _infoAlbumTexts(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        Text(
          this.widget.album.title,
          style: this.widget.themeDark ?
          Theme.of(context).textTheme.headline5 : Theme.of(context).textTheme.headline6,
        ),
        Text(
          this.widget.album.author,
          style: this.widget.themeDark ?
          Theme.of(context).textTheme.headline5 : Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 3.0),
        Row(
          children: <Widget>[
            Icon(
              Icons.play_circle_outline,
              color: Theme.of(context).highlightColor,
              size: 15.0
            ),
            const SizedBox(width: 5.0),
            Text(
              this.widget.album.songsAmount + ' canciones',
              style: const TextStyle(
                fontSize: 15.0,
                color: Colors.greenAccent
              ),
            )
          ],
        )
      ],
    );
  }
}
import 'package:app_ui/models/song.dart';
import 'package:flutter/material.dart';

class CompactItemSong extends StatelessWidget {

  Song song;

  CompactItemSong(this.song);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
      child: Container(
        decoration: _boxDecoration(),
        height: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                _songLogo(),
                _songInfo(context)
              ],
            ),
            _favIcon(context)
          ],
        )
      )
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Colors.black26,
          offset: Offset(2.0, 2.0),
          blurRadius: 8.0
        )
      ]
    );
  }

  Widget _songLogo() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Image.network(this.song.image),
    );
  }

  Widget _songInfo(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          this.song.name,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          this.song.author,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        const SizedBox(height: 3.0),
        Row(
          children: const <Widget> [
            Icon(
              Icons.play_arrow,
              color: Colors.black26,
              size: 14.0,
            ),
            SizedBox(width: 3.0),
            Text(
              'Reproducir',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black26
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _favIcon(final BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20.0, right: 20.0),
      child: Icon(
        Icons.favorite_border,
        color: Colors.black26,
      ),
    );
  }
}
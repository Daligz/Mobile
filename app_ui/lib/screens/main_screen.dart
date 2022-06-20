import 'package:app_ui/components/song_list.dart';
import 'package:app_ui/models/album.dart';
import 'package:app_ui/models/song.dart';
import 'package:flutter/material.dart';
import '../components/album_carousel.dart';

class MainScreen extends StatelessWidget {

  List<Album> albums = [
    Album('Rockport Espacial', 'Kidd Keo', 'https://i1.sndcdn.com/artworks-wR6N5LA9Pdrp-0-t500x500.jpg', '5'),
    Album('RUNAWAYS', 'Travis Thompson', 'https://is4-ssl.mzstatic.com/image/thumb/Music115/v4/e6/52/c9/e652c9cf-97ee-204a-7864-e882140ce2e4/886447540862.jpg/600x600bf-60.jpg', '8'),
    Album('BALLADS 1', 'Joji', 'https://m.media-amazon.com/images/I/81pf4NjVhfL._AC_SL1500_.jpg', '3')
  ];

  List<Song> songs = [
    Song('Save Me', 'Dro Kenji', 'https://i.scdn.co/image/ab67616d0000b273a2df0998c3520ef21632fe4c'),
    Song('Blueberry faygo', 'Lil Mosey', 'https://m.media-amazon.com/images/I/81ARXEkdl2L._SS500_.jpg'),
    Song('MAMA', 'Kidd Keo', 'https://images.genius.com/800d562df21f63f2d364a2c1a40ae1e4.1000x1000x1.png'),
    Song('Dracukeo', 'Kidd Keo', 'https://images.genius.com/b67609ee2facf672c2461115e2da289f.1000x1000x1.jpg'),
    Song('Ransom', 'Lil Tecca', 'https://i.scdn.co/image/ab67616d0000b273bd69bbde4aeee723d6d08058'),
    Song('Prosegur Hoe', 'Leiti Sene', 'https://i1.sndcdn.com/artworks-bnYYTO6uyyAQ-0-t500x500.jpg'),
  ];

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            _customAppBar(context),
            _textsHeader(context),
            _playList(context),
            _songList(context),
            const SizedBox(height: 50.0)
          ],
        ),
      ),
    );
  }

  Widget _customAppBar(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            iconSize: 40.0,
            icon: Image.asset('icons/home.png'),
            onPressed: () { },
          ),
          Row(
            children: <Widget>[
              IconButton(
                iconSize: 40.0,
                icon: Image.asset('icons/search.png'),
                onPressed: () { },
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    iconSize: 40.0,
                    icon: Image.asset('images/profile_pic.jpg'),
                    onPressed: () { },
                  ),
                  const Text(
                    'User Name',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF191414)
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _textsHeader(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              'Good morning',
              style: Theme.of(context).textTheme.headline3
          ),
          Text(
            'User Name',
            style: TextStyle(
                fontSize: 20.0,
                color: Theme.of(context).primaryColor
            ),
          )
        ],
      )
    );
  }

  Widget _playList(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text (
            'Album',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        AlbumCarousel(
            this.albums
        )
      ],
    );
  }

  Widget _songList(final BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0, bottom: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Recientes',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'Ver mas',
                style: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SongList(this.songs),
        )
      ],
    );
  }
}
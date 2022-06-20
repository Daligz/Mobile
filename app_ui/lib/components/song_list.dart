import 'package:app_ui/components/compact_item_song.dart';
import 'package:app_ui/models/song.dart';
import 'package:flutter/material.dart';

class SongList extends StatelessWidget {

  List<Song> songs;

  SongList(this.songs);

  @override
  Widget build(final BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: this.songs.length,
      itemBuilder: (context, index) => CompactItemSong(this.songs[index]),
    );
  }
}
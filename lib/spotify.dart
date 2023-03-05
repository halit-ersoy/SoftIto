import 'package:flutter/material.dart';

class Spotify extends StatefulWidget {
  const Spotify({super.key});

  @override
  State<Spotify> createState() => _SpotifyState();
}

class _SpotifyState extends State<Spotify> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    List<SongItem> songItems = generateSongList();

    return Scaffold(
        appBar: buildAppBar(),
        bottomNavigationBar: buildBottomNavigationBar(context),
        body: Container(
          decoration: buildGradientDecoration(),
          child: Center(
            child: Column(
              children: <Widget>[
                buildCoverImage(),
                buildAlbumTitle(),
                buildFollowButton(),
                buildFollowerCountText(),
                buildShufflePlayButton(),
                buildDownloadSection(),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) =>
                        songItems[index],
                    itemCount: songItems.length,
                  ),
                )
              ],
            ),
          ),
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Color(0xFFA35D59),
      leading: BackButton(),
      actions: <Widget>[
        IconButton(
          // ignore: prefer_const_constructors
          icon: Icon(
            Icons.more_vert,
          ),
          onPressed: () {},
        )
      ],
    );
  }

  Theme buildBottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color(0xFF222326),
          textTheme: Theme.of(context)
              .textTheme
              .copyWith(caption: new TextStyle(color: Colors.grey))),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Your Library',
          ),
        ],
        currentIndex: 2,
        fixedColor: Colors.white,
        onTap: null,
      ),
    );
  }

  BoxDecoration buildGradientDecoration() {
    // ignore: prefer_const_constructors
    return BoxDecoration(
      gradient: const LinearGradient(
          colors: [Color(0xFFA35D59), Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.center,
          tileMode: TileMode.clamp),
    );
  }

  Image buildCoverImage() {
    return Image.network("https://picsum.photos/seed/picsum/300/300");
  }

  Padding buildAlbumTitle() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'This Is Teneke',
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Container buildFollowButton() {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0, bottom: 4.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.transparent,
          border: Border.all(color: Colors.grey, width: 1.0)),
      child: const Text(
        'FOLLOW',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Padding buildFollowerCountText() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        'BY SPOTIFY • 379,634 FOLLOWERS',
        style: TextStyle(fontSize: 12.0, color: Colors.grey),
      ),
    );
  }

  Container buildShufflePlayButton() {
    return Container(
      padding: const EdgeInsets.only(
          left: 40.0, right: 40.0, top: 16.0, bottom: 16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xFF2AB859),
          border: Border.all(color: Color(0xFF2AB859), width: 1.0)),
      child: const Text(
        'SHUFFLE PLAY',
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
    );
  }

  Padding buildDownloadSection() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0, bottom: 4.0),
      child: Row(
        children: const <Widget>[
          Expanded(
            child: Text(
              'Download',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Switch(
            value: false,
            onChanged: null,
          ),
        ],
      ),
    );
  }

  List<SongItem> generateSongList() {
    List<SongItem> songItems = [
      const SongItem(Song(
          name: 'Teneke Kafalar',
          artist: 'Suat Bıçak, Osman Balcılar, Hilmi Namlı...')),
      const SongItem(Song(
          name: 'Teneke Kafalar',
          artist: 'Suat Bıçak, Osman Balcılar, Hilmi Namlı...')),
      const SongItem(Song(
          name: 'Teneke Kafalar',
          artist: 'Suat Bıçak, Osman Balcılar, Hilmi Namlı...')),
      const SongItem(Song(
          name: 'Teneke Kafalar',
          artist: 'Suat Bıçak, Osman Balcılar, Hilmi Namlı...')),
    ];
    return songItems;
  }
}

class SongItem extends StatelessWidget {
  final Song song;

  const SongItem(this.song);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  song.name,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(song.artist,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey)),
                )
              ],
            ),
          ),
          const IconButton(
            icon: Icon(
              Icons.more_vert,
              size: 32.0,
              color: Colors.grey,
            ),
            onPressed: null,
          )
        ],
      ),
    );
  }
}

class Song {
  final String name;
  final String artist;

  const Song({
    required this.name,
    required this.artist,
  });
}

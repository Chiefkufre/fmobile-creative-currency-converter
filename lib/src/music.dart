import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

class Music extends StatefulWidget {
  const Music({Key? key}) : super(key: key);

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: true,
              leading: const Text('Library'),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.browse_gallery_rounded),
                  label: Text("Browse"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.music_note),
                  label: Text("Songs"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.photo_album),
                  label: Text("Albums"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.people),
                  label: Text("Artists"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.radio),
                  label: Text("Radio"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.receipt_long_outlined),
                  label: Text("Recently Played"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text("Favorite Songs"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.file_copy_rounded),
                  label: Text("Local FIles"),
                ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              child: const MainPage(),
            ),
          )
        ],
      ));
    });
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar()
      body: Column(
        children: [
          Card(
            color: Colors.red,
            elevation: 20.5,
            // shape: Border(),
            child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(18.0),
                              child: Text(
                                'Curated Playlist',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'BLINDING LIGHT',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [Text('Text')],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

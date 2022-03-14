// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:layout_app/third_screen.dart';

class ImageLayout extends StatelessWidget {
  const ImageLayout({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Grid',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Grid Image'),
        ),
        body: Center(
          child: _buildGrid()
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            tooltip: 'Back',
            child: const Icon(Icons.arrow_back),
            heroTag: null,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => const AnimatedShape()));
            },
            tooltip: 'Next',
            child: const Icon(Icons.arrow_forward),
            heroTag: null,
          )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 31, 35, 37),
        child: Container(height: 50.0),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

Widget _buildGrid() => GridView.extent(
  maxCrossAxisExtent: 150,
  padding: const EdgeInsets.all(4),
  mainAxisSpacing: 4,
  crossAxisSpacing: 4,
  children: 
    _buildGridTileList(12),
);

List<Container> _buildGridTileList(int count) => List.generate(
  // ignore: avoid_unnecessary_containers
  count, (i) => Container(child: Image.asset('images/img$i.jpg'))
);
import 'package:flutter/material.dart';
import 'package:maps/examples/bicycle_page.dart';
import 'package:maps/examples/circle_map_object_page.dart';
import 'package:maps/examples/clusterized_placemark_collection_page.dart';
import 'package:maps/examples/driving_page.dart';
import 'package:maps/examples/map_controls_page.dart';
import 'package:maps/examples/map_object_collection_page.dart';
import 'package:maps/examples/placemark_map_object_page.dart';
import 'package:maps/examples/polygon_map_object_page.dart';
import 'package:maps/examples/polyline_map_object_page.dart';
import 'package:maps/examples/reverse_search_page.dart';
import 'package:maps/examples/search_page.dart';
import 'package:maps/examples/suggest_page.dart';
import 'package:maps/examples/user_layer_page.dart';
import 'package:maps/examples/widgets/map_page.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
      home: MainPage(),
    );
  }
}

const List<MapPage> _allPages = <MapPage>[
  MapControlsPage(),
  ClusterizedPlacemarkCollectionPage(),
  MapObjectCollectionPage(),
  PlacemarkMapObjectPage(),
  PolylineMapObjectPage(),
  PolygonMapObjectPage(),
  CircleMapObjectPage(),
  UserLayerPage(),
  SuggestionsPage(),
  SearchPage(),
  ReverseSearchPage(),
  BicyclePage(),
  DrivingPage(),
];

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  void _pushPage(BuildContext context, MapPage page) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
            builder: (_) => Scaffold(
                appBar: AppBar(title: Text(page.title)),
                body:
                    Container(padding: const EdgeInsets.all(8), child: page))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('YandexMap examples')),
        body: Column(children: <Widget>[
          Expanded(
              child: Container(
                  padding: const EdgeInsets.all(8), child: const YandexMap())),
          Expanded(
              child: ListView.builder(
            itemCount: _allPages.length,
            itemBuilder: (_, int index) => ListTile(
              title: Text(_allPages[index].title),
              onTap: () => _pushPage(context, _allPages[index]),
            ),
          ))
        ]));
  }
}

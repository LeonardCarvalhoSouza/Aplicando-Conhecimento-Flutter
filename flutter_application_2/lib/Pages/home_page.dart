import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/emojipage.dart';
import 'package:flutter_application_2/Pages/webView.dart';
import 'package:flutter_application_2/api/peopleApi.dart';
import 'package:fluttermoji/fluttermoji.dart';

import '../api/api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Album>> futureAlbum;
  late Future<List<People>> futurePeople;
  late List<String> listFavoritos = [];

  @override
  void initState() {
    super.initState();
    futurePeople = fetchPeople();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        // alignment: Alignment.bottomRight,
                        foregroundColor: MaterialStateProperty.all(
                          Colors.black,
                        ),
                      ),
                      child: const Text('Site Oficial'),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => WebExampleTwo()));
                      },
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => EmojiPage()));
                      },
                      child: FluttermojiCircleAvatar(),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.resolveWith((states) {
                          return RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(150),
                          );
                        }),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return Colors.white70;
                        }),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: Colors.black,
                        tabs: [
                          Tab(
                            text: 'Filmes',
                          ),
                          Tab(
                            text: 'Personagens',
                          ),
                          Tab(
                            text: 'Favoritos',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 600,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Color(0x00FFFFFF),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3, 3, 3, 3),
                                      child: Center(
                                        child: FutureBuilder<List<Album>>(
                                          future: futureAlbum,
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              List<Album>? data = snapshot.data;
                                              return ListView.builder(
                                                  itemCount: data!.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Container(
                                                      height: 75,
                                                      color: Colors.white,
                                                      child: Center(
                                                        child: Row(
                                                          children: [
                                                            Text(data[index]
                                                                .title),
                                                            IconButton(
                                                                onPressed: () {
                                                                  bool list = listFavoritos
                                                                      .contains(data[
                                                                              index]
                                                                          .title
                                                                          .toString());

                                                                  if (!list) {
                                                                    listFavoritos.add(data[
                                                                            index]
                                                                        .title
                                                                        .toString());
                                                                    setState(
                                                                        () {
                                                                      listFavoritos;
                                                                    });
                                                                    print(
                                                                        listFavoritos);
                                                                  } else {
                                                                    listFavoritos
                                                                        .clear();
                                                                    setState(
                                                                        () {
                                                                      listFavoritos;
                                                                    });
                                                                  }
                                                                },
                                                                icon: Icon(
                                                                  Icons
                                                                      .favorite_border,
                                                                ))
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            } else if (snapshot.hasError) {
                                              return Text("${snapshot.error}");
                                            }
                                            // By default show a loading spinner.
                                            return CircularProgressIndicator();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 800,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Color(0x00FFFFFF),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3, 3, 3, 3),
                                      child: Center(
                                        child: FutureBuilder<List<People>>(
                                          future: futurePeople,
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              List<People>? data =
                                                  snapshot.data;
                                              return ListView.builder(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  itemCount: data!.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Container(
                                                      height: 75,
                                                      color: Colors.white,
                                                      child: Center(
                                                        child: Row(
                                                          children: [
                                                            Text(data[index]
                                                                .title),
                                                            IconButton(
                                                                onPressed: () {
                                                                  bool list = listFavoritos
                                                                      .contains(data[
                                                                              index]
                                                                          .title
                                                                          .toString());

                                                                  if (!list) {
                                                                    listFavoritos.add(data[
                                                                            index]
                                                                        .title
                                                                        .toString());
                                                                    setState(
                                                                        () {
                                                                      listFavoritos;
                                                                    });
                                                                    print(
                                                                        listFavoritos);
                                                                  } else {
                                                                    listFavoritos
                                                                        .clear();
                                                                    setState(
                                                                        () {
                                                                      listFavoritos;
                                                                    });
                                                                  }
                                                                },
                                                                icon: Icon(Icons
                                                                    .favorite_border))
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            } else if (snapshot.hasError) {
                                              return Text("${snapshot.error}");
                                            }
                                            // By default show a loading spinner.
                                            return CircularProgressIndicator();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 800,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Color(0x00FFFFFF),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3, 3, 3, 3),
                                      child: Center(
                                        child: ListView.builder(
                                            itemCount: listFavoritos.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Container(
                                                height: 75,
                                                color: Colors.white,
                                                child: Center(
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                          listFavoritos[index]),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class listFavoritos {
  final String title;
  final int id;

  listFavoritos({
    required this.title,
    required this.id,
  });
}

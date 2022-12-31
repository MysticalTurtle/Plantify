import 'dart:convert';

import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.response});

  final String response;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late var map;

  @override
  void initState() {
    map = jsonDecode(widget.response);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black.withAlpha(100),
                      ),
                      child: Text(
                          map["suggestions"]?[0]?["plant_details"]?
                                  ["common_names"]?[0]?? "Plantify",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          )),
                    ),
                    background: Image.network(
                      map["suggestions"][0]["similar_images"][0]["url"] ??
                          "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                      fit: BoxFit.fitWidth,
                    )),
              ),
            ];
          },
          body: Container(
            color: Colors.black.withAlpha(15),
            // make box decoration for rounded corners on top
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Text("Sugerencias: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 20),
                for (var i = 0; i < map["suggestions"].length; i++)
                  Container(
                    // make a beauty decoration for listtile
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.only(bottom: 20),
                    child: ListTile(
                      leading: Image.network(
                        map["suggestions"][i]["similar_images"][0]["url"] ??
                            "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                        fit: BoxFit.cover,
                      ),
                      title: Row(
                        children: [
                          Text(
                            map["suggestions"][i]["plant_name"],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            ((map["suggestions"][i]["probability"] as double) *
                                            100)
                                        .toStringAsFixed(2) +
                                    "%" ??
                                "Unknown",
                            style: TextStyle(
                              color: Colors.black.withAlpha(100),
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                            ),
                          )
                        ],
                      ),
                      subtitle: Text(map["suggestions"]?[i]?["plant_details"]?
                          ["wiki_description"]?["value"]?? "Sin descripción"),
                      // leading: Image.network(
                      //   map["suggestions"][i]["similar_images"][0]["url"] ??
                      //       "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),
              ],
            ),
          )),
    );
  }
}

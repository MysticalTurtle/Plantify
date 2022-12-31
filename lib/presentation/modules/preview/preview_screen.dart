import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:recog_plantify/data/datasources/recognition_datasource.dart';
import 'package:recog_plantify/presentation/widgets/loading_screen.dart';
import 'package:recog_plantify/presentation/widgets/planty_button.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({super.key, required this.image});

  final File image;

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  bool _isLoading = false;
  var dataSource = RecognitionDataSourceImpl();

  void _analize() async {
    // setState(() => _isLoading = true);
    const String token = "3IG8pt7WkS75KtlU81fN6sQV07cvqrhDMebn7fWEKTR3WDaf55";

    print("path: ${widget.image.path}");

    var response = await dataSource.recognizePlant(token, widget.image.path);
    // setState(() => _isLoading = false);
    // print(response);
    // Navigator.of(context).pushNamed("/result", arguments: value);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text(''),
          ),
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Image.file(widget.image),
              const SizedBox(height: 20),
              PlantyButton(
                text: "Analizar",
                onPressed: _analize,
              ),
            ],
          ),
        ),
        if (_isLoading) const LoadingScreen()
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluttermoji/fluttermoji.dart';

import 'home_page.dart';

class WebExampleTwo extends StatefulWidget {
  WebExampleTwo({Key? key}) : super(key: key);

  @override
  _WebExampleTwoState createState() => _WebExampleTwoState();
}

class _WebExampleTwoState extends State<WebExampleTwo> {
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                          builder: (context) => MyHomePage()));
                    },
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => MyHomePage()));
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
            progress < 1.0
                ? LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.white,
                  )
                : Center(), // this perform the loading on every page load
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                    url: Uri.parse('https://www.starwars.com/community')),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    javaScriptEnabled: true,
                    javaScriptCanOpenWindowsAutomatically: true,
                  ),
                ),
                onProgressChanged: (_, load) {
                  setState(() {
                    progress = load / 100;
                  });
                },
                // onWebViewCreated: (controller) {
                //   _webViewController = controller;
                // },
              ),
            )
          ],
        ),
      ),
    );
  }
}

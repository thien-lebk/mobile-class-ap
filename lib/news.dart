import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:webview_flutter/webview_flutter.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    // print(1);
    // Stream streamData = extractData();
    // streamData.listen((event) {
    //   print(event);
    // });
    // print(2);
    return FutureBuilder(
        future: extractData(),
        builder:
            (BuildContext context, AsyncSnapshot<List<List<String>>> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Không thể kết nối máy chủ'));
          } else if (snapshot.hasData) {
            print(snapshot.data);
            if (snapshot.data!.length == 0)
              return Center(child: Text('Chưa có tin mới'));
            List<Widget> _itemList = [];
            for (var i = 0; i < snapshot.data!.length; i++) {
              print(i);
              _itemList.add(InkWell(
                onTap: () {
                  print('link: ' + snapshot.data![i][3]);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WebPage(webURL: snapshot.data![i][3])));
                },
                child: Column(
                  children: [
                    ListTile(
                      leading: Image.network(snapshot.data![i][2]),
                      title: Text(snapshot.data![i][0]),
                      subtitle: Text(
                        snapshot.data![i][1],
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Divider()
                  ],
                ),
              ));
            }
            return ListView(
              children: _itemList,
            );
          }

          return Center(child: CircularProgressIndicator());
        });
  }
}

Future<List<List<String>>> extractData() async {
  print('---');
  final response = await http.Client()
      .get(Uri.parse('https://vnexpress.net/suc-khoe/dan-ong/tap-luyen'));
  List<List<String>> _list = [];

  if (response.statusCode == 200) {
    var document = parser.parse(response.body);
    String _title = '';
    String _description = '';
    String _imageURL = '';
    String _articleURL = '';
    try {
      var responseString = document.getElementById('automation_TV0')!;

      // First item
      _title = responseString.children[0].children[0].children[1].text.trim();
      _description =
          responseString.children[0].children[0].children[2].text.trim();
      _imageURL = responseString.children[0].children[0].children[0].children[0]
          .children[0].children[1].attributes['src']!
          .trim();
      _articleURL = responseString
          .children[0].children[0].children[1].children[0].attributes['href']!
          .trim();

      _list.add([_title, _description, _imageURL, _articleURL]);

      //Other item
      int i = 0;
      int _errorCount = 0;
      while (i <= 50 && _errorCount < 10)
        try {
          _title =
              responseString.children[1].children[i].children[1].text.trim();

          _description =
              responseString.children[1].children[i].children[2].text.trim();
          _imageURL = responseString.children[1].children[i].children[0]
              .children[0].children[0].children[1].attributes['data-src']!
              .trim();
          _articleURL = responseString.children[1].children[i].children[1]
              .children[0].attributes['href']!
              .trim();

          _list.add([_title, _description, _imageURL, _articleURL]);

          i++;
        } catch (e) {
          _errorCount++;
          i++;
          continue;
        }
    } catch (e) {
      print(['Lỗi: ' + e.toString(), '', '', '']);
    }
    return _list;
  } else {
    return [
      ['Error', '', '', '']
    ];
  }
}

class WebPage extends StatefulWidget {
  final String webURL;
  const WebPage({required this.webURL, Key? key}) : super(key: key);

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Go back'),
            ),
            body: WebView(
              initialUrl: widget.webURL,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              onProgress: (int progress) {
                print("WebView is loading (progress : $progress%)");
              },
              javascriptChannels: <JavascriptChannel>{
                _toasterJavascriptChannel(context),
              },
              // navigationDelegate: (NavigationRequest request) {
              //   if (request.url.startsWith('https://www.youtube.com/')) {
              //     print('blocking navigation to $request}');
              //     return NavigationDecision.prevent;
              //   }
              //   print('allowing navigation to $request');
              //   return NavigationDecision.navigate;
              // },
              onPageStarted: (String url) {
                print('Page started loading: $url');
              },
              onPageFinished: (String url) {
                print('Page finished loading: $url');
              },
              gestureNavigationEnabled: true,
            )));
  }
}

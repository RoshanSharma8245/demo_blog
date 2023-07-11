import 'package:flutter/material.dart';

void main() {
  runApp(const MyAp());
}

class MyAp extends StatelessWidget {
  const MyAp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: HomeScreens(),
    );
  }
}

class HomeScreens extends StatelessWidget {
  HomeScreens({Key? key}) : super(key: key);

  final List<Map> myProducts =
      List.generate(20, (index) => {"id": index, "name": "Product $index"})
          .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // implement GridView.builder
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: myProducts.length,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(myProducts[index]["name"]),
              );
            }),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   Future<void> _handleRefresh() async {
//     return await Future.delayed(Duration(seconds: 2));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.deepPurple[200],
//       body: LiquidPullToRefresh(
//         color: Colors.deepPurple,
//         height: 300,
//         backgroundColor: Colors.deepPurple[200],
//         onRefresh: _handleRefresh,
//         child: ListView.builder(
//             itemCount: 5,
//             itemBuilder: (BuildContext context, int index) {
//               return Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Container(
//                     height: 300,
//                     color: Colors.deepPurple[300],
//                   ),
//                 ),
//               );
//             }),
//       ),
//     );
//   }
// }


// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   var list;
//   var random;
//
//   var refreshKey = GlobalKey<RefreshIndicatorState>();
//
//   @override
//   void initState() {
//     list = List.generate(3, (i) => "Item $i");
//     super.initState();
//     random = Random();
//     refreshList();
//   }
//
//   Future<Null> refreshList() async {
//     refreshKey.currentState?.show(atTop: false);
//     await Future.delayed(Duration(seconds: 2));
//
//     setState(() {
//       list = List.generate(random.nextInt(10), (i) => "Item $i");
//     });
//
//     return null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Pull to refresh"),
//       ),
//       body: RefreshIndicator(
//         key: refreshKey,
//         child: ListView.builder(
//           itemCount: list?.length,
//           itemBuilder: (context, i) => ListTile(
//             title: Text(list[i]),
//           ),
//         ),
//         onRefresh: refreshList,
//       ),
//     );
//   }
// }


// import 'package:example/other/refresh_glowindicator.dart';
// import 'package:example/ui/MainActivity.dart';
// import 'package:example/ui/SecondActivity.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'ui/indicator/base/IndicatorActivity.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return RefreshConfiguration(
//       footerTriggerDistance: 15,
//       dragSpeedRatio: 0.91,
//       headerBuilder: () => MaterialClassicHeader(),
//       footerBuilder: () => ClassicFooter(),
//       enableLoadingWhenNoData: false,
//       enableRefreshVibrate: false,
//       enableLoadMoreVibrate: false,
//       shouldFooterFollowWhenNotFull: (state) {
//         // If you want load more with noMoreData state ,may be you should return false
//         return false;
//       },
//       child: MaterialApp(
//         title: 'Pulltorefresh Demo',
//         debugShowCheckedModeBanner: false,
//         builder: (context, child) {
//           return ScrollConfiguration(
//             child: child,
//             behavior: RefreshScrollBehavior(),
//           );
//         },
//         theme: ThemeData(
//           // This is the theme of your application.
//           //s
//           // Try running your application with "flutter run". You'll see the
//           // application has a blue toolbar. Then, without quitting the app, try
//           // changing the primarySwatch below to Colors.green and then invoke
//           // "hot reload" (press "r" in the console where you ran "flutter run",
//           // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
//           // counter didn't reset back to zero; the application is not restarted.
//             primarySwatch: Colors.blue,
//             primaryColor: Colors.greenAccent),
//         localizationsDelegates: [
//           RefreshLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//           GlobalMaterialLocalizations.delegate,
//           GlobalCupertinoLocalizations.delegate
//         ],
//         supportedLocales: [
//           const Locale('en'),
//           const Locale('zh'),
//           const Locale('ja'),
//           const Locale('uk'),
//           const Locale('it'),
//           const Locale('ru'),
//           const Locale('fr'),
//           const Locale('es'),
//           const Locale('nl'),
//           const Locale('sv'),
//           const Locale('pt'),
//           const Locale('ko'),
//         ],
//         locale: const Locale('zh'),
//         localeResolutionCallback:
//             (Locale locale, Iterable<Locale> supportedLocales) {
//           //print("change language");
//           return locale;
//         },
//         home: MainActivity(title: 'Pulltorefresh'),
//         routes: {
//           "sec": (BuildContext context) {
//             return SecondActivity(
//               title: "SecondAct",
//             );
//           },
//           "indicator": (BuildContext context) {
//             return IndicatorActivity();
//           }
//         },
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: RefreshIndicatorExample(),
//     );
//   }
// }
//
// class RefreshIndicatorExample extends StatefulWidget {
//   const RefreshIndicatorExample({super.key});
//
//   @override
//   State<RefreshIndicatorExample> createState() =>
//       _RefreshIndicatorExampleState();
// }
//
// class _RefreshIndicatorExampleState extends State<RefreshIndicatorExample> {
//   final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
//   GlobalKey<RefreshIndicatorState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('RefreshIndicator Sample'),
//       ),
//       body: RefreshIndicator(
//         key: _refreshIndicatorKey,
//         color: Colors.white,
//         backgroundColor: Colors.blue,
//         strokeWidth: 4.0,
//         onRefresh: () async {
//           // Replace this delay with the code to be executed during refresh
//           // and return a Future when code finishs execution.
//           return Future<void>.delayed(const Duration(seconds: 3));
//         },
//         // Pull from top to show refresh indicator.
//         child: ListView.builder(
//           itemCount: 25,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//               title: Text('Item $index'),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           // Show refresh indicator programmatically on button tap.
//           _refreshIndicatorKey.currentState?.show();
//         },
//         icon: const Icon(Icons.refresh),
//         label: const Text('Show Indicator'),
//       ),
//     );
//   }


// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     backgroundColor: Colors.green,
//     appBar: AppBar(
//       title: const Text('Flutter WebView example'),
//       // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
//       actions: <Widget>[
//         NavigationControls(_controller.future),
//         SampleMenu(_controller.future, widget.cookieManager),
//       ],
//     ),
//     body: WebView(
//       initialUrl: 'https://flutter.dev',
//       javascriptMode: JavascriptMode.unrestricted,
//       onWebViewCreated: (WebViewController webViewController) {
//         _controller.complete(webViewController);
//       },
//       onProgress: (int progress) {
//         print('WebView is loading (progress : $progress%)');
//       },
//       javascriptChannels: <JavascriptChannel>{
//         _toasterJavascriptChannel(context),
//       },
//       navigationDelegate: (NavigationRequest request) {
//         if (request.url.startsWith('https://www.youtube.com/')) {
//           print('blocking navigation to $request}');
//           return NavigationDecision.prevent;
//         }
//         print('allowing navigation to $request');
//         return NavigationDecision.navigate;
//       },
//       onPageStarted: (String url) {
//         print('Page started loading: $url');
//       },
//       onPageFinished: (String url) {
//         print('Page finished loading: $url');
//       },
//       gestureNavigationEnabled: true,
//       backgroundColor: const Color(0x00000000),
//     ),
//     floatingActionButton: favoriteButton(),
//   );
// }



//
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// final webViewKey = GlobalKey<WebViewContainerState>();
//
// class WebViewPage extends StatefulWidget {
//   @override
//   WebViewPageState createState() => WebViewPageState();
// }
//
// class WebViewPageState extends State<WebViewPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("WebView example"),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.refresh),
//             onPressed: () {
//               // using currentState with question mark to ensure it's not null
//               webViewKey.currentState?.reloadWebView();
//             },
//           )
//         ],
//       ),
//       body: WebViewContainer(key: webViewKey),
//     );
//   }
// }
//
// class WebViewContainer extends StatefulWidget {
//   WebViewContainer({Key key}) : super(key: key);
//
//   @override
//   WebViewContainerState createState() => WebViewContainerState();
// }
//
// class WebViewContainerState extends State<WebViewContainer> {
//   late WebViewController _webViewController;
//
//   @override
//   Widget build(BuildContext context) {
//     return WebView(
//       onWebViewCreated: (controller) {
//         _webViewController = controller;
//       },
//       initialUrl: "https://stackoverflow.com",
//     );
//   }
//
//   void reloadWebView() {
//     _webViewController?.reload();
//   }
// }



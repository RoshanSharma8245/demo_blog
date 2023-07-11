import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var controller;
  int pageIndex = 0;
  final List<Widget> _list = <Widget>[
    const ListTile(
      title: Text(
        'Welcome to the embedded subs testing phase one',
        textAlign: TextAlign.center,
      ),
    ),
    Container(
        alignment: Alignment.center,
        height: 200,
        //width: double.maxFinite,
        color: Colors.green,
        child: const Center(
            child: Text(
          "Page 1",
          style: TextStyle(color: Colors.white),
        ))),
    Container(
        alignment: Alignment.center,
        height: 200,
        // width: double.maxFinite,
        color: Colors.red,
        child: const Center(
            child: Text(
          "Page 2",
          style: TextStyle(color: Colors.white),
        ))),
    Container(
        alignment: Alignment.center,
        height: 200,

        //  width: double.maxFinite,
        color: Colors.blue,
        child: const Center(
            child: Text(
          "Page 3",
          style: TextStyle(color: Colors.white),
        ))),
    Container(
        alignment: Alignment.center,
        height: 200,
        //  width: double.maxFinite,
        color: Colors.orange,
        child: const Center(
            child: Text(
          "Page 4",
          style: TextStyle(color: Colors.white),
        ))),
    const ListTile(
      title: Text(
        'Benefits: You will get',
        textAlign: TextAlign.center,
      ),
    ),
    const ListTile(title: Text('List 1')),
    ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
      ),
      child: const Text('Subscribe'),
    ),
    const Text("Pay with"),
    Image.asset('assets/conscentLogoMono.png',
        height: 50,
        width: 80,
        opacity: const AlwaysStoppedAnimation<double>(0.5))
  ];

//2 nd widget .........................................................

  final List<Widget> _list2 = <Widget>[
    const ListTile(
      title: Text(
        'Welcome to the embedded subs testing phase one',
        textAlign: TextAlign.center,
      ),
    ),
    const ListTile(
      title: Text(
        'Choose Plan',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
    ),
    Column(
      children: <Widget>[
        //add column end .........................................

        //add column end .........................................
        const SizedBox(
          height: 15,
        ),
        Container(
            child: const Text(
          'Benefits: You will get',
          style: TextStyle(fontSize: 20),
        )),
        const ListTile(title: Text('List 1')),
      ],
    ),
    const Text("Pay with"),
    Image.asset('assets/conscentLogoMono.png',
        height: 50,
        width: 80,
        opacity: const AlwaysStoppedAnimation<double>(0.5))
  ];

//2list

  @override
  void initState() {
    // TODO: implement initState
    controller = PageController(initialPage: pageIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: homeBody(),
    );
  }

  Widget homeBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (pageIndex > 0) {
                        pageIndex = pageIndex - 1;
                        controller.animateToPage(
                          pageIndex,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      }
                    });
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 40,
                    color: pageIndex != 0 ? Colors.black : Colors.grey,
                  )),
              const SizedBox(width: 10),
              SizedBox(
                height: 100,
                width: 200,
                child: PageView(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (currentIndex) {
                    pageIndex = currentIndex;
                  },
                  children: _list,
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (pageIndex < _list.length) {
                        pageIndex = pageIndex + 1;
                        controller.animateToPage(
                          pageIndex,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      }
                    });
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 40,
                    color:
                        pageIndex != _list.length ? Colors.black : Colors.grey,
                  )),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

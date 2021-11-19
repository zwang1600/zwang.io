import 'package:flutter/material.dart';
import 'package:website/pages/about_section.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:website/pages/melodong_page.dart';
import '../widgets/project_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zuo Wang',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(230, 10, 20, 80),
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: Colors.cyan[200],
        primaryColorDark: Colors.cyan[400],
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 120.0,
            fontWeight: FontWeight.bold,
            fontFamily: "Signatra",
          ),
          headline2: TextStyle(fontSize: 45.0, fontFamily: "RoadRage"),
          headline3: TextStyle(
              fontSize: 35.0,
              height: 1.5,
              color: Colors.cyan,
              fontWeight: FontWeight.w900),
          headline4:
              TextStyle(fontSize: 35.0, height: 1.5, color: Colors.white),
          subtitle1:
              TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, height: 2),
          subtitle2: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              height: 2,
              color: Color.fromARGB(200, 177, 156, 217)),
          bodyText1: TextStyle(fontSize: 20.0, height: 1.5),
          bodyText2: TextStyle(
              fontSize: 20.0,
              height: 1.5,
              decoration: TextDecoration.underline,
              color: Color.fromARGB(200, 177, 156, 217)),
        ),
      ),
      home: const MyHomePage(title: 'Zuo Wang\' personal website'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 1;
  late AutoScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "Z W",
                    style: TextStyle(
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Signatra"),
                  ),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextButton(
                    onPressed: () => _scrollToIndex(1),
                    child: const Text(
                      "About",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextButton(
                    onPressed: () => _scrollToIndex(2),
                    child: const Text(
                      "Work",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextButton(
                    onPressed: () => _scrollToIndex(3),
                    child: const Text(
                      "Projects",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                IconButton(
                    icon: const FaIcon(FontAwesomeIcons.linkedin),
                    onPressed: () {
                      _launchURL(
                          "https://www.linkedin.com/in/zuo-wang-b41a1b175/");
                    }),
              ],
            )),
        body: ListView(controller: _controller, children: [
          Padding(
            padding: const EdgeInsets.only(left: 80, right: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Z u o     W a n g",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                AutoScrollTag(
                  key: const ValueKey(1),
                  index: 1,
                  controller: _controller,
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "1.",
                        style: Theme.of(context).textTheme.headline3),
                    TextSpan(
                        text: " About Me",
                        style: Theme.of(context).textTheme.headline4),
                  ])),
                ),
                const AboutSection(),
                const SizedBox(
                  height: 300,
                ),
                AutoScrollTag(
                  key: const ValueKey(2),
                  index: 2,
                  controller: _controller,
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "2.", style: Theme.of(context).textTheme.headline3),
                    TextSpan(
                        text: " Work",
                        style: Theme.of(context).textTheme.headline4),
                  ])),
                ),
                ProjectWidget(
                  "MeloDonG",
                  "https://melodong.com/",
                  "Game Development Enginner Intern",
                  "Created 3D gaming environments and character animations in Unity Engine and managed game objects using C# scripts.",
                  "assets/images/one.png",
                  MeloDonGPage(),
                ),
                ProjectWidget(
                    "XiaoMi",
                    "https://www.mi.com/us/",
                    "Software Development Enginner Intern",
                    "Joined the mobile app development department and participated in projects involving incorporating 3D surrounding audio sounds into the mobile operating system. Focused on bridging the native libraries(C) and the user interface(Java.)",
                    "assets/images/two.png",
                    AboutSection()),
                ProjectWidget(
                    "Xuberance",
                    "http://ma-steven.blogspot.com/",
                    "3D Digital Designer Intern",
                    "3D-designed and printed using Maya, Rhino, Grasshopper and Keyshot and integrated Python scripts when generating repetitve patterns.",
                    "assets/images/three.png",
                    AboutSection()),
                const SizedBox(
                  height: 300,
                ),
                AutoScrollTag(
                  key: const ValueKey(3),
                  index: 3,
                  controller: _controller,
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "3.", style: Theme.of(context).textTheme.headline3),
                    TextSpan(
                        text: " Projects",
                        style: Theme.of(context).textTheme.headline4),
                  ])),
                ),
              ],
            ),
          ),
        ]));
  }

  Future _scrollToIndex(index) async {
    await _controller.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _controller.highlight(index);
  }
}

void _launchURL(url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
import 'package:flutter/material.dart';
import 'package:ornek_proje/widgets/expansiontile_page.dart';
import 'package:ornek_proje/widgets/liste_ornek.dart';
import 'package:ornek_proje/widgets/pageview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyProject(),
    );
  }
}

class MyProject extends StatefulWidget {
  const MyProject({super.key});

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  var keyList = PageStorageKey("key liste");
  var keyExpansion = PageStorageKey("key expansion");
  late List<Widget> sayfalar;
  int bottomIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sayfalar = [
      ListeOrnek(listKey: keyList),
      ExpansiontilePage(expansionKey: keyExpansion),
      PageviewPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasarım Araçları"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: sayfalar[bottomIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        currentIndex: bottomIndex,
        onTap: (index) {
          setState(() {
            bottomIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Liste",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.expand_less_rounded),
            label: "Expansion",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages),
            label: "Pageview",
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PageviewPage extends StatefulWidget {
  const PageviewPage({super.key});

  @override
  State<PageviewPage> createState() => _PageviewPageState();
}

class _PageviewPageState extends State<PageviewPage> {
  bool yatayEksen = true;
  bool isPageSnapping = true;
  int currentIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: pageController,
            scrollDirection: yatayEksen
                ? Axis.horizontal
                : Axis.vertical,
            pageSnapping: isPageSnapping,
            onPageChanged: (value) {
              setState(() {});
              currentIndex = value;
            },
            children: [
              Container(
                width: double.infinity,
                color: Colors.indigo.shade300,
                child: Center(
                  child: Text(
                    "Sayfa 0",
                    style: TextStyle(fontSize: 36),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.blue.shade300,
                child: Center(
                  child: Text(
                    "Sayfa 1",
                    style: TextStyle(fontSize: 36),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.purple.shade300,
                child: Center(
                  child: Text(
                    "Sayfa 2",
                    style: TextStyle(fontSize: 36),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: 200,
            width: double.infinity,
            color: Colors.blueGrey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: currentIndex == 2
                          ? null
                          : () {
                              pageController.nextPage(
                                duration: Duration(
                                  seconds: 1,
                                ),
                                curve: Curves.easeIn,
                              );
                            },
                      child: Text("İleri"),
                    ),
                    ElevatedButton(
                      onPressed: currentIndex == 0
                          ? null
                          : () {
                              pageController.previousPage(
                                duration: Duration(
                                  seconds: 1,
                                ),
                                curve: Curves.easeIn,
                              );
                            },
                      child: Text("Geri"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Yatay Eksende Çalış"),
                    Checkbox(
                      value: yatayEksen,
                      onChanged: (value) {
                        setState(() {
                          yatayEksen = value!;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Page Snapping Değiştir"),
                    Checkbox(
                      value: isPageSnapping,
                      onChanged: (value) {
                        setState(() {
                          isPageSnapping = value!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

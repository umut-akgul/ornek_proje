import 'package:flutter/material.dart';

class PageviewPage extends StatefulWidget {
  const PageviewPage({super.key});

  @override
  State<PageviewPage> createState() => _PageviewPageState();
}

class _PageviewPageState extends State<PageviewPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Pageview Sayfası",
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}

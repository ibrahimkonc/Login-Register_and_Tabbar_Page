import 'package:flutter/material.dart';
import 'package:mart_8_calismalar/tabs_subwidgets/profile_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FİLMCİKOLİK"),
        bottom: TabBar(
            onTap: (tabindex) {
              setState(() {
                _tabController.index = tabindex;
              });
            },
            indicatorColor: Color(0xFFE1FF00),
            indicatorWeight: 2,
            padding: EdgeInsets.all(1),
            indicatorSize: TabBarIndicatorSize.tab,
            controller: _tabController,
            tabs: const [
              Icon(Icons.home, size: 35),
              Icon(Icons.leaderboard, size: 35),
              Icon(Icons.person, size: 35),
            ]),
      ),
      body: TabBarView(controller: _tabController, children: [
        Center(child: Text("Ana Sayfam", style: _style)),
        Center(child: Text("Eğitim Sayfam", style: _style)),
        Center(child: MyProfilePage()),
      ]),
    );
  }

  final TextStyle _style = TextStyle(
      color: Colors.grey.shade900, fontWeight: FontWeight.w600, fontSize: 20);
}

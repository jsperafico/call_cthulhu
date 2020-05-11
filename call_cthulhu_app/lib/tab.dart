// import 'package:flutter/material.dart';

// class TabWidget extends StatefulWidget {
//   static List<Tab> myTabs = const <Tab>[
//     Tab(text: 'LEFT'),
//     Tab(text: 'RIGHT'),
//   ];
//   static TabController tabController;

//   @override
//   State<StatefulWidget> createState() {
//     return _TabState();
//   }

//   static TabBar createTabBar() {
//     return TabBar(
//       controller: TabWidget.tabController,
//       tabs: TabWidget.myTabs,
//     );
//   }
// }

// class _TabState extends State<TabWidget> with SingleTickerProviderStateMixin {

//   @override
//   void initState() {
//     super.initState();
//     TabWidget.tabController = TabController(
//       vsync: this,
//       length: TabWidget.myTabs.length
//     );
//   }

//   @override
//  void dispose() {
//    TabWidget.tabController.dispose();
//    super.dispose();
//  }

//   @override
//   Widget build(BuildContext context) {
//     return TabBarView(
//       controller: TabWidget.tabController,
//         children: TabWidget.myTabs.map((Tab tab) {
//           final String label = tab.text.toLowerCase();
//           return Center(
//             child: Text(
//               'This is the $label tab',
//               style: const TextStyle(fontSize: 36),
//             ),
//           );
//         }).toList(),
//     );
//   }
// }
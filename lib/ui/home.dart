import 'package:agenda_boa/states/counter.dart';
import 'package:agenda_boa/ui/counter_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final counterLists = List.generate(3, (index) => index + 1);
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemCount: 3,
        itemBuilder: (BuildContext ctx, int index) => CounterPage(counterIndex: index),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon((Icons.add)),
        onPressed: () => counterState.incrementCounter(currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: counterLists
            .map((e) => BottomNavigationBarItem(icon: Text("$e", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)), label: "Counter $e"))
            .toList(),
        onTap: (int index) {
          setState(() {
            currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}

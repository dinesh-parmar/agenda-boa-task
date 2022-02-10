import 'package:agenda_boa/states/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatefulWidget {
  final int counterIndex;

  const CounterPage({Key? key, required this.counterIndex}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Counter ${widget.counterIndex + 1}"),
        actions: [
          IconButton(
            onPressed: () => counterState.setValue(widget.counterIndex, 0),
            icon: const Icon(Icons.restart_alt),
            tooltip: "Reset Counter",
          ),
        ],
      ),
      body: ChangeNotifierProvider.value(
        value: counterState,
        builder: (ctx, _) => Center(
          child: FutureBuilder(
              future: counterState.retrieveCounterValue(widget.counterIndex),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) return const CircularProgressIndicator();
                return Consumer<CounterState>(
                  builder: (BuildContext context, value, Widget? child) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "You have Pushed Counter No. ${widget.counterIndex + 1} button : ",
                          children: [
                            TextSpan(text: "${value.counterValue[widget.counterIndex]} times", style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => counterState.incrementCounter(widget.counterIndex),
                        child: const Text("Increment Me!"),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}

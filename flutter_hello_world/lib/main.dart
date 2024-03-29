//import 'package:js/js.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/*
class A extends StatelessWidget: 객체 A 생성시마다 A.build 함수 호출 
class B extends StatefulWidget: 객체 B 생성시 State<B>를 반환하는 B.createState 함수 호출
                                -> class C extends State<B> 생성시 C.build 함수 호출 
                                -> C.setState 호출시 C.build 함수 호출
*/

void main() {
  //  original
  //  runApp(const MyApp());

  //  practice1. 
  //  runApp(const Center(child:Text("Hello World!", textDirection: TextDirection.ltr,)));

  // practice2
  /*
  runApp(
    const MaterialApp(
      title: 'My app',
      home: SafeArea(child: MyScaffold()),
    )
  );
  */

  // practice3
  /*
  runApp(
    const MaterialApp(
      title: "Flutter tutorial",
      home: TutorialHome(),
    )
  );
  */
  
  // practice4
  /*
  runApp(
    const MaterialApp(
      home: Scaffold(
        body:Center(
          child: MyButton(),
        )
      )
    )
  );
  */

  // practice5, practice6
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Counter(),
        ),
      ),
    ),
  );
}

// for practice5, practice6
class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

// for practice6
class CounterDisplay extends StatelessWidget {
  const CounterDisplay({required this.count, super.key});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}

class CounterIncrementor extends StatelessWidget{
  const CounterIncrementor({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed: onPressed, 
      child: const Text('Increment'),
    );
  }
}
// for practice6 end

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    print("before setState");
    setState((){
      _counter++;
    });
    print("after :setState");
  }

  @override
  Widget build(BuildContext context) {
    print("build: 객체 생성시, setState 호출시마다 build가 호출된다.");
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /* practice5
        ElevatedButton(
          onPressed: _increment, 
          child: const Text('Increment'),
        ),
        const SizedBox(width:16),
        Text('Count: $_counter'),
        */
        CounterIncrementor(onPressed: _increment),
        const SizedBox(width:16),
        CounterDisplay(count:_counter),
      ],
    );
  }
}
// for practice5, practice6 end

// for practice4
class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color:Colors.lightGreen[500],
        ),
        child: const Center(
          child: Text("Engage"),
        )
      ),
    );
  }
}
// for practice4 end


// for practice3
class TutorialHome extends StatelessWidget {
  const TutorialHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(onPressed: null, icon: Icon(Icons.menu), tooltip: "Navigation Menu",),
        title: const Text('Example title'),
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.search), tooltip: "search",),
        ],
      ),
      body: const Center(
        child: Text("Hello World"),
      ),
      floatingActionButton: const FloatingActionButton(
        tooltip: "Add",
        onPressed: null, 
        child: Icon(Icons.add),
        ),
    );
  }
}
// for practice3 end

// for practice2
class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column (
        children: [
          MyAppBar(
            title: Text('Example title', style: Theme.of(context).primaryTextTheme.titleLarge,),
          ),
          const Expanded(
            child: Center(
              child: Text("Hello World"),
            ),
          ),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, super.key});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration( color: Colors.blue[500]),
      child: Row(
        children: [
          const IconButton(
            icon: Icon(Icons.menu),
            onPressed: null,
            tooltip: "Navigation menu",
          ),
          Expanded(
            child: title
          ),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: "Search",
            onPressed: null,
            ),
        ],
        ),
    );
  }
}
// for practice 2 end

// original
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
// original end
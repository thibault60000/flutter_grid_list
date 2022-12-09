import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter List Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Activity> activities = [
    Activity('Vélo', Icons.directions_bike),
    Activity('Alarme', Icons.access_alarm_rounded)
  ];

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    print("Orientation ${orientation}");

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: grid(),
          // child: (orientation == Orientation.portrait) ?  list() : grid()
        ));
  }

  Widget grid() {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: activities.length,
        itemBuilder: (context, i) {
          return Container(
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.all(3.5),
              child: Card(
                  elevation: 10.0,
                  child: InkWell(
                      onTap: (() => {print("tap on grid")}),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("Activité",
                              style: TextStyle(
                                  color: Colors.teal, fontSize: 13.0)),
                          Icon(activities[i].icon,
                              color: Colors.teal, size: 35.0),
                          Text(activities[i].name,
                              style: const TextStyle(
                                  color: Colors.teal, fontSize: 20.0))
                        ],
                      ))));
        });
  }

  Widget list() {
    return ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, i) {
          print("index ${i}");
          Activity activity = activities[i];
          String key = activity.name;
          return Dismissible(
              key: Key(key),
              child: Container(
                  padding: const EdgeInsets.all(10.0),
                  height: 130.0,
                  child: Card(
                      elevation: 7.5,
                      child: InkWell(
                          onTap: (() => print("Tapped")),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(activity.icon,
                                    color: Colors.amberAccent, size: 75.0),
                                Column(
                                  children: [
                                    const Text(
                                      'Activité: ',
                                      style:
                                          TextStyle(color: Colors.amberAccent),
                                    ),
                                    Text(
                                      activity.name,
                                      style: const TextStyle(
                                          color: Colors.amberAccent),
                                    ),
                                  ],
                                )
                              ])))));
        });
  }
}

class Activity {
  String name;
  IconData icon;

  Activity(this.name, this.icon);
}

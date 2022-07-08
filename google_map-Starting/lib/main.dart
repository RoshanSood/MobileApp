// import 'dart:html';
// import 'package:path_provider/path_provider.dart';
//import 'dart:convert';

//import 'package:test/test.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_mao/scrape_gas_prices.dart';
// import 'dart:async';
// import 'dart:io';
//import 'package:path_provider/path_provider.dart';

// import 'package:http/http.dart' as http;
// import 'dart:convert';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gas App',
      
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'The Gas Price Finder App'),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
  String textFromFile = 'Empty';
  String newGas = "";
  getData() async {
    //String response;
    //response = await rootBundle.loadString('data.txt');
    //final response2 = await getGasByZipCode(controller.text);
    //print(response2);
    setState(() {
      //textFromFile = response;
      //newGas = price;
      // final response2 =  getGasByZipCode(controller.text);
      // print(response2);

      //print(textFromFile);
    });
  }

  String greetings = '';
  int _counter = 0;
  final List<String> items = ['Regular', 'Premium', 'Diesel'];
  String result = "";
  String value = "";
  String test = "test";
  String selectedSubject = 'Regular';
  final TextEditingController controller = new TextEditingController();
  String? _content;
  // // Find the Documents path
  // Future<String> _getDirPath() async {
  //   final dir = await getApplicationDocumentsDirectory();
  //   return dir.path;
  // }
  // // This function is triggered when the "Read" button is pressed
  // Future<void> _readData() async {
  //   print("Button Hit");
  //   final dirPath = await _getDirPath();
  //   final myFile = File('$dirPath/test.txt');
  //   final data = await myFile.readAsString(encoding: utf8);
  //   setState(() {
  //     _content = data;
  //     print(_content);
  //   });
  // }
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
      backgroundColor: Color.fromARGB(255, 54, 54, 54),
      appBar: AppBar(
        title: Text(widget.title),
         backgroundColor: Color.fromARGB(255, 54, 54, 54),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              //color: Color.fromARGB(255, 255, 255, 255),
              controller: controller,
              decoration: const InputDecoration(
                  hintText: "Zip Code",
                  hintStyle: TextStyle(fontSize: 24, color: Color.fromARGB(255, 255, 255, 255)),
                  labelText: "Input Zip Code",
                  labelStyle: TextStyle(fontSize: 24, color: Color.fromARGB(255, 255, 255, 255)),
                  border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
              maxLength: 5,
            ),
            ElevatedButton(
              child: Text("Submit"),
              onPressed: () async {
                // final response = await getGasByZipCode(controller.text);
                // print(response);
                getData();
                // {
                //   //  final response = await http.get("http://127.0.0.1:5000");

                //   //  final decoded = jsonDecode(response.body) as Map<String, dynamic>;

                //   //  setState(() {
                //   //    greetings = decoded['greetings'];
                //   //  });

                //   print("Zip Code: " + controller.text);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Page2(controller.text),
                ));
              },
              style: ElevatedButton.styleFrom(
                 primary: Color.fromARGB(255, 31, 30, 30),
                // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                 textStyle: TextStyle(
                 fontSize: 20,
                // fontWeight: FontWeight.bold)
              )),
  //             style: ElevatedButton.styleFrom({
  //       backgroundColor: const Color.fromARGB(255, 54, 54, 54),
  // }),
             
              
            )
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  String ZipCode;

  Page2(this.ZipCode, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String test = "test";
    // FutureBuilder(builder: builder)
    // File file = new File("station/lib/test.txt");
    // print(file.readAsStringSync());
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return FutureBuilder(
        future: getGasByZipCode(ZipCode),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Scaffold(
              backgroundColor: Color.fromARGB(255, 54, 54, 54),
              appBar: AppBar(
                title: const Text("Gas Prices"),
                backgroundColor: Color.fromARGB(255, 54, 54, 54),
              ),
              body: ListView.builder(
                itemCount: snapshot.data.length + 1,
                itemBuilder: (context, index) {
                  if (index == snapshot.data.length) {
                    return Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Page3()));
                          },
                          style: ElevatedButton.styleFrom(
                 primary: Color.fromARGB(255, 31, 30, 30),
                // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                 textStyle: TextStyle(
                 fontSize: 20,
                // fontWeight: FontWeight.bold)
              )),
                          child: const Text("Heat Map"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const MyApp()));
                          },
                          style: ElevatedButton.styleFrom(
                 primary: Color.fromARGB(255, 31, 30, 30),
                // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                 textStyle: TextStyle(
                 fontSize: 20,
                // fontWeight: FontWeight.bold)
              )),
                          child: const Text("Back"),
                        ),
                      ],
                    );
                  } else {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 5,
                                height: MediaQuery.of(context).size.height /
                                    10, //need to change height with this variable
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Color.fromARGB(99, 0, 0, 0)),
                                child: Center(
                                    child: Text(snapshot.data[index][0] + ": " +
                                        snapshot.data[index][1] + "\n" + 
                                        snapshot.data[index][2],
                                        textAlign: TextAlign.center,
                                        
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          
                      )
                          )),
                                        
                              ),
                            ],
                          ),
                        ));
                  }
                },
              ),
            );
          }
        });
    // ElevatedButton(
    //   onPressed: () {
    //     Navigator.of(context)
    //         .push(MaterialPageRoute(builder: (context) => Page3()));
    //   },
    //   child: const Text("Heat Map"),
    // ),
    // ElevatedButton(
    //   onPressed: () {
    //     Navigator.of(context)
    //         .push(MaterialPageRoute(builder: (context) => const MyApp()));
    //   },
    //   child: const Text("Back"),
    // ),

//     return Scaffold(
//       appBar: AppBar(title: const Text("Gas Prices")),
//       body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [

//                 Container(
//                   width: MediaQuery.of(context).size.width - 5,
//                   height: MediaQuery.of(context).size.height /
//                       10, //need to change height with this variable
//                   decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       color: Color.fromARGB(99, 0, 0, 0)),
//                   child: Center(child: Text(Test.counter)),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width - 15,
//                   height: MediaQuery.of(context).size.height /
//                       10, //need to change height with this variable
//                   decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       color: Color.fromARGB(99, 0, 0, 0)),
//                   child:  Center(child: Text(Study.test2)),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width - 15,
//                   height: MediaQuery.of(context).size.height /
//                       10, //need to change height with this variable
//                   decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       color: Color.fromARGB(99, 0, 0, 0)),
//                   child: const Center(child: Text("Station 3")),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width - 15,
//                   height: MediaQuery.of(context).size.height /
//                       10, //need to change height with this variable
//                   decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       color: Color.fromARGB(99, 0, 0, 0)),
//                   child: Center(child: Text("Station 4 " + test)),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context)
//                         .push(MaterialPageRoute(builder: (context) => Page3()));
//                   },
//                   child: const Text("Heat Map"),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).push(
//                         MaterialPageRoute(builder: (context) => const MyApp()));
//                   },
//                   child: const Text("Back"),
//                 )
//               ],
//             ),
//           )));
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String test = "test";
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
     
      appBar: AppBar(title: const Text("Gas Heat Map"),
       backgroundColor: Color.fromARGB(255, 54, 54, 54),),
      // child: Image(
      //   image: NetworkImage(''),
       backgroundColor: Color.fromARGB(255, 54, 54, 54),
      body: Container(
        
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     // image: AssetImage("lib/ouput.jpg"),

        //   ),
        // ),

        child: Column(
          children: [
            Center(
                child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MyApp()));
              },
              style: ElevatedButton.styleFrom(
                 primary: Color.fromARGB(255, 31, 30, 30),
                // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                 textStyle: TextStyle(
                 fontSize: 20,
                // fontWeight: FontWeight.bold)
              )),
              child: const Text("Enter Zip Code"),
            ))
          ],
        ),
      ),
    );
  }
}

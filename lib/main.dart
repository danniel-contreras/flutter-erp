import 'package:erp_test_app/services/user.service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF01395E)),
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
  final TextEditingController userNameControlled = TextEditingController();
  final TextEditingController passwordControlled = TextEditingController();
  final UserService service = UserService();

  void makeLogin() {
    service.loginUser(
        context: context,
        username: userNameControlled.text,
        password: passwordControlled.text);
  }

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_header(context), _fields(context)],
        ),
      ),
    );
  }

  _header(context) {
    return const Column(children: [
      Text("Bienvenido",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF01395E))),
      Text("Ingresa tus credenciales",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(0xFF01395E))),
    ]);
  }

  _fields(context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Usuario",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF01395E))),
                TextField(
                  controller: userNameControlled,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Color(0xFFadb5bd)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Color(0xFFadb5bd)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Color(0xFFadb5bd)),
                    ),
                    fillColor: const Color(0xFFf8f9fa),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon: const Icon(Icons.person),
                    hintText: 'Ingresa tu usuario',
                    hintStyle: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            )),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Contraseña",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF01395E))),
              TextField(
                controller: passwordControlled,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xFFadb5bd)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xFFadb5bd)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xFFadb5bd)),
                  ),
                  fillColor: const Color(0xFFf8f9fa),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixIcon: const Icon(Icons.key),
                  hintText: 'Ingresa tu contraseña',
                  hintStyle: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ElevatedButton(
                onPressed: () {
                  makeLogin();
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color(0xFF1282a2),
                ),
                child: const Text("Iniciar sesión", style: TextStyle(color: Color(0xFFffffff)),)))
      ],
    );
  }
}

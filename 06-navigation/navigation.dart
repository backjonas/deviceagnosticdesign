import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(routes: {
    "/": (BuildContext context) => HomeScreen(),
    "/read": (BuildContext context) => ReadScreen(),
    "/write": (BuildContext context) => WriteScreen(),
  }));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Row(children: [
      OutlinedButton(
          onPressed: () => Navigator.pushNamed(context, "/read"),
          child: const Text("Read")),
      OutlinedButton(
          onPressed: () => Navigator.pushNamed(context, "/write"),
          child: const Text("Write")),
    ], mainAxisAlignment: MainAxisAlignment.center)));
  }
}

class ReadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Row(children: [
      Text("Reading"),
      OutlinedButton(
          onPressed: () => Navigator.pop(context), child: const Text("Back"))
    ], mainAxisAlignment: MainAxisAlignment.center)));
  }
}

class WriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Row(children: [
      Text("Writing"),
      OutlinedButton(
          onPressed: () => Navigator.pop(context), child: const Text("Back"))
    ], mainAxisAlignment: MainAxisAlignment.center)));
  }
}

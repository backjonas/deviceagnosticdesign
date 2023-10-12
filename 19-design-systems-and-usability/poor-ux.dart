import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
        path: '/contact/:id',
        builder: (context, state) =>
            ContactScreen(int.parse(state.pathParameters['id']!))),
  ],
);

main() {
  runApp(MaterialApp.router(routerConfig: router));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  // Doherty threshold: slow response
  _goToContact(BuildContext context, int index) async {
    await Future.delayed(Duration(seconds: 5));
    context.go('/contact/$index');
  }

  @override
  Widget build(BuildContext context) {
    final contacts = ContactService().getContacts();
    return ListView(
      children: List.generate(
          contacts.length,
          (index) => Column(children: [
                // Law of similarity: Buttons don't seem to belong to contacts
                // Law of proximity: It's unclear which button belongs to which contact
                ElevatedButton(
                  child: Container(width: 10, height: 10, color: Colors.red),
                  onPressed: () async {
                    _goToContact(context, index);
                  },
                ),
                Text(contacts[index].email),
                Text(contacts[index].name),
              ])),
    );
  }
}

class ContactScreen extends StatelessWidget {
  final int id;
  const ContactScreen(this.id);

  @override
  Widget build(BuildContext context) {
    final contact = ContactService().getContact(id);
    return Center(
        child: Row(children: [Text(contact.name), Text(contact.email)]));
  }
}

class Contact {
  final String name;
  final String email;

  Contact(this.name, this.email);
}

class ContactService {
  final List<Contact> _contacts = [
    Contact("Leela", "leela@futurama.com"),
    Contact("Bender", "bender@futurama.com"),
    Contact("Zoidberg", "zoidberg@futurama.com"),
    Contact("Homer", "homer@simpsons.com"),
    Contact("Marge", "marge@simpsons.com"),
    Contact("Bart", "bart@simpsons.com"),
    Contact("Lisa", "lisa@simpsons.com"),
    Contact("Maggie", "lisa@simpsons.com"),
  ];

  List<Contact> getContacts() {
    return _contacts;
  }

  Contact getContact(int index) {
    return _contacts[index];
  }
}

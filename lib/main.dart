import 'package:drawer_app/screens/about_page.dart';
import 'package:drawer_app/screens/home_page.dart';
import 'package:drawer_app/screens/login_page.dart';
import 'package:drawer_app/screens/messages_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedDrawer = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Builder(
          builder: (context) => Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const UserAccountsDrawerHeader(
                      accountName: Text("Bryan"),
                      accountEmail: Text("contact@bryandbernhardt.com"),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://instagram.fpoa6-1.fna.fbcdn.net/v/t51.2885-19/320212784_875213080460220_1207934028322762128_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fpoa6-1.fna.fbcdn.net&_nc_cat=100&_nc_ohc=yXaEOsmpyAQAX_Ne7aw&edm=ACWDqb8BAAAA&ccb=7-5&oh=00_AfCKyGB8pvVQRtftlxuCB7zXhTY434ifumTeFKoGmNfjXQ&oe=64178053&_nc_sid=1527a3"),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: const Text("Home"),
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          _selectedDrawer = 0;
                        });
                      },
                    ),
                    ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.message),
                        ],
                      ),
                      title: const Text("Messages"),
                      trailing: Stack(
                        alignment: Alignment.center,
                        children: const [
                          Icon(
                            Icons.brightness_1,
                            color: Colors.redAccent,
                          ),
                          Text(
                            "5",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      subtitle: const Text("Access inbox"),
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          _selectedDrawer = 1;
                        });
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.info),
                      title: const Text("About"),
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          _selectedDrawer = 2;
                        });
                      },
                    ),
                  ],
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text("Logout"),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: const Text("Drawer App"),
        ),
        body: IndexedStack(
          index: _selectedDrawer,
          children: const [
            HomePage(),
            MessagesPage(),
            AboutPage(),
          ],
        ),
      ),
    );
  }
}

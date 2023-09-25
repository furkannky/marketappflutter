import 'package:flutter/material.dart';
import 'package:marketappflutter/sepetim.dart';
import 'package:marketappflutter/urunler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'projem',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  final yazi = "widget an gelen içerik";
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int _AktifIcerikNno = 0;
  late List<Widget> _icerikler;
  @override
  void initState() {
    super.initState();

    _icerikler = [
      Urunler(),
      Sepetim(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "ucarak gelsin",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
      body: _icerikler[_AktifIcerikNno],
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Furkan Kaya"),
              accountEmail: const Text("furkannkayaa@gmail.com"),
              currentAccountPicture: Container(
                decoration:  BoxDecoration(
                  image: const DecorationImage(
                      image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2016/03/12/23/18/man-1253004_1280.jpg",
                  ),
                  fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              decoration: BoxDecoration(color: Colors.green.shade900),
            ),
            ListTile(title: const Text("sparişlerim"),onTap: () {},),
            ListTile(title: const Text("indirimlerim"),onTap: () {},),
            ListTile(title: const Text("ayarlar"),onTap: () {},),
            ListTile(title: const Text("çıkış yap"),onTap: () {
              Navigator.pop(context);
            },),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _AktifIcerikNno,
        selectedItemColor: Colors.orange.shade400,
        unselectedItemColor: Colors.grey.shade500,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ("Urunler")),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: ("Sepetim ")),
        ],
        onTap: (int tiklananButonPozisyonNo) {
          setState(() {
            _AktifIcerikNno = tiklananButonPozisyonNo;
          });
        },
      ),
    );
  }
}

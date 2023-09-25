import 'package:flutter/material.dart';

class UrunDetay extends StatelessWidget {

  final String isim;
  final String fiyat;
  final String resimYolu;
  final bool mevcut;

  const UrunDetay({super.key, required this.isim, required this.fiyat, required this.resimYolu, required this.mevcut});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Stack(
          children: [
            Hero(
              tag: resimYolu,
              child: Image.network(
                  resimYolu),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.red.shade400,
              ),
            ),
          ],
        ),
        Column(
          children: [
            const SizedBox(
              height: 20,
            ),
             Text(
              isim,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              fiyat,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade400),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                "Bu bölümde ürun açıklaması bulunacak. ürunun ne kadar kaliteli olduğu hakkında bilgiler verilecek",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              height: 50,
              decoration: BoxDecoration(
                color: mevcut ? Colors.red.shade400 : Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child:  Center(
                child: Text(
                  mevcut ? "sepete ekle " : "stokta yok",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}

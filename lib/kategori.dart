import 'package:flutter/material.dart';
import 'package:marketappflutter/urun_detay.dart';

class Kategori extends StatefulWidget {
  final String kategori;

  const Kategori({super.key, required this.kategori});

  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  late List<Widget> gosterilecekListe;
  @override
  void initState() {
    super.initState();
    if (widget.kategori == "temel gıda") {
      gosterilecekListe = <Widget>[
        urunKarti(
          "zeytin yağı",
          "23.50 TL",
          "https://cdn.pixabay.com/photo/2016/05/24/13/29/olive-oil-1412361_1280.jpg",
          mevcut: true,
        ),
        urunKarti(
          "süt",
          "3.50 TL",
          "https://cdn.pixabay.com/photo/2016/12/06/18/27/cereal-1887237_1280.jpg",
        ),
        urunKarti(
          "et 1 KG",
          "30 TL",
          "https://cdn.pixabay.com/photo/2016/03/05/23/02/barbecue-1239434_1280.jpg",
        ),
        urunKarti(
          "yumurta 8'li",
          "12.50 TL",
          "https://cdn.pixabay.com/photo/2021/02/21/07/42/easter-eggs-6035549_1280.jpg",
          mevcut: true,
        ),
        urunKarti(
          "makarna",
          "15.50 TL",
          "https://cdn.pixabay.com/photo/2016/08/30/20/20/noodles-1631935_1280.jpg",
        ),
        urunKarti(
          "çay",
          "30 TL",
          "https://cdn.pixabay.com/photo/2016/11/29/12/44/tea-1869594_1280.jpg",
        ),
        urunKarti(
          "ketçap",
          "10.50 TL",
          "https://cdn.pixabay.com/photo/2016/06/10/16/17/tomatoes-1448361_1280.jpg",
        ),
        urunKarti(
          "un 5 KG",
          "25 TL",
          "https://cdn.pixabay.com/photo/2016/02/05/15/34/pasta-1181189_1280.jpg",
        ),
      ];
    } else if (widget.kategori == "şekerleme") {
      gosterilecekListe = <Widget>[
        urunKarti(
          "çikolata hediyelik",
          "22.50 TL ",
          "https://cdn.pixabay.com/photo/2013/06/05/18/50/mozartkugeln-116782_1280.jpg",
        ),
        urunKarti(
          "karışık kurabiye",
          " 20  TL ",
          "https://cdn.pixabay.com/photo/2020/12/06/15/52/cookies-5809181_1280.jpg",
        ),
        urunKarti(
          "çilekli kek",
          "15 TL ",
          "https://cdn.pixabay.com/photo/2014/05/23/23/17/dessert-352475_1280.jpg",
        ),
        urunKarti(
          "pasta",
          "16 TL ",
          "https://cdn.pixabay.com/photo/2016/02/29/00/19/cake-1227842_1280.jpg",
        ),
      ];
    } else if (widget.kategori == "içecekler") {
      gosterilecekListe = <Widget>[
        urunKarti(
          "Portakal suyu",
          "6.50 TL",
          "https://cdn.pixabay.com/photo/2016/08/23/15/52/fresh-orange-juice-1614822_1280.jpg",
        ),
        urunKarti(
          "Şişe Su",
          " 2 TL",
          "https://cdn.pixabay.com/photo/2017/02/02/15/15/bottle-2032980_1280.jpg",
        ),
        urunKarti(
          "Maden Suyu 6'lı",
          "5 TL",
          "https://cdn.pixabay.com/photo/2016/07/22/20/52/cold-drink-1535766_1280.jpg",
        ),
        urunKarti(
          "Gazoz",
          " 1.50 TL",
          "https://cdn.pixabay.com/photo/2015/11/30/23/32/eve-1071352_1280.jpg",
        ),
      ];
    } else if (widget.kategori == "temizlik") {
      gosterilecekListe = <Widget>[
        urunKarti(
          "bulaşık deterjanı",
          "12 TL",
          "https://cdn.pixabay.com/photo/2017/06/19/16/16/dishes-2419967_1280.jpg",
        ),
        urunKarti(
          "sıvı sabun",
          "9 TL",
          "https://cdn.pixabay.com/photo/2016/02/11/14/48/bottle-1193706_1280.jpg",
        ),
      ];
    }
  }

  Widget urunKarti(String Isim, String Fiyat, String ResimYolu, {bool mevcut = false }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context)=> UrunDetay(
          isim:Isim,
          fiyat:Fiyat,
          resimYolu:ResimYolu,
          mevcut: mevcut,
        )) );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 4,
                spreadRadius: 2,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: ResimYolu,
              child: Container(
                width: 120,
                height: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(ResimYolu),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              Isim,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              Fiyat,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      padding: EdgeInsets.all(10),
      childAspectRatio: 1,
      children: gosterilecekListe,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:marketappflutter/kategori.dart';

class Urunler extends StatefulWidget {
  const Urunler({super.key});

  @override
  State<Urunler> createState() => _UrunlerState();
}

class _UrunlerState extends State<Urunler> with SingleTickerProviderStateMixin  {

  late TabController televizyonKontrolcusu;
  @override
  void initState() {
    super.initState();
    televizyonKontrolcusu = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return   Column(
      children:<Widget> [
         TabBar(
          controller: televizyonKontrolcusu,
          indicatorColor: Colors.green.shade400,
          labelColor: Colors.green.shade400,
          unselectedLabelColor: Colors.grey,
          isScrollable: true,
          labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          tabs: const [
          Tab(child: Text("temel gıda" ),),
          Tab(child: Text("şekerleme"),),
          Tab(child: Text("içecekler"),),
          Tab(child: Text("temizlik"),),

        ],),
        Expanded(
          child:  TabBarView(
          controller: televizyonKontrolcusu,

            children: const [
            Kategori(kategori: "temel gıda",),
            Kategori(kategori:"şekerleme"),
            Kategori(kategori:"içecekler"),
            Kategori(kategori:"temizlik"),


          ]),
        )
      ],
    );
  }
}

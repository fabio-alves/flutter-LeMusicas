import 'package:flutter/material.dart';

class LyricPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Le Musicas"),
      ),
      body: listaMusicas()
      
    );
  }
  listaMusicas(){
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("minha lista")
        );
      }
    );
  }
}
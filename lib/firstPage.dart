import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FirstPage extends StatelessWidget {
  bool isSearch = false;
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !isSearch ? Text("Le Musicas"): Text("Busque sua musica"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),
          onPressed: (){
            setState((){
              this.isSearch=!this.isSearch;
            });
            {
            
          }},)
        ],
      ),
        body: listaMusicas()
      
    );
  }
  _searchBar(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
   child:TextField(decoration:InputDecoration(hintText:'Buscar...'
    ),
    ),
     );
  }
  listaMusicas(){
    return ListView.builder(
      itemBuilder: (context, index) {
        return  Card(child: ListTile(
          title: Text("minha lista")
        ));
      }
    );
  }
}
      
   
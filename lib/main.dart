import 'package:flutter/material.dart';
import 'package:flutterpokemon_app/pokedex.dart';
import 'package:flutterpokemon_app/pokemon_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(
  title: "poke app",
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url = " https://github.com/Biuni/PokemonGO-Pokedex/blob/master/pokedex.json";

Pokedex pokeDex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  fetchData()async{
    var res=await http.get(url);
    var decodeJson = jsonDecode(res.body);
    pokeDex = Pokedex.fromJson(decodeJson);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Poke App"),
        backgroundColor: Colors.greenAccent,
      ),
      body:pokeDex == null ?Center(child: CircularProgressIndicator()):GridView.count(crossAxisCount: 2,
        children: pokeDex.pokemon.map((poke) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> PokeDetail(pokemon: poke,)));
            },
            child: Hero(
              tag: poke.img,
              child: Card(
                elevation:3.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration:BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(poke.img)
                      )
                    )
                  ),
                  Text(poke.name,style: TextStyle(
                    fontSize: 20,

                  ),)
                ],
              ),),
            ),
          ),
        )).toList(),
      ),
        drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
      ),
    );
  }
}

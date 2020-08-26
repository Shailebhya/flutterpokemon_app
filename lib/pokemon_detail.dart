import 'package:flutter/material.dart';
import 'package:flutterpokemon_app/pokedex.dart';
class PokeDetail extends StatelessWidget {

  final Pokemon pokemon;
  PokeDetail({this.pokemon});

  bodyWidget(BuildContext context) => Stack(
     children: [
       Positioned(
         height: MediaQuery.of(context).size.height/1.5,
         width: MediaQuery.of(context).size.width-20,
         left: 10,
         top: MediaQuery.of(context).size.height*.1 ,
         child: Card(
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(15)
           ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               SizedBox(height: 70,),
               Text(pokemon.name,style: TextStyle(
                 fontSize: 25,
                 fontWeight: FontWeight.bold
               ),),
               Text("Height = ${pokemon.height}"),
               Text("Weight = ${pokemon.weight}"),
               Text("Types",style: TextStyle(
                 fontWeight: FontWeight.bold
               ),),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: pokemon.type.map((t) => FilterChip(backgroundColor:Colors.amber,label: Text(t,style: TextStyle(color: Colors.white),),onSelected:(b){})).toList(),

               ),
               Text("Weakness",style: TextStyle(
  fontWeight: FontWeight.bold
  ),),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: pokemon.weaknesses.map((t) => FilterChip(backgroundColor:Colors.red,label: Text(t,style: TextStyle(color: Colors.white),),onSelected:(b){})).toList(),

               ),
               Text("Next Evolution",style: TextStyle(
                   fontWeight: FontWeight.bold
               ),),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: pokemon.nextEvolution.map((t) => FilterChip(backgroundColor:Colors.greenAccent,label: Text(t.name,style: TextStyle(color: Colors.white),),onSelected:(b){})).toList(),

               ),
             ],
           ),
         ),
       ),
       Align(
         alignment: Alignment.topCenter,
         child: Hero(
           tag: pokemon.img,
           child: Container(
             height: 200,
             width: 200,
             decoration: BoxDecoration(
               image: DecorationImage(
                 fit: BoxFit.cover,
                 image: NetworkImage(pokemon.img)
               )
             ),
           ),
         ),
       )
     ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyan,
        title: Text(pokemon.name),
      ),
      body: bodyWidget(context),
    );
  }
}

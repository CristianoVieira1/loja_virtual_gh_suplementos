import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/category_screen.dart';

class CategoryTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  CategoryTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(snapshot.data["icon"]),
      ),
      title: Text(snapshot.data["title"]),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>CategoryScreen(snapshot))

        );
      },
    );
  }
}



// Padding(
//        padding: const EdgeInsets.all(2.0),
//        child: InkWell(
//          child: Container(
//            width: 100.0,
//            child: ListTile(
//              leading: Image.network(
//                   snapshot.data["icon"],
//                   alignment: Alignment.centerLeft,
//                   width: 80.0,
//                   height: 75,
//                 ),
//                  title: Container(
//                   alignment: Alignment.centerLeft,
//                   child: Text(snapshot.data["title"],
//                   style: TextStyle(
//                     fontSize: 26.0,
//                   ),
//                       ),

//                  ),
//                  trailing: Icon(Icons.keyboard_arrow_right),
//                  onTap: (){
//                    Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context)=>CategoryScreen(snapshot))
//                    );
//                  },
//            ),
//                     ),
//                   )
//                 );
    
    

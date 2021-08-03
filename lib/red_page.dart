import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RedPage extends StatefulWidget {
  const RedPage({Key key}) : super(key: key);

  @override
  _RedPageState createState() => _RedPageState();
}

class _RedPageState extends State<RedPage> {
  var _food = FirebaseFirestore.instance.collection('food').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: StreamBuilder(
        stream: _food,
        builder: (context,snapshot){
          if(!snapshot.hasData)
            return CircularProgressIndicator();
          return ListView.builder(
            itemCount:snapshot.data.docs.length,
            itemBuilder: (context,index)
            {
            return Center(
              child: Column(
                children: [
                  Text(snapshot.data.docs[index]['title']),
                  Text(snapshot.data.docs[index]['color']),
                  Text(snapshot.data.docs[index]['userid']),
                ],
              ),
            );

            },
          );
        },

      ),

      // Padding(
      //   padding: const EdgeInsets.all(18.0),
      //   child: Center(
      //     child: Text(
      //       'This is Red page',
      //       style: TextStyle(fontSize: 34, color: Colors.white),
      //     ),
      //   ),
      // ),
    );
  }
}

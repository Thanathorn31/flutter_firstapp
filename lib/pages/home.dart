// stf
import 'dart:convert';

import 'package:firstapp/pages/detail.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: FutureBuilder(
        builder: (context, snapshot) {
          var data = json.decode(snapshot.data.toString());
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return MyBox(
                data[index]['title'],
                data[index]['subtitle'],
                data[index]['image_url'],
                data[index]['detail'],
              );
            },
            itemCount: data.length,
          );
        },
        future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
      ),
    );
  }

  Widget MyBox(String title, String subtitle, String img_url, String detail) {
    var v1, v2, v3, v4;
    v1 = title;
    v2 = subtitle;
    v3 = img_url;
    v4 = detail;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      height: 150,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 195, 210, 210),
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(img_url),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: const Color.fromARGB(255, 182, 179, 179),
            ),
          ),
          SizedBox(height: 15),
          TextButton(
            onPressed: () {
              print("next page >>");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(v1, v2, v3, v4),
                ),
              );
            },
            child: Text("red more"),
          ),
        ],
      ),
    );
  }
}

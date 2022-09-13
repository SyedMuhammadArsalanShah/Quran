import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

late String stringresponse;
late Map mapResponse;
late Map dataResponse;
late List listResponse;

class Quranlist extends StatefulWidget {
  const Quranlist({Key? key}) : super(key: key);

  @override
  State<Quranlist> createState() => _QuranlistState();
}

class _QuranlistState extends State<Quranlist> {
  Future apicall() async {
    http.Response response;

    response = await http.get(Uri.parse("http://api.alquran.cloud/v1/meta"));
    if (response.statusCode == 200) {
      setState(() {
        // stringresponse = response.body;
        mapResponse = jsonDecode(response.body);
        dataResponse = mapResponse['data']['surahs'];
        listResponse = dataResponse['references'];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HolyQuran"),
        backgroundColor: Colors.teal,
      ),
      body: (ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.teal,
              child: Text(
                listResponse[index]["number"].toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(listResponse[index]['name'],
                style: TextStyle(fontFamily: 'alq')),
            subtitle: Text(
              listResponse[index]['englishName'],
              style: TextStyle(fontFamily: 'alq', color: Colors.teal),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                listResponse[index]['revelationType'] == 'Meccan'
                    ? Image.asset('images/kaaba.png', width: 30, height: 30)
                    : Image.asset('images/madina.png', width: 30, height: 30),
                Text(
                  "verses ${listResponse[index]['numberOfAyahs'].toString()}",
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ));
        },
        itemCount: listResponse == null ? 0 : listResponse.length,
      )),
    );
  }
}

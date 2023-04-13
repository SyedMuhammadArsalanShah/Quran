import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:quran/surahindex.dart';

Map mapResponse = {};
Map dataResponse = {};
List listResponse = [];
List listResponse1 = [];

class Surahs extends StatefulWidget {
  final Surahindex name;
  Surahs({Key? key, required this.name}) : super(key: key);

  @override
  State<Surahs> createState() => _SurahsState();
}

class _SurahsState extends State<Surahs> {
  Future apicall() async {
    http.Response response;

    response = await http
        .get(Uri.parse("http://api.alquran.cloud/v1/quran/quran-uthmani"));
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = jsonDecode(response.body);
        dataResponse = mapResponse['data'];
        listResponse = dataResponse['surahs'][widget.name.numm - 1]['ayahs'];
        listResponse1 = dataResponse['surahs'];
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
          title: Text("Surah ${widget.name.namee}",
              style: TextStyle(fontFamily: 'alq', color: Colors.white)),
          backgroundColor: Colors.teal,
        ),
        body: Column(
          children: [
            Center(
              child: Card(
                child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(
                        "${widget.name.numm}",
                        style: TextStyle(color: Colors.teal),
                      ),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Surah ${widget.name.namee} : ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'alq',
                                fontSize: 15,
                                color: Colors.white)),
                        Text(
                            listResponse1[widget.name.numm - 1]
                                ['englishNameTranslation'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'alq', color: Colors.white)),
                      ],
                    ),
                    title: Text(widget.name.urname,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style:
                            TextStyle(fontFamily: 'alq', color: Colors.white)),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        listResponse1[widget.name.numm - 1]['revelationType'] ==
                                'Meccan'
                            ? Image.asset('images/kaaba.png',
                                width: 30, height: 30)
                            : Image.asset('images/madina.png',
                                width: 30, height: 30),
                        Text(
                          "verses ${widget.name.nummv}",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ],
                    )),
                elevation: 8,
                color: Colors.teal,
                shadowColor: Colors.green,
                margin: EdgeInsets.all(10),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    // onTap: () {},

                    title: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        listResponse[index]['text'],
                        textDirection: TextDirection.rtl,
                        style:
                            TextStyle(fontFamily: 'alq', color: Colors.black),
                      ),
                    ),
                  ),
                  margin: const EdgeInsets.all(10),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white)),
                );
              },
              itemCount: listResponse == null ? 0 : listResponse.length,
            ))
          ],
        ));
  }
}

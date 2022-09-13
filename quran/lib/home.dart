// import 'dart:convert';

// import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   getuser() async {
//     var usersdata = [];
//     var res = await http.get(Uri.http('api.alquran.cloud', 'v1/meta'));
//     var jsondata = jsonDecode(res.body);

//     // print(jsondata);

//     for (var i in jsondata) {
//       // print(i['data'][i]['name']);
//     }

//     return usersdata;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ElevatedButton(onPressed: getuser, child: Text("get show")),
//     );
//   }
// }
// // class Home extends StatefulWidget {
// //   const Home({Key? key}) : super(key: key);

// //   @override
// //   State<Home> createState() => _HomeState();
// // }

// // class _HomeState extends State<Home> {
// //   getuser() async {
// //     var usersdata = [];
// //     var res = await http.get(Uri.http('api.alquran.cloud', 'v1/meta'));
// //     var jsondata = jsonDecode(res.body);

// //     // print(jsondata);

// //     for (var i in jsondata) {
// //       Usermodel user = new Usermodel.fromJson(jsondata);
// //       print(user.datas[i].name);

// //       usersdata.add(user);
// //     }

// //     return usersdata;
// //   }

// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         body: FutureBuilder(
// //       future: getuser(),
// //       builder: (context, snapshot) {
// //         if (snapshot.data == null) {
// //           return Text("Nothing Show ");
// //         } else
// //           return Text("show");
// //         // ListView.builder(
// //         //   itemCount: snapshot.data.length,
// //         //   itemBuilder: (context, i) {
// //         //     return ListTile(
// //         //       title: Text(snapshot.data[i].data),
// //         //     );
// //         //   },
// //         // );
// //       },
// //     ));
// //   }
// // }

// // class Usermodel {
// //   List<Data> datas;

// //   Usermodel({required this.datas});

// //   factory Usermodel.fromJson(Map<String, dynamic> json) {
// //     var list = json['data'] as List;
// //     List<Data> datasurah = list.map((datas) => Data.fromJson(datas)).toList();
// //     return Usermodel(datas: datasurah);
// //   }
// // }

// // class Data {
// //   int number;
// //   String name,
// //       englishName,
// //       englishNameTranslation,
// //       numberOfAyahs,
// //       revelationType;

// //   Data(
// //       {required this.number,
// //       required this.name,
// //       required this.englishName,
// //       required this.englishNameTranslation,
// //       required this.numberOfAyahs,
// //       required this.revelationType});

// //   factory Data.fromJson(Map<String, dynamic> json) {
// //     return Data(
// //       number: json['number'],
// //       name: json['name'],
// //       englishName: json['englishName'],
// //       englishNameTranslation: json['englishNameTranslation'],
// //       numberOfAyahs: json[' numberOfAyahs'],
// //       revelationType: json['revelationType'],
// //     );
// //   }
// // }

      // dataResponse = mapResponse['data']['surahs'];
        // listResponse = mapResponse['references'];
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

late String stringresponse;
late Map mapResponse;
late Map dataResponse;
late List listResponse;

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  Future apicall() async {
    http.Response response;

    response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode == 200) {
      setState(() {
        // stringresponse = response.body;
        mapResponse = jsonDecode(response.body);
        // dataResponse = mapResponse['data'];
        listResponse = mapResponse['data'];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    apicall();
    super.initState();
  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text("Holy Quran")),
//         body: Center(
//           child: Container(
//             width: 300,
//             height: 300,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               color: Colors.teal,
//             ),
//             child: Center(
//                 child: mapResponse == null
//                     ? Container()
//                     : Text(
//                         // stringresponse.toString(),
//                         // mapResponse['data'].toString(),
//                         listResponse[3]['first_name'].toString(),

//                         style: TextStyle(color: Colors.white),
//                       )),
//           ),
//         ));
//   }
//}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Holy Quran")),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Image.network(listResponse[index]['avatar']),
                ),
                Text(listResponse[index]['id'].toString()),
                Text(listResponse[index]['first_name']),
                Text(listResponse[index]['last_name']),
                Text(listResponse[index]['email']),
              ]),
            );
          },
          itemCount: listResponse == null ? 0 : listResponse.length,
        ));
  }
}

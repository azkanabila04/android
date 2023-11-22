import 'package:flutter/material.dart';

import 'second_page.dart';

import 'widget_hari.dart';


class FirstPage extends StatefulWidget {

  const FirstPage({Key? key}) : super(key: key);


  @override

  FirstPageState createState() => FirstPageState();

}


class FirstPageState extends State<FirstPage> {

  List<bool> isYaCheckedList = List.generate(7, (index) => false);

  List<bool> isTidakCheckedList = List.generate(7, (index) => false);

  String infoText = '';

  int yaCount = 0;

  int tidakCount = 0;

  List<String> historyList = [];


  void resetCheckboxes() {

    setState(() {

      isYaCheckedList = List.generate(7, (index) => false);

      isTidakCheckedList = List.generate(7, (index) => false);

      yaCount = 0;

      tidakCount = 0;

      infoText = '';

    });

  }


  void saveHistory() {

    final now = DateTime.now();

    historyList.add(

        '${now.day}-${now.month}-${now.year} ${now.hour}:${now.minute}:${now.second} Ya: $yaCount Tidak: $tidakCount');

  }


  @override

  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    double screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(

        appBar: AppBar(

          title: const Text('TAHAJUD CHECKLIST',

              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),

          centerTitle: true,

        ),

        body: Container(

          decoration: const BoxDecoration(

            gradient: LinearGradient(

              begin: Alignment.topRight,

              end: Alignment.bottomLeft,

              colors: [Colors.blue, Colors.red],

            ),

          ),

          child: Center(

            child: Column(

              children: <Widget>[

                const Padding(

                  padding: EdgeInsets.all(16.0),

                  child: Text(

                    'Ini adalah checklist untuk introspeksi diri. Tidak untuk disebarkan ke orang lain.',

                    textAlign: TextAlign.center,

                    style: TextStyle(color: Colors.white),

                  ),

                ),

                Expanded(

                  child: ListView.builder(

                    itemCount: 7,

                    itemBuilder: (BuildContext context, int index) {

                      return WidgetHari(

                        index: index,

                        isYaCheckedList: isYaCheckedList,

                        isTidakCheckedList: isTidakCheckedList,

                        setState: setState,

                      );

                    },

                  ),

                ),

                SizedBox(height: screenHeight * 0.02),

                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [

                    ElevatedButton(

                      onPressed: resetCheckboxes,

                      style: ElevatedButton.styleFrom(

                          padding: const EdgeInsets.all(10.0)),

                      child: const Text('Hapus'),

                    ),

                    ElevatedButton(

                      onPressed: () {

                        setState(() {

                          yaCount = isYaCheckedList.where((b) => b).length;

                          tidakCount =

                              isTidakCheckedList.where((b) => b).length;

                          infoText =

                              'Total Checklist sudah di simpan, silakan lihat pada RANGKUMAN';

                        });

                        saveHistory();

                      },

                      style: ElevatedButton.styleFrom(

                          padding: const EdgeInsets.all(10.0)),

                      child: const Text('Simpan'),

                    ),

                  ],

                ),

                Text(infoText),

                const SizedBox(height: 10.0),

                Padding(

                  padding: const EdgeInsets.only(bottom: 20.0),

                  child: ElevatedButton(

                    onPressed: () {

                      Navigator.push(

                        context,

                        MaterialPageRoute(

                            builder: (context) => SecondPage(

                                yaCount: yaCount,

                                tidakCount: tidakCount,

                                historyList: historyList)),

                      );

                    },

                    style: ElevatedButton.styleFrom(

                        padding: EdgeInsets.all(screenWidth * 0.02)),

                    child: const Text('RANGKUMAN'),

                  ),

                ),

              ],

            ),

          ),

        ));

  }

}


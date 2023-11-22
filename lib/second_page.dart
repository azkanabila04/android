import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final int yaCount;
  final int tidakCount;
  final List<String> historyList;

  const SecondPage({
    Key? key,
    required this.yaCount,
    required this.tidakCount,
    required this.historyList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RANGKUMAN'),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
              child: Text('Jumlah Ya: $yaCount',
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text('Jumlah Tidak: $tidakCount',
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white)),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              child: Text('Riwayat:',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white)),
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                itemCount: historyList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.all(2.0),
                    child: ListTile(
                      title: Text(historyList[index]),
                    ),
                  );
                },
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.5),
                child: SingleChildScrollView(
                  child: Center(
                    child: Text(
                      'Rasulullah SAW bersabda: "Hendaklah kalian melakukan shalat malam/qiyamullail karena hal tersebut merupakan kebiasaan para orang shalih sebelum kalian, karena qiyamullail tersebut sebagai bentuk pendekatan (seorang hamba) kepada Allah, pencegah dari perbuatan dosa, pelebur kesalahan dan sebagai penolak sakit dari jasad." (HR Tirmidzi)',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue, // text color
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('KEMBALI'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

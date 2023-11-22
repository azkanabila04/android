import 'package:flutter/material.dart';

class WidgetHari extends StatelessWidget {
  final int index;
  final List<bool> isYaCheckedList;
  final List<bool> isTidakCheckedList;
  final Function setState;

  const WidgetHari({
    Key? key,
    required this.index,
    required this.isYaCheckedList,
    required this.isTidakCheckedList,
    required this.setState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String day = '';
    switch (index) {
      case 0:
        day = 'Senin';
        break;
      case 1:
        day = 'Selasa';
        break;
      case 2:
        day = 'Rabu';
        break;
      case 3:
        day = 'Kamis';
        break;
      case 4:
        day = 'Jumat';
        break;
      case 5:
        day = 'Sabtu';
        break;
      case 6:
        day = 'Minggu';
        break;
    }
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(screenWidth * 0.01),
      padding: EdgeInsets.all(screenHeight * 0.01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        title: Text(day, style: const TextStyle(color: Colors.black)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Ya', style: TextStyle(color: Colors.black)),
            Checkbox(
              value: isYaCheckedList[index],
              onChanged: (bool? value) {
                setState(() {
                  isYaCheckedList[index] = value ?? false;
                  if (isYaCheckedList[index]) {
                    isTidakCheckedList[index] = false;
                  }
                });
              },
            ),
            const Text('Tidak', style: TextStyle(color: Colors.black)),
            Checkbox(
              value: isTidakCheckedList[index],
              onChanged: (bool? value) {
                setState(() {
                  isTidakCheckedList[index] = value ?? false;
                  if (isTidakCheckedList[index]) {
                    isYaCheckedList[index] = false;
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

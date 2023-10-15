import 'package:flutter/material.dart';

class GlobalMethod{
  Future<void> showDialogg(String title, String subtitle, Function fct, BuildContext context) async {
    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Row(
              children: [
                Padding(padding: const EdgeInsets.only(right: 6.0),
                  child: Image.network('https://www.kindpng.com/picc/m/195-1956886_warning-signs-red-hd-png-download.png',
                    height: 20,
                    width: 20,
                  ),
                ),
                Padding(padding: const EdgeInsets.all(8.0),
                  child: Text(title),
                ),
              ],
            ),
            content: Text(subtitle),
            actions: [
              TextButton(onPressed: ()=>Navigator.pop(context), child: Text('Cancel')),
              TextButton(onPressed: (){fct();Navigator.pop(context);}, child: Text('OK')),
            ],
          );
        }
    );
  }
}
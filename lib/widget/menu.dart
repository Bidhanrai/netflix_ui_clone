import 'package:flutter/material.dart';
import 'package:netflix_clone/constants.dart';

class HelperFunctions{

  List options= ['All', 'TV Shows', 'Movies', 'My List'];

  showOptionMenu(BuildContext context, int index){
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel: MaterialLocalizations.of(context)
            .modalBarrierDismissLabel,
        barrierColor: Colors.black54,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext,
            Animation animation,
            Animation secondaryAnimation) {
          return Material(
            color: Colors.black54,
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: options.map((value) {
                        int i = options.indexOf(value);
                        return Column(
                          children: [
                            Text(value, style: TextStyle(color: index==i?Constants.textColorHighlight:Colors.white70, fontSize: index==i?26:20, fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                            SizedBox(height: 30,),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  FlatButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                      ),
                      child: Icon(Icons.close,size: 30,),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

}
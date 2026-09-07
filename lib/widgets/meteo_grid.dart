import 'package:directmeteo/models/meteodata.dart';
import 'package:directmeteo/utils/utils.dart';
import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  final Meteodata data;

  const MyGridView({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,

      crossAxisSpacing: 10,
      mainAxisSpacing: 10,

      childAspectRatio: 1.5,

      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white24,
            border: Border.all(color: Colors.white38),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center
            ,children: [
            Icon(Icons.water_drop, color: Colors.blue),
            Text(HumidityToPourcent(data.humidity), style: TextStyle(color: Colors.white, fontSize: 20),),
            Text('Humidity', style: TextStyle(color: Colors.white),)
          ],),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white24,
            border: Border.all(color: Colors.white38),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center
            ,children: [
            Icon(Icons.air, color: const Color.fromARGB(255, 2, 240, 188)),
            Text(VentToMS(data.windSpeed), style: TextStyle(color: Colors.white, fontSize: 20),),
            Text('Vent', style: TextStyle(color: Colors.white),)
          ],),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white24,
            border: Border.all(color: Colors.white38),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center
            ,children: [
            Icon(Icons.speed, color: const Color.fromARGB(255, 241, 5, 151)),
            Text(PressionToHPA(data.pressure), style: TextStyle(color: Colors.white, fontSize: 20),),
            Text('Pression', style: TextStyle(color: Colors.white),)
          ],),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white24,
            border: Border.all(color: Colors.white38),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center
            ,children: [
            Icon(Icons.visibility, color: Colors.yellow),
            Text(VisibilityToKM(data.visibility), style: TextStyle(color: Colors.white, fontSize: 20),),
            Text('Visibility', style: TextStyle(color: Colors.white),)
          ],),
        ),

        
      ],
    );
  }
}

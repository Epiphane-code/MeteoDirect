import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String DateformatFr(DateTime datetimeType) {
  String date = DateFormat('EEEE d MMMM y', 'fr_FR').format(datetimeType);
  return date;
}

String TemperatureToC(double temp){
  return '$temp C';
}


String HumidityToPourcent(int temp){
  return '$temp %';
}


String VisibilityToKM(int temp){
  return '${temp/1000} KM';
}


String PressionToHPA(int temp){
  return '${temp/1000} hPA';
}

String VentToMS(double temp){
  return '$temp m/s NO';
}



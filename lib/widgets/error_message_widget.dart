import 'package:flutter/material.dart';

Widget ErrorMessageWidget(String message){
  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
}
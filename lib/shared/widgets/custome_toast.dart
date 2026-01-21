import 'package:flutter/material.dart';

customToast({required message, required context, duration = 2}){
  ScaffoldMessenger.of(context!).showSnackBar(
    SnackBar(
      elevation: 0,
      duration: Duration(seconds: duration),
      backgroundColor: Colors.transparent,
      content: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.012),
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.03),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.03),
          color: const Color(0xFFFF9800),
        ),
        child: Center(child: Text(message, style: Theme.of(context!).textTheme.labelLarge,)),
      ),
    ),
  );
}
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String massage;
  final Function()? onRetry ;
  const ErrorView({super.key, required this.massage,  this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(massage),
          if(onRetry != null) /// ولله لو onretry مش ب   null  اظهر الزرار
          ElevatedButton(onPressed: (){
            onRetry!();
          }, child: Text("Retry"))
        ],

      ),
    );
  }
}

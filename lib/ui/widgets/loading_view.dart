import 'package:flutter/material.dart';
import 'package:project_news/ui/utilts/extensions/build_context_extenstions.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: context.secondaryColor,),
    );
  }
}

import 'package:flutter/material.dart';

class GenreCard extends StatelessWidget {
  final String name;
  final Function onTap;

  const GenreCard({
    Key key,
    this.name,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
    );
  }
}

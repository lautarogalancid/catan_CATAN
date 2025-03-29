import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../setup/model/player_color.dart';

class ScoreboardPlayerTile extends StatelessWidget {
  final PlayerColor color;

  const ScoreboardPlayerTile({required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: color.color),
      title: Text(color.label),
      subtitle: const Text('Puntos: 2'), // TODO: Conectar al VM luego
    );
  }
}
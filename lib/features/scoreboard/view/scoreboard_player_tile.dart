import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../setup/model/player_color.dart';
import '../viewmodel/scoreboard_view_model.dart';

class ScoreboardPlayerTile extends StatelessWidget {
  // props
  final PlayerColor color;

  // init
  const ScoreboardPlayerTile({required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<IScoreboardViewModel>();
    final score = viewModel.getScore(color);
    final isRouteOwner = viewModel.routeOwner == color;
    final isArmyOwner = viewModel.armyOwner == color;

    return Card( elevation: 2,
      child: Padding( padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(backgroundColor: color.color),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    color.label, style: TextStyle(fontSize: 18),
                  ),
                ),
                IconButton(onPressed: () => viewModel.decrease(color), icon: const Icon(Icons.remove)),
                Text('$score', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                IconButton(onPressed: () => viewModel.increment(color), icon: const Icon(Icons.add)),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, // centrado para todos
              children: [
                RawMaterialButton(
                    elevation: 2.0,
                    fillColor: isRouteOwner ? Colors.purple.shade300 : Colors.transparent,
                    shape: const CircleBorder(),
                    constraints: const BoxConstraints.tightFor(width: 40, height: 40),
                    child: const Icon(Icons.route),
                    onPressed: () => viewModel.toggleRoute(color)),
                const SizedBox(width: 16),
                RawMaterialButton(
                    elevation: 2.0,
                    fillColor: isArmyOwner ? Colors.cyan.shade300 : Colors.transparent,
                    shape: const CircleBorder(),
                    constraints: const BoxConstraints.tightFor(width: 40, height: 40),
                    child: const Icon(Icons.military_tech),
                    onPressed: () => viewModel.toggleArmy(color)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/game_setup_view_model.dart';

class GameSetupView extends StatelessWidget {
  const GameSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GameSetupViewModel>(); // watch esta escuchando cambios, al haber un notifyObservers() se redibuja este widget

    return Column( // Esto es un VSTACK
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Jugadores:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8), // Esto es un Spacer()
        Row( // esto es un HSTACK
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: viewModel.numberOfPlayers > 2
                  ? viewModel.decreasePlayers
                  : null,
            ),
            Text(
              '${viewModel.numberOfPlayers}',
              style: const TextStyle(fontSize: 18),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: viewModel.numberOfPlayers < 6
                  ? viewModel.incrementPlayers
                  : null,
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Colores:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap( // Esto es como un flow layout o lazyvgrid...
          spacing: 12,
          runSpacing: 8, // y esto?
          children: viewModel.allColors.map((color) {
            final isSelected = viewModel.isColorSelected(color);
            final isDisabled = !isSelected && viewModel.colorSelectionList;

            return FilterChip( // esto es un checkbox?
              label: Text(color.label),
              selected: isSelected,
              backgroundColor: Colors.grey.shade200,
              selectedColor: color.color.withValues(alpha: 0.7),
              checkmarkColor: Colors.black,
              onSelected: isDisabled
                  ? null
                  : (_) => viewModel.toggleColor(color),
            );
          }).toList(), // esta agregando un filter chip por cada color?
        ),
      ],
    );
  }
}
import 'package:catan_catan/features/scoreboard/viewmodel/scoreboard_view_model.dart';
import 'package:catan_catan/features/setup/model/game_settings.dart';
import 'package:catan_catan/features/setup/model/player_color.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // contenedor de tests, ejecutar flutter test para correr
  group('ScoreBoardViewModel', () {
    late ScoreboardViewModel viewModel;
    late GameSettings settings;

    setUp(() {
      settings = GameSettings(
          numberOfPlayers: 3,
          playerColors: [PlayerColor.red, PlayerColor.blue, PlayerColor.green]);
      viewModel = ScoreboardViewModel(settings);
    });

    test('Players start with 2 points', () {
      expect(viewModel.getScore(settings.playerColors[0]), 2);
      expect(viewModel.getScore(settings.playerColors[1]), 2);
      expect(viewModel.getScore(settings.playerColors[2]), 2);
    });

    test('Player score increments and decrements', () {
      viewModel.increment(settings.playerColors[0]);
      expect(viewModel.getScore(settings.playerColors[0]), 3);

      viewModel.decrease(settings.playerColors[0]);
      expect(viewModel.getScore(settings.playerColors[0]), 2);
    });

    test('Player score cant drop below 2', () {
      viewModel.decrease(settings.playerColors[0]);
      viewModel.decrease(settings.playerColors[0]);
      viewModel.decrease(settings.playerColors[0]);
      viewModel.decrease(settings.playerColors[0]);
      expect(viewModel.getScore(settings.playerColors[0]), 2);
    });

    test('Comercial route changes score by 2 and can be held by one', () {
      viewModel.toggleRoute(settings.playerColors[0]);
      expect(viewModel.getScore(settings.playerColors[0]), 4);
      viewModel.toggleRoute(settings.playerColors[0]);
      expect(viewModel.getScore(settings.playerColors[0]), 2);
      viewModel.toggleRoute(settings.playerColors[0]);


      viewModel.toggleRoute(settings.playerColors[1]);
      expect(viewModel.getScore(settings.playerColors[1]), 4);
      expect(viewModel.getScore(settings.playerColors[0]), 2);
    });

    test('Army changes score by 2 and can be held by one', () {
      viewModel.toggleArmy(settings.playerColors[0]);
      expect(viewModel.getScore(settings.playerColors[0]), 4);
      viewModel.toggleArmy(settings.playerColors[0]);
      expect(viewModel.getScore(settings.playerColors[0]), 2);
      viewModel.toggleArmy(settings.playerColors[0]);


      viewModel.toggleArmy(settings.playerColors[1]);
      expect(viewModel.getScore(settings.playerColors[1]), 4);
      expect(viewModel.getScore(settings.playerColors[0]), 2);
    });
  });
}
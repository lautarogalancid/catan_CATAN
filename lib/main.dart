// Importamos Flutter Material, que incluye todos los widgets visuales modernos
import 'package:flutter/material.dart';

// Importamos el AppCoordinator, que será el encargado de manejar la navegación inicial de la app.
// (Todavía no lo creamos, pero lo vamos a hacer en el próximo paso)
import 'core/navigation/app_coordinator.dart';

/// Es el punto de entrada de cualquier app Flutter.
void main() {
  // runApp() toma un widget raíz y lo pone en pantalla.
  // En este caso, usamos CatanCatanApp como raíz del árbol de widgets.
  runApp(const CatanCatanApp());
}

/// Este es el widget raíz de toda nuestra app.
/// Hereda de StatelessWidget porque su contenido no cambia.
/// Si necesitáramos reaccionar a cambios globales (como tema, localización...), lo podríamos convertir en StatefulWidget.
class CatanCatanApp extends StatelessWidget {
  const CatanCatanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Título de la app, usado por ejemplo en Android para el switcher de apps
      title: 'CatanCatan',

      // Esto saca el banner de "Debug" arriba a la derecha
      debugShowCheckedModeBanner: false,

      // Configuramos los dos temas de la app
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,

      // Este es el widget que se mostrará cuando la app arranca. Se lo pedimos al app coordinator.
      home: const AppCoordinator(),
    );
  }
}
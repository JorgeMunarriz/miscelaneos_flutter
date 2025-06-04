import 'package:miscelaneos/lib_barrel.dart';
import 'package:quick_actions/quick_actions.dart';

class QuickActionsPlugin {
  static registerActions() {
    const QuickActions quickActions = QuickActions();
    quickActions.initialize((shortcutType) {
    
      switch (shortcutType) {
        case 'biometric':
          router.push('/biometrics');
          break;
        case 'compass':
          router.push('/compass');
          break;
        case 'pokemons':
          router.push('/pokemons');
          break;
        case 'charmander':
          router.push('/pokemons/4');
          break;
      }
    });
    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
        type: 'biometric',
        localizedTitle: 'Biometric',
        icon: 'biometric',
      ),
      const ShortcutItem(
        type: 'compass',
        localizedTitle: 'Compass',
        icon: 'compass',
      ),
      const ShortcutItem(
        type: 'pokemons',
        localizedTitle: 'Pokemons',
        icon: 'icon_main',
      ),
      const ShortcutItem(
        type: 'charmander',
        localizedTitle: 'Charmander',
        icon: 'icon_main',
      ),
    ]);
  }
}

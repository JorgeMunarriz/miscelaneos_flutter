import 'package:go_router/go_router.dart';
import '../../lib_barrel.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/permissions',
      builder: (context, state) => const PermisionsScreen(),
    ),
    GoRoute(
      path: '/gyroscope',
      builder: (context, state) => const GyroscopeScreen(),
    ),
    GoRoute(
      path: '/accelerometer',
      builder: (context, state) => const AccelerometerScreen(),
    ),
    GoRoute(
      path: '/magnetometer',
      builder: (context, state) => const MagnetometerScreen(),
    ),
    GoRoute(
      path: '/gyroscope-ball',
      builder: (context, state) => const GyroscopeBallScreen(),
    ),
    GoRoute(
      path: '/compass',
      builder: (context, state) => const CompassScreen(),
    ),
    GoRoute(
      path: '/biometrics',
      builder: (context, state) => const BiometricsScreen(),
    ),
    GoRoute(path: '/maps', builder: (context, state) => const MapScreen()),
    GoRoute(
      path: '/location',
      builder: (context, state) => const LocationScreen(),
    ),
    GoRoute(
      path: '/controlmap',
      builder: (context, state) => const ControlledMapScreen(),
    ),
    GoRoute(
      path: '/badge',
      builder: (context, state) => const BadgeScreen(),
    ),
    GoRoute(
      path: '/pokemons',
      builder: (context, state) => const PokemonsScreen(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final String id = state.pathParameters['id'] ?? '1';
            return PokemonScreen(pokemonId: id);
          },
        ),
      ],
    ),
     GoRoute(
      path: '/ad-fullscreen',
      builder: (context, state) => const AdFullScreen(),
    ),
    GoRoute(
      path: '/ad-rewarded',
      builder: (context, state) => const AdRewardedScreen(),
    ),
  ],
);

// import 'package:flutter_modular/flutter_modular.dart';

// import 'base/gateway/interceptors/interceptors.dart';
// import 'config/app_config.dart';
// import 'gateways/temp_gateway.dart';

// class AppModule extends Module {
//   AppModule();

//   @override
//   List<Bind<Object>> get binds => [
//         Bind.lazySingleton<Config>(
//           (i) => Config.load(),
//         ),
//         Bind.lazySingleton<CreateInterceptors>((i) => () => [
//               //AuthenticationInterceptor(),
//             ]),
//         Bind.lazySingleton<TempGateway>(
//           (i) => TempGateway.fromConfig(
//             i.get<Config>(),
//             i.get<CreateInterceptors>(),
//           ),
//         )
//       ];

//   @override
//   List<ModularRoute> get routes => [
//         // ModuleRoute(
//         //   AppRoute.home.route,
//         //   module: HomeModule(),
//         // ),
//       ];
// }

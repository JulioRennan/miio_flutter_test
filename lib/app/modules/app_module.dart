import 'package:flutter_modular/flutter_modular.dart';
import 'package:miio_flutter_test/app/modules/posts/presentation/routes/post_module.dart';
import 'package:miio_flutter_test/core/adapters/network_adapter/network_adapter.dart';

import 'home/presentation/routes/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton(
      (i) => NetworkAdapter(),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      '/',
      module: HomeModule(),
    ),
    ModuleRoute(
      "/post",
      module: PostModule(),
      transition: TransitionType.downToUp,
    )
  ];
}

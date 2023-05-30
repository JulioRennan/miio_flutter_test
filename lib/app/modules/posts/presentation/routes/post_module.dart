import 'package:flutter_modular/flutter_modular.dart';
import 'package:miio_flutter_test/app/modules/posts/presentation/pages/post_detail_page.dart';

class PostModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/",
      child: (context, args) => PostDetailPage(post: args.data),
    )
  ];
}

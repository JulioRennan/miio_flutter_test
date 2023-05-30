import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miio_flutter_test/app/modules/posts/presentation/routes/post_module.dart';

void main() {

  setUpAll(() {
    initModule(PostsModule());
  });
}

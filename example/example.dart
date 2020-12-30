import 'package:gitterapi/gitter_api.dart';
import 'package:gitterapi/models.dart';

Future<void> main() async {
  // Create a instance of GitterApi.
  // In this case ApiKeys are being grabed from env.
  final gitterApi = GitterApi(ApiKeys.fromEnv());
  // Fetches current user.
  final Result<Map> result = await gitterApi.v1.userResource.me();
  // check if result is success.
  if (result.isError) {
    print('Some error occured error: ${result.error}');
    return;
  }
  print(result.data);
  // parse User from Map object.
  final User me = User.fromMap(result.data);
  print(me);
}

import 'package:share_delivery/src/data/provider/community/post_register/post_register_api_client.dart';

class PostRegisterRepository {
  PostRegisterApiClient apiClient;

  PostRegisterRepository({required this.apiClient});

  registerPost(String content, String topic) {
    apiClient.registerPost(content, topic);
  }
}

abstract class NotificationRepositoryDomain {
  Stream<dynamic> foreGround();
  Stream<dynamic> backGround();
  Stream<dynamic> terminated();
    Future<void> init();
  Future<bool> sendNotification({
    required String message,
    required String token,
    required String title,
  });
}

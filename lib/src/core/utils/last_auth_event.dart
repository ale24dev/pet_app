class LastAuthEvent {
  const LastAuthEvent._();

 static String getRouterByLastSession(String eventString) {
    switch (eventString) {
      case 'signedIn':
        return '/laytout';

      default:
        return '/signup';
    }
  }
}

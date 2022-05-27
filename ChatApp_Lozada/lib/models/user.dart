class AppUser {
  final String uid;

  AppUser({ this.uid });

}

class UserData {
  final String username;
  final String email;

  UserData({ this.username, this.email });
}

class Chat {
  final String message;
  final String sender;

  Chat({ this.message, this.sender });
}
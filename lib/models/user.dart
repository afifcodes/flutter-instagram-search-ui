class User {
  final String name;
  final String username;
  final String image;
  bool isFollowing;
  bool isVerified;
  bool isHaveSnap;

  User(this.name, this.username, this.image, this.isFollowing, this.isVerified,
      this.isHaveSnap);
}

class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

//chat mockdata for testing
List chatsData = [
  Chat(
    name: "JD",
    lastMessage: "...",
    image: "assets/images/user.png",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "AE",
    lastMessage: "...",
    image: "assets/images/user_2.png",
    time: "8m ago",
    isActive: true,
  ),
  // Chat(
  //   name: "Khalil Kessa",
  //   lastMessage: "Hope you are doing well...",
  //   image: "assets/images/user.png",
  //   time: "3m ago",
  //   isActive: false,
  // ),
];

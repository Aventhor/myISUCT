class Post {
  final int id;
  final String title;
  final String body;
  final String imageLink;

  const Post({
    this.id ,this.title, this.body, this.imageLink
  });
}

List<Post> posts = [
  const Post(
    id: 1,
    title: "First Post",
    body: "It's Revolution Jonhy!",
    imageLink: "http://isuct.ru/sites/default/files/common/mainphoto1.jpg",
  ),
  const Post(
    id: 2,
    title: "Second Post",
    body: "It's Revolution Igor!",
    imageLink: "https://www.isuct.ru/sites/default/files/common/okbtmcyruwo.jpg",
  ),
];
import 'package:chat_screen/model/User.dart';

class Massages{
  User sender;
  String time;
  String text;
  bool isLiked;
  bool unRead;

  Massages({this.sender,this.time,this.text,this.isLiked,this.unRead});
}
// current user
final User currentUser = User(id: 0,name: 'current user',imageUrl: 'assets/images/image1.jpg');

// users
final User olivia =User(id: 1,name: 'Olivia',imageUrl: 'assets/images/image1.jpg');

final User mark =User(id: 2,name: 'Mark',imageUrl: 'assets/images/image2.jpg');

final User aria =User(id: 3,name: 'Aria',imageUrl: 'assets/images/image3.jpg');

final User ali =User(id: 4,name: 'Ali',imageUrl: 'assets/images/image4.jpg');

final User ahmed =User(id: 5,name: 'Ahmed',imageUrl: 'assets/images/image5.jpeg');

List<User> favorites=[olivia,mark,aria,ali,ahmed];

List<Massages> chats =[
  Massages(sender: olivia,time: '7:32PM',text: 'hey how are you',isLiked: false,unRead: true),

  Massages(sender: mark,time: '9:32PM',text: 'hey how are you',isLiked: false,unRead: false),

  Massages(sender: aria,time: '4:25PM',text: 'hey how are you',isLiked: false,unRead: true),

  Massages(sender: ali,time: '7:32AM',text: 'hey how are you',isLiked: true,unRead: true),

  Massages(sender: ahmed,time: '7:32AM',text: 'hey how are you',isLiked: true,unRead: false),
];

List<Massages> massages =[
  Massages(sender: currentUser,time: '7:32PM',text: 'hey how are you',isLiked: false,unRead: true),

  Massages(sender: olivia,time: '9:32PM',text: 'hey how are you',isLiked: false,unRead: false),

  Massages(sender: currentUser,time: '4:25PM',text: 'hey how are you',isLiked: false,unRead: true),

  Massages(sender: olivia,time: '7:32AM',text: 'hey how are you',isLiked: true,unRead: true),

  Massages(sender: currentUser,time: '7:32PM',text: 'hey how are you',isLiked: false,unRead: true),

  Massages(sender: olivia,time: '9:32PM',text: 'hey how are you',isLiked: false,unRead: false),

  Massages(sender: currentUser,time: '4:25PM',text: 'hey how are you',isLiked: false,unRead: true),

  Massages(sender: olivia,time: '7:32AM',text: 'hey how are you',isLiked: true,unRead: true),

  Massages(sender: currentUser,time: '7:32AM',text: 'hey how are you',isLiked: true,unRead: false),

];
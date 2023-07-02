import "package:flutter/material.dart";


class SearchCart extends StatelessWidget {
  const SearchCart({Key? key}) : super(key: key);//SearchCart constructor

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;//Width of context
    final height = MediaQuery.of(context).size.height;//Height of context
    //Main container
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: width/1.2,
        height: height/2.7,
        //Decoration settings of container
        decoration: BoxDecoration(
          color: Colors.white,
          //Setting border radius of container
          borderRadius: BorderRadius.circular(20),
          //Boxshadow settings
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )],
        ),
        //Right side of container
        child: Row(
          children: <Widget>[
            SideImage(width: width),//SideImage widget
            UserInfo(width: width)//Userinformation
          ],
        ),
      ),
    );
  }
}

//Code of image at left side of the container
class SideImage extends StatelessWidget {
  final double width;
  const SideImage({
    //Getting width from constructor
    required this.width,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width/2.5,
      decoration: const BoxDecoration(
        //Sample network image
        image: DecorationImage(image: NetworkImage("https://img.freepik.com/free-photo/panoramic-istanbul-city-twilight-turkey_335224-1278.jpg?w=826&t=st=1687290970~exp=1687291570~hmac=c5438b96180740c659ed60ad1adf7bda9a7228e92975282afebbf96331cd6bed"),
          fit: BoxFit.fill,),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topLeft: Radius.circular(20)),//Borderradius for only topLeft and bottomLeft
      ),
    );
  }
}


class UserInfo extends StatelessWidget {
  final double width;
  const UserInfo({
    //Getting context width from constructor
    required this.width,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //Total width - width of image
      width: (width/1.2) - (width/2.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //Creating const CircleAvatar widget for user photo
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage('https://www.woolha.com/media/2020/03/eevee.png'),
                ),
                // Sizedbox for Username and follower count
                SizedBox(
                  //Column used for fixing them up-down
                  child: Column(
                    children: const <Widget>[
                      Text("Kullanıcı adi",style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("Takipçi sayisi")
                    ],
                  ),
                )
              ],
            ),
          ),
          const Text("ÖZET",style: TextStyle(fontWeight: FontWeight.bold)),
          textbox()
        ],
      ),
    );
  }
  //Seperated textbox widget for information
  Widget textbox(){
    return SizedBox(
      width: width/1.2,
      child: const Text("Açıklama, bla bla bla bla Açıklama, bla bla bla bla Açıklama, bla bla bla bla Açıklama, bla bla bla bla Açıklama, bla bla bla blaAçıklama, bla bla bla bla"),
    );
  }
}



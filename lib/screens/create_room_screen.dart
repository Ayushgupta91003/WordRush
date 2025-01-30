import 'package:flutter/material.dart';
import 'package:wordrush/utils/socket_client.dart';
import 'package:wordrush/utils/socket_methods.dart';
import 'package:wordrush/widgets/custom_button.dart';
import 'package:wordrush/widgets/custom_text_field.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 600,
          ),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Create Room',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                CustomTextField(
                  controller: _nameController,
                  hintText: 'Enter your nickname',
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: 'Create',
                  onTap: () {
                    _socketMethods.createGame(_nameController.text);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:wordrush/utils/socket_client.dart';
// import 'package:wordrush/utils/socket_methods.dart';
// import 'package:wordrush/widgets/custom_button.dart';
// import 'package:wordrush/widgets/custom_text_field.dart';

// class CreateRoomScreen extends StatefulWidget {
//   const CreateRoomScreen({super.key});

//   @override
//   State<CreateRoomScreen> createState() => _CreateRoomScreenState();
// }

// class _CreateRoomScreenState extends State<CreateRoomScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   // final SocketClient _socketClient = SocketClient.instance;
//   final SocketMethods _socketMethods = SocketMethods();

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _nameController.dispose();
//   }

//   // testing() {
//   //   _socketClient.socket!.emit('test', 'This is wroking');
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Center(
//         child: ConstrainedBox(
//           constraints: BoxConstraints(
//             maxWidth: 600,
//           ),
//           child: Container(
//             margin: EdgeInsets.symmetric(
//               horizontal: 20,
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const Text(
//                   'Create Room',
//                   style: TextStyle(fontSize: 30),
//                 ),
//                 SizedBox(
//                   height: size.height * 0.08,
//                 ),
//                 CustomTextField(
//                   controller: _nameController,
//                   hintText: 'Enter your nickname',
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 CustomButton(
//                   text: 'Create',
//                   onTap: _socketMethods.createGame(_nameController.text),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

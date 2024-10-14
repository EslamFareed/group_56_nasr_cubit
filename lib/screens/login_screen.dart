// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   int counter = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context, "Hello from login");
//           },
//           icon: Icon(Icons.arrow_back_ios),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(counter.toString()),
//             IconButton(
//               onPressed: () {
//                 counter++;
//                 setState(() {});
//               },
//               icon: Icon(Icons.add),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_56_nasr_cubit/cubits/home/home_cubit.dart';
import 'package:group_56_nasr_cubit/cubits/theme/theme_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                HomeCubit.get(context).increment();
              },
              icon: Icon(Icons.add),
            ),
            BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Container();
              },
            ),
            // BlocListener<HomeCubit, HomeState>(
            //   listener: (context, state) {
            //     if (state is DecrementState) {
            //       print("Errorrrrrr");
            //     }
            //   },
            //   child: Text(
            //     "${HomeCubit.get(context).counter}",
            //     style: TextStyle(
            //         fontSize: 50,
            //         color: HomeCubit.get(context).counter >= 0
            //             ? Colors.green
            //             : Colors.red),
            //   ),
            // ),
            // BlocBuilder<HomeCubit, HomeState>(
            //   builder: (context, state) {
            // return Text(
            //   "${HomeCubit.get(context).counter}",
            //   style: TextStyle(
            //       fontSize: 50,
            //       color: HomeCubit.get(context).counter >= 0
            //           ? Colors.green
            //           : Colors.red),
            // );
            //   },
            // ),
            IconButton(
              onPressed: () {
                HomeCubit.get(context).decrement();
              },
              icon: Icon(Icons.remove),
            ),
            ElevatedButton(
              onPressed: () {
                ThemeCubit.get(context).changeTheme();
              },
              child: Text("Change Mode"),
            ),
          ],
        ),
      ),
    );
  }
}

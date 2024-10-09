import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:group_56_nasr_cubit/category_model.dart';
import 'package:group_56_nasr_cubit/main.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<CategoryModel> categories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
            onPressed: () {
              EasyLocalization.of(context)!.currentLocale == Locale("en")
                  ? EasyLocalization.of(context)!.setLocale(Locale("ar"))
                  : EasyLocalization.of(context)!.setLocale(Locale("en"));
            },
            icon: const Icon(Icons.change_circle),
          )
        ],
      ),
      drawer: Drawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "welcome".tr(),
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  var response = await Dio()
                      .get("https://api.escuelajs.co/api/v1/categories");
                  if (response.statusCode == 200) {
                    var data = response.data as List;
                    for (var element in data) {
                      categories.add(CategoryModel.formJson(element));
                    }
                    print(categories.length);
                    print("---------------------------------------- Success");
                  } else {
                    print("---------------------------------------- Error");
                  }
                } catch (e) {
                  print("---------------------------------------- Error");
                }
              },
              child: const Text("Get All Products"),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  var response = await Dio()
                      .post("https://api.escuelajs.co/api/v1/auth/login",
                          // options: Options(headers: {}),
                          //! Raw Data in Body
                          data: {
                        "email": "john@mail.com",
                        "password": "changeme",
                      }
                          //? Form Data in Body
                          // data: FormData.fromMap({
                          // })
                          // queryParameters: {}
                          );
                  if (response.statusCode == 201) {
                    print("---------------------------------------- Success");
                  } else {
                    print("---------------------------------------- Error");
                  }
                } catch (e) {
                  print("---------------------------------------- Error");
                }
              },
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';
import 'package:library_api_mvvm/core/enums.dart';
import 'package:library_api_mvvm/view/registration/home_reg.dart';
import 'package:library_api_mvvm/view/registration/widgets/formbox.dart';
import 'package:library_api_mvvm/view/registration/widgets/register_button.dart';
import 'package:library_api_mvvm/view/registration/widgets/text_field.dart';
import 'package:library_api_mvvm/view/route_screen.dart';
import 'package:library_api_mvvm/view_model/registration_provider.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormBox(
              size: size,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'User Dashboard',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 30),
                TextFieldWidget(
                  hint: 'First name',
                  controller: nameController,
                  page: Screens.result,
                ),
                TextFieldWidget(
                  hint: 'Age',
                  controller: ageController,
                  page: Screens.result,
                ),
                TextFieldWidget(
                  hint: 'Favourite book',
                  controller: favouriteBookController,
                  page: Screens.result,
                ),
              ],
            ),
            sizedbox,
            CustomButton(
              text: 'Home',
              onTap: () async {
                final provider = await Provider.of<RegistrationProvider>(
                  context,
                  listen: false,
                );
                final name = nameController.text;
                final age = ageController.text;
                final favBook = favouriteBookController.text;
                provider.saveData(name, age, favBook);
                

                // ignore: use_build_context_synchronously
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RootScreen(),
                  ),
                  (route) => false,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:apolloshop/features/authentication/controllers/login/login_controller.dart';
import 'package:apolloshop/features/authentication/screens/signup/signup.dart';
import 'package:apolloshop/utils/constants/sizes.dart';
import 'package:apolloshop/utils/constants/text_strings.dart';
import 'package:apolloshop/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        key: controller.logInFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              // Email
              TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email,
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),

              // Password
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: (value) =>
                      TValidator.validateEmptyText('Password', value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    labelText: TTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: controller.hidePassword.value
                          ? const Icon(Iconsax.eye_slash)
                          : const Icon(Iconsax.eye),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // Sign In button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.performSignIn(),
                  child: const Text(TTexts.signIn),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              // Create Account button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Get.to(() => const SignupScreen()),
                  child: const Text(TTexts.createAccount),
                ),
              ),
            ],
          ),
        ));
  }
}
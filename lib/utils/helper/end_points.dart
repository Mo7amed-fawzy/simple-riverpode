class Endpoint {
  static String userUrl = 'https://reqres.in/api';
  static String dataUrl = 'https://jsonplaceholder.typicode.com/posts';
}

class ApiKey {
  static String status = 'name';
  static String job = 'job';
}

// // الاحسن منستخدمش TextEditingController كثوابت علشان لازم نتخلص منها dispose
// // علشان كدا ضفت هناك .whenComplete
// class MyTextFieldControllers {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController imageController = TextEditingController();

//   void dispose() {
//     nameController.dispose();
//     emailController.dispose();
//     imageController.dispose();
//   }
// }

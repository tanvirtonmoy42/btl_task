### **[Flutter Best Practices and Coding Guidelines]{.underline}**

#### ** Naming convention:**

1.  **Classes, enums, typedefs, mixin, and extensions name should in
    UpperCamelCase**\
    \
    \# Bad

>     class Classname {
>    
>     }
>    
>     extension Extensionname on String {
>    
>     }
>
>     enum Enumname {
>    
>     }
>    
>     mixin Mixinname{}
>    
>     typedef Functionname = void Function();
>
> // ClassName, ExtensionName, EnumName, MixinName and FunctionName are
> in the UpperCamelCase format
>
 \# Good
>
>     class ClassName {}
>    
>     extension ExtensionName on String {}
>    
>     enum EnumName {}
>    
>     mixin MixinName{}
>    
>     typedef FunctionName = void Function();

2.  Libraries, packages, directories, and source files name should be in
    snake_case(lowercase_with_underscores)\
    \
    \# Bad

>     mypackage
>    
>     └─ lib
>    
>         └─ bottom-nav.dart
>
 \# Good
>
>     my_package
>    
>     └─ lib
>
>         └─ bottom_nav.dart

3.  **Name imports prefixes should be in
    snake_case(lower_with_underscores)**\
    \
    #Bad

>     import \'package:dio/dio.dart\' as Dio;
 
\# Good

>     import \'package:dio/dio.dart\' as dio;

4. **Variables, constants, parameters, and named parameters should be
    in lowerCamelCase.**\
    \
    \# Bad

>     int phone_number;
>    
>     const pie_value=3.14;
>    
>     // parameters
>
>     double calculateBMI(int weight_in_kg, int height_in_meter) {
>    
>         return weight_in_kg / (height_in_meter \* height_in_meter);
>    
>     }
>    
>     //named parameters
>    
>     double calculateBMI({int? weight_in_kg, int? height_in_meter}) {
>    
>         return weight_in_kg / (height_in_meter \* height_in_meter);
>    
>     }
>     
\# Good

>     int phoneNumber;   
>     const pieValue=3.14;
>    
>     // parameters
>    
>     double calculateBMI(int weightInKg, int heightInMeter) {
>    
>         return weightInKg / (heightInMeter \* heightInMeter);
>    
>     }
>    
>     //named parameters
>    
>     double calculateBMI({int? weightInKg, int? heightInMeter}) {
>    
>         if(weightInKg !=null && heightInMeter !=null){
>
>             return weightInKg / (heightInMeter \* heightInMeter);
>    
>         }
>    
>     }

5.  **Proper meaningful names should be followed.**\
    
    \# Bad

>     Color bg;
>     int age(Date date);
>     
 \# Good

>     Color backgroundColor;
>     int calculateAge(Date dob);

6.  **Private variable names are preceded with underscores.**\
    
>      class ClassName {
>    
>         String \_variableName;
>
>     }

## **Use Nullable operators:**

1.  **?? (if null) operator:**\
    
    \# Bad

>     String? name;
>    
>     name= name==null? \"unknown\": name;\

 \# Good
>
>     String? name;
>    
>     name= name ?? \"unknown\";

2.  **?. (null aware) operator:**\
    
    \# Bad

>     String? name;
>    
>     name= name==null? null: name.length.toString();\
> 
 \# Good

>     String? name;
>    
>     name=name?.length.toString();

3.  **Prefer is Operator Over as for Safer Type Checking:\
    **\
    To prevent potential exceptions, it is recommended to utilize the is
    operator instead of the as cast operator in Flutter. The is operator
    allows for safer type checking without throwing an exception if the
    cast is not possible.\
    \
    \# Bad

>     (person as Person).name=\"Ashish\";\
>     \
>     **\# Good**
>    
>     if(person is Person){
>    
>     person.name=\"Ashish\";
>    
>     }

4.  **Avoid the unnecessary creation of lambdas\
    \
    \# Bad**

>     **void main(){**
>    
>     **List\<int\> oddNumber=\[1,3,4,5,6,7,9,11\];**
>    
>     **oddNumber.forEach((number){**
>    
>     **print(number);**
>    
>     **});**
>
>     **}\
>     \
>     \# Good**
>    
>     **void main(){**
>    
>     **List\<int\> oddNumber=\[1,3,4,5,6,7,9,11\];**
>    
>     **oddNumber.forEach(print);**
>    
>     **}**

## **[Simplify Your Code with Spread Collection]{.underline}**

> Utilizing spread collections simplifies the code when you already have
> existing items stored in another collection.\
> 
> \# Bad
>
>     List\<int\> firstFiveOddNumber=\[1,3,5,7,9\];
>    
>     List\<int\> secondFiveOddNumber=\[11,13,15,17,19\];
>    
>     firstFiveOddNumber.addAll(secondFiveOddNumber);\
>     \
>     \# Good
>    
>     List\<int\> secondFiveOddNumber=\[11,13,15,17,19\];
>    
>     List\<int\> firstFiveOddNumber=\[1,3,5,7,9,\...secondFiveOddNumber\];

## **[Simplify Object Operations with the Cascades Operation:]{.underline}**

The Cascades (..) operator is ideal for executing a series of operations
on the same object, enabling a more concise and readable code.

>     class Person {
>
>     String? name;
>
>     int? age;
>    
>         Person({
>    
>         this.name,
>
>         this.age,
>    
>         });
>    
>     \@override
>
>     String toString() {
>    
>         return \"name: \$name age \$age\";
>    
>     }
>    
>     }
>     
 \# Bad

>     void main(){
>    
>     final person=Person();
>    
>     person.name=\"Ashish\";
>    
>     person.age=25;
>    
>     print(person.toString());
>    
>     }\
 \
 \# Good

>     void main(){
>    
>     final person=Person();
>    
>     person
>    
>     ..name=\"Ashish\"
>    
>     ..age=25;
>    
>     print(person.toString());
>    
>     }

**\
**

**\
[Optimal Widget Rendering in Row and Column Using if
Conditions:]{.underline}**

**\# Bad**

Column(

children: \[

isLoggedIn

? ElevatedButton(

onPressed: () {},

child: const Text(\"Go to Login page\"),

)

: const SizedBox(),

\],

),\
\
**\# Good**

Column(

children: \[

if(isLoggedIn)

ElevatedButton(

onPressed: () {},

child: const Text(\"Go to Login page\"),

)

\],

),

## **[Use arrow function(() =\>):]{.underline}**

If a function has only a single statement, use the () =\> arrow
function.\
\
**\# Bad**

double calculateBMI(int weight_in_kg, int height_in_meter) {

return weight_in_kg / (height_in_meter \* height_in_meter);

}\
\
**\# Good**

double calculateBMI(int weight_in_kg, int height_in_meter) =\>

weight_in_kg / (height_in_meter \* height_in_meter);

## **[Remove any print statements, unused and commented code:]{.underline}**

To improve production code, it is important to remove print statements
used for debugging and logging. Eliminating unused code enhances
readability and reduces file size while removing commented-out code
improves maintainability. For logging, log() and debugPrint() are
recommended over print as they provide better control and formatting
options and prevent log line discarding in certain situations.\
\
**\# Bad**

\# production mode

// commented message\-\--main method

void main(){

print(\"print statement\");

//..rest of code

}

void unusedFunction(){

}\
\
**\# Good**

\# production mode

void main(){

//..rest of code

}

## **[Proper folder structure]{.underline}**

1.  Segregation of code into a proper folder structure depending on
    architecture.

2.  The code is formatted correctly with trailing commas used
    appropriately.

3.  Try to make code reusable with the help of helper functions in
    utility files saved in the utils folder.\
    \
    \# utils.dart

> import \'package:intl/intl.dart\';
>
> String formatDateTime(DateTime dateTime) {
>
> final formatter = DateFormat(\'yyyy-MM-dd HH:mm:ss\');
>
> return formatter.format(dateTime);
>
> }

4.  Widgets should also be designed to be reusable and can be saved in a
    widgets folder separately.

> \# text_input.dart
>
> import \'package:flutter/material.dart\';
>
> class TextInput extends StatelessWidget {
>
> final String? label;
>
> final String? hintText;
>
> final TextEditingController? controller;
>
> final TextInputType keyboardType;
>
> final bool obscureText;
>
> final String? Function(String?)? validator;
>
> final Widget? suffix;
>
> const TextInput({
>
> this.label,
>
> this.hintText,
>
> this.suffix,
>
> this.controller,
>
> this.validator,
>
> this.obscureText = false,
>
> this.keyboardType = TextInputType.text,
>
> });
>
> \@override
>
> Widget build(BuildContext context) {
>
> return TextFormField(
>
> decoration: InputDecoration(
>
> labelText: label,
>
> hintText:hintText
>
> suffixIcon:suffix,
>
> ),
>
> controller: controller,
>
> obscureText: obscureText,
>
> validator:validator
>
> keyboardType: keyboardType,
>
> );
>
> }
>
> }

5.  Avoid using static or hard-coded strings in UI screens, it is
    recommended to organize them in separate folders or files according
    to their scope.\
    \
    **#Bad**

> class LoginPage extends StatelessWidget {
>
> const LoginPage({super.key});
>
> \@override
>
> Widget build(BuildContext context) {
>
> return Scaffold(
>
> appBar: AppBar(
>
> backgroundColor: const Color(0xff000000), // bad
>
> title: const Text(\"Login page\"),
>
> ),
>
> body: Column(
>
> children: \[
>
> TextInput(
>
> label: \"email\",
>
> hintText: \"email address\",
>
> validator: (value) { // bad
>
> if (value!.isEmpty) {
>
> return \'Please enter\';
>
> } else {
>
> return null;
>
> }
>
> },
>
> )
>
> \],
>
> ),
>
> );
>
> }
>
> }\
> \
> **\# Good\
> **
>
> \# validators/
>
> common_validator.dart
>
> mixin CommonValidator{
>
> String? emptyValidator(String value) {
>
> if (value.isEmpty) {
>
> return \'Please enter\';
>
> } else {
>
> return null;
>
> }
>
> }
>
> }
>
> #config/themes
>
> colors.dart
>
> class AppColors{
>
> static const white=Color(0xffffffff);
>
> static const black=Color(0xff000000);
>
> }
>
> class LoginPage extends StatelessWidget with CommonValidator {
>
> const LoginPage({super.key});
>
> \@override
>
> Widget build(BuildContext context) {
>
> return Scaffold(
>
> appBar: AppBar(
>
> backgroundColor: AppColors.black, // good
>
> title: const Text(\"Login page\"),
>
> ),
>
> body: Column(
>
> children: \[
>
> TextInput(
>
> label: \"email\",
>
> hintText: \"email address\",
>
> validator: emptyValidator, // good
>
> )
>
> \],
>
> ),
>
> );
>
> }
>
> }

## **[Widget Organization:]{.underline}**

1.  Split the widget into different Widgets instead of the same file.

2.  use const in widgets

3.  When setState() is called on a State, all descendent widgets will
    rebuild. Therefore, Split the widget into small widgets so the
    setState() call rebuilds only the part of the subtree, whose UI
    actually needs to change.

> **\# Bad**
>
> class LoginPage extends StatefulWidget {
>
> const LoginPage({super.key});
>
> \@override
>
> State\<LoginPage\> createState() =\> \_LoginPageState();
>
> }
>
> class \_LoginPageState extends State\<LoginPage\> {
>
> bool \_secureText = true;
>
> \@override
>
> Widget build(BuildContext context) {
>
> return Scaffold(
>
> appBar: AppBar(
>
> title: const Text(\"Login page\"),
>
> ),
>
> body: Column(
>
> children: \[
>
> const TextInput(
>
> label: \"Email\",
>
> hintText: \"Email address\",
>
> ),
>
> TextInput(
>
> label: \"Password\",
>
> hintText: \"Password\",
>
> obscureText: \_secureText,
>
> suffix: IconButton(
>
> onPressed: () {
>
> setState(() {
>
> \_secureText = !\_secureText;
>
> });
>
> },
>
> icon: Icon(
>
> \_secureText ?
>
> Icons.visibility_off
>
> : Icons.visibility)),
>
> ),
>
> ElevatedButton(
>
> onPressed: () {},
>
> child: const Text(\"Login\"))
>
> \],
>
> ),
>
> );
>
> }
>
> }\
> \
> **\# Good**
>
> class LoginPage extends StatelessWidget {
>
> const LoginPage({super.key});
>
> \@override
>
> Widget build(BuildContext context) {
>
> return Scaffold(
>
> appBar: AppBar(
>
> title: const Text(\"Login page\"),
>
> ),
>
> body: Column(
>
> children: \[
>
> const TextInput(
>
> label: \"Email\",
>
> hintText: \"Email address\",
>
> ),
>
> const TextInput(
>
> label: \"Password\",
>
> hintText: \"Password\",
>
> obscureText: true,
>
> ),
>
> ElevatedButton(
>
> onPressed: () {},
>
> child: const Text(\"Login\"))
>
> \],
>
> ),
>
> );
>
> }
>
> }

## **[Follow Linting rules]{.underline}**

1.  **DO avoid relative imports for files in lib/. Use package
    imports.**\
    \
    **\# Bad**

> import \'widgets/text_input.dart\';
>
> import \'widgets/button.dart\'
>
> import \'../widgets/custom_tile.dart\';\
> \
> **\# Good\
> **
>
> import \'package:coding_guidelines/widgets/text_input.dart\';
>
> import \'package:coding_guidelines/widgets/button.dart\'
>
> import \'package:coding_guidelines/widgets/custom_tile.dart\';

2.  **Avoid empty else statements**

3.  **Avoid print statements. Use debugPrint or Logger instead**\
    \
    **\# Bad**

> void f(int x) {
>
> print(\'debug: \$x\');
>
> \...
>
> }
>
> \# Good
>
> void f(int x) {
>
> debugPrint(\'debug: \$x\');
>
> }\
> \
> **or**
>
> void f(int x) {
>
> Logger().i(\'debug: \$x\');
>
> }

## **[Proper state management]{.underline}**

-   Use Riverpod as the recommended package for state management..

-   You can also choose to use any other approach for state management
    like Bloc, Provider, Getx and Redux.

-   Business logic should be separated from the UI.

## **[Using Third-party packages:]{.underline}**

-   Validate any third-party package being used in the application as
    sometimes it might break the build or not be in sync with the
    current Flutter version. This is especially required when you are
    upgrading Flutter, so make sure to check all your plugins and
    third-party packages after an upgrade.

## **[Error Handling and Logging:]{.underline}**

-   Properly handle exceptions and errors in your code using try-catch
    blocks.

-   Use logging libraries like pretty_dio_logger or dio_logger to log
    important events or errors.

> **\# Bad\
> **
>
> final dio = Dio();
>
> Future\<dynamic\> fetchNetworkData() {
>
> dio.get(\'endpoint\').then((data){
>
> return data;
>
> )}.catchError((e) {
>
> log.error(e);
>
> return e;
>
> });
>
> }
>
> **\# Good**
>
> final dio = Dio()
>
> ..interceptors.add(PrettyDioLogger(
>
> requestHeader: true,
>
> requestBody: true,
>
> responseBody: true,
>
> responseHeader: false,
>
> compact: false,
>
> ));
>
> Future\<dynamic\> fetchNetworkData() async{
>
> try {
>
> // Simulating an asynchronous network call
>
> final data= await dio.get(\'endpoint\');
>
> return data;
>
> } catch (e, stackTrace) {
>
> Logger().e(\'An exception occurred: \$e\');
>
> Logger().e(\'Stack trace: \$stackTrace\');
>
> return e;
>
> // Perform additional error handling actions
>
> }
>
> }

## **[Testing]{.underline}**

-   Write unit tests and widget tests to ensure the correctness of your
    code.

-   Use testing frameworks like flutter_test to write and run tests.

-   Aim for high code coverage, especially for critical parts of your
    app.

> void main() {
>
> IntegrationTestWidgetsFlutterBinding.ensureInitialized();
>
> group(\'end-to-end test\', () {
>
> testWidgets(\'tap on the floating action button, verify counter\',
>
> (tester) async {
>
> app.main();
>
> await tester.pumpAndSettle();
>
> // Verify the counter starts at 0.
>
> expect(find.text(\'0\'), findsOneWidget);
>
> // Finds the floating action button to tap on.
>
> final Finder fab = find.byTooltip(\'Increment\');
>
> // Emulate a tap on the floating action button.
>
> await tester.tap(fab);
>
> // Trigger a frame.
>
> await tester.pumpAndSettle();
>
> // Verify the counter increments by 1.
>
> expect(find.text(\'1\'), findsOneWidget);
>
> });
>
> });
>
> }

## **[Version Control and Collaboration]{.underline}**

-   Use version control systems like Git to track changes and
    collaborate with other developers.

-   Follow Git best practices, such as creating meaningful commit
    messages and branching strategies.

> Github Rules(by Shohel Rana):

1.  Create a branch\
    \-- DEV/BUG-Ticket-No-Ticket Title \[Short Title\]

2.  Commit Message\
    \-- DEV/BUG-Ticket-No-Ticket Title \[Too Short Title\]: Your
    message\
    \-- Add a ticket link\
    \-- Review yourself and add only one label: Initial Review Passed
    \[After reviewed\]

3.  Before Commit\
    \-- Add In draft or In Progress label (Who does not have access to
    draft)

4.  Need to add some comments when you reviewed someone\'s code

5.  Naming of variables and functions should be meaningful

6.  All static data will come from constant.

### **Use [[Future.wait]{.underline}](https://api.flutter.dev/flutter/dart-async/Future/wait.html) to make concurrent API calls:**

By using **Future.wait**, you can initiate multiple async tasks at the
same time. Thereby reducing the overall execution time.

**//! BAD**

Future callMultipleApis() async {

await getUserInfo();

await getLocations();

}

**//\* GOOD**

Future callMultipleApis() async {

await Future.wait(\[

getUserInfo(),

getLocations(),

\]);

}

### **[Avoid mental mapping:]{.underline}**

We have a list that contains staff names:

const staffs = \[\'Holmes\', \'Dane\', \'Dyno\', \'Maker\'\];

**//! BAD**

for (final n in staffs) {

doSomething();

//\...

//\"n\" is defined as what?

doStuff(n);

}

**//\* GOOD**

for (final staffName in staffs) {

doSomething();

//\...

doStuff(staffName);

}

**[Data Class helpers:]{.underline}**

**Equatable:**

We can use equatable for creating data model classes as it helps us
compare 2 data of the same model.

Equatable overrides == and hashCode for you so you don\'t have to waste
your time writing lots of boilerplate code.

There are other packages that will actually generate the boilerplate for
you; however, you still have to run the code generation step which is
not ideal.

With Equatable there is no code generation needed and we can focus more
on writing amazing applications and less on mundane tasks.\
\
**class** **Person** **extends** **Equatable** {

**const** Person(**this**.name);

**final** String name;

**\@override**

List\<Object\> **get** props =\> \[name\];

}

**[Code Generator helper:]{.underline}**

1.  You can use ***Dart Data Class Generator*** by hzgood for generating
    data classes in vsCode.\
    \
    Name: Dart Data Class Generator

> Id: hzgood.dart-data-class-generator
>
> Publisher: hzgood
>
> VS Marketplace Link:
> [[https://marketplace.visualstudio.com/items?itemName=hzgood.dart-data-class-generator]{.underline}](https://marketplace.visualstudio.com/items?itemName=hzgood.dart-data-class-generator)
>
> Using this package you can generate all commonly used components that
> are used in a data model including formMap, toMap etc. It also
> supports auto generated null safety.

2.  **Flutter Riverpod Snippets**: It helps by generating codes for
    riverpod provider depending on your needs.

> Name: Flutter Riverpod Snippets
>
> Id: robert-brunhage.flutter-riverpod-snippets
>
> Publisher: Robert Brunhage
>
> VS Marketplace Link:
> [[https://marketplace.visualstudio.com/items?itemName=robert-brunhage.flutter-riverpod-snippets]{.underline}](https://marketplace.visualstudio.com/items?itemName=robert-brunhage.flutter-riverpod-snippets)

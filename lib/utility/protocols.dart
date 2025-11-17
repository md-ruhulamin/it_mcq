// This file will contain protocols and guidelines to be followed for this project.
// Add your protocols below as needed.


// 1. when creating an screen from figma or motiff remember following rules:
// a. the screen should be responsive and should be able to work on all mobile devices.
// b. the screen should be designed in a way that it is easy to understand and use.
// c. for every color you need to check it in the file name "color_pallet.dart" if the color is not added there then add it or if added then use existing color, the new color that you will add should be in a formate like this:- clrGreen53E (in this case green is the color and 53E is the last 3 digit of hex code of the color)
// d. same as rule c for every icon you need to check if the icon is added or not in the folder name "icons" inside "assets", if the icon exist then use it else you should download and use new icon, nameing should be like this :-icSomeName.png(insted someName use the name of the icon and use only png format in 3x size).
// e. use the same rule as d. for images, the folder for images is "images" inside "assets", naming should be like this :-imgSomeName.jpg(insted 'someName' use the name of the image), also use this rule for gif images.
// f. for textstyle only use the textstyle defined in the file name "text_style.dart" if the textstyle is not added there then add it or if added then use existing textstyle, the new textstyle that you will add should be like this :- TextStyle st14Regular(Color color) => TextStyle(color: color, fontSize: 14, fontFamily: "regular");
// in the name st14Regular 'st' is short for textstyle and 14 is the font size and Regular is the font family. and it should be use like this :- Text("some_data".tr, style: st14Regular(clrBlackF1F),)
// g. when adding a text remember to add the text in file name "en.dart" (only if the text is not added already) like this :- "log_in": "Log In", where 'log_in' is the key and 'Log In' is the text.
// h. dont create image url, you should always download image then use it (fom figma/motiff)
// i. to show icons use method name 'iconAsset()' in constants.dart file, for images use 'imageAsset()', for gif use 'gifAsset'.
// j. For icons/images, use the height and width as specified in Motiff/Figma. If the value is decimal, round it (e.g., 15.5 becomes 15).
// k. for top navigation bar use function name "customHeader" in constants.dart. for example - customHeader(() { Navigator.pop(context); }, context), there are a few other options in customHeader like you can also add text in it.
// l. always use test like this - Text('continue'.tr,style: st14SemiBold(Colors.white),) , because im using multi-language in whole app
// m. don't use deprecated code
// n. for TextFormField take example from loginScreen.dart, in that screen there is a TextFormField wrapped inside a SizedBox. use that on every place where TextFormField is needed.
// o. for creating buttons use button() function defined in constants.dart, it contain all the necessary component to design a button. (code example - button('yes_this_is_my_company'.tr, () {},),)
//
//
//
//
//
//
//

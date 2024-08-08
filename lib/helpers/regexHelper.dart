// ignore_for_file: file_names

RegExp voterIdExpression = RegExp(r"^[A-Z]{3}[0-9]{7}$");
// RegExp aadhaarRegex = RegExp(r'^[0-9]{4}\s[0-9]{4}\s[0-9]{4}$');
RegExp aadhaarRegex = RegExp(r'^[0-9]{4}[0-9]{4}[0-9]{4}$');
RegExp nameRegex = RegExp(r'^[A-Za-z ]*$');
RegExp mobileRegex = RegExp(r'^\d*$'); //  (r'^(?:[+0]9)?[0-9]{10,12}$'); //
RegExp emailExpression = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]{2}");
RegExp addressReg = RegExp(
  r"^[a-zA-Z0-9\s\.,#\-\/\:\!\@\$\#\%\^\&\*\(\)\-\=\+\_\;\?\{\}\[\]]+$",
);
RegExp pinCodeReg = RegExp(r'^\d{6}');
RegExp regex1 =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d)(?=.*?[!@#\$&*~]).{8,}$');
RegExp regex = RegExp(r'^\w*$');

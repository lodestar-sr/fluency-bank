import 'package:fluencybank/components/country_picker/country_code.dart';
import 'package:fluencybank/views/dashboard/Cards/InvitefriendsfromContacts.dart';

class Globals {
  static CountryCode countryInfo;
  static String phoneNumber = "";
  static String email = "";
  static String firstName = "";
  static String lastName = "";
  static String dob = "";
  static String postCode = "";
  static String street = "";
  static var preAddresses = [];
  static List<ContactsChoosed> savedList = [];
  static List<ContactsChoosed> savedListfromInviteScreen = [];
  static var getExchangeBtnClickedInTheInviteHomeScreen = [];
}
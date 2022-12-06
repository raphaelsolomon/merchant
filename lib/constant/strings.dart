// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merchant/model/nav_drawer.model.dart';
import 'package:merchant/model/person/user.dart';

const String CALL_COLLECTION = "call";
const LINKEDIN_CLIENTID = '772wa1uu6cvroc';
const LINKEDIN_SECRET = 'aQF6dRF0wmkPm366';
const LINKEDIN_REDIRECT =
    'https://www.linkedin.com/developers/tools/oauth/redirect';
const LINKEDIN_ACCESS =
    'AQUQv9Hzq_OEB82jAgynLLVp8PADGaUcE2bBug-WWAg100hOYKIWBAH1Vt8fXS-y20jB5YSYbr5yLq0Itv7H-s72JHxVfochrVOf-WSneoxOhMiriw16WwGlabu1PwbtvFTaAoyVYYL943stj_Qb7bj76GKqQPTOlTQlGwYfqB8NS1_YLzNdsx9M3rZrnMKAoOH6IiQW-T8YfTUyfYeRj0tLn2MMqDbr1kh2h5yMY8uEm-tmsP451X5L_UBNcrPf_GKkODH-kyZvO6PofJOP3rSKoZ41O1hLjPcYkKV8-lLdDHLgTXylWdQQ_3yIeJb5vVeMYTX7FhtX32EfMXObS3deTYinzw';
const String APP_ID = "696c822eb6044bdda1120f3a7ae97fc2";
const String FIREBASE_WEB_TOKEN =
    "AAAAqF03j5w:APA91bFWo0NcDfGQSWBlMOXw5S7_PoxTzn8ysxuB2CVVUEJXYujYJxxxw6Yl_qTI4bUgICzdTtx66o1QhKfJAcCd_wsqqrcEyItKJRXhIo5xAsV8mVGrmq07QiBorF-J4_HEIic7aR8W";
//const String TOKEN = "006ee267e6dae9e4c66bf1946fb905646abIABNQv9e6lg/MtUKvQqYkDmT0aH4d1kc/LnMGrln4Am4xVgUM64AAAAAEACGukDPGADwYgEAAQAXAPBi";
const String CALL_STATUS_DIALLED = "dialled";
const String CALL_STATUS_RECEIVED = "received";
const String CALL_STATUS_MISSED = "missed";
const USERPATH = 'details';

const MERCHANTTYPE = [
  'Ambulance Air/Land/Sea',
  'Commentary/Burial Centers',
  'Hospital/Clinic',
  'HMO/Insurance',
  'Pharmacy Store',
  'Laboratory/Diagnosis',
  'Other Health Provider'
];

const CUSTOMERTYPE = [
  'Walk-In Customer',
  'Online Customer',
  'Caash Customer',
  'Credit Customer',
  'Other Customer'
];

const VENDORTYPE = [
  'Manufacturer',
  'Distributor',
  'Importer',
  'Other Health Provider'
];

List<User> users = [
  // User(
  //     email: 'phoenixk54@gmail.com',
  //     name: 'Uzoechi chigozie',
  //     uid: 'darkseidjdbjsbkjv',
  //     username: 'phoenixk54',
  //     profilePhoto:
  //         'https://www.whatspaper.com/wp-content/uploads/2021/12/hd-itachi-uchiha-wallpaper-whatspaper-21.jpg',
  //     status: 'Online',
  //     state: 1),
  User(
      email: 'phoenixk545@gmail.com',
      name: 'Uchiha Madara',
      uid: 'phoenixk5weufuhieh',
      verified: true,
      profilePhoto:
          'https://www.whatspaper.com/wp-content/uploads/2021/12/hd-itachi-uchiha-wallpaper-whatspaper-21.jpg',
      phone: '09067618740',
      country: 'Nigeria'),
];

List firstList = [
  {
    'title': 'Heart Rate',
    'icon': 'assets/imgs/heart.png',
    'count': '12',
    'unit': 'bmp'
  },
  {
    'title': 'Temperature',
    'icon': 'assets/imgs/temp.png',
    'count': '18',
    'unit': 'c'
  },
  {
    'title': 'Glucose Level',
    'icon': 'assets/imgs/gas.png',
    'count': '70 - 90',
    'unit': ''
  },
  {
    'title': 'Blood Pressure',
    'icon': 'assets/imgs/pressure.png',
    'count': '202/90',
    'unit': 'mg/dl'
  },
];

List secondList = [
  {
    'title': 'BMI Status',
    'icon': 'assets/imgs/trend.png',
    'date': 'Last upload 6d',
    'color': Color(0xFF6A5DEE),
  },
  {
    'title': 'Heart Rate Status',
    'icon': 'assets/imgs/trend2.png',
    'date': 'Last upload 2d',
    'color': Color(0xFFffa69e)
  },
  {
    'title': 'FCB Status',
    'icon': 'assets/imgs/bar.png',
    'date': 'Last upload 5d',
    'color': Color(0xFFa9d4ff)
  },
  {
    'title': 'Weight Status',
    'icon': 'assets/imgs/search.png',
    'date': 'Last upload 3d',
    'color': Color(0xFFffb88e)
  },
];

const PickerData2 = '''
[
    [
        "Non",
        "Mon",
        "Tue",
        "Wed",
        "Thur",
        "Fri",
        "Sat",
        "Sun"
    ],
    [
        "Non",
        "Mon",
        "Tue",
        "Wed",
        "Thur",
        "Fri",
        "Sat",
        "Sun"
    ],
    [   
        "Non",
        "Mon",
        "Tue",
        "Wed",
        "Thur",
        "Fri",
        "Sat",
        "Sun"
    ],
    [
        "Non",
        "Mon",
        "Tue",
        "Wed",
        "Thur",
        "Fri",
        "Sat",
        "Sun"
    ],
    [
        "Non",
        "Mon",
        "Tue",
        "Wed",
        "Thur",
        "Fri",
        "Sat",
        "Sun"
    ],
    [
        "Non",
        "Mon",
        "Tue",
        "Wed",
        "Thur",
        "Fri",
        "Sat",
        "Sun"
    ]
]
    ''';

const DUMMYREVIEW =
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.';

const BoxName = 'userBox';
const ReferralBox = 'refBox';

List ONBOARDING = [
  {
    'image': 'assets/auth/spl.png',
    'title': 'Instant Prescription And Reminder For Your Patient',
    'description':
        'Get access to Millions of Patients from different race, ethnicity and diversity across Africa and Globally, you can easily chat, video or voice call and book online appointment with patients.'
  },
  {
    'image': 'assets/auth/pana.png',
    'title': 'Book Appointments with Doctors Right from your Phone and System!',
    'description':
        'Get Access to Millions of Patients and Tools to help your Business without Borders, Boundaries and limitations.'
  },
  {
    'image': 'assets/imgs/4.png',
    'title': 'Browse the Largest Database',
    'description':
        'Join the Largest Database of Doctors, Nurses, Pharmacist, Pharmacy Stores, Hospitals and Clinics, Health Insurance and Other Health Services Providers in Africa and Globally with Just a click Away.'
  },
  {
    'image': 'assets/auth/amico.png',
    'title': 'A Smarter Ways to Save More on the E-Store!',
    'description':
        'You Can Order You’re Medications, Health Equipment and Accessories Delivered to Your Home or Office at your Convenience.'
  },
  {
    'image': 'assets/auth/rafiki.png',
    'title': 'Get Your Prescriptions and Orders Delivered at Your Door Step!',
    'description':
        'You Can Order You’re Medications, Health Equipment and Accessories Delivered to Your Home or Office at your Convenience'
  },
  {
    'image': 'A smarter way to pay',
    'title': 'Get Your Prescriptions and Orders Delivered at Your Door Step!',
    'description':
        'We have provided various Tools and options for you to ay and Received Funds seamlessly using wallet, Net Banking, USSD and More!'
  }
];

final SHADOW = [
  BoxShadow(
      color: Colors.black12,
      spreadRadius: 1.0,
      blurRadius: 10.0,
      offset: Offset(0.0, 1.0))
];

const BLUECOLOR = Color(0xFF00329B);
const BODYTEXT = Color(0xFF373737);
const GREYTEXT = Color(0xFFA1A1A1);

List<String> month = [
  'January',
  'Febuary',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

List<String> constDays = [
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday'
];

List Advert = [
  {'title': 'Upto\n10%', 'desc': '10% cashback\neveryhour'},
  {'title': 'Upto\n15%', 'desc': '15% cashback\neveryhour'}
];

List Specialities = [
  {'title': 'Urology', 'asset': 'assets/imgs/kidney.png'},
  {'title': 'Neurology', 'asset': 'assets/imgs/brain.png'},
  {'title': 'Cardiology', 'asset': 'assets/imgs/heart0.png'},
  {'title': 'Dentist', 'asset': 'assets/imgs/tooth.png'},
  {'title': 'Orthopedic', 'asset': 'assets/imgs/bone.png'},
];

getCustomFont({size = 14.0, color = Colors.black54, weight = FontWeight.w400}) {
  return GoogleFonts.poppins(fontSize: size, color: color, fontWeight: weight);
}

getNavdraweritem(BuildContext context) {
  return [
    {'image': FontAwesome.home, 'title': 'Dashboard', 'index': 0},
    {'image': FontAwesome5.heart, 'title': 'My Vitals & Target', 'index': 1},
    {'image': FontAwesome5.store, 'title': 'E-store', 'index': 2},
    {'image': FontAwesome5.user_nurse, 'title': 'Doctor Booking', 'index': 3},
    {'image': FontAwesome5.calendar, 'title': 'My Appointment', 'index': 4},
    {'image': FontAwesome5.facebook_messenger, 'title': 'message', 'index': 5},
    {'image': FontAwesome5.file_invoice, 'title': 'My Invoices', 'index': 6},
  ];
}

List removeBottom = [
  3,
  11,
  -7,
  14,
  15,
  9,
  10,
  17,
  12,
  13,
  16,
  19,
  21,
  20,
  22,
  23,
  8,
  6,
  -5,
  18,
  -7,
  2,
  7,
  5
];
List removeBottom1 = [
  3,
  11,
  -7,
  14,
  15,
  9,
  10,
  17,
  12,
  13,
  16,
  19,
  21,
  20,
  22,
  23,
  8,
  6,
  -5,
  -7,
  18,
  2,
  7,
  5
];

List shop_by_categgory = [
  {
    'title': 'OTC MEDICINES',
    'color': Colors.blueGrey,
    'icon': 'assets/estore/estore5.png'
  },
  {
    'title': 'DIABETIC MEDICINES',
    'color': Colors.lightBlueAccent,
    'icon': 'assets/estore/estore6.png'
  },
  {
    'title': 'BABY & MOTHER',
    'color': Colors.orangeAccent,
    'icon': 'assets/estore/estore7.png'
  },
];

List shop_by_offer = [
  {
    'title': 'STAY HOME GET DISCOUNT',
    'color': Colors.purpleAccent,
    'icon': 'assets/estore/bro.png'
  },
  {
    'title': 'GET 50% OFF ON FIRST ORDER',
    'color': Colors.amber,
    'icon': 'assets/estore/bro.png'
  },
];

List allStores = [
  {
    'title': 'Wild Life Store',
    'desc': 'Willington Bridge',
    'color': Colors.lightGreen,
    'icon': 'assets/estore/estore4.png'
  },
  {
    'title': 'Healthyfy',
    'desc': 'New Park Maryland',
    'color': Colors.lightBlueAccent,
    'icon': 'assets/estore/estore2.png'
  },
  {
    'title': 'Success Store',
    'desc': 'Shoprite Aluasa',
    'color': Colors.amber,
    'icon': 'assets/estore/estore1.png'
  },
  {
    'title': 'Healthy Family',
    'desc': 'Manchester New Park',
    'color': Colors.lightGreenAccent,
    'icon': 'assets/estore/estore3.png'
  }
];

List<NavDrawerItem> getNavdraweritem_(BuildContext context) {
  return [
    NavDrawerItem(
        title: 'Home',
        icon: FontAwesome.home,
        children: [],
        isOpen: false,
        index: 0),
    NavDrawerItem(
        title: 'Dashboard',
        icon: FontAwesome5.dashcube,
        children: [],
        isOpen: false,
        index: 1),
    NavDrawerItem(
        title: 'E-stores',
        icon: FontAwesome5.store,
        children: [],
        isOpen: false,
        index: 4),
    NavDrawerItem(
        title: 'My Store',
        icon: FontAwesome.heart,
        children: [],
        isOpen: false,
        index: 2),
    NavDrawerItem(
        title: 'My Calender',
        icon: Icons.folder,
        children: [],
        isOpen: false,
        index: 3),

    // NavDrawerItem(
    //     title: 'My Appointment',
    //     icon: FontAwesome5.meetup,
    //     children: [],
    //     isOpen: false,
    //     index: 4),
    NavDrawerItem(
        title: 'Communication',
        icon: FontAwesome5.facebook_messenger,
        children: [
          {'index': -13, 'title': 'Social Media'},
          {'index': 5, 'title': 'Chat'},
        ],
        isOpen: false,
        index: -0),
    NavDrawerItem(
        title: 'Doctor Booking',
        icon: FontAwesome5.user_nurse,
        children: [],
        isOpen: false,
        index: 23),
    NavDrawerItem(
        title: 'Product Mgt.',
        icon: Icons.family_restroom,
        children: [
          {'index': -222, 'title': 'All Product'},
          {'index': 22, 'title': 'Add Medicine'},
          {'index': 24, 'title': 'Add Product'},
        ],
        isOpen: false,
        index: 22),
    NavDrawerItem(
        title: 'Customer Mgt.',
        icon: FontAwesome5.file_invoice,
        children: [
          {'index': 5, 'title': 'All Customers'},
          {'index': -5, 'title': 'Add Customer'},
          {'index': 20, 'title': 'All Services'},

          {'index': -5, 'title': 'All Sales Invoices'},
          {'index': 25, 'title': 'Add Sales Invoice'}, //done
          {'index': -5, 'title': 'Customer Receipt'},
        ],
        isOpen: false,
        index: -0),
    NavDrawerItem(
        title: 'Vendor Mgt.',
        icon: FontAwesome5.file_invoice,
        children: [
          {'index': 7, 'title': 'All Vendor'},
          {'index': -7, 'title': 'Add Vendor'},
          {'index': 21, 'title': 'All Specializations'},
          {'index': 19, 'title': 'All Purchases'},

          {'index': -7, 'title': 'Add Purchase Invoices'},
          {'index': 19, 'title': 'Purchase Return'},
          {'index': 19, 'title': 'Vendor Payment'},
          {'index': 4, 'title': 'All Brands'},
        ],
        isOpen: false,
        index: -0),
    NavDrawerItem(
        title: 'My Transaction',
        icon: FontAwesome5.file_invoice,
        children: [
          {'index': 9, 'title': 'My Offer'},
          {'index': 10, 'title': 'My Invoices'},
          {'index': 11, 'title': 'Favourite'},
          //{'index': -0, 'title': 'Reviews'}
        ],
        isOpen: false,
        index: -0),
    NavDrawerItem(
        title: 'Company',
        icon: FontAwesome5.industry,
        children: [
          //{'index': -0, 'title': 'My Invites'},
          {'index': 12, 'title': 'My Referrals'},
          {'index': 13, 'title': 'Contact Us'},
          {'index': 14, 'title': 'Rate Us'},
          {'index': 15, 'title': 'Share App'},
        ],
        isOpen: false,
        index: -0),
    NavDrawerItem(
        title: 'My Profile',
        icon: FontAwesome5.user,
        children: [],
        isOpen: false,
        index: 6),
    NavDrawerItem(
        title: 'Settings',
        icon: Icons.settings,
        children: [
          {'index': 23, 'title': 'Currency'},
          {'index': 16, 'title': 'Change Password'},
          {'index': 17, 'title': 'Notification'}
        ],
        isOpen: false,
        index: -0),
    NavDrawerItem(
        title: 'Sign Out',
        icon: FontAwesome5.sign_out_alt,
        children: [],
        isOpen: false,
        index: 11),
  ];
}

const DUMMYTEXT =
    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled';

List<Map<String, dynamic>> countryListDrop = [
  {"id": 1, "code": "93", "shortname": "AFG", "name": "Afghanistan"},
  {"id": 2, "code": "358 18", "shortname": "ALA", "name": "Åland Islands"},
  {"id": 3, "code": "355", "shortname": "ALB", "name": "Albania"},
  {"id": 4, "code": "213", "shortname": "DZA", "name": "Algeria"},
  {"id": 5, "code": "1 684", "shortname": "ASM", "name": "American Samoa"},
  {"id": 6, "code": "376", "shortname": "AND", "name": "Andorra"},
  {"id": 7, "code": "244", "shortname": "AGO", "name": "Angola"},
  {"id": 8, "code": "1 264", "shortname": "AIA", "name": "Anguilla"},
  {"id": 9, "code": "6721", "shortname": "ATA", "name": "Antarctica"},
  {
    "id": 10,
    "code": "1 268",
    "shortname": "ATG",
    "name": "Antigua and Barbuda"
  },
  {"id": 11, "code": "54", "shortname": "ARG", "name": "Argentina"},
  {"id": 12, "code": "374", "shortname": "ARM", "name": "Armenia"},
  {"id": 13, "code": "297", "shortname": "ABW", "name": "Aruba"},
  {"id": 14, "code": "61", "shortname": "AUS", "name": "Australia"},
  {"id": 15, "code": "43", "shortname": "AUT", "name": "Austria"},
  {"id": 16, "code": "994", "shortname": "AZE", "name": "Azerbaijan"},
  {"id": 17, "code": "1 242", "shortname": "BHS", "name": "Bahamas"},
  {"id": 18, "code": "973", "shortname": "BHR", "name": "Bahrain"},
  {"id": 19, "code": "880", "shortname": "BGD", "name": "Bangladesh"},
  {"id": 20, "code": "1 246", "shortname": "BRB", "name": "Barbados"},
  {"id": 21, "code": "375", "shortname": "BLR", "name": "Belarus"},
  {"id": 22, "code": "32", "shortname": "BEL", "name": "Belgium"},
  {"id": 23, "code": "501", "shortname": "BLZ", "name": "Belize"},
  {"id": 24, "code": "229", "shortname": "BEN", "name": "Benin"},
  {"id": 25, "code": "1 441", "shortname": "BMU", "name": "Bermuda"},
  {"id": 26, "code": "975", "shortname": "BTN", "name": "Bhutan"},
  {"id": 27, "code": "591", "shortname": "BOL", "name": "Bolivia"},
  {
    "id": 28,
    "code": "5997",
    "shortname": "BES",
    "name": "Bonaire, Sint Eustatius and Saba"
  },
  {
    "id": 29,
    "code": "387",
    "shortname": "BIH",
    "name": "Bosnia and Herzegovina"
  },
  {"id": 30, "code": "267", "shortname": "BWA", "name": "Botswana"},
  {"id": 31, "code": "47", "shortname": "BVT", "name": "Bouvet Island"},
  {"id": 32, "code": "55", "shortname": "BRA", "name": "Brazil"},
  {
    "id": 33,
    "code": "246",
    "shortname": "IOT",
    "name": "British Indian Ocean Territory"
  },
  {"id": 34, "code": "673", "shortname": "BRN", "name": "Brunei Darussalam"},
  {"id": 35, "code": "359", "shortname": "BGR", "name": "Bulgaria"},
  {"id": 36, "code": "226", "shortname": "BFA", "name": "Burkina Faso"},
  {"id": 37, "code": "257", "shortname": "BDI", "name": "Burundi"},
  {"id": 38, "code": "855", "shortname": "KHM", "name": "Cambodia"},
  {"id": 39, "code": "237", "shortname": "CMR", "name": "Cameroon"},
  {"id": 40, "code": "1", "shortname": "CAN", "name": "Canada"},
  {"id": 41, "code": "238", "shortname": "CPV", "name": "Cape Verde"},
  {"id": 42, "code": "1 345", "shortname": "CYM", "name": "Cayman Islands"},
  {
    "id": 43,
    "code": "236",
    "shortname": "CAF",
    "name": "Central African Republic"
  },
  {"id": 44, "code": "235", "shortname": "TCD", "name": "Chad"},
  {"id": 45, "code": "56", "shortname": "CHL", "name": "Chile"},
  {"id": 46, "code": "86", "shortname": "CHN", "name": "China"},
  {"id": 47, "code": "61", "shortname": "CXR", "name": "Christmas Island"},
  {
    "id": 48,
    "code": "61",
    "shortname": "CCK",
    "name": "Cocos (Keeling) Islands"
  },
  {"id": 49, "code": "57", "shortname": "COL", "name": "Colombia"},
  {"id": 50, "code": "269", "shortname": "COM", "name": "Comoros"},
  {"id": 52, "code": "243", "shortname": "COG", "name": "Congo"},
  {
    "id": 51,
    "code": "242",
    "shortname": "COD",
    "name": "Congo, the Democratic Republic of the"
  },
  {"id": 53, "code": "682", "shortname": "COK", "name": "Cook Islands"},
  {"id": 54, "code": "506", "shortname": "CRI", "name": "Costa Rica"},
  {"id": 55, "code": "225", "shortname": "CIV", "name": "Côte d'Ivoire"},
  {"id": 56, "code": "385", "shortname": "HRV", "name": "Croatia"},
  {"id": 57, "code": "53", "shortname": "CUB", "name": "Cuba"},
  {"id": 58, "code": "599", "shortname": "CUW", "name": "Curaçao"},
  {"id": 59, "code": "357", "shortname": "CYP", "name": "Cyprus"},
  {"id": 60, "code": "420", "shortname": "CZE", "name": "Czech Republic"},
  {"id": 61, "code": "45", "shortname": "DNK", "name": "Denmark"},
  {"id": 62, "code": "253", "shortname": "DJI", "name": "Djibouti"},
  {"id": 63, "code": "1 767", "shortname": "DMA", "name": "Dominica"},
  {
    "id": 64,
    "code": "1 809/829/ 849",
    "shortname": "DOM",
    "name": "Dominican Republic"
  },
  {"id": 65, "code": "593", "shortname": "ECU", "name": "Ecuador"},
  {"id": 66, "code": "20", "shortname": "EGY", "name": "Egypt"},
  {"id": 67, "code": "503", "shortname": "SLV", "name": "El Salvador"},
  {"id": 68, "code": "240", "shortname": "GNQ", "name": "Equatorial Guinea"},
  {"id": 69, "code": "291", "shortname": "ERI", "name": "Eritrea"},
  {"id": 70, "code": "372", "shortname": "EST", "name": "Estonia"},
  {"id": 71, "code": "251", "shortname": "ETH", "name": "Ethiopia"},
  {
    "id": 72,
    "code": "500",
    "shortname": "FLK",
    "name": "Falkland Islands (Malvinas)"
  },
  {"id": 73, "code": "298", "shortname": "FRO", "name": "Faroe Islands"},
  {"id": 74, "code": "679", "shortname": "FJI", "name": "Fiji"},
  {"id": 75, "code": "358", "shortname": "FIN", "name": "Finland"},
  {"id": 76, "code": "33", "shortname": "FRA", "name": "France"},
  {"id": 77, "code": "594", "shortname": "GUF", "name": "French Guiana"},
  {"id": 78, "code": "689", "shortname": "PYF", "name": "French Polynesia"},
  {
    "id": 79,
    "code": "-",
    "shortname": "ATF",
    "name": "French Southern Territories"
  },
  {"id": 80, "code": "241", "shortname": "GAB", "name": "Gabon"},
  {"id": 81, "code": "220", "shortname": "GMB", "name": "Gambia"},
  {"id": 82, "code": "995", "shortname": "GEO", "name": "Georgia"},
  {"id": 83, "code": "49", "shortname": "DEU", "name": "Germany"},
  {"id": 84, "code": "233", "shortname": "GHA", "name": "Ghana"},
  {"id": 85, "code": "350", "shortname": "GIB", "name": "Gibraltar"},
  {"id": 86, "code": "30", "shortname": "GRC", "name": "Greece"},
  {"id": 87, "code": "299", "shortname": "GRL", "name": "Greenland"},
  {"id": 88, "code": "1 473", "shortname": "GRD", "name": "Grenada"},
  {"id": 89, "code": "590", "shortname": "GLP", "name": "Guadeloupe"},
  {"id": 90, "code": "1 671", "shortname": "GUM", "name": "Guam"},
  {"id": 91, "code": "502", "shortname": "GTM", "name": "Guatemala"},
  {"id": 92, "code": "44", "shortname": "GGY", "name": "Guernsey"},
  {"id": 94, "code": "224", "shortname": "GIN", "name": "Guinea"},
  {"id": 93, "code": "245", "shortname": "GNB", "name": "Guinea-Bissau"},
  {"id": 95, "code": "592", "shortname": "GUY", "name": "Guyana"},
  {"id": 96, "code": "509", "shortname": "HTI", "name": "Haiti"},
  {
    "id": 97,
    "code": "1 672",
    "shortname": "HMD",
    "name": "Heard Island and McDonald Islands"
  },
  {
    "id": 98,
    "code": "379",
    "shortname": "VAT",
    "name": "Holy See (Vatican City State)"
  },
  {"id": 99, "code": "504", "shortname": "HND", "name": "Honduras"},
  {"id": 100, "code": "852", "shortname": "HKG", "name": "Hong Kong"},
  {"id": 101, "code": "36", "shortname": "HUN", "name": "Hungary"},
  {"id": 102, "code": "354", "shortname": "ISL", "name": "Iceland"},
  {"id": 103, "code": "91", "shortname": "IND", "name": "India"},
  {"id": 104, "code": "62", "shortname": "IDN", "name": "Indonesia"},
  {
    "id": 105,
    "code": "98",
    "shortname": "IRN",
    "name": "Iran, Islamic Republic of"
  },
  {"id": 106, "code": "964", "shortname": "IRQ", "name": "Iraq"},
  {"id": 107, "code": "353", "shortname": "IRL", "name": "Ireland"},
  {"id": 108, "code": "44", "shortname": "IMN", "name": "Isle of Man"},
  {"id": 109, "code": "972", "shortname": "ISR", "name": "Israel"},
  {"id": 110, "code": "39", "shortname": "ITA", "name": "Italy"},
  {"id": 111, "code": "1 876", "shortname": "JAM", "name": "Jamaica"},
  {"id": 112, "code": "81", "shortname": "JPN", "name": "Japan"},
  {"id": 113, "code": "44", "shortname": "JEY", "name": "Jersey"},
  {"id": 114, "code": "962", "shortname": "JOR", "name": "Jordan"},
  {"id": 115, "code": "7", "shortname": "KAZ", "name": "Kazakhstan"},
  {"id": 116, "code": "254", "shortname": "KEN", "name": "Kenya"},
  {"id": 117, "code": "686", "shortname": "KIR", "name": "Kiribati"},
  {
    "id": 118,
    "code": "850",
    "shortname": "PRK",
    "name": "Korea, Democratic People's Republic of"
  },
  {"id": 119, "code": "82", "shortname": "KOR", "name": "Korea, Republic of"},
  {"id": 120, "code": "965", "shortname": "KWT", "name": "Kuwait"},
  {"id": 121, "code": "996", "shortname": "KGZ", "name": "Kyrgyzstan"},
  {
    "id": 122,
    "code": "856",
    "shortname": "LAO",
    "name": "Lao People's Democratic Republic"
  },
  {"id": 123, "code": "371", "shortname": "LVA", "name": "Latvia"},
  {"id": 124, "code": "961", "shortname": "LBN", "name": "Lebanon"},
  {"id": 125, "code": "266", "shortname": "LSO", "name": "Lesotho"},
  {"id": 126, "code": "231", "shortname": "LBR", "name": "Liberia"},
  {
    "id": 127,
    "code": "218",
    "shortname": "LBY",
    "name": "Libyan Arab Jamahiriya"
  },
  {"id": 128, "code": "423", "shortname": "LIE", "name": "Liechtenstein"},
  {"id": 129, "code": "370", "shortname": "LTU", "name": "Lithuania"},
  {"id": 130, "code": "352", "shortname": "LUX", "name": "Luxembourg"},
  {"id": 131, "code": "853", "shortname": "MAC", "name": "Macao"},
  {
    "id": 132,
    "code": "389",
    "shortname": "MKD",
    "name": "Macedonia, the Former Yugoslav Republic of"
  },
  {"id": 133, "code": "261", "shortname": "MDG", "name": "Madagascar"},
  {"id": 134, "code": "265", "shortname": "MWI", "name": "Malawi"},
  {"id": 135, "code": "60", "shortname": "MYS", "name": "Malaysia"},
  {"id": 136, "code": "960", "shortname": "MDV", "name": "Maldives"},
  {"id": 137, "code": "223", "shortname": "MLI", "name": "Mali"},
  {"id": 138, "code": "356", "shortname": "MLT", "name": "Malta"},
  {"id": 139, "code": "692", "shortname": "MHL", "name": "Marshall Islands"},
  {"id": 140, "code": "596", "shortname": "MTQ", "name": "Martinique"},
  {"id": 141, "code": "222", "shortname": "MRT", "name": "Mauritania"},
  {"id": 142, "code": "230", "shortname": "MUS", "name": "Mauritius"},
  {"id": 143, "code": "262", "shortname": "MYT", "name": "Mayotte"},
  {"id": 144, "code": "52", "shortname": "MEX", "name": "Mexico"},
  {
    "id": 145,
    "code": "691",
    "shortname": "FSM",
    "name": "Micronesia, Federated States of"
  },
  {
    "id": 146,
    "code": "373",
    "shortname": "MDA",
    "name": "Moldova, Republic of"
  },
  {"id": 147, "code": "377", "shortname": "MCO", "name": "Monaco"},
  {"id": 148, "code": "976", "shortname": "MNG", "name": "Mongolia"},
  {"id": 149, "code": "382", "shortname": "MNE", "name": "Montenegro"},
  {"id": 150, "code": "1 664", "shortname": "MSR", "name": "Montserrat"},
  {"id": 151, "code": "212", "shortname": "MAR", "name": "Morocco"},
  {"id": 152, "code": "258", "shortname": "MOZ", "name": "Mozambique"},
  {"id": 153, "code": "95", "shortname": "MMR", "name": "Myanmar"},
  {"id": 154, "code": "264", "shortname": "NAM", "name": "Namibia"},
  {"id": 155, "code": "674", "shortname": "NRU", "name": "Nauru"},
  {"id": 156, "code": "977", "shortname": "NPL", "name": "Nepal"},
  {"id": 157, "code": "31", "shortname": "NLD", "name": "Netherlands"},
  {"id": 158, "code": "687", "shortname": "NCL", "name": "New Caledonia"},
  {"id": 159, "code": "64", "shortname": "NZL", "name": "New Zealand"},
  {"id": 160, "code": "505", "shortname": "NIC", "name": "Nicaragua"},
  {"id": 162, "code": "227", "shortname": "NER", "name": "Niger"},
  {"id": 161, "code": "234", "shortname": "NGA", "name": "Nigeria"},
  {"id": 163, "code": "683", "shortname": "NIU", "name": "Niue"},
  {"id": 164, "code": "6723", "shortname": "NFK", "name": "Norfolk Island"},
  {
    "id": 165,
    "code": "1 670",
    "shortname": "MNP",
    "name": "Northern Mariana Islands"
  },
  {"id": 166, "code": "47", "shortname": "NOR", "name": "Norway"},
  {"id": 167, "code": "968", "shortname": "OMN", "name": "Oman"},
  {"id": 168, "code": "92", "shortname": "PAK", "name": "Pakistan"},
  {"id": 169, "code": "680", "shortname": "PLW", "name": "Palau"},
  {
    "id": 170,
    "code": "970",
    "shortname": "PSE",
    "name": "Palestinian Territory, Occupied"
  },
  {"id": 171, "code": "507", "shortname": "PAN", "name": "Panama"},
  {"id": 172, "code": "675", "shortname": "PNG", "name": "Papua New Guinea"},
  {"id": 173, "code": "595", "shortname": "PRY", "name": "Paraguay"},
  {"id": 174, "code": "51", "shortname": "PER", "name": "Peru"},
  {"id": 175, "code": "63", "shortname": "PHL", "name": "Philippines"},
  {"id": 176, "code": "64", "shortname": "PCN", "name": "Pitcairn"},
  {"id": 177, "code": "48", "shortname": "POL", "name": "Poland"},
  {"id": 178, "code": "351", "shortname": "PRT", "name": "Portugal"},
  {"id": 179, "code": "1 57/68", "shortname": "PRI", "name": "Puerto Rico"},
  {"id": 180, "code": "974", "shortname": "QAT", "name": "Qatar"},
  {"id": 181, "code": "262", "shortname": "REU", "name": "Réunion"},
  {"id": 182, "code": "40", "shortname": "ROU", "name": "Romania"},
  {"id": 183, "code": "7", "shortname": "RUS", "name": "Russian Federation"},
  {"id": 184, "code": "250", "shortname": "RWA", "name": "Rwanda"},
  {"id": 185, "code": "590", "shortname": "BLM", "name": "Saint Barthélemy"},
  {"id": 186, "code": "290", "shortname": "SHN", "name": "Saint Helena"},
  {
    "id": 187,
    "code": "1 869",
    "shortname": "KNA",
    "name": "Saint Kitts and Nevis"
  },
  {"id": 188, "code": "1 758", "shortname": "LCA", "name": "Saint Lucia"},
  {
    "id": 189,
    "code": "590",
    "shortname": "MAF",
    "name": "Saint Martin (French part)"
  },
  {
    "id": 190,
    "code": "508",
    "shortname": "SPM",
    "name": "Saint Pierre and Miquelon"
  },
  {
    "id": 191,
    "code": "1 784",
    "shortname": "VCT",
    "name": "Saint Vincent and the Grenadines"
  },
  {"id": 192, "code": "685", "shortname": "WSM", "name": "Samoa"},
  {"id": 193, "code": "378", "shortname": "SMR", "name": "San Marino"},
  {
    "id": 194,
    "code": "239",
    "shortname": "STP",
    "name": "Sao Tome and Principe"
  },
  {"id": 195, "code": "966", "shortname": "SAU", "name": "Saudi Arabia"},
  {"id": 196, "code": "221", "shortname": "SEN", "name": "Senegal"},
  {"id": 197, "code": "381", "shortname": "SRB", "name": "Serbia"},
  {"id": 198, "code": "248", "shortname": "SYC", "name": "Seychelles"},
  {"id": 199, "code": "232", "shortname": "SLE", "name": "Sierra Leone"},
  {"id": 200, "code": "65", "shortname": "SGP", "name": "Singapore"},
  {
    "id": 201,
    "code": "1 721",
    "shortname": "SXM",
    "name": "Sint Maarten (Dutch part)"
  },
  {"id": 202, "code": "421", "shortname": "SVK", "name": "Slovakia"},
  {"id": 203, "code": "386", "shortname": "SVN", "name": "Slovenia"},
  {"id": 204, "code": "677", "shortname": "SLB", "name": "Solomon Islands"},
  {"id": 205, "code": "252", "shortname": "SOM", "name": "Somalia"},
  {"id": 206, "code": "27", "shortname": "ZAF", "name": "South Africa"},
  {
    "id": 207,
    "code": "500",
    "shortname": "SGS",
    "name": "South Georgia and the South Sandwich Islands"
  },
  {"id": 208, "code": "211", "shortname": "SSD", "name": "South Sudan"},
  {"id": 209, "code": "34", "shortname": "ESP", "name": "Spain"},
  {"id": 210, "code": "94", "shortname": "LKA", "name": "Sri Lanka"},
  {"id": 211, "code": "249", "shortname": "SDN", "name": "Sudan"},
  {"id": 212, "code": "597", "shortname": "SUR", "name": "Suriname"},
  {
    "id": 213,
    "code": "47",
    "shortname": "SJM",
    "name": "Svalbard and Jan Mayen"
  },
  {"id": 214, "code": "268", "shortname": "SWZ", "name": "Swaziland"},
  {"id": 215, "code": "46", "shortname": "SWE", "name": "Sweden"},
  {"id": 216, "code": "41", "shortname": "CHE", "name": "Switzerland"},
  {
    "id": 217,
    "code": "963",
    "shortname": "SYR",
    "name": "Syrian Arab Republic"
  },
  {
    "id": 218,
    "code": "886",
    "shortname": "TWN",
    "name": "Taiwan, Province of China"
  },
  {"id": 219, "code": "992", "shortname": "TJK", "name": "Tajikistan"},
  {
    "id": 220,
    "code": "255",
    "shortname": "TZA",
    "name": "Tanzania, United Republic of"
  },
  {"id": 221, "code": "66", "shortname": "THA", "name": "Thailand"},
  {"id": 222, "code": "670", "shortname": "TLS", "name": "Timor-Leste"},
  {"id": 223, "code": "228", "shortname": "TGO", "name": "Togo"},
  {"id": 224, "code": "690", "shortname": "TKL", "name": "Tokelau"},
  {"id": 225, "code": "676", "shortname": "TON", "name": "Tonga"},
  {
    "id": 226,
    "code": "1 868",
    "shortname": "TTO",
    "name": "Trinidad and Tobago"
  },
  {"id": 227, "code": "216", "shortname": "TUN", "name": "Tunisia"},
  {"id": 228, "code": "90", "shortname": "TUR", "name": "Turkey"},
  {"id": 229, "code": "993", "shortname": "TKM", "name": "Turkmenistan"},
  {
    "id": 230,
    "code": "1 649",
    "shortname": "TCA",
    "name": "Turks and Caicos Islands"
  },
  {"id": 231, "code": "688", "shortname": "TUV", "name": "Tuvalu"},
  {"id": 232, "code": "256", "shortname": "UGA", "name": "Uganda"},
  {"id": 233, "code": "380", "shortname": "UKR", "name": "Ukraine"},
  {
    "id": 234,
    "code": "971",
    "shortname": "ARE",
    "name": "United Arab Emirates"
  },
  {"id": 235, "code": "44", "shortname": "GBR", "name": "United Kingdom"},
  {"id": 237, "code": "1", "shortname": "USA", "name": "United States"},
  {
    "id": 236,
    "code": "1 808",
    "shortname": "UMI",
    "name": "United States Minor Outlying Islands"
  },
  {"id": 238, "code": "598", "shortname": "URY", "name": "Uruguay"},
  {"id": 239, "code": "998", "shortname": "UZB", "name": "Uzbekistan"},
  {"id": 240, "code": "678", "shortname": "VUT", "name": "Vanuatu"},
  {"id": 241, "code": "58", "shortname": "VEN", "name": "Venezuela"},
  {"id": 242, "code": "84", "shortname": "VNM", "name": "Vietnam"},
  {
    "id": 243,
    "code": "1 284",
    "shortname": "VGB",
    "name": "Virgin Islands, British"
  },
  {
    "id": 244,
    "code": "1 340",
    "shortname": "VIR",
    "name": "Virgin Islands, U.S."
  },
  {"id": 245, "code": "681", "shortname": "WLF", "name": "Wallis and Futuna"},
  {"id": 246, "code": "212 28", "shortname": "ESH", "name": "Western Sahara"},
  {"id": 247, "code": "967", "shortname": "YEM", "name": "Yemen"},
  {"id": 248, "code": "260", "shortname": "ZMB", "name": "Zambia"},
  {"id": 249, "code": "263", "shortname": "ZWE", "name": "Zimbabwe"}
];

List countryList = [
  {"id": 1, "code": "93", "shortname": "AFG", "name": "Afghanistan"},
  {"id": 2, "code": "358 18", "shortname": "ALA", "name": "Åland Islands"},
  {"id": 3, "code": "355", "shortname": "ALB", "name": "Albania"},
  {"id": 4, "code": "213", "shortname": "DZA", "name": "Algeria"},
  {"id": 5, "code": "1 684", "shortname": "ASM", "name": "American Samoa"},
  {"id": 6, "code": "376", "shortname": "AND", "name": "Andorra"},
  {"id": 7, "code": "244", "shortname": "AGO", "name": "Angola"},
  {"id": 8, "code": "1 264", "shortname": "AIA", "name": "Anguilla"},
  {"id": 9, "code": "6721", "shortname": "ATA", "name": "Antarctica"},
  {
    "id": 10,
    "code": "1 268",
    "shortname": "ATG",
    "name": "Antigua and Barbuda"
  },
  {"id": 11, "code": "54", "shortname": "ARG", "name": "Argentina"},
  {"id": 12, "code": "374", "shortname": "ARM", "name": "Armenia"},
  {"id": 13, "code": "297", "shortname": "ABW", "name": "Aruba"},
  {"id": 14, "code": "61", "shortname": "AUS", "name": "Australia"},
  {"id": 15, "code": "43", "shortname": "AUT", "name": "Austria"},
  {"id": 16, "code": "994", "shortname": "AZE", "name": "Azerbaijan"},
  {"id": 17, "code": "1 242", "shortname": "BHS", "name": "Bahamas"},
  {"id": 18, "code": "973", "shortname": "BHR", "name": "Bahrain"},
  {"id": 19, "code": "880", "shortname": "BGD", "name": "Bangladesh"},
  {"id": 20, "code": "1 246", "shortname": "BRB", "name": "Barbados"},
  {"id": 21, "code": "375", "shortname": "BLR", "name": "Belarus"},
  {"id": 22, "code": "32", "shortname": "BEL", "name": "Belgium"},
  {"id": 23, "code": "501", "shortname": "BLZ", "name": "Belize"},
  {"id": 24, "code": "229", "shortname": "BEN", "name": "Benin"},
  {"id": 25, "code": "1 441", "shortname": "BMU", "name": "Bermuda"},
  {"id": 26, "code": "975", "shortname": "BTN", "name": "Bhutan"},
  {"id": 27, "code": "591", "shortname": "BOL", "name": "Bolivia"},
  {
    "id": 28,
    "code": "5997",
    "shortname": "BES",
    "name": "Bonaire, Sint Eustatius and Saba"
  },
  {
    "id": 29,
    "code": "387",
    "shortname": "BIH",
    "name": "Bosnia and Herzegovina"
  },
  {"id": 30, "code": "267", "shortname": "BWA", "name": "Botswana"},
  {"id": 31, "code": "47", "shortname": "BVT", "name": "Bouvet Island"},
  {"id": 32, "code": "55", "shortname": "BRA", "name": "Brazil"},
  {
    "id": 33,
    "code": "246",
    "shortname": "IOT",
    "name": "British Indian Ocean Territory"
  },
  {"id": 34, "code": "673", "shortname": "BRN", "name": "Brunei Darussalam"},
  {"id": 35, "code": "359", "shortname": "BGR", "name": "Bulgaria"},
  {"id": 36, "code": "226", "shortname": "BFA", "name": "Burkina Faso"},
  {"id": 37, "code": "257", "shortname": "BDI", "name": "Burundi"},
  {"id": 38, "code": "855", "shortname": "KHM", "name": "Cambodia"},
  {"id": 39, "code": "237", "shortname": "CMR", "name": "Cameroon"},
  {"id": 40, "code": "1", "shortname": "CAN", "name": "Canada"},
  {"id": 41, "code": "238", "shortname": "CPV", "name": "Cape Verde"},
  {"id": 42, "code": "1 345", "shortname": "CYM", "name": "Cayman Islands"},
  {
    "id": 43,
    "code": "236",
    "shortname": "CAF",
    "name": "Central African Republic"
  },
  {"id": 44, "code": "235", "shortname": "TCD", "name": "Chad"},
  {"id": 45, "code": "56", "shortname": "CHL", "name": "Chile"},
  {"id": 46, "code": "86", "shortname": "CHN", "name": "China"},
  {"id": 47, "code": "61", "shortname": "CXR", "name": "Christmas Island"},
  {
    "id": 48,
    "code": "61",
    "shortname": "CCK",
    "name": "Cocos (Keeling) Islands"
  },
  {"id": 49, "code": "57", "shortname": "COL", "name": "Colombia"},
  {"id": 50, "code": "269", "shortname": "COM", "name": "Comoros"},
  {"id": 52, "code": "243", "shortname": "COG", "name": "Congo"},
  {
    "id": 51,
    "code": "242",
    "shortname": "COD",
    "name": "Congo, the Democratic Republic of the"
  },
  {"id": 53, "code": "682", "shortname": "COK", "name": "Cook Islands"},
  {"id": 54, "code": "506", "shortname": "CRI", "name": "Costa Rica"},
  {"id": 55, "code": "225", "shortname": "CIV", "name": "Côte d'Ivoire"},
  {"id": 56, "code": "385", "shortname": "HRV", "name": "Croatia"},
  {"id": 57, "code": "53", "shortname": "CUB", "name": "Cuba"},
  {"id": 58, "code": "599", "shortname": "CUW", "name": "Curaçao"},
  {"id": 59, "code": "357", "shortname": "CYP", "name": "Cyprus"},
  {"id": 60, "code": "420", "shortname": "CZE", "name": "Czech Republic"},
  {"id": 61, "code": "45", "shortname": "DNK", "name": "Denmark"},
  {"id": 62, "code": "253", "shortname": "DJI", "name": "Djibouti"},
  {"id": 63, "code": "1 767", "shortname": "DMA", "name": "Dominica"},
  {
    "id": 64,
    "code": "1 809/829/ 849",
    "shortname": "DOM",
    "name": "Dominican Republic"
  },
  {"id": 65, "code": "593", "shortname": "ECU", "name": "Ecuador"},
  {"id": 66, "code": "20", "shortname": "EGY", "name": "Egypt"},
  {"id": 67, "code": "503", "shortname": "SLV", "name": "El Salvador"},
  {"id": 68, "code": "240", "shortname": "GNQ", "name": "Equatorial Guinea"},
  {"id": 69, "code": "291", "shortname": "ERI", "name": "Eritrea"},
  {"id": 70, "code": "372", "shortname": "EST", "name": "Estonia"},
  {"id": 71, "code": "251", "shortname": "ETH", "name": "Ethiopia"},
  {
    "id": 72,
    "code": "500",
    "shortname": "FLK",
    "name": "Falkland Islands (Malvinas)"
  },
  {"id": 73, "code": "298", "shortname": "FRO", "name": "Faroe Islands"},
  {"id": 74, "code": "679", "shortname": "FJI", "name": "Fiji"},
  {"id": 75, "code": "358", "shortname": "FIN", "name": "Finland"},
  {"id": 76, "code": "33", "shortname": "FRA", "name": "France"},
  {"id": 77, "code": "594", "shortname": "GUF", "name": "French Guiana"},
  {"id": 78, "code": "689", "shortname": "PYF", "name": "French Polynesia"},
  {
    "id": 79,
    "code": "-",
    "shortname": "ATF",
    "name": "French Southern Territories"
  },
  {"id": 80, "code": "241", "shortname": "GAB", "name": "Gabon"},
  {"id": 81, "code": "220", "shortname": "GMB", "name": "Gambia"},
  {"id": 82, "code": "995", "shortname": "GEO", "name": "Georgia"},
  {"id": 83, "code": "49", "shortname": "DEU", "name": "Germany"},
  {"id": 84, "code": "233", "shortname": "GHA", "name": "Ghana"},
  {"id": 85, "code": "350", "shortname": "GIB", "name": "Gibraltar"},
  {"id": 86, "code": "30", "shortname": "GRC", "name": "Greece"},
  {"id": 87, "code": "299", "shortname": "GRL", "name": "Greenland"},
  {"id": 88, "code": "1 473", "shortname": "GRD", "name": "Grenada"},
  {"id": 89, "code": "590", "shortname": "GLP", "name": "Guadeloupe"},
  {"id": 90, "code": "1 671", "shortname": "GUM", "name": "Guam"},
  {"id": 91, "code": "502", "shortname": "GTM", "name": "Guatemala"},
  {"id": 92, "code": "44", "shortname": "GGY", "name": "Guernsey"},
  {"id": 94, "code": "224", "shortname": "GIN", "name": "Guinea"},
  {"id": 93, "code": "245", "shortname": "GNB", "name": "Guinea-Bissau"},
  {"id": 95, "code": "592", "shortname": "GUY", "name": "Guyana"},
  {"id": 96, "code": "509", "shortname": "HTI", "name": "Haiti"},
  {
    "id": 97,
    "code": "1 672",
    "shortname": "HMD",
    "name": "Heard Island and McDonald Islands"
  },
  {
    "id": 98,
    "code": "379",
    "shortname": "VAT",
    "name": "Holy See (Vatican City State)"
  },
  {"id": 99, "code": "504", "shortname": "HND", "name": "Honduras"},
  {"id": 100, "code": "852", "shortname": "HKG", "name": "Hong Kong"},
  {"id": 101, "code": "36", "shortname": "HUN", "name": "Hungary"},
  {"id": 102, "code": "354", "shortname": "ISL", "name": "Iceland"},
  {"id": 103, "code": "91", "shortname": "IND", "name": "India"},
  {"id": 104, "code": "62", "shortname": "IDN", "name": "Indonesia"},
  {
    "id": 105,
    "code": "98",
    "shortname": "IRN",
    "name": "Iran, Islamic Republic of"
  },
  {"id": 106, "code": "964", "shortname": "IRQ", "name": "Iraq"},
  {"id": 107, "code": "353", "shortname": "IRL", "name": "Ireland"},
  {"id": 108, "code": "44", "shortname": "IMN", "name": "Isle of Man"},
  {"id": 109, "code": "972", "shortname": "ISR", "name": "Israel"},
  {"id": 110, "code": "39", "shortname": "ITA", "name": "Italy"},
  {"id": 111, "code": "1 876", "shortname": "JAM", "name": "Jamaica"},
  {"id": 112, "code": "81", "shortname": "JPN", "name": "Japan"},
  {"id": 113, "code": "44", "shortname": "JEY", "name": "Jersey"},
  {"id": 114, "code": "962", "shortname": "JOR", "name": "Jordan"},
  {"id": 115, "code": "7", "shortname": "KAZ", "name": "Kazakhstan"},
  {"id": 116, "code": "254", "shortname": "KEN", "name": "Kenya"},
  {"id": 117, "code": "686", "shortname": "KIR", "name": "Kiribati"},
  {
    "id": 118,
    "code": "850",
    "shortname": "PRK",
    "name": "Korea, Democratic People's Republic of"
  },
  {"id": 119, "code": "82", "shortname": "KOR", "name": "Korea, Republic of"},
  {"id": 120, "code": "965", "shortname": "KWT", "name": "Kuwait"},
  {"id": 121, "code": "996", "shortname": "KGZ", "name": "Kyrgyzstan"},
  {
    "id": 122,
    "code": "856",
    "shortname": "LAO",
    "name": "Lao People's Democratic Republic"
  },
  {"id": 123, "code": "371", "shortname": "LVA", "name": "Latvia"},
  {"id": 124, "code": "961", "shortname": "LBN", "name": "Lebanon"},
  {"id": 125, "code": "266", "shortname": "LSO", "name": "Lesotho"},
  {"id": 126, "code": "231", "shortname": "LBR", "name": "Liberia"},
  {
    "id": 127,
    "code": "218",
    "shortname": "LBY",
    "name": "Libyan Arab Jamahiriya"
  },
  {"id": 128, "code": "423", "shortname": "LIE", "name": "Liechtenstein"},
  {"id": 129, "code": "370", "shortname": "LTU", "name": "Lithuania"},
  {"id": 130, "code": "352", "shortname": "LUX", "name": "Luxembourg"},
  {"id": 131, "code": "853", "shortname": "MAC", "name": "Macao"},
  {
    "id": 132,
    "code": "389",
    "shortname": "MKD",
    "name": "Macedonia, the Former Yugoslav Republic of"
  },
  {"id": 133, "code": "261", "shortname": "MDG", "name": "Madagascar"},
  {"id": 134, "code": "265", "shortname": "MWI", "name": "Malawi"},
  {"id": 135, "code": "60", "shortname": "MYS", "name": "Malaysia"},
  {"id": 136, "code": "960", "shortname": "MDV", "name": "Maldives"},
  {"id": 137, "code": "223", "shortname": "MLI", "name": "Mali"},
  {"id": 138, "code": "356", "shortname": "MLT", "name": "Malta"},
  {"id": 139, "code": "692", "shortname": "MHL", "name": "Marshall Islands"},
  {"id": 140, "code": "596", "shortname": "MTQ", "name": "Martinique"},
  {"id": 141, "code": "222", "shortname": "MRT", "name": "Mauritania"},
  {"id": 142, "code": "230", "shortname": "MUS", "name": "Mauritius"},
  {"id": 143, "code": "262", "shortname": "MYT", "name": "Mayotte"},
  {"id": 144, "code": "52", "shortname": "MEX", "name": "Mexico"},
  {
    "id": 145,
    "code": "691",
    "shortname": "FSM",
    "name": "Micronesia, Federated States of"
  },
  {
    "id": 146,
    "code": "373",
    "shortname": "MDA",
    "name": "Moldova, Republic of"
  },
  {"id": 147, "code": "377", "shortname": "MCO", "name": "Monaco"},
  {"id": 148, "code": "976", "shortname": "MNG", "name": "Mongolia"},
  {"id": 149, "code": "382", "shortname": "MNE", "name": "Montenegro"},
  {"id": 150, "code": "1 664", "shortname": "MSR", "name": "Montserrat"},
  {"id": 151, "code": "212", "shortname": "MAR", "name": "Morocco"},
  {"id": 152, "code": "258", "shortname": "MOZ", "name": "Mozambique"},
  {"id": 153, "code": "95", "shortname": "MMR", "name": "Myanmar"},
  {"id": 154, "code": "264", "shortname": "NAM", "name": "Namibia"},
  {"id": 155, "code": "674", "shortname": "NRU", "name": "Nauru"},
  {"id": 156, "code": "977", "shortname": "NPL", "name": "Nepal"},
  {"id": 157, "code": "31", "shortname": "NLD", "name": "Netherlands"},
  {"id": 158, "code": "687", "shortname": "NCL", "name": "New Caledonia"},
  {"id": 159, "code": "64", "shortname": "NZL", "name": "New Zealand"},
  {"id": 160, "code": "505", "shortname": "NIC", "name": "Nicaragua"},
  {"id": 162, "code": "227", "shortname": "NER", "name": "Niger"},
  {"id": 161, "code": "234", "shortname": "NGA", "name": "Nigeria"},
  {"id": 163, "code": "683", "shortname": "NIU", "name": "Niue"},
  {"id": 164, "code": "6723", "shortname": "NFK", "name": "Norfolk Island"},
  {
    "id": 165,
    "code": "1 670",
    "shortname": "MNP",
    "name": "Northern Mariana Islands"
  },
  {"id": 166, "code": "47", "shortname": "NOR", "name": "Norway"},
  {"id": 167, "code": "968", "shortname": "OMN", "name": "Oman"},
  {"id": 168, "code": "92", "shortname": "PAK", "name": "Pakistan"},
  {"id": 169, "code": "680", "shortname": "PLW", "name": "Palau"},
  {
    "id": 170,
    "code": "970",
    "shortname": "PSE",
    "name": "Palestinian Territory, Occupied"
  },
  {"id": 171, "code": "507", "shortname": "PAN", "name": "Panama"},
  {"id": 172, "code": "675", "shortname": "PNG", "name": "Papua New Guinea"},
  {"id": 173, "code": "595", "shortname": "PRY", "name": "Paraguay"},
  {"id": 174, "code": "51", "shortname": "PER", "name": "Peru"},
  {"id": 175, "code": "63", "shortname": "PHL", "name": "Philippines"},
  {"id": 176, "code": "64", "shortname": "PCN", "name": "Pitcairn"},
  {"id": 177, "code": "48", "shortname": "POL", "name": "Poland"},
  {"id": 178, "code": "351", "shortname": "PRT", "name": "Portugal"},
  {"id": 179, "code": "1 57/68", "shortname": "PRI", "name": "Puerto Rico"},
  {"id": 180, "code": "974", "shortname": "QAT", "name": "Qatar"},
  {"id": 181, "code": "262", "shortname": "REU", "name": "Réunion"},
  {"id": 182, "code": "40", "shortname": "ROU", "name": "Romania"},
  {"id": 183, "code": "7", "shortname": "RUS", "name": "Russian Federation"},
  {"id": 184, "code": "250", "shortname": "RWA", "name": "Rwanda"},
  {"id": 185, "code": "590", "shortname": "BLM", "name": "Saint Barthélemy"},
  {"id": 186, "code": "290", "shortname": "SHN", "name": "Saint Helena"},
  {
    "id": 187,
    "code": "1 869",
    "shortname": "KNA",
    "name": "Saint Kitts and Nevis"
  },
  {"id": 188, "code": "1 758", "shortname": "LCA", "name": "Saint Lucia"},
  {
    "id": 189,
    "code": "590",
    "shortname": "MAF",
    "name": "Saint Martin (French part)"
  },
  {
    "id": 190,
    "code": "508",
    "shortname": "SPM",
    "name": "Saint Pierre and Miquelon"
  },
  {
    "id": 191,
    "code": "1 784",
    "shortname": "VCT",
    "name": "Saint Vincent and the Grenadines"
  },
  {"id": 192, "code": "685", "shortname": "WSM", "name": "Samoa"},
  {"id": 193, "code": "378", "shortname": "SMR", "name": "San Marino"},
  {
    "id": 194,
    "code": "239",
    "shortname": "STP",
    "name": "Sao Tome and Principe"
  },
  {"id": 195, "code": "966", "shortname": "SAU", "name": "Saudi Arabia"},
  {"id": 196, "code": "221", "shortname": "SEN", "name": "Senegal"},
  {"id": 197, "code": "381", "shortname": "SRB", "name": "Serbia"},
  {"id": 198, "code": "248", "shortname": "SYC", "name": "Seychelles"},
  {"id": 199, "code": "232", "shortname": "SLE", "name": "Sierra Leone"},
  {"id": 200, "code": "65", "shortname": "SGP", "name": "Singapore"},
  {
    "id": 201,
    "code": "1 721",
    "shortname": "SXM",
    "name": "Sint Maarten (Dutch part)"
  },
  {"id": 202, "code": "421", "shortname": "SVK", "name": "Slovakia"},
  {"id": 203, "code": "386", "shortname": "SVN", "name": "Slovenia"},
  {"id": 204, "code": "677", "shortname": "SLB", "name": "Solomon Islands"},
  {"id": 205, "code": "252", "shortname": "SOM", "name": "Somalia"},
  {"id": 206, "code": "27", "shortname": "ZAF", "name": "South Africa"},
  {
    "id": 207,
    "code": "500",
    "shortname": "SGS",
    "name": "South Georgia and the South Sandwich Islands"
  },
  {"id": 208, "code": "211", "shortname": "SSD", "name": "South Sudan"},
  {"id": 209, "code": "34", "shortname": "ESP", "name": "Spain"},
  {"id": 210, "code": "94", "shortname": "LKA", "name": "Sri Lanka"},
  {"id": 211, "code": "249", "shortname": "SDN", "name": "Sudan"},
  {"id": 212, "code": "597", "shortname": "SUR", "name": "Suriname"},
  {
    "id": 213,
    "code": "47",
    "shortname": "SJM",
    "name": "Svalbard and Jan Mayen"
  },
  {"id": 214, "code": "268", "shortname": "SWZ", "name": "Swaziland"},
  {"id": 215, "code": "46", "shortname": "SWE", "name": "Sweden"},
  {"id": 216, "code": "41", "shortname": "CHE", "name": "Switzerland"},
  {
    "id": 217,
    "code": "963",
    "shortname": "SYR",
    "name": "Syrian Arab Republic"
  },
  {
    "id": 218,
    "code": "886",
    "shortname": "TWN",
    "name": "Taiwan, Province of China"
  },
  {"id": 219, "code": "992", "shortname": "TJK", "name": "Tajikistan"},
  {
    "id": 220,
    "code": "255",
    "shortname": "TZA",
    "name": "Tanzania, United Republic of"
  },
  {"id": 221, "code": "66", "shortname": "THA", "name": "Thailand"},
  {"id": 222, "code": "670", "shortname": "TLS", "name": "Timor-Leste"},
  {"id": 223, "code": "228", "shortname": "TGO", "name": "Togo"},
  {"id": 224, "code": "690", "shortname": "TKL", "name": "Tokelau"},
  {"id": 225, "code": "676", "shortname": "TON", "name": "Tonga"},
  {
    "id": 226,
    "code": "1 868",
    "shortname": "TTO",
    "name": "Trinidad and Tobago"
  },
  {"id": 227, "code": "216", "shortname": "TUN", "name": "Tunisia"},
  {"id": 228, "code": "90", "shortname": "TUR", "name": "Turkey"},
  {"id": 229, "code": "993", "shortname": "TKM", "name": "Turkmenistan"},
  {
    "id": 230,
    "code": "1 649",
    "shortname": "TCA",
    "name": "Turks and Caicos Islands"
  },
  {"id": 231, "code": "688", "shortname": "TUV", "name": "Tuvalu"},
  {"id": 232, "code": "256", "shortname": "UGA", "name": "Uganda"},
  {"id": 233, "code": "380", "shortname": "UKR", "name": "Ukraine"},
  {
    "id": 234,
    "code": "971",
    "shortname": "ARE",
    "name": "United Arab Emirates"
  },
  {"id": 235, "code": "44", "shortname": "GBR", "name": "United Kingdom"},
  {"id": 237, "code": "1", "shortname": "USA", "name": "United States"},
  {
    "id": 236,
    "code": "1 808",
    "shortname": "UMI",
    "name": "United States Minor Outlying Islands"
  },
  {"id": 238, "code": "598", "shortname": "URY", "name": "Uruguay"},
  {"id": 239, "code": "998", "shortname": "UZB", "name": "Uzbekistan"},
  {"id": 240, "code": "678", "shortname": "VUT", "name": "Vanuatu"},
  {"id": 241, "code": "58", "shortname": "VEN", "name": "Venezuela"},
  {"id": 242, "code": "84", "shortname": "VNM", "name": "Vietnam"},
  {
    "id": 243,
    "code": "1 284",
    "shortname": "VGB",
    "name": "Virgin Islands, British"
  },
  {
    "id": 244,
    "code": "1 340",
    "shortname": "VIR",
    "name": "Virgin Islands, U.S."
  },
  {"id": 245, "code": "681", "shortname": "WLF", "name": "Wallis and Futuna"},
  {"id": 246, "code": "212 28", "shortname": "ESH", "name": "Western Sahara"},
  {"id": 247, "code": "967", "shortname": "YEM", "name": "Yemen"},
  {"id": 248, "code": "260", "shortname": "ZMB", "name": "Zambia"},
  {"id": 249, "code": "263", "shortname": "ZWE", "name": "Zimbabwe"}
];

List<String> SpecialitiesFilter = [
  'Audiologist',
  'Bariatric Surgeon (Obesity)',
  'Behavioral Therapist',
  'Cardiologist (Heart)',
  'Chiropractor (Alternative Medicine)',
  'Clinical Physiologist',
  'Cupping Therapist (Alternative Medicine)',
  'Dental Hygienist',
  'Dermatologist (Skin)',
  'Dietitian (Nutrition)',
  'Educational Psychologist',
  'Emergency Medicine',
  'Endocrinologist (Hormones)',
  'Endodontic',
  'E.N.T. (Ear, Nose &amp; Throat)',
  'Family Medicine',
  'Gastroenterologist (Stomach)',
  'General Dentist',
  'General Practitioner (GP)',
  'General Surgeon',
  'Geriatrician (Elderly)',
  'Gynecologist',
  'Hand Surgeon',
  'Internal Medicine',
  'IVF (In Vitro Fertilizer)',
  'Matron',
  'Medical Aesthetician (Cosmetic)',
  'Nephrologist (Kidney)',
  'Neurologist (Brain)',
  'Neuromuscular Therapist',
  'Neurosurgeon (Brain)',
  'Nutritionist',
  'Nurse',
  'Pedodonist (Pediatric Dentist)',
  'Periodontics',
  'Physiatrist',
  'Physiotherapist',
  'Plastic Surgeon',
  'Prosthodontics',
  'Psychiatrist (Mental Health)',
  'Public Health',
  'Pulmonologist (Lungs)',
  'Radiologist',
  'Reproductive Medicine (Fertility)',
  'Restorative Dentist',
  'Rheumatologist (Joint)',
  'Spine Surgeon',
  'Surgeon',
  'Traditional African Medicine',
  'Traditional Chinese Medicine',
  'Traditional Indian Medicine',
  'Urologist',
  'Vascular Surgeon'
];

List<String> treatmentList = [
  'Allergist',
  'Cardiologist',
  'Coordinating healthcare',
  'Dermatologist',
  'Diagnosis and treatment',
  'Family practice',
  'Endocrinologist',
  'Gastroenterologist',
  'General practice',
  'Geneticist',
  'Geriatric specialists',
  'Gynecologist',
  'Information and advice',
  'Internist',
  'Health check-ups',
  'Hematologist',
  'Medical tests',
  'Nephrologist',
  'Neurologist',
  'Nutrition advice',
  'Ophthalmologist',
  'Otolaryngologist',
  "Primary care",
  'Pediatrician',
  'Prescription',
  'Plastic surgeons',
  'Podiatrist',
  'Pulmonologist',
  'Psychiatrists',
  'Oncologist',
  'Osteopath',
  'Radiologists'
];

List<String> doctorsExperience = [
  '1-3 Years',
  '4–6 Years',
  '7–9 Years',
  '10–12 Years',
  '13-Years Above'
];

List<String> doctorPrice = [
  '0 – 2500',
  '2501 – 5000',
  '5001 – 7500',
  '7501 – 10,000',
  '10,001 – 15,000',
  '15,000 – Above'
];

List<String> bookClass = [
  'Standard',
  'Future',
  'Urgent',
  'Private',
  'VIP',
  'VVIP'
];

List<String> consultationShift = [
  'Early Morning',
  'Morning',
  'Noon',
  'Evening',
  'Night',
  'Mid Night',
  'Rounds'
];

List<String> HospitalClinic = [
  'First Consultants Medical Centre',
  'Lagoon Hospital',
  'Tranquil &amp; Quest',
  'Duchess International Hospital',
  '2Premier Specialist Medical Centre',
  'Saint Francois Medical Center',
  'St. Nicholas Hospital',
  'TAAL Specialist Hospital',
  'The Pennisula Hospital',
  'Adequate Medcare',
  'Cedar Group Hospital',
  'Citizen Medical Centre',
  'Dako Dako Medical Centre',
  'El-Dunamis Medical Center'
];

List<String> doctorServices = ['None', 'None', 'None', 'None'];

List<String> SurgeryAndTrans = [
  'Zenith Medical & Kidney Centre',
  'Clarion Call Kidney Transplant program',
  'Grandville Medical Center',
  'Primus Hospital Nigeria',
  'Clearview Hospital',
  'Vedic Lifecare Hospital',
  'Primrose Specialist Hospital',
  'St. I\'ve Hospital',
  'Reddington Hospital',
  'Eko Hospital',
  'St. Nicholas Hospital',
  'Lagoon Hospital'
];

List<String> DiagnosisTest = [
  'Vcare Diagnosis Limited',
  'Hallmark Diagnostic Center',
  'O2 Medical Diagnostic Services',
  'Accunalysus Medical Diagnostic',
  'Landmark Diagnostics',
  'EL-Lab Medical Diagnostics and Research Center',
  'Synlab',
  'RiverLabs',
  'Cleveland Clinic',
  'Everight Diagnostic & Lab'
];

List<String> ServicesList = [
  'Dental & Tooth Cleaning',
  'Lab. Test',
  'Surgical',
  'Diagnostic',
  'Ambulances',
  'chiropractic',
  'Mental',
  'Substance abuse',
  'Fluid & Allergy',
  'Anesthesiology',
  'Anticoagulation',
  'Audiology',
  'Breast Cancer',
  'Cardiac',
  'Dialysis',
  'Dermatology',
  'Diabetes',
  'Diagnostic',
  'Otorhinolaryngology',
  'Orthopedics'
];

List homeItem1 = [
  {
    'icon': '',
    'title': 'My Customers',
    'desc': 'Manage All your Customers records and billing with just a click.'
  },
  {
    'icon': '',
    'title': 'Appointments',
    'desc':
        'See all incoming and past appointments, you can also reschedule and accept or reject appoinments'
  },
  {
    'icon': '',
    'title': 'Order medicines',
    'desc':
        'Get a low rate of interest for all medications from local and international suppliers'
  }
];

List homeItem2 = [
  {
    'icon': '',
    'title': 'Health brands',
    'desc':
        'Sale and Order Health Suppliers from Top Brands around the world with much hassles.'
  },
  {
    'icon': '',
    'title': 'Book On Whatsapp',
    'desc':
        'Speak to our Support Agents to Book and order products and services from whatsapp.'
  },
  {
    'icon': '',
    'title': 'Create Invoices',
    'desc':
        'You can manage all your customers and suppliers invoices including in app billings .'
  },
  {
    'icon': '',
    'title': 'QR Scanner',
    'desc':
        'You can scan QR code to accept payments from your customers aywhere and anytime.'
  },
  {
    'icon': '',
    'title': 'Manage Stocks',
    'desc':
        'You can create, edit and manage your stocks in multiple stores and see your stock movements'
  }
];

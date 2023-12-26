import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Main_Notifications
  {
    '8ewqy5xl': {
      'en': 'Notifications',
      'ar': '',
    },
    'awo14bjo': {
      'en': 'Below are your notifications',
      'ar': '',
    },
    'wyglogyk': {
      'en': 'FlutterFlow CRM App:',
      'ar': 'تطبيق FlutterFlow لإدارة علاقات العملاء:',
    },
    'a9cx9kgq': {
      'en': ' Begin Work',
      'ar': 'بدء العمل',
    },
    '9uqw60ac': {
      'en': 'SOW Change Order',
      'ar': 'SOW تغيير الطلب',
    },
    'wpmrva4n': {
      'en': 'FlutterFlow CRM App',
      'ar': 'تطبيق FlutterFlow لإدارة علاقات العملاء',
    },
    'i5cwme4h': {
      'en': 'Jul 8, at 4:31pm',
      'ar': '8 يوليو، الساعة 4:31 مساءً',
    },
    '446140md': {
      'en': 'Jeremiah Goldsten ',
      'ar': 'جيريميا جولدستن',
    },
    'z96oqe9i': {
      'en': 'accepted a request',
      'ar': 'قبلت الطلب',
    },
    '9hkn5wbk': {
      'en': 'SOW Change Order',
      'ar': 'SOW تغيير الطلب',
    },
    'z9uvnsar': {
      'en': 'FlutterFlow CRM App',
      'ar': 'تطبيق FlutterFlow لإدارة علاقات العملاء',
    },
    '433l5p9f': {
      'en':
          '\"Notifications and reminders informing users about upcoming classes and training schedules will be sent to them via email, SMS or notifications within the application.\"',
      'ar':
          '\"سيتم إرسال الإخطارات والتذكيرات لإعلام المستخدمين بالفصول القادمة وجداول التدريب عبر البريد الإلكتروني أو الرسائل النصية القصيرة أو الإشعارات داخل التطبيق.\"',
    },
    '229rrfjz': {
      'en': 'Jul 8, at 4:30pm',
      'ar': '8 يوليو، الساعة 4:30 مساءً',
    },
    'n1rh9g7k': {
      'en': 'Randy Rudolph ',
      'ar': 'راندي رودولف',
    },
    'szxyfwog': {
      'en': 'sent a SOW Change Order for ',
      'ar': 'أرسل أمر تغيير SOW لـ',
    },
    'y7txnevq': {
      'en': 'FlutterFlow CRM APP',
      'ar': 'تطبيق FlutterFlow لإدارة علاقات العملاء',
    },
    'i1ybibdu': {
      'en': 'SOW Change Order',
      'ar': 'SOW تغيير الطلب',
    },
    '3kcgepl3': {
      'en': 'FlutterFlow CRM App',
      'ar': 'تطبيق FlutterFlow لإدارة علاقات العملاء',
    },
    'lt0ukpoj': {
      'en':
          '\"Please review the updates to this document and get back with me.\"',
      'ar': '\"يُرجى مراجعة التحديثات على هذه الوثيقة والتواصل معي مرة أخرى.\"',
    },
    'pq19162b': {
      'en': 'Jul 8, at 2:20pm',
      'ar': '8 يوليو، الساعة 2:20 مساءً',
    },
    'jdnz8183': {
      'en': '--',
      'ar': '--',
    },
  },
  // Main_Users
  {
    'ye2ifdlo': {
      'en': 'Members',
      'ar': '',
    },
    'v37nankn': {
      'en': 'Below are a list of members of your team.',
      'ar': '',
    },
    'v5eln8p6': {
      'en': 'Search all users...',
      'ar': '',
    },
    'pbdznq09': {
      'en': 'All',
      'ar': '',
    },
    '3qe54s33': {
      'en': 'Owners',
      'ar': '',
    },
    'mkbmodj8': {
      'en': 'Editors',
      'ar': '',
    },
    'chndgesn': {
      'en': 'Viewers',
      'ar': '',
    },
    'mdsb1215': {
      'en': 'All',
      'ar': '',
    },
    'f2g5mx74': {
      'en': 'All',
      'ar': '',
    },
    'rcrz45mw': {
      'en': 'Name',
      'ar': '',
    },
    'xc3ajner': {
      'en': 'Last Active',
      'ar': '',
    },
    'ztrby41z': {
      'en': 'Title',
      'ar': '',
    },
    'uqpb0ixa': {
      'en': 'Status',
      'ar': '',
    },
    '3bzcdgrg': {
      'en': 'Randy Rodriguez',
      'ar': '',
    },
    '68tic8wo': {
      'en': 'randy@domainname.com',
      'ar': '',
    },
    'fq58v68t': {
      'en': '5 mins ago',
      'ar': '',
    },
    'lnsllh1h': {
      'en': 'Head of Design',
      'ar': '',
    },
    '20gsxm4y': {
      'en': 'Viewer',
      'ar': '',
    },
    '262kpfr1': {
      'en': 'Randy Rodriguez',
      'ar': '',
    },
    'wzkuur7e': {
      'en': 'randy@domainname.com',
      'ar': '',
    },
    '4z5oo0q9': {
      'en': '5 mins ago',
      'ar': '',
    },
    'rp34xxu9': {
      'en': 'Head of Design',
      'ar': '',
    },
    '0dht92jk': {
      'en': 'Viewer',
      'ar': '',
    },
    'bfli15gf': {
      'en': 'Randy Rodriguez',
      'ar': '',
    },
    'ilqoqpaz': {
      'en': 'randy@domainname.com',
      'ar': '',
    },
    'ld2yovjo': {
      'en': '5 mins ago',
      'ar': '',
    },
    'unhn8bze': {
      'en': 'Head of Design',
      'ar': '',
    },
    '94oadi1n': {
      'en': 'Viewer',
      'ar': '',
    },
    'rot8f5ro': {
      'en': 'Randy Rodriguez',
      'ar': '',
    },
    'w3due873': {
      'en': 'randy@domainname.com',
      'ar': '',
    },
    'v4jt9m29': {
      'en': '5 mins ago',
      'ar': '',
    },
    'i1bf2bvd': {
      'en': 'Head of Design',
      'ar': '',
    },
    'wgvd0m7v': {
      'en': 'Viewer',
      'ar': '',
    },
    '0rhu594q': {
      'en': 'Randy Rodriguez',
      'ar': '',
    },
    'xdqmxi1h': {
      'en': 'randy@domainname.com',
      'ar': '',
    },
    'r8yktrce': {
      'en': '5 mins ago',
      'ar': '',
    },
    '5vfny9p6': {
      'en': 'Head of Design',
      'ar': '',
    },
    '9z1e88pz': {
      'en': 'Owner',
      'ar': '',
    },
    'mhl64e3r': {
      'en': '__',
      'ar': '',
    },
  },
  // Main_Recent
  {
    'nnxzq7b8': {
      'en': 'Recent Orders',
      'ar': '',
    },
    'h8m2expt': {
      'en': 'Below are your most recent orders',
      'ar': '',
    },
    '25ykxb8z': {
      'en': 'Order Number',
      'ar': '',
    },
    'a2n2swno': {
      'en': 'Weight',
      'ar': '',
    },
    'm6ps74bp': {
      'en': 'Status',
      'ar': '',
    },
    '5mdw1wqn': {
      'en': 'Amount',
      'ar': '',
    },
    'fozuqwnu': {
      'en': 'Order #: ',
      'ar': '',
    },
    'tniwb89f': {
      'en': '429242424',
      'ar': '',
    },
    'r8pvrt3f': {
      'en': 'Mon. July 3rd',
      'ar': '',
    },
    '99g9qmb7': {
      'en': '2.5 lbs',
      'ar': '',
    },
    'l35o0yx5': {
      'en': 'Shipped',
      'ar': '',
    },
    'qjqkx4fw': {
      'en': '\$1.50',
      'ar': '',
    },
    'ic6bzbtl': {
      'en': 'Order #: ',
      'ar': '',
    },
    'iu1soeko': {
      'en': '429242424',
      'ar': '',
    },
    'ei4a1fg3': {
      'en': 'Mon. July 3rd',
      'ar': '',
    },
    'gycrte9d': {
      'en': '2.5 lbs',
      'ar': '',
    },
    '8ebxgh66': {
      'en': 'Shipped',
      'ar': '',
    },
    'sz5xw26v': {
      'en': '\$11.42',
      'ar': '',
    },
    'vh7mgf87': {
      'en': 'Order #: ',
      'ar': '',
    },
    '5x67l042': {
      'en': '429242424',
      'ar': '',
    },
    'z1529oxc': {
      'en': 'Mon. July 3rd',
      'ar': '',
    },
    'drhlzufq': {
      'en': '2.5 lbs',
      'ar': '',
    },
    'gotyn6o0': {
      'en': 'Accepted',
      'ar': '',
    },
    'fk1mrxkd': {
      'en': '\$56.89',
      'ar': '',
    },
    'pmpf7ymi': {
      'en': 'Order #: ',
      'ar': '',
    },
    'sy4pjn7d': {
      'en': '429242424',
      'ar': '',
    },
    'qbt9iu6e': {
      'en': 'Mon. July 3rd',
      'ar': '',
    },
    'wpc1dv5h': {
      'en': '2.5 lbs',
      'ar': '',
    },
    'ussgq885': {
      'en': 'Accepted',
      'ar': '',
    },
    'sd9jnpf9': {
      'en': '\$15.12',
      'ar': '',
    },
    'kxcnn9zl': {
      'en': '__',
      'ar': '',
    },
  },
  // Main_Profile
  {
    'ka1t8srq': {
      'en': 'Sameh Ouda',
      'ar': '',
    },
    'nccav291': {
      'en': 'samehoudaunit@gmail.com',
      'ar': '',
    },
    'h01xzsvj': {
      'en': '2,200',
      'ar': '',
    },
    'hg5gtyg3': {
      'en': 'Orders Placed',
      'ar': '',
    },
    'c09eu4in': {
      'en': '\$212.4k',
      'ar': '',
    },
    '1ogcuuy0': {
      'en': 'Money Earned',
      'ar': '',
    },
    'ni3gco4m': {
      'en': 'My Account Information',
      'ar': '',
    },
    'ts700fft': {
      'en': 'Change Password',
      'ar': '',
    },
    '8jcqrokd': {
      'en': 'Edit Profile',
      'ar': '',
    },
    'ihi4u446': {
      'en': 'Support',
      'ar': '',
    },
    'qqsqal1p': {
      'en': 'Tutorial',
      'ar': '',
    },
    'bs1dbn1y': {
      'en': 'Submit a Bug',
      'ar': '',
    },
    '92nwrwe6': {
      'en': 'Submit a Feature Request',
      'ar': '',
    },
    'nmgf4ui0': {
      'en': 'Light ',
      'ar': '',
    },
    'ewqq6eg1': {
      'en': 'Dark',
      'ar': '',
    },
    'fjatx62f': {
      'en': 'Log Out',
      'ar': '',
    },
    '14q8qgvj': {
      'en': '__',
      'ar': '',
    },
  },
  // Main_Dashboard
  {
    's0sdwnuy': {
      'en': 'Hello, ',
      'ar': '',
    },
    'bfw86c1w': {
      'en': 'Sameh Ouda',
      'ar': '',
    },
    'ig5fdm1q': {
      'en': 'Below is an overview of your results',
      'ar': '',
    },
    '7yp42q40': {
      'en': 'Current ranking',
      'ar': '',
    },
    'tdaza1fe': {
      'en': '8',
      'ar': '',
    },
    'tf6dr43n': {
      'en': 'Number of Tournaments',
      'ar': '',
    },
    'am8w4u7x': {
      'en': '40',
      'ar': '',
    },
    'zoagrr0s': {
      'en': 'Total points',
      'ar': '',
    },
    'mih07tv9': {
      'en': '1402',
      'ar': '',
    },
    '64qtzm5o': {
      'en': 'Total number of matches',
      'ar': '',
    },
    'ckb31hhn': {
      'en': '806',
      'ar': '',
    },
    '5021a9z8': {
      'en': 'Performance | Won Challenges',
      'ar': '',
    },
    'fhm75c8k': {
      'en': '400',
      'ar': '',
    },
    '9ifa12i9': {
      'en': '55%',
      'ar': '',
    },
    'cogf7e7t': {
      'en': 'Sameh Ouda',
      'ar': '',
    },
    '9gm44du0': {
      'en': '18-578-897',
      'ar': '',
    },
    '6qju4tmn': {
      'en': 'Rank  8th',
      'ar': '',
    },
    'ae4gw1ug': {
      'en': 'Recent Orders',
      'ar': '',
    },
    'ee4ho8kv': {
      'en': 'Create tables and ui elements that work below.',
      'ar': '',
    },
    'qgtf675e': {
      'en': 'Add New',
      'ar': '',
    },
    '6xl8bgxg': {
      'en': 'Work Type',
      'ar': '',
    },
    '0h7859j5': {
      'en': 'Assigned User',
      'ar': '',
    },
    '4zu8w6zf': {
      'en': 'Contract Amount',
      'ar': '',
    },
    'bhho0z4o': {
      'en': 'Status',
      'ar': '',
    },
    'nwjxux3q': {
      'en': 'Actions',
      'ar': '',
    },
    't3zke9q8': {
      'en': 'Design Work',
      'ar': '',
    },
    'nqlxoqx4': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    '1uw5wrn2': {
      'en': 'Business Name',
      'ar': '',
    },
    'ij2un4rs': {
      'en': '\$2,100',
      'ar': '',
    },
    'iv1ovl11': {
      'en': 'Paid',
      'ar': '',
    },
    'g6asa6z8': {
      'en': 'Design Work',
      'ar': '',
    },
    's9k0362v': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'y81l8n58': {
      'en': 'Business Name',
      'ar': '',
    },
    'b1pxjxyh': {
      'en': '\$2,100',
      'ar': '',
    },
    'y1t858ky': {
      'en': 'Paid',
      'ar': '',
    },
    '5y11ooii': {
      'en': 'Design Work',
      'ar': '',
    },
    'y7s7uoxf': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'x0yimyju': {
      'en': 'Business Name',
      'ar': '',
    },
    't28og9hw': {
      'en': '\$2,100',
      'ar': '',
    },
    'jsn0w95e': {
      'en': 'Paid',
      'ar': '',
    },
    'siyzj9x8': {
      'en': 'Design Work',
      'ar': '',
    },
    'wlcwtvae': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    '6cgg8jwd': {
      'en': 'Business Name',
      'ar': '',
    },
    'hc0hzqzi': {
      'en': '\$2,100',
      'ar': '',
    },
    'x8vgpoqa': {
      'en': 'Paid',
      'ar': '',
    },
    'p5ne6utc': {
      'en': 'Design Work',
      'ar': '',
    },
    's0wou6z6': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'vxwnumjk': {
      'en': 'Business Name',
      'ar': '',
    },
    'qwmyvbgf': {
      'en': '\$2,100',
      'ar': '',
    },
    'ifiymxnn': {
      'en': 'Pending',
      'ar': '',
    },
    'qy0ze18k': {
      'en': 'Design Work',
      'ar': '',
    },
    '1rw2mhdx': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'aalj9spp': {
      'en': 'Business Name',
      'ar': '',
    },
    'iazwfrfg': {
      'en': '\$2,100',
      'ar': '',
    },
    'd52mu2hd': {
      'en': 'Pending',
      'ar': '',
    },
    'ab2a6bo8': {
      'en': 'Design Work',
      'ar': '',
    },
    'u1n4tqbg': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'ajwmuuoz': {
      'en': 'Business Name',
      'ar': '',
    },
    'xny7vafi': {
      'en': '\$2,100',
      'ar': '',
    },
    'p7y6ltd5': {
      'en': 'Pending',
      'ar': '',
    },
    'r7rl67pq': {
      'en': 'Coming Challenges',
      'ar': '',
    },
    'brpoz53c': {
      'en': 'Here you can find you next challenges',
      'ar': '',
    },
    '18aiet66': {
      'en': 'Work Type',
      'ar': '',
    },
    '9b5attli': {
      'en': 'Assigned Player',
      'ar': '',
    },
    '3id7eq21': {
      'en': 'Contract Amount',
      'ar': '',
    },
    'ryeyh516': {
      'en': 'Rank',
      'ar': '',
    },
    '7wizwyxu': {
      'en': 'Action',
      'ar': '',
    },
    'tg7dwlnn': {
      'en': 'Design Work',
      'ar': '',
    },
    'gl9ozqqu': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'klguk48h': {
      'en': 'Business Name',
      'ar': '',
    },
    '8rveyjrn': {
      'en': '\$2,100',
      'ar': '',
    },
    'r0rxmezw': {
      'en': 'Paid',
      'ar': '',
    },
    '5bwzm8bv': {
      'en': 'Design Work',
      'ar': '',
    },
    'zao0bphw': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'esfunb8y': {
      'en': 'Business Name',
      'ar': '',
    },
    'jith65u0': {
      'en': '\$2,100',
      'ar': '',
    },
    'egcxixuw': {
      'en': 'Paid',
      'ar': '',
    },
    'm4l4ccy9': {
      'en': 'Design Work',
      'ar': '',
    },
    '65xuqzmg': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'edr2vbo3': {
      'en': 'Business Name',
      'ar': '',
    },
    '7119sowl': {
      'en': '\$2,100',
      'ar': '',
    },
    'ylks6ryy': {
      'en': 'Paid',
      'ar': '',
    },
    'ragn48ub': {
      'en': 'Design Work',
      'ar': '',
    },
    '88wtepip': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    '855t0o9p': {
      'en': 'Business Name',
      'ar': '',
    },
    'vanb5fo2': {
      'en': '\$2,100',
      'ar': '',
    },
    'z5ucyp6k': {
      'en': 'Paid',
      'ar': '',
    },
    'xga8boie': {
      'en': 'Design Work',
      'ar': '',
    },
    'utsiuua5': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    '55q75j9q': {
      'en': 'Business Name',
      'ar': '',
    },
    '0yrv1mfb': {
      'en': '\$2,100',
      'ar': '',
    },
    'wh57glnw': {
      'en': 'Pending',
      'ar': '',
    },
    '0s7t4qw8': {
      'en': 'Design Work',
      'ar': '',
    },
    'v1xn1muo': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'lmqnn8um': {
      'en': 'Business Name',
      'ar': '',
    },
    'nzs1ops4': {
      'en': '\$2,100',
      'ar': '',
    },
    'qjvdrl4j': {
      'en': 'Pending',
      'ar': '',
    },
    '3dud5v1c': {
      'en': 'Design Work',
      'ar': '',
    },
    'y4m01235': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'q9oiv80x': {
      'en': 'Business Name',
      'ar': '',
    },
    'lcbqvajq': {
      'en': '\$2,100',
      'ar': '',
    },
    'yx6s49sd': {
      'en': 'Pending',
      'ar': '',
    },
    'jzdu1fte': {
      'en': 'News',
      'ar': '',
    },
    'gudj390a': {
      'en': 'World News',
      'ar': '',
    },
    '5tob1gt8': {
      'en': 'Cairo Tournament',
      'ar': '',
    },
    'g4lmpng3': {
      'en': 'Squash Cairo Tournament starts on January 2024',
      'ar': '',
    },
    'kh0fgu10': {
      'en': '16 friends played',
      'ar': '',
    },
    '8prhugv2': {
      'en': 'View related topics',
      'ar': '',
    },
    'osiia7ri': {
      'en': '__',
      'ar': '',
    },
  },
  // TransactionHistory
  {
    'zn28birx': {
      'en': 'Order Details',
      'ar': '',
    },
    'ksg6hoy0': {
      'en': 'Order #49224222',
      'ar': '',
    },
    'au5ng71j': {
      'en': 'Below are the details of your order.',
      'ar': '',
    },
    '8wav2yxp': {
      'en': 'Payment Details',
      'ar': '',
    },
    '9l8ooi5x': {
      'en': 'Transaction ID',
      'ar': '',
    },
    'xww3iba5': {
      'en': 'TXN123456789',
      'ar': '',
    },
    '7vslc6r2': {
      'en': 'Date',
      'ar': '',
    },
    'uwvx977j': {
      'en': 'Fri, Jun 23 - 4:30pm',
      'ar': '',
    },
    '55rubwcl': {
      'en': 'Amount',
      'ar': '',
    },
    '07jsutc6': {
      'en': '\$500.00',
      'ar': '',
    },
    '9oku2zyv': {
      'en': 'Status',
      'ar': '',
    },
    '0nfhh7h6': {
      'en': 'Completed',
      'ar': '',
    },
    'wykg0nbq': {
      'en': 'Payment Method',
      'ar': '',
    },
    'qmkk7nwo': {
      'en': 'Visa ****1234',
      'ar': '',
    },
    'f2dtix4b': {
      'en': 'Transaction Breakdown',
      'ar': '',
    },
    '4oteco28': {
      'en': 'Subtotal',
      'ar': '',
    },
    'sgi363jc': {
      'en': '\$480.00',
      'ar': '',
    },
    'fp5rxlk6': {
      'en': 'Tax',
      'ar': '',
    },
    'wglm7c5i': {
      'en': '\$20.00',
      'ar': '',
    },
    'q14r0ry9': {
      'en': 'Total',
      'ar': '',
    },
    'cgqy7apu': {
      'en': '\$500.00',
      'ar': '',
    },
    'c2xwa3ac': {
      'en': 'Notes',
      'ar': '',
    },
    'qaaa3s0m': {
      'en': 'Transaction for monthly subscription.',
      'ar': '',
    },
    's70ps81o': {
      'en': 'Customer Details',
      'ar': '',
    },
    'nxajnugl': {
      'en': 'Haily Brown',
      'ar': '',
    },
    'g9zh4mzu': {
      'en': '@brownisthenewblack',
      'ar': '',
    },
    'ytp6ujv4': {
      'en': 'Address',
      'ar': '',
    },
    '3veifkev': {
      'en': '123 West Hollywood Blvd. San Mateo, CA. 90294',
      'ar': '',
    },
    'fgpc40vg': {
      'en': 'Report Now',
      'ar': '',
    },
    '74clqgs5': {
      'en': 'Message',
      'ar': '',
    },
    'o2ox1ae8': {
      'en': 'Customer Details',
      'ar': '',
    },
    'kbq8cq8k': {
      'en': 'Haily Brown',
      'ar': '',
    },
    'cffx8qfg': {
      'en': '@brownisthenewblack',
      'ar': '',
    },
    'sqccl0tb': {
      'en': 'Address',
      'ar': '',
    },
    '1j7otk8r': {
      'en': '123 West Hollywood Blvd. San Mateo, CA. 90294',
      'ar': '',
    },
    '2la9n6hr': {
      'en': 'Message Customer',
      'ar': '',
    },
    '7ah6g0t6': {
      'en': 'Report Now',
      'ar': '',
    },
    '0zpr6lj3': {
      'en': 'Order Details',
      'ar': '',
    },
  },
  // responsive_profile
  {
    '9hk86nbf': {
      'en': 'check.io',
      'ar': '',
    },
    'knvlj4pz': {
      'en': 'Andrew D.',
      'ar': '',
    },
    'tko0q2fz': {
      'en': 'admin@gmail.com',
      'ar': '',
    },
    'ncjl1cn8': {
      'en': 'Dashboard',
      'ar': '',
    },
    '64o50drf': {
      'en': 'Chats',
      'ar': '',
    },
    '05niyn0v': {
      'en': 'Projects',
      'ar': '',
    },
    'og24kcbh': {
      'en': 'Explore',
      'ar': '',
    },
    '4h0layh9': {
      'en': 'Overview',
      'ar': '',
    },
    'fvyq5gfw': {
      'en': 'Below is a company overview',
      'ar': '',
    },
    'y81nnyza': {
      'en': 'Andrew D.',
      'ar': '',
    },
    'np93qs9a': {
      'en': 'admin@gmail.com',
      'ar': '',
    },
    'exmys9dm': {
      'en': 'Income this Month',
      'ar': '',
    },
    'g72ts8fn': {
      'en': '\$567k',
      'ar': '',
    },
    'd724cq9u': {
      'en': 'Income YTD',
      'ar': '',
    },
    'c12m4mxo': {
      'en': '5.7m',
      'ar': '',
    },
    'w2e1sz8u': {
      'en': 'New Customers',
      'ar': '',
    },
    'jjlv3hty': {
      'en': '2.5k',
      'ar': '',
    },
    'wsmbheur': {
      'en': 'Total Orders',
      'ar': '',
    },
    'zvlxq3gm': {
      'en': '6.4k',
      'ar': '',
    },
    '32dllrl0': {
      'en': 'Outstanding Balance',
      'ar': '',
    },
    '5ohmi16x': {
      'en': '\$529,204',
      'ar': '',
    },
    'gp0ayrge': {
      'en': '55%',
      'ar': '',
    },
    'tu4tdh1u': {
      'en': 'Outstanding Balance',
      'ar': '',
    },
    'nd3uax4y': {
      'en': '\$529,204',
      'ar': '',
    },
    'vxl9veie': {
      'en': '55%',
      'ar': '',
    },
    'jhwthbwa': {
      'en': 'Network Requests',
      'ar': '',
    },
    'j189de8x': {
      'en': 'You’re using 80% of available requests.',
      'ar': '',
    },
    'ozkgbnkm': {
      'en': '562k',
      'ar': '',
    },
    '4tfie1rj': {
      'en': 'You’ve almost reached your limit',
      'ar': '',
    },
    '7dvixroj': {
      'en':
          'You have used 80% of your available requests. Upgrade plan to make more network requests.',
      'ar': '',
    },
    '84wyou4d': {
      'en': 'Completed Requests',
      'ar': '',
    },
    '2rhpcsaw': {
      'en': 'You’re averaging 62% completed requests',
      'ar': '',
    },
    'ecbpx3pu': {
      'en': '262k',
      'ar': '',
    },
    '7rgt6pjw': {
      'en': 'You’ve almost reached your limit',
      'ar': '',
    },
    'lqu1an3o': {
      'en':
          'You have used 80% of your available requests. Upgrade plan to make more network requests.',
      'ar': '',
    },
    'e1bolhzq': {
      'en': 'Outstanding Balance',
      'ar': '',
    },
    'ch8796do': {
      'en': '\$529,204',
      'ar': '',
    },
    'mwzhetu9': {
      'en': '55%',
      'ar': '',
    },
    'zzlm1zyg': {
      'en': 'Outstanding Balance',
      'ar': '',
    },
    '5xps5hi5': {
      'en': '\$529,204',
      'ar': '',
    },
    '9t2yg7e5': {
      'en': '55%',
      'ar': '',
    },
    '8zviy32v': {
      'en': 'Network Requests',
      'ar': '',
    },
    'apm1faec': {
      'en': 'You’re using 80% of available requests.',
      'ar': '',
    },
    'ghgd07uk': {
      'en': '562k',
      'ar': '',
    },
    '6foj6zmz': {
      'en': 'You’ve almost reached your limit',
      'ar': '',
    },
    'd11kz44h': {
      'en':
          'You have used 80% of your available requests. Upgrade plan to make more network requests.',
      'ar': '',
    },
    'icrztdfc': {
      'en': 'Completed Requests',
      'ar': '',
    },
    'd0vznui2': {
      'en': 'You’re averaging 62% completed requests',
      'ar': '',
    },
    'y2z83bai': {
      'en': '262k',
      'ar': '',
    },
    'lwlnfz56': {
      'en': 'You’ve almost reached your limit',
      'ar': '',
    },
    'pw4262y4': {
      'en':
          'You have used 80% of your available requests. Upgrade plan to make more network requests.',
      'ar': '',
    },
    '1tx154uy': {
      'en': 'Recent Invoices',
      'ar': '',
    },
    'l5fmh6jy': {
      'en': 'Below is a list of recent invoices.',
      'ar': '',
    },
    'wm5vopd5': {
      'en': 'Add New',
      'ar': '',
    },
    'ga8x4qpw': {
      'en': 'Work Type',
      'ar': '',
    },
    'x1bmmiir': {
      'en': 'Assigned User',
      'ar': '',
    },
    'z4e3gkh2': {
      'en': 'Contract Amount',
      'ar': '',
    },
    'jtlfuvjv': {
      'en': 'Status',
      'ar': '',
    },
    'xyvh96pi': {
      'en': 'Actions',
      'ar': '',
    },
    'jpbv123r': {
      'en': 'Design Work',
      'ar': '',
    },
    'sezmurs2': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'wiio7oiz': {
      'en': 'Business Name',
      'ar': '',
    },
    'v5n3phlb': {
      'en': '\$2,100',
      'ar': '',
    },
    'mw6uxzka': {
      'en': 'Paid',
      'ar': '',
    },
    'cp8g6cgy': {
      'en': 'Design Work',
      'ar': '',
    },
    'epehcvyu': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    't85vf4fg': {
      'en': 'Business Name',
      'ar': '',
    },
    '4d87ab26': {
      'en': '\$2,100',
      'ar': '',
    },
    'igtftux5': {
      'en': 'Paid',
      'ar': '',
    },
    'miqecohu': {
      'en': 'Design Work',
      'ar': '',
    },
    'm9ma08so': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    '9l7mmw84': {
      'en': 'Business Name',
      'ar': '',
    },
    '37sh129p': {
      'en': '\$2,100',
      'ar': '',
    },
    '3ps75ftn': {
      'en': 'Paid',
      'ar': '',
    },
    'w8ds0kfc': {
      'en': 'Design Work',
      'ar': '',
    },
    'yuoaysr1': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'ot0c6tg7': {
      'en': 'Business Name',
      'ar': '',
    },
    '07ecm9bo': {
      'en': '\$2,100',
      'ar': '',
    },
    '22861l3s': {
      'en': 'Paid',
      'ar': '',
    },
    'xwlq3ah1': {
      'en': 'Design Work',
      'ar': '',
    },
    '9tsf9m9i': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    '0pese1m9': {
      'en': 'Business Name',
      'ar': '',
    },
    'wq1ds1aq': {
      'en': '\$2,100',
      'ar': '',
    },
    '0g3ukvq6': {
      'en': 'Pending',
      'ar': '',
    },
    '5zh36j91': {
      'en': 'Design Work',
      'ar': '',
    },
    'o6tni5yb': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'nbouez0c': {
      'en': 'Business Name',
      'ar': '',
    },
    '2aato8fk': {
      'en': '\$2,100',
      'ar': '',
    },
    'nu5huljh': {
      'en': 'Pending',
      'ar': '',
    },
    '9za27hjc': {
      'en': 'Design Work',
      'ar': '',
    },
    'do5l9rav': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    '0qxnfksn': {
      'en': 'Business Name',
      'ar': '',
    },
    'v0ibm30m': {
      'en': '\$2,100',
      'ar': '',
    },
    'e6lo99pu': {
      'en': 'Pending',
      'ar': '',
    },
    '7cj0svql': {
      'en': 'My Profile',
      'ar': '',
    },
    'cppe88x7': {
      'en': '__',
      'ar': '',
    },
  },
  // responsive_Test
  {
    'yxx72sto': {
      'en': 'check.io',
      'ar': '',
    },
    'evpqpwyj': {
      'en': 'Dashboard',
      'ar': '',
    },
    'iotp9eg9': {
      'en': 'Chats',
      'ar': '',
    },
    'hbt8se4h': {
      'en': 'Projects',
      'ar': '',
    },
    'vvee90k6': {
      'en': 'My Feed',
      'ar': '',
    },
    'mte5k593': {
      'en': '12',
      'ar': '',
    },
    '5wkc58bj': {
      'en': 'Light Mode',
      'ar': '',
    },
    'b298ljcu': {
      'en': 'Dark Mode',
      'ar': '',
    },
    'd1ob6aeq': {
      'en': 'Casper Ghost',
      'ar': '',
    },
    'k1avq9ly': {
      'en': 'admin@gmail.com',
      'ar': '',
    },
    '27wkn8ja': {
      'en': 'My Feed',
      'ar': '',
    },
    'n8sz1fro': {
      'en': 'Review the recent posts.',
      'ar': '',
    },
    'fxn93zsb': {
      'en': 'Andrew Daniels',
      'ar': '',
    },
    'yaxuq4ij': {
      'en': '@username',
      'ar': '',
    },
    'pmpojad2': {
      'en': ' • ',
      'ar': '',
    },
    'qwtho6p0': {
      'en': '4 mins ago',
      'ar': '',
    },
    'lnypf8yw': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,',
      'ar': '',
    },
    'v3q13bhy': {
      'en': '4',
      'ar': '',
    },
    'vnast4pf': {
      'en': '4',
      'ar': '',
    },
    '4ix0fndn': {
      'en': 'Andrew Daniels',
      'ar': '',
    },
    'o982h35z': {
      'en': '@username',
      'ar': '',
    },
    'pi6rqh7n': {
      'en': ' • ',
      'ar': '',
    },
    'bm7tr23d': {
      'en': '4 mins ago',
      'ar': '',
    },
    'z3myszmx': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,',
      'ar': '',
    },
    'zq0hc57r': {
      'en': '4',
      'ar': '',
    },
    'vaa3a82s': {
      'en': '4',
      'ar': '',
    },
    '1f9et5q1': {
      'en': 'Andrew Daniels',
      'ar': '',
    },
    'c3mtwdsl': {
      'en': '@username',
      'ar': '',
    },
    'd33x3vgz': {
      'en': ' • ',
      'ar': '',
    },
    'qmiuh6m8': {
      'en': '4 mins ago',
      'ar': '',
    },
    'nl3uppqp': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,',
      'ar': '',
    },
    'j9uogpcx': {
      'en': '4',
      'ar': '',
    },
    'fj39k0dc': {
      'en': '4',
      'ar': '',
    },
    '2zefq6xk': {
      'en': 'Andrew Daniels',
      'ar': '',
    },
    'oev9ah5g': {
      'en': '@username',
      'ar': '',
    },
    'oxm47k2m': {
      'en': ' • ',
      'ar': '',
    },
    'u05rlfff': {
      'en': '4 mins ago',
      'ar': '',
    },
    '066edjmk': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,',
      'ar': '',
    },
    '0hoaocqm': {
      'en': '4',
      'ar': '',
    },
    'kro2oq9q': {
      'en': '4',
      'ar': '',
    },
    'xzdgeb0q': {
      'en': 'Andrew Daniels',
      'ar': '',
    },
    'smsegtpy': {
      'en': '@username',
      'ar': '',
    },
    'ycuby8h1': {
      'en': ' • ',
      'ar': '',
    },
    'petmmn0u': {
      'en': '4 mins ago',
      'ar': '',
    },
    'jwmg2bue': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,',
      'ar': '',
    },
    '3sea6bz6': {
      'en': '4',
      'ar': '',
    },
    'zb1t5zaz': {
      'en': '4',
      'ar': '',
    },
    'e3c072zp': {
      'en': 'Andrew Daniels',
      'ar': '',
    },
    'osp9yb0y': {
      'en': '@username',
      'ar': '',
    },
    '18zmgf9m': {
      'en': ' • ',
      'ar': '',
    },
    'drih7aft': {
      'en': '4 mins ago',
      'ar': '',
    },
    'tnpr92m7': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,',
      'ar': '',
    },
    'i5808bao': {
      'en': '4',
      'ar': '',
    },
    'sq00xryu': {
      'en': '4',
      'ar': '',
    },
    'pm7btsb2': {
      'en': 'Andrew Daniels',
      'ar': '',
    },
    'e31bvy6l': {
      'en': '@username',
      'ar': '',
    },
    'yp0nmc4n': {
      'en': ' • ',
      'ar': '',
    },
    's3pax414': {
      'en': '4 mins ago',
      'ar': '',
    },
    'mga53nq9': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,',
      'ar': '',
    },
    's13qdfwm': {
      'en': '4',
      'ar': '',
    },
    '67bzuueg': {
      'en': '4',
      'ar': '',
    },
    '0z6s6qjm': {
      'en': 'Andrew Daniels',
      'ar': '',
    },
    't30vrzku': {
      'en': '@username',
      'ar': '',
    },
    'k05lgf0x': {
      'en': ' • ',
      'ar': '',
    },
    'viriojp3': {
      'en': '4 mins ago',
      'ar': '',
    },
    '3f6em019': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,',
      'ar': '',
    },
    'a24tyh3u': {
      'en': '4',
      'ar': '',
    },
    'm4bdl27a': {
      'en': '4',
      'ar': '',
    },
    '4q3voz6i': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Main_Admin
  {
    'tf6ke78b': {
      'en': 'Hello, ',
      'ar': 'مرحبًا،',
    },
    'moq0wnp0': {
      'en': 'Administrator',
      'ar': 'مدير',
    },
    'jndpx07r': {
      'en': 'Below is an overview of your Squash platform',
      'ar': 'وفيما يلي نظرة عامة على منصة الاسكواش الخاصة بك',
    },
    '0y6h5n3v': {
      'en': 'Total Number of Players',
      'ar': 'إجمالي عدد اللاعبين',
    },
    'fpxjn6xs': {
      'en': '230',
      'ar': '230',
    },
    '5gpf0rse': {
      'en': 'Total Number fof Clubs',
      'ar': 'العدد الإجمالي للأندية',
    },
    'wq6fqzln': {
      'en': '140',
      'ar': '140',
    },
    '4nzg6m28': {
      'en': 'Total Number of Tournaments',
      'ar': 'إجمالي عدد البطولات',
    },
    'czzhtzw0': {
      'en': '1000',
      'ar': '1000',
    },
    '4wh6we2c': {
      'en': 'Added by Me',
      'ar': 'تمت إضافتها بواسطتي',
    },
    '1pt9nzgq': {
      'en': '806',
      'ar': '806',
    },
    'xjtv1ood': {
      'en': 'Players in Tournaments',
      'ar': 'اللاعبين في البطولات',
    },
    'zj93znt7': {
      'en': '1900',
      'ar': '1900',
    },
    '8dr3hn7o': {
      'en': '55%',
      'ar': '55%',
    },
    'j8ed85qz': {
      'en': '__',
      'ar': '__',
    },
  },
  // CreatePlayerPage
  {
    'cfs4nqew': {
      'en': 'Create Player Profile',
      'ar': 'إنشاء ملف تعريف اللاعب',
    },
    'ijdsr4b5': {
      'en': 'Player Name',
      'ar': 'اسم اللاعب',
    },
    'tdt6m9le': {
      'en': 'Date of birth',
      'ar': 'تاريخ الميلاد',
    },
    '3pqk6qoq': {
      'en': 'yyyy-MM-dd',
      'ar': 'س س س-ش-ي ي',
    },
    'vujrngs7': {
      'en': '',
      'ar': '',
    },
    'd2hlzbwn': {
      'en': 'Club/Academy',
      'ar': 'النادي/الأكاديمية',
    },
    'geeip94z': {
      'en': '0',
      'ar': '0',
    },
    '4grmk0f7': {
      'en': 'Male',
      'ar': 'ذكر',
    },
    'y8gchfi1': {
      'en': 'Female',
      'ar': 'أنثى',
    },
    'rfyerx6h': {
      'en': '      Gender',
      'ar': 'جنس',
    },
    '23q6t5gi': {
      'en': 'Select player stage',
      'ar': 'حدد مرحلة اللاعب',
    },
    'gxpzvkgr': {
      'en': 'Stage',
      'ar': 'منصة',
    },
    'sovmb9a6': {
      'en': 'Stage',
      'ar': 'منصة',
    },
    'ps44pj3p': {
      'en': 'Age 8',
      'ar': 'العمر 8',
    },
    'wld0t5k7': {
      'en': 'Age 9',
      'ar': 'العمر 9',
    },
    'gpx0vmvu': {
      'en': 'Age 10',
      'ar': 'العمر 10',
    },
    'ln6h481l': {
      'en': 'Age 11',
      'ar': 'العمر 11',
    },
    'sx3vugjc': {
      'en': 'Age 12',
      'ar': 'العمر 12',
    },
    '3jsdf8hj': {
      'en': 'Age 13',
      'ar': 'العمر 13',
    },
    'w5ptjrbg': {
      'en': 'Age 14',
      'ar': 'العمر 14',
    },
    'kqvbe04h': {
      'en': 'Age 15',
      'ar': 'العمر 15',
    },
    'iaziru17': {
      'en': 'Age 16',
      'ar': 'العمر 16',
    },
    'aprok9gu': {
      'en': 'Player Stage',
      'ar': 'مرحلة اللاعب',
    },
    '1xjs6e21': {
      'en': 'Select player stage',
      'ar': 'حدد مرحلة اللاعب',
    },
    'h4q75pef': {
      'en': 'Stage',
      'ar': 'منصة',
    },
    'tkgu68pl': {
      'en': 'Stage',
      'ar': 'منصة',
    },
    '4stuqs7d': {
      'en': 'Age 8',
      'ar': 'العمر 8',
    },
    'pekrvsv5': {
      'en': 'Age 9',
      'ar': 'العمر 9',
    },
    'q1bsl7hb': {
      'en': 'Age 10',
      'ar': 'العمر 10',
    },
    'dcq8azq7': {
      'en': 'Age 11',
      'ar': 'العمر 11',
    },
    'pmi6k9j0': {
      'en': 'Age 12',
      'ar': 'العمر 12',
    },
    'evnsjlk2': {
      'en': 'Age 13',
      'ar': 'العمر 13',
    },
    'pl3lrarw': {
      'en': 'Age 14',
      'ar': 'العمر 14',
    },
    'zoctxwpd': {
      'en': 'Age 15',
      'ar': 'العمر 15',
    },
    'ls7qk948': {
      'en': 'Age 16',
      'ar': 'العمر 16',
    },
    'm9bpzaed': {
      'en': 'Player Rank',
      'ar': 'رتبة اللاعب',
    },
    '09t47qt2': {
      'en': 'Select player rank',
      'ar': 'حدد رتبة اللاعب',
    },
    'q6gpggct': {
      'en': 'Player bio',
      'ar': 'لاعب الحيوي',
    },
    'tew6dmd0': {
      'en': 'Submit',
      'ar': 'يُقدِّم',
    },
    'xtbv7j9u': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'gq006lhj': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '2sn8d8ax': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'cuuifs3a': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'lidmtar9': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '4b8v0pvf': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
  },
  // CreateTournamentPage
  {
    'ben1uy9a': {
      'en': 'Create Tournament ',
      'ar': '',
    },
    'j6sj0c15': {
      'en': 'Tournament Name',
      'ar': '',
    },
    'm2axwgyd': {
      'en': 'Tournament Year',
      'ar': '',
    },
    'xj42t1xl': {
      'en': 'Example: 2023',
      'ar': '',
    },
    '0zayxubq': {
      'en': 'Sponsors : Vodafone , Nike , ... ',
      'ar': '',
    },
    '0hmd3bai': {
      'en': 'Field is required',
      'ar': '',
    },
    'vixv7l87': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'z00ll44r': {
      'en': 'Field is required',
      'ar': '',
    },
    '7pcvruox': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1yqjttac': {
      'en': 'Field is required',
      'ar': '',
    },
    'ca64nxcs': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'wjyk4dmp': {
      'en': 'Submit',
      'ar': '',
    },
  },
  // LinkPlayersToTournament3rd
  {
    '3tbr6otk': {
      'en': '3. Link player(s) to tournament',
      'ar': '',
    },
    'tecbppsn': {
      'en': 'Registered Players',
      'ar': '',
    },
    '3phx2021': {
      'en': 'Players',
      'ar': '',
    },
    'uj41ge8w': {
      'en': 'Search all players...',
      'ar': '',
    },
    'fgplwuyf': {
      'en': 'Player Information',
      'ar': '',
    },
    'fbr8prc5': {
      'en': 'Last Active',
      'ar': '',
    },
    'hquur2ji': {
      'en': 'Title',
      'ar': '',
    },
    'ahm2d0st': {
      'en': 'Add',
      'ar': '',
    },
    'mkl0vbpu': {
      'en': 'Rank:',
      'ar': '',
    },
    '1zime9bq': {
      'en': '5 mins ago',
      'ar': '',
    },
    'uhdqqvk1': {
      'en': 'Head of Design',
      'ar': '',
    },
    '6hd6ni79': {
      'en': '__',
      'ar': '',
    },
  },
  // CreateClubPage
  {
    'egd6lc9a': {
      'en': 'Create Club',
      'ar': '',
    },
    'j6eq5d12': {
      'en': 'Name',
      'ar': '',
    },
    '3ip7b2pe': {
      'en': 'Location',
      'ar': '',
    },
    'lkxncotj': {
      'en': 'Contact person',
      'ar': '',
    },
    '2dcxq9pv': {
      'en': 'Email',
      'ar': '',
    },
    '1sbffjyw': {
      'en': 'Submit',
      'ar': '',
    },
    '5ffisbrr': {
      'en': 'Field is required',
      'ar': '',
    },
    'm1ykbbmt': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'aafqpdrw': {
      'en': 'Field is required',
      'ar': '',
    },
    'kczrhuly': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'aeule1ov': {
      'en': 'Field is required',
      'ar': '',
    },
    'uqqziv5w': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // ListClubsPage
  {
    'hx9gwium': {
      'en': 'List clubs',
      'ar': '',
    },
    '4rutfk4p': {
      'en': 'Clubs',
      'ar': '',
    },
    'wc2od4bw': {
      'en': 'Search all clubs...',
      'ar': '',
    },
    's2eapcdn': {
      'en': 'Name',
      'ar': '',
    },
    'e9bxoskb': {
      'en': 'Last Active',
      'ar': '',
    },
    'sces91ou': {
      'en': 'Title',
      'ar': '',
    },
    '5f7vntxo': {
      'en': 'Edit',
      'ar': '',
    },
    'pj49g00m': {
      'en': 'Delete',
      'ar': '',
    },
    'bynislfp': {
      'en': '5 mins ago',
      'ar': '',
    },
    'ri0ykhif': {
      'en': 'Head of Design',
      'ar': '',
    },
    'r9smwf0w': {
      'en': '__',
      'ar': '',
    },
  },
  // ListPlayersPage
  {
    'hq3t49t4': {
      'en': 'List players',
      'ar': '',
    },
    'hqpxkxp8': {
      'en': 'Players',
      'ar': '',
    },
    'bfdhjrp2': {
      'en': 'Search all players...',
      'ar': '',
    },
    '1crwkgzh': {
      'en': 'Name',
      'ar': '',
    },
    'fb24ujps': {
      'en': 'Last Active',
      'ar': '',
    },
    'x4dyujna': {
      'en': 'Title',
      'ar': '',
    },
    'm6ah04jp': {
      'en': 'Edit',
      'ar': '',
    },
    'm2bigo7u': {
      'en': 'Delete',
      'ar': '',
    },
    '8rlt3kcm': {
      'en': 'Rank:',
      'ar': '',
    },
    'fj1uk7a9': {
      'en': '5 mins ago',
      'ar': '',
    },
    '2v1d7xgd': {
      'en': 'Head of Design',
      'ar': '',
    },
    'd8pd5vsj': {
      'en': '__',
      'ar': '',
    },
  },
  // EditTournamentPage
  {
    'kpup48v1': {
      'en': 'Edit tournament',
      'ar': '',
    },
    'cxrw0dyb': {
      'en': 'Tournament Name',
      'ar': '',
    },
    'ho540bfa': {
      'en': 'Tournament Year',
      'ar': '',
    },
    '9i1d2gko': {
      'en': 'Example: 2023',
      'ar': '',
    },
    'z70q2cza': {
      'en': 'Sponsors : Vodafone , Nike , ... ',
      'ar': '',
    },
    'uahhlr6l': {
      'en': 'Field is required',
      'ar': '',
    },
    'oab6pphh': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ykzr9op7': {
      'en': 'Field is required',
      'ar': '',
    },
    'g4xneay4': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'fssaq7gm': {
      'en': 'Field is required',
      'ar': '',
    },
    'w9gyhmo1': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ms5iny2x': {
      'en': 'Field is required',
      'ar': '',
    },
    'uusawezf': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'l5lxa6ey': {
      'en': 'Update',
      'ar': '',
    },
    'pa7m8lxm': {
      'en': 'Tournament plans',
      'ar': '',
    },
    'ptnn4oq5': {
      'en': 'Search all tournament plans...',
      'ar': '',
    },
    'wpho1kc1': {
      'en': 'Name',
      'ar': '',
    },
    'q2iqyr9w': {
      'en': 'Edit',
      'ar': '',
    },
    'f12ef294': {
      'en': 'Delete',
      'ar': '',
    },
    '6pe12orc': {
      'en': 'Add Plan',
      'ar': '',
    },
    '95ss9cew': {
      'en': '__',
      'ar': '',
    },
  },
  // ListTournamentsPage
  {
    '2v8qo17x': {
      'en': 'List tournaments',
      'ar': '',
    },
    '8dr5sd63': {
      'en': 'Tournaments',
      'ar': '',
    },
    'p1brsnud': {
      'en': 'Search all tournaments...',
      'ar': '',
    },
    '1phbmbxm': {
      'en': 'Name',
      'ar': '',
    },
    'fshwortv': {
      'en': 'Last Active',
      'ar': '',
    },
    'kyjyv428': {
      'en': 'Title',
      'ar': '',
    },
    'lefn8kzt': {
      'en': 'Edit',
      'ar': '',
    },
    'tn2jcozc': {
      'en': 'Delete',
      'ar': '',
    },
    'q286tovb': {
      'en': '5 mins ago',
      'ar': '',
    },
    '19kwyp1i': {
      'en': 'Head of Design',
      'ar': '',
    },
    'xhuayisa': {
      'en': '__',
      'ar': '',
    },
  },
  // EditClubPage
  {
    'nb02yuyr': {
      'en': 'Edit Club',
      'ar': '',
    },
    '5t8h70m4': {
      'en': 'Name',
      'ar': '',
    },
    '7l7iwdtr': {
      'en': 'Location',
      'ar': '',
    },
    'zo801dbw': {
      'en': 'Contact person',
      'ar': '',
    },
    'b73i8l5p': {
      'en': 'Email',
      'ar': '',
    },
    'zwkpscdv': {
      'en': 'Update',
      'ar': '',
    },
    '1fdzg1x9': {
      'en': 'Field is required',
      'ar': '',
    },
    '224987dz': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'vv17ig0u': {
      'en': 'Field is required',
      'ar': '',
    },
    'byk08eb8': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '7l9kxgjt': {
      'en': 'Field is required',
      'ar': '',
    },
    '9z9ylu28': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // EditPlayerPage
  {
    'l2nf3yu4': {
      'en': 'Edit Player Profile',
      'ar': '',
    },
    'z2e54z8c': {
      'en': 'Player Name',
      'ar': '',
    },
    'c6q0i1py': {
      'en': 'Date of birth',
      'ar': '',
    },
    'i8rtpql0': {
      'en': 'yyyy-MM-dd',
      'ar': '',
    },
    'kux32ek3': {
      'en': '',
      'ar': '',
    },
    'mb9fnizf': {
      'en': 'Club/Academy',
      'ar': '',
    },
    '938rbvcm': {
      'en': '0',
      'ar': '',
    },
    'ayudxgd7': {
      'en': 'Male',
      'ar': '',
    },
    'o5n9g0iv': {
      'en': 'Female',
      'ar': '',
    },
    '9o1i58pp': {
      'en': '      Gender',
      'ar': '',
    },
    'k2xpyfky': {
      'en': 'Select player stage',
      'ar': '',
    },
    'rga2wb7i': {
      'en': 'Stage',
      'ar': '',
    },
    'hbq6qtjt': {
      'en': 'Stage',
      'ar': '',
    },
    '4uhab05h': {
      'en': 'Age 8',
      'ar': '',
    },
    '6rvfio4m': {
      'en': 'Age 9',
      'ar': '',
    },
    'wwx7ikcf': {
      'en': 'Age 10',
      'ar': '',
    },
    'o5iomhhp': {
      'en': 'Age 11',
      'ar': '',
    },
    'okx020yf': {
      'en': 'Age 12',
      'ar': '',
    },
    '3byo2ilp': {
      'en': 'Age 13',
      'ar': '',
    },
    '9lnavw4g': {
      'en': 'Age 14',
      'ar': '',
    },
    'waolil3r': {
      'en': 'Age 15',
      'ar': '',
    },
    'g9uaye32': {
      'en': 'Age 16',
      'ar': '',
    },
    'yjk21bfw': {
      'en': 'Player Stage',
      'ar': '',
    },
    '8s545lga': {
      'en': 'Select player stage',
      'ar': '',
    },
    '2w5t3zat': {
      'en': 'Stage',
      'ar': '',
    },
    'ryu3iya7': {
      'en': 'Stage',
      'ar': '',
    },
    's3wxs65v': {
      'en': 'Age 8',
      'ar': '',
    },
    'lqqwl1k7': {
      'en': 'Age 9',
      'ar': '',
    },
    'fsutaec2': {
      'en': 'Age 10',
      'ar': '',
    },
    'nv67fpla': {
      'en': 'Age 11',
      'ar': '',
    },
    'tdsoclg1': {
      'en': 'Age 12',
      'ar': '',
    },
    'shogaymp': {
      'en': 'Age 13',
      'ar': '',
    },
    'as6kdfy8': {
      'en': 'Age 14',
      'ar': '',
    },
    '6ldpfdum': {
      'en': 'Age 15',
      'ar': '',
    },
    'jo5v4hqb': {
      'en': 'Age 16',
      'ar': '',
    },
    '3a1u01eu': {
      'en': 'Player Rank',
      'ar': '',
    },
    '1d38b92b': {
      'en': 'Select player rank',
      'ar': '',
    },
    'pskkrfhx': {
      'en': 'Player bio',
      'ar': '',
    },
    'whypbf6r': {
      'en': 'Update',
      'ar': '',
    },
    'uxxphy8h': {
      'en': 'Field is required',
      'ar': '',
    },
    '2a16pn25': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'jdui54dx': {
      'en': 'Field is required',
      'ar': '',
    },
    'j4t312dx': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    's63i9qd2': {
      'en': 'Field is required',
      'ar': '',
    },
    'txrgzkz4': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // LinkPlayersToTournament1st
  {
    '4d7vyu48': {
      'en': '1. Select Tournament',
      'ar': '',
    },
    'jx49dhty': {
      'en': 'Tournaments',
      'ar': '',
    },
    'aj5gnegy': {
      'en': 'Search all tournaments...',
      'ar': '',
    },
    '43w4ot5k': {
      'en': 'Tournament Information',
      'ar': '',
    },
    'vpqlnohw': {
      'en': 'Last Active',
      'ar': '',
    },
    'oibgzccf': {
      'en': 'Title',
      'ar': '',
    },
    '5v3z5428': {
      'en': '__',
      'ar': '',
    },
  },
  // LinkPlayersToTournament2nd
  {
    'x2zqr6u7': {
      'en': '2. Select Tournament Plan',
      'ar': '',
    },
    'hcnjqfk9': {
      'en': 'Tournament Name',
      'ar': '',
    },
    'tj3eerdh': {
      'en': 'Field is required',
      'ar': '',
    },
    'hkeo42xg': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ohwvuak9': {
      'en': 'Field is required',
      'ar': '',
    },
    '0djm49vg': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'id11tplr': {
      'en': 'Field is required',
      'ar': '',
    },
    'pqto289r': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '0ofa4fs6': {
      'en': 'Field is required',
      'ar': '',
    },
    'gumsi9ll': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '15dv5041': {
      'en': 'Tournament plans',
      'ar': '',
    },
    'wa6i8f7c': {
      'en': 'Search all tournament plans...',
      'ar': '',
    },
    'q8t3geqr': {
      'en': 'Tournament Plan Info',
      'ar': '',
    },
    'sbxgkkz2': {
      'en': 'Last Active',
      'ar': '',
    },
    'gji4x5zh': {
      'en': 'Title',
      'ar': '',
    },
    'kxk3wvgl': {
      'en': 'Head of Design',
      'ar': '',
    },
    'skucpm6d': {
      'en': '5 mins ago',
      'ar': '',
    },
    'ku8m1xqy': {
      'en': '__',
      'ar': '',
    },
  },
  // LinkPlayersToTournament4th
  {
    'z0nrcs3w': {
      'en': '4. Players list in tournament',
      'ar': '',
    },
    'mj05tmh8': {
      'en': 'Print PDF',
      'ar': '',
    },
    'idizrz07': {
      'en': 'Players',
      'ar': '',
    },
    'mgokigza': {
      'en': 'Search all players...',
      'ar': '',
    },
    're3fe4q8': {
      'en': 'Player Information',
      'ar': '',
    },
    'vrf4cvuo': {
      'en': 'Last Active',
      'ar': '',
    },
    '2sw8bg8j': {
      'en': 'Title',
      'ar': '',
    },
    '2nfsnyin': {
      'en': 'Remove',
      'ar': '',
    },
    '5qlki30m': {
      'en': 'Rank:',
      'ar': '',
    },
    'mv46jfrq': {
      'en': '5 mins ago',
      'ar': '',
    },
    'eqfughv8': {
      'en': 'Head of Design',
      'ar': '',
    },
    'cpk6qcxw': {
      'en': '__',
      'ar': '',
    },
  },
  // CreateTournamentEvent1st
  {
    'sewrpw2q': {
      'en': '1. Select Tournament',
      'ar': '',
    },
    'qetzrt3y': {
      'en': 'Tournaments',
      'ar': '',
    },
    '75dp8wkr': {
      'en': 'Search all tournaments...',
      'ar': '',
    },
    'szldkreb': {
      'en': 'Tournament Information',
      'ar': '',
    },
    'jyps7di0': {
      'en': 'Last Active',
      'ar': '',
    },
    'qaetqd6y': {
      'en': 'Title',
      'ar': '',
    },
    'kanlikqk': {
      'en': '__',
      'ar': '',
    },
  },
  // CreateTournamentEvent2nd
  {
    '1dkpo63j': {
      'en': '2. Select Tournament Plan',
      'ar': '',
    },
    '1xgjkdn4': {
      'en': 'Tournament Name',
      'ar': '',
    },
    'jyj7ap43': {
      'en': 'Field is required',
      'ar': '',
    },
    'f598v1nd': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '5n7lnl4e': {
      'en': 'Field is required',
      'ar': '',
    },
    'g8nzv0ez': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ysfi8idv': {
      'en': 'Field is required',
      'ar': '',
    },
    'mm2c3wtf': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '6vnnjaee': {
      'en': 'Field is required',
      'ar': '',
    },
    'k3yj8161': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'zgfc21l4': {
      'en': 'Tournament plans',
      'ar': '',
    },
    'rhqhadiu': {
      'en': 'Search all tournament plans...',
      'ar': '',
    },
    'dqagd2ev': {
      'en': 'Tournament Plan Info',
      'ar': '',
    },
    'c36hx6pw': {
      'en': 'Last Active',
      'ar': '',
    },
    'hcgig14z': {
      'en': 'Title',
      'ar': '',
    },
    'lucsdyys': {
      'en': 'Head of Design',
      'ar': '',
    },
    '2nf92nnl': {
      'en': '5 mins ago',
      'ar': '',
    },
    'mwrynq0i': {
      'en': '__',
      'ar': '',
    },
  },
  // CreateTournamentEvent3rd
  {
    'lyyec8us': {
      'en': '3. Create Tournament Event',
      'ar': '',
    },
    'mm7ltbbu': {
      'en': '',
      'ar': '',
    },
    'npxvrlba': {
      'en': 'Location',
      'ar': '',
    },
    'hppgesz6': {
      'en': 'From',
      'ar': '',
    },
    '4cyb21a1': {
      'en': 'yyyy-MM-dd',
      'ar': '',
    },
    'oeqb6kw2': {
      'en': 'To',
      'ar': '',
    },
    'u73nrwl1': {
      'en': 'yyyy-MM-dd',
      'ar': '',
    },
    '7jhmqy5y': {
      'en': 'Submit',
      'ar': '',
    },
    '5i4kzmgg': {
      'en': 'Field is required',
      'ar': '',
    },
    '3ojm1g91': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'zdyvjavw': {
      'en': 'Field is required',
      'ar': '',
    },
    'tr9xkbr2': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'hn8yikxx': {
      'en': '__',
      'ar': '',
    },
  },
  // EditTournamentEvent1st
  {
    'agnttain': {
      'en': '1. Select Tournament',
      'ar': '',
    },
    'sbijjwe3': {
      'en': 'Tournaments',
      'ar': '',
    },
    'nesb2j48': {
      'en': 'Search all tournaments...',
      'ar': '',
    },
    'yy76g7n8': {
      'en': 'Tournament Information',
      'ar': '',
    },
    'wyxlgn6v': {
      'en': 'Last Active',
      'ar': '',
    },
    'rxtnz9fh': {
      'en': 'Title',
      'ar': '',
    },
    'rtppvn2d': {
      'en': '__',
      'ar': '',
    },
  },
  // EditTournamentEvent2nd
  {
    '9qg8hvev': {
      'en': '2. Select Tournament Plan',
      'ar': '',
    },
    'um4r3uri': {
      'en': 'Tournament Name',
      'ar': '',
    },
    '0k0tbm3s': {
      'en': 'Field is required',
      'ar': '',
    },
    '60mwoda2': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'wflzs45w': {
      'en': 'Field is required',
      'ar': '',
    },
    'xslrtx4j': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'vijm1kvy': {
      'en': 'Field is required',
      'ar': '',
    },
    'wk764s9r': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'd3d24v24': {
      'en': 'Field is required',
      'ar': '',
    },
    'vpes61ao': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'j5ck5bw1': {
      'en': 'Tournament plans',
      'ar': '',
    },
    'yc2o3me6': {
      'en': 'Search all tournament plans...',
      'ar': '',
    },
    'x9iz8ex8': {
      'en': 'Tournament Plan Info',
      'ar': '',
    },
    '6jejhjte': {
      'en': 'Last Active',
      'ar': '',
    },
    'rsykxpgq': {
      'en': 'Title',
      'ar': '',
    },
    'c5w1ufi6': {
      'en': 'Head of Design',
      'ar': '',
    },
    '9h7efiu4': {
      'en': '5 mins ago',
      'ar': '',
    },
    '97z2yw28': {
      'en': '__',
      'ar': '',
    },
  },
  // EditTournamentEvent3rd
  {
    'rrhc3lwj': {
      'en': '3. Edit/Delete Tournament Event',
      'ar': '',
    },
    '1keqd238': {
      'en': 'Events',
      'ar': '',
    },
    'erlrs0bz': {
      'en': 'Search all events...',
      'ar': '',
    },
    'x5brbkp8': {
      'en': 'Event Information',
      'ar': '',
    },
    'ivcwuzv3': {
      'en': 'Last Active',
      'ar': '',
    },
    '08entexv': {
      'en': 'Title',
      'ar': '',
    },
    'i2yqpwwm': {
      'en': 'Edit',
      'ar': '',
    },
    'pwfektto': {
      'en': 'Remove',
      'ar': '',
    },
    'r5prqs30': {
      'en': '5 mins ago',
      'ar': '',
    },
    'sezeruzv': {
      'en': 'Head of Design',
      'ar': '',
    },
    '3gwfbm8a': {
      'en': 'Print PDF',
      'ar': '',
    },
    '3tirru2k': {
      'en': '__',
      'ar': '',
    },
  },
  // EditTournamentEvent4th
  {
    'xznzlljo': {
      'en': '4. Edit Tournament Event',
      'ar': '',
    },
    'a9m6980p': {
      'en': '',
      'ar': '',
    },
    'cycouyo4': {
      'en': 'Location',
      'ar': '',
    },
    'rok728c2': {
      'en': 'From',
      'ar': '',
    },
    '5sq10sde': {
      'en': 'yyyy-MM-dd',
      'ar': '',
    },
    'flqque6n': {
      'en': 'To',
      'ar': '',
    },
    '3z7ofrat': {
      'en': 'yyyy-MM-dd',
      'ar': '',
    },
    '2nztgmb9': {
      'en': 'Update',
      'ar': '',
    },
    'atz8dt09': {
      'en': 'Field is required',
      'ar': '',
    },
    'qw1k43nu': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ml3nalae': {
      'en': 'Field is required',
      'ar': '',
    },
    'xu5e37ki': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'd250cj3x': {
      'en': '__',
      'ar': '',
    },
  },
  // CreateTournamentMatch1st
  {
    '842hj5ab': {
      'en': '1. Select Tournament',
      'ar': '',
    },
    'bcazzp83': {
      'en': 'Tournaments',
      'ar': '',
    },
    'iwfvn674': {
      'en': 'Search all tournaments...',
      'ar': '',
    },
    'q48qbc87': {
      'en': 'Tournament Information',
      'ar': '',
    },
    'vqmnqcbc': {
      'en': 'Last Active',
      'ar': '',
    },
    'nr18up5h': {
      'en': 'Title',
      'ar': '',
    },
    'dzmgvf9b': {
      'en': '__',
      'ar': '',
    },
  },
  // CreateTournamentMatch2nd
  {
    '7zyl12xw': {
      'en': '2. Select Tournament Plan',
      'ar': '',
    },
    'dxj7otge': {
      'en': 'Tournament Name',
      'ar': '',
    },
    '1gtr2ld5': {
      'en': 'Field is required',
      'ar': '',
    },
    'aj8c37ns': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    's3b54upv': {
      'en': 'Field is required',
      'ar': '',
    },
    'q6kk3cqm': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'y5ue4pi4': {
      'en': 'Field is required',
      'ar': '',
    },
    '9sxlqro5': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'frqtoits': {
      'en': 'Field is required',
      'ar': '',
    },
    '40ew90cb': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'wjbzrp8f': {
      'en': 'Tournament plans',
      'ar': '',
    },
    'uomw4tg6': {
      'en': 'Search all tournament plans...',
      'ar': '',
    },
    'ta88kx9z': {
      'en': 'Tournament Plan Info',
      'ar': '',
    },
    'oru5uj7b': {
      'en': 'Last Active',
      'ar': '',
    },
    'jxx5h5uj': {
      'en': 'Title',
      'ar': '',
    },
    '5t4ea7k0': {
      'en': 'Head of Design',
      'ar': '',
    },
    '5xce43kf': {
      'en': '5 mins ago',
      'ar': '',
    },
    'kfibkhpg': {
      'en': '__',
      'ar': '',
    },
  },
  // CreateTournamentMatch3rd
  {
    'buawznd2': {
      'en': '3. Create Tournament Match',
      'ar': '',
    },
    '527vzz8o': {
      'en': '',
      'ar': '',
    },
    'o1vgmgko': {
      'en': 'Tournament Event',
      'ar': '',
    },
    'gvyjy3zb': {
      'en': 'Match Time',
      'ar': '',
    },
    'dosxzxup': {
      'en': 'yyyy-MM-dd hh:mm',
      'ar': '',
    },
    'i8w6s016': {
      'en': '',
      'ar': '',
    },
    'm6zu1354': {
      'en': 'Player I',
      'ar': '',
    },
    'x6ioeemi': {
      'en': '',
      'ar': '',
    },
    '8aq6hm6i': {
      'en': 'Player II',
      'ar': '',
    },
    'rnwmz4uj': {
      'en': 'Field is required',
      'ar': '',
    },
    'cnnr4e8y': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'fj9oleze': {
      'en': 'Submit',
      'ar': '',
    },
    'zp4ed96v': {
      'en': '__',
      'ar': '',
    },
  },
  // EditTournamentMatch1st
  {
    '1k7oi536': {
      'en': '1. Select Tournament',
      'ar': '',
    },
    'k6jlbo0y': {
      'en': 'Tournaments',
      'ar': '',
    },
    'fqf534yh': {
      'en': 'Search all tournaments...',
      'ar': '',
    },
    'xt0rmiri': {
      'en': 'Tournament Information',
      'ar': '',
    },
    'yj176v52': {
      'en': 'Last Active',
      'ar': '',
    },
    'a54d6iyg': {
      'en': 'Title',
      'ar': '',
    },
    '5vpp7r40': {
      'en': '__',
      'ar': '',
    },
  },
  // EditTournamentMatch2nd
  {
    'drbxeyxc': {
      'en': '2. Select Tournament Plan',
      'ar': '',
    },
    'aft1orjf': {
      'en': 'Tournament Name',
      'ar': '',
    },
    '1gse9tmf': {
      'en': 'Field is required',
      'ar': '',
    },
    'tzpuv7ki': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1h8l4l0e': {
      'en': 'Field is required',
      'ar': '',
    },
    'n95nqw2a': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'adzziawy': {
      'en': 'Field is required',
      'ar': '',
    },
    'wuf82uap': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'qm7xfo85': {
      'en': 'Field is required',
      'ar': '',
    },
    'a98br705': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'e0y4njs5': {
      'en': 'Tournament plans',
      'ar': '',
    },
    'wr69bfhw': {
      'en': 'Search all tournament plans...',
      'ar': '',
    },
    '2zosp29x': {
      'en': 'Tournament Plan Info',
      'ar': '',
    },
    '8eanlax7': {
      'en': 'Last Active',
      'ar': '',
    },
    'h1xg3rwu': {
      'en': 'Title',
      'ar': '',
    },
    '7x5ix59p': {
      'en': 'Head of Design',
      'ar': '',
    },
    '26q0169s': {
      'en': '5 mins ago',
      'ar': '',
    },
    'p1lsco8d': {
      'en': '__',
      'ar': '',
    },
  },
  // EditTournamentMatch3rd
  {
    'd5qai84s': {
      'en': '3. Edit/Delete Tournament Matches',
      'ar': '',
    },
    'nm5idbd7': {
      'en': 'Matches',
      'ar': '',
    },
    'mmw1e9cj': {
      'en': 'Search all events...',
      'ar': '',
    },
    'zufuzc4m': {
      'en': 'Match Information',
      'ar': '',
    },
    'gxr6c1td': {
      'en': 'Last Active',
      'ar': '',
    },
    'sgnal70m': {
      'en': 'Title',
      'ar': '',
    },
    's6rpduqg': {
      'en': 'Edit',
      'ar': '',
    },
    'nsn4e3sv': {
      'en': 'Remove',
      'ar': '',
    },
    'r8qd3845': {
      'en': '5 mins ago',
      'ar': '',
    },
    'e9jdy85l': {
      'en': 'Head of Design',
      'ar': '',
    },
    'upnmwd1b': {
      'en': 'Print PDF',
      'ar': '',
    },
    't5ubsc54': {
      'en': '__',
      'ar': '',
    },
  },
  // EditTournamentMatch4th
  {
    'der2wr6m': {
      'en': '4. Edit Tournament Match',
      'ar': '',
    },
    '4n6i8bi3': {
      'en': '',
      'ar': '',
    },
    '7l04vibq': {
      'en': 'Tournament Event',
      'ar': '',
    },
    'zcirpfur': {
      'en': 'Match Time',
      'ar': '',
    },
    '39j3lxbp': {
      'en': 'yyyy-MM-dd hh:mm',
      'ar': '',
    },
    'kogjrx1z': {
      'en': '',
      'ar': '',
    },
    'uvzvcklf': {
      'en': 'Player I',
      'ar': '',
    },
    '7u9sre0r': {
      'en': '',
      'ar': '',
    },
    'n6sk17uj': {
      'en': 'Player II',
      'ar': '',
    },
    'h89pbn8j': {
      'en': 'Field is required',
      'ar': '',
    },
    'wko3i4in': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    't0fg7ypl': {
      'en': 'Update',
      'ar': '',
    },
    'txt69yrb': {
      'en': '__',
      'ar': '',
    },
  },
  // sideNav
  {
    'e57ec01n': {
      'en': 'Squash Platform',
      'ar': '',
    },
    'v6oy234t': {
      'en': 'Casper Ghost',
      'ar': '',
    },
    'z7oxdz80': {
      'en': 'ghost@domain.com',
      'ar': '',
    },
    '4at42qaa': {
      'en': 'Platform Navigation',
      'ar': '',
    },
    'rjsznqni': {
      'en': 'Dashboard',
      'ar': '',
    },
    'fj4n65x2': {
      'en': 'Users',
      'ar': '',
    },
    '59tq5jvc': {
      'en': 'Notifications',
      'ar': '',
    },
    'vowflysf': {
      'en': '12',
      'ar': '',
    },
    'pyys0t2q': {
      'en': 'Recent Orders',
      'ar': '',
    },
    '5xfx892x': {
      'en': 'Platform Settings',
      'ar': '',
    },
    'c9k341is': {
      'en': 'Account',
      'ar': '',
    },
    'f8rn8avu': {
      'en': 'Administrator',
      'ar': '',
    },
    'zilxqp4y': {
      'en': 'Light Mode',
      'ar': '',
    },
    '8s8yoond': {
      'en': 'Dark Mode',
      'ar': '',
    },
  },
  // accountUserDropdown
  {
    '1wx59lmh': {
      'en': 'Account Options',
      'ar': '',
    },
    '81lw4sy6': {
      'en': 'Casper Ghost',
      'ar': '',
    },
    '5qpho5hi': {
      'en': 'ghost@domain.com',
      'ar': '',
    },
    '7rcvt4fw': {
      'en': 'My Account',
      'ar': '',
    },
    'rnl5f2u7': {
      'en': 'Settings',
      'ar': '',
    },
    'zzpx6v19': {
      'en': 'Billing Details',
      'ar': '',
    },
    'pkb9deac': {
      'en': 'Light Mode',
      'ar': '',
    },
    'scdt8a81': {
      'en': 'Dark Mode',
      'ar': '',
    },
    '3nz2s9p4': {
      'en': 'Log out',
      'ar': '',
    },
  },
  // ActionsPlayer
  {
    'a7mnf0u0': {
      'en': 'Players',
      'ar': '',
    },
    'rdjl6xt8': {
      'en': 'Tap to select the needed action for Players',
      'ar': '',
    },
    'rpriwyov': {
      'en': 'Add new player',
      'ar': '',
    },
    'qsoojlph': {
      'en': 'Edit/Delete player information',
      'ar': '',
    },
  },
  // ActionsClubs
  {
    '82uvs0xm': {
      'en': 'Clubs / Academy',
      'ar': '',
    },
    '3c6g96pn': {
      'en': 'Tap to select the needed action for Clubs/Academies',
      'ar': '',
    },
    'z4jh38lq': {
      'en': 'Add new club',
      'ar': '',
    },
    '2zooh9ig': {
      'en': 'Edit/Delete club information',
      'ar': '',
    },
  },
  // ActionsTournaments
  {
    '4b1m6rip': {
      'en': 'Tournaments',
      'ar': '',
    },
    'e556wavj': {
      'en': 'Tap to select the needed action for Tournament',
      'ar': '',
    },
    '3ts5psql': {
      'en': 'Add new tournament/plan',
      'ar': '',
    },
    '4ew1ngix': {
      'en': 'Link players to tournament',
      'ar': '',
    },
    'jyvacx25': {
      'en': 'Edit/Delete tournament information',
      'ar': '',
    },
  },
  // ActionsOthers
  {
    '99jnjz89': {
      'en': 'Others',
      'ar': '',
    },
    'nh30sneb': {
      'en': 'Select the required action',
      'ar': '',
    },
    'cn12hrg1': {
      'en': 'Print PDF reports',
      'ar': '',
    },
    'xfi56ob0': {
      'en': 'Create tournament draw',
      'ar': '',
    },
  },
  // CreateTournamentPlan
  {
    'tpgu8qdr': {
      'en': 'Tournament Plan Name',
      'ar': '',
    },
    '26s43q2t': {
      'en': '',
      'ar': '',
    },
    '44yj8pdc': {
      'en': 'Location',
      'ar': '',
    },
    'b06dkvg9': {
      'en': 'From',
      'ar': '',
    },
    '1kyxoz4c': {
      'en': 'yyyy-MM-dd',
      'ar': '',
    },
    'q5gv7nhj': {
      'en': 'To',
      'ar': '',
    },
    'zg2cgepf': {
      'en': 'yyyy-MM-dd',
      'ar': '',
    },
    'zdy4fa9z': {
      'en': '0',
      'ar': '',
    },
    'i4mt9xy1': {
      'en': 'Male',
      'ar': '',
    },
    '2bqrkquu': {
      'en': 'Female',
      'ar': '',
    },
    'n98v3tj9': {
      'en': '      Gender',
      'ar': '',
    },
    'ho4yv261': {
      'en': 'Select player stage',
      'ar': '',
    },
    'uosbjno1': {
      'en': 'Stage',
      'ar': '',
    },
    'i76eybrz': {
      'en': 'Stage',
      'ar': '',
    },
    'u4wfgf35': {
      'en': 'Age 8',
      'ar': '',
    },
    's2thegj8': {
      'en': 'Age 9',
      'ar': '',
    },
    'sx6heixu': {
      'en': 'Age 10',
      'ar': '',
    },
    '2p4fe6ps': {
      'en': 'Age 11',
      'ar': '',
    },
    '5yaaiw4j': {
      'en': 'Age 12',
      'ar': '',
    },
    'w49uqq00': {
      'en': 'Age 13',
      'ar': '',
    },
    'hrvj01me': {
      'en': 'Age 14',
      'ar': '',
    },
    '6cqakyus': {
      'en': 'Age 15',
      'ar': '',
    },
    'q5frh8cp': {
      'en': 'Age 16',
      'ar': '',
    },
    'gqh3xn94': {
      'en': 'Player Stage',
      'ar': '',
    },
    'spifmxo2': {
      'en': 'Select player stage',
      'ar': '',
    },
    'nnxeqv3t': {
      'en': 'Submit',
      'ar': '',
    },
    'tpo9ef7u': {
      'en': 'Later',
      'ar': '',
    },
    'gsn3k4iw': {
      'en': 'Field is required',
      'ar': '',
    },
    'qk1bjnb2': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '63hmfqhc': {
      'en': 'Field is required',
      'ar': '',
    },
    '78ll7g46': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '0wkxvh1k': {
      'en': 'Field is required',
      'ar': '',
    },
    'nt1o51yd': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'unbwxo40': {
      'en': 'Field is required',
      'ar': '',
    },
    '1101rlp3': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // ListPlayersWithStage
  {
    'q8sjphgb': {
      'en': 'Players',
      'ar': '',
    },
    'gs2xhhr3': {
      'en': 'Select players to join selected tournament',
      'ar': '',
    },
    '08c04gve': {
      'en': 'Search all players...',
      'ar': '',
    },
    'spzwdo7d': {
      'en': 'All',
      'ar': '',
    },
    'nkb6xbe3': {
      'en': 'Under 10',
      'ar': '',
    },
    'breq2sue': {
      'en': 'Under 12',
      'ar': '',
    },
    'yk9aaku2': {
      'en': 'Under 14',
      'ar': '',
    },
    'lzqabli4': {
      'en': 'Under 16',
      'ar': '',
    },
    '4k8enayf': {
      'en': 'Under 18',
      'ar': '',
    },
    'ri4aitgv': {
      'en': 'All',
      'ar': '',
    },
    '0vlzbiz7': {
      'en': 'All',
      'ar': '',
    },
    '6vxbfnt5': {
      'en': 'Name',
      'ar': '',
    },
    '4k4kwhpj': {
      'en': 'Status',
      'ar': '',
    },
    'cqucac5y': {
      'en': 'Randy Rodriguez',
      'ar': '',
    },
    'jwoqu34g': {
      'en': 'randy@domainname.com',
      'ar': '',
    },
  },
  // ListPlayers
  {
    'qsgvyv7j': {
      'en': 'Players',
      'ar': '',
    },
    'hyhq8aaq': {
      'en': 'Select players to join selected tournament',
      'ar': '',
    },
    '9wgibxlo': {
      'en': 'Search all players...',
      'ar': '',
    },
    '9x1frc0x': {
      'en': 'Name',
      'ar': '',
    },
    '0gi2ah3t': {
      'en': 'Status',
      'ar': '',
    },
    'k6t7lmoz': {
      'en': 'Rank:',
      'ar': '',
    },
  },
  // EditTournamentPlan
  {
    '25vflj29': {
      'en': 'Tournament Plan Name',
      'ar': '',
    },
    '7gsq8edt': {
      'en': '',
      'ar': '',
    },
    'ba9z92qz': {
      'en': 'Location',
      'ar': '',
    },
    'oaf5yrqc': {
      'en': 'From',
      'ar': '',
    },
    'h1r01gqp': {
      'en': 'yyyy-MM-dd',
      'ar': '',
    },
    '3ddjzdsd': {
      'en': 'To',
      'ar': '',
    },
    '7ijo0ecf': {
      'en': 'yyyy-MM-dd',
      'ar': '',
    },
    'fgevdm7m': {
      'en': '0',
      'ar': '',
    },
    '6rnjglih': {
      'en': 'Male',
      'ar': '',
    },
    'ednv9ond': {
      'en': 'Female',
      'ar': '',
    },
    'td8ctzo7': {
      'en': '      Gender',
      'ar': '',
    },
    'bfy3pzv4': {
      'en': 'Select player stage',
      'ar': '',
    },
    'ial54kwt': {
      'en': 'Stage',
      'ar': '',
    },
    'r2by1crx': {
      'en': 'Stage',
      'ar': '',
    },
    'x0p5znc2': {
      'en': 'Age 8',
      'ar': '',
    },
    'nndxtgnk': {
      'en': 'Age 9',
      'ar': '',
    },
    'vr6l926o': {
      'en': 'Age 10',
      'ar': '',
    },
    'hewce0dw': {
      'en': 'Age 11',
      'ar': '',
    },
    'blg4b4w5': {
      'en': 'Age 12',
      'ar': '',
    },
    'smffw7hk': {
      'en': 'Age 13',
      'ar': '',
    },
    'ewre5au5': {
      'en': 'Age 14',
      'ar': '',
    },
    'zlaa27gy': {
      'en': 'Age 15',
      'ar': '',
    },
    'mh31rwkf': {
      'en': 'Age 16',
      'ar': '',
    },
    'x9v2h7zj': {
      'en': 'Player Stage',
      'ar': '',
    },
    '2vnjxpas': {
      'en': 'Select player stage',
      'ar': '',
    },
    '4o0ruus0': {
      'en': 'Update',
      'ar': '',
    },
    't7bq9kgl': {
      'en': 'Later',
      'ar': '',
    },
    'rf6sh44d': {
      'en': 'Field is required',
      'ar': '',
    },
    'eeytw6o7': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '67qr6o81': {
      'en': 'Field is required',
      'ar': '',
    },
    'vfubg5dn': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'si9w9y8c': {
      'en': 'Field is required',
      'ar': '',
    },
    'cqvtucc3': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // ActionsEvents
  {
    '6jr3t8p3': {
      'en': 'Tournament Events',
      'ar': '',
    },
    'q9t52oln': {
      'en': 'Tap to select the needed action for Tournament Event',
      'ar': '',
    },
    'r7jjl9ji': {
      'en': 'Add new tournament event',
      'ar': '',
    },
    '0s9zymq0': {
      'en': 'Edit/Delete tournament event',
      'ar': '',
    },
  },
  // ActionsMatches
  {
    'nu262vzy': {
      'en': 'Tournament Matches',
      'ar': '',
    },
    '5lug6e0t': {
      'en': 'Tap to select the needed action for Tournament Match',
      'ar': '',
    },
    'j3htyqkl': {
      'en': 'Add new tournament match',
      'ar': '',
    },
    'lg42x56s': {
      'en': 'Edit/Delete tournament match',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    'gerzqsik': {
      'en': 'Email address',
      'ar': '',
    },
    'jjbjhhly': {
      'en': 'Password',
      'ar': '',
    },
    'dzdq5o8j': {
      'en': 'Button',
      'ar': '',
    },
    'smhcfs7h': {
      'en': 'Button',
      'ar': '',
    },
    'dpf0ojc4': {
      'en': 'Button',
      'ar': '',
    },
    'fj8t39n3': {
      'en': 'Button',
      'ar': '',
    },
    'ph5mhxqr': {
      'en': 'Button',
      'ar': '',
    },
    'rzng4tr7': {
      'en': 'Button',
      'ar': '',
    },
    'h6ykz5g8': {
      'en': 'Button',
      'ar': '',
    },
    'pe9bcd69': {
      'en': 'Button',
      'ar': '',
    },
    'irsjabzh': {
      'en': 'Button',
      'ar': '',
    },
    'qvam849u': {
      'en': 'Calling',
      'ar': '',
    },
    'c9jixhqr': {
      'en': 'Not Called',
      'ar': '',
    },
    'aqrkkfqk': {
      'en': 'Pending Review',
      'ar': '',
    },
    'kevfag77': {
      'en': 'Closed',
      'ar': '',
    },
    '6mbsrg97': {
      'en': 'Completed',
      'ar': '',
    },
    'x7dr7gif': {
      'en': 'Please select...',
      'ar': '',
    },
    '96yookj9': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '7ajgzeo0': {
      'en': 'All',
      'ar': '',
    },
    'g1hel3p4': {
      'en': 'Pending',
      'ar': '',
    },
    'y8vkdn8c': {
      'en': 'Completed',
      'ar': '',
    },
    'iyeglmdg': {
      'en': 'Calling',
      'ar': '',
    },
    'nvbg5rz7': {
      'en': 'All',
      'ar': '',
    },
    'djh0awha': {
      'en': '50%',
      'ar': '',
    },
    'go1y1gru': {
      'en': 'Notifications',
      'ar': '',
    },
    'rv72mx09': {
      'en': 'Notifications',
      'ar': '',
    },
    '3es04tsv': {
      'en': 'Turn on notifications',
      'ar': '',
    },
    'or7f08lj': {
      'en': 'Male',
      'ar': '',
    },
    '4wso1kdr': {
      'en': 'Female',
      'ar': '',
    },
    'y1s9361t': {
      'en': 'Other',
      'ar': '',
    },
    'c1achnd3': {
      'en': 'Design',
      'ar': '',
    },
    'oqiwjpw2': {
      'en': 'Marketing',
      'ar': '',
    },
    'wbd7myej': {
      'en': 'Development',
      'ar': '',
    },
    'hw38q7t0': {
      'en': 'Management',
      'ar': '',
    },
    'xirwddjz': {
      'en': 'Operations',
      'ar': '',
    },
    'xoqgeazz': {
      'en': 'Customer Service',
      'ar': '',
    },
    'v5034ucm': {
      'en': 'Design',
      'ar': '',
    },
    '8js2qnch': {
      'en': 'Button',
      'ar': '',
    },
    'g04koavl': {
      'en': 'Button',
      'ar': '',
    },
    'ppgdobr6': {
      'en': 'Button',
      'ar': '',
    },
    'n1jsafsm': {
      'en': '',
      'ar': '',
    },
    'm8bd9vgc': {
      'en': '',
      'ar': '',
    },
    '6rljy2sc': {
      'en': '',
      'ar': '',
    },
    '54qz3wzf': {
      'en': '',
      'ar': '',
    },
    'bx531skf': {
      'en': '',
      'ar': '',
    },
    'ja0hmrzc': {
      'en': '',
      'ar': '',
    },
    '68k5s01n': {
      'en': '',
      'ar': '',
    },
    '5g25hgor': {
      'en': '',
      'ar': '',
    },
    '3uq1wc2t': {
      'en': '',
      'ar': '',
    },
    's12jnwtb': {
      'en': '',
      'ar': '',
    },
    'gwvbbx8x': {
      'en': '',
      'ar': '',
    },
    'ezjkmv0h': {
      'en': '',
      'ar': '',
    },
    'l59g8imu': {
      'en': '',
      'ar': '',
    },
    'etxb4vna': {
      'en': '',
      'ar': '',
    },
    'a6tq56vu': {
      'en': '',
      'ar': '',
    },
    'q2c5x0vx': {
      'en': '',
      'ar': '',
    },
    '2kwahpjh': {
      'en': '',
      'ar': '',
    },
    '1uq6a1hx': {
      'en': '',
      'ar': '',
    },
    'g9q6z2ah': {
      'en': '',
      'ar': '',
    },
    '8coet8jq': {
      'en': '',
      'ar': '',
    },
    '3ixs03v1': {
      'en': '',
      'ar': '',
    },
    'p7p4yunc': {
      'en': '',
      'ar': '',
    },
    'nu1jwnqw': {
      'en': '',
      'ar': '',
    },
    'qrkp7mwj': {
      'en': '',
      'ar': '',
    },
    'tcmlh3bh': {
      'en': '',
      'ar': '',
    },
    'ct6pitue': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));

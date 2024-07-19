class Constants {
  /// The key name for storing the app theme in the Shared Preference.
  static const String preferenceKeyAppTheme = 'app_theme';

  /// The key name for storing the app display language in the Shared
  /// Preference.
  static const String preferenceKeyAppLocale = 'app_locale';

  /// The key name for storing the default sorting method of the A&E service
  /// waiting time list in the Shared Preference.
  static const String preferenceKeyDefaultSorting = 'default_sorting';

  /// The key name for storing the display text scale of the app in the Shared
  /// Preference.
  static const String preferenceKeyTextScale = 'text_scale';

  //////////////////////////////////////////////////////////////////////////////

  /// The key name of the compact-size screen (width < 600px).
  static const String screenSizeKeyCompact = 'compact';

  /// The key name of the medium-size screen (600px < width < 840px).
  static const String screenSizeKeyMedium = 'medium';

  /// The key name of the expanded-size screen (840px < width < 1200px).
  static const String screenSizeKeyExpanded = 'expanded';

  /// The key name of the large-size screen (1200px < width < 1600px).
  static const String screenSizeKeyLarge = 'large';

  /// The key name of the extra-large sized screen (width > 1600px).
  static const String screenSizeKeyExtraLarge = 'extra-large';

  /// The URL of the A&E services waiting time in Traditional Chinese.
  static const String apiWaitTimeTC =
      'https://www.ha.org.hk/opendata/aed/aedwtdata-tc.json';

  /// The URL of the A&E services waiting time in Simplified Chinese.
  static const String apiWaitTimeSC =
      'https://www.ha.org.hk/opendata/aed/aedwtdata-sc.json';

  /// The URL of the A&E services waiting time in English.
  static const String apiWaitTimeEN =
      'https://www.ha.org.hk/opendata/aed/aedwtdata-en.json';

  /// The URL of the list of hospital/institution.
  static const String apiFacilityHospital =
      'https://www.ha.org.hk/opendata/facility-hosp.json';

  /// The URL of the list of Specialist Outpatient Clinic.
  static const String apiFacilitySoc =
      'https://www.ha.org.hk/opendata/facility-sop.json';

  /// The URL of the list of General Outpatient Clinic.
  static const String apiFacilityGoc =
      'https://www.ha.org.hk/opendata/facility-gop.json';

  /// The URL of the list of Chinese Medicine Clinics cum Training and Research
  /// Centres.
  static const String apiFacilityCmc =
      'https://www.ha.org.hk/opendata/cmctr/facility-cmctr.json';

  /// The URL of the General Outpatient Clinic Quota in Traditional Chinese.
  static const String apiGocQuotaTC =
      'https://www.ha.org.hk/pas_gopc/pas_gopc_avg_quota_pdf/g0_9uo7a_p-tc.json';

  /// The URL of the General Outpatient Clinic Quota in Simplified Chinese.
  static const String apiGocQuotaSC =
      'https://www.ha.org.hk/pas_gopc/pas_gopc_avg_quota_pdf/g0_9uo7a_p-sc.json';

  /// The URL of the General Outpatient Clinic Quota in English.
  static const String apiGocQuotaEN =
      'https://www.ha.org.hk/pas_gopc/pas_gopc_avg_quota_pdf/g0_9uo7a_p-en.json';

  //////////////////////////////////////////////////////////////////////////////

  /// The URL of the OpenStreetMap contributors.
  static const String osmCopyright = 'https://openstreetmap.org/copyright';

  //////////////////////////////////////////////////////////////////////////////

  /// The URL of the GitHub repository page.
  static const String pageGitHubRepository =
      'https://github.com/kshuiroy/ae-live-flutter';

  /// The URL of the privacy policy page.
  static const String pagePrivacyPolicy =
      'https://sites.google.com/view/ae-live-privacy-policy/home';

  /// The URL of the terms and conditions page.
  static const String pageTermsAndConditions =
      'https://sites.google.com/view/ae-live-terms-conditions/home';
}

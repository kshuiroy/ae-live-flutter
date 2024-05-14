///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint

part of 'translations.g.dart';

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _TranslationsSettingsEn settings = _TranslationsSettingsEn._(_root);
	late final _TranslationsHomeEn home = _TranslationsHomeEn._(_root);
	late final _TranslationsWaitTimeDetailsEn waitTimeDetails = _TranslationsWaitTimeDetailsEn._(_root);
	late final _TranslationsMainEn main = _TranslationsMainEn._(_root);
}

// Path: settings
class _TranslationsSettingsEn {
	_TranslationsSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Settings';
	String get save => 'Save Settings';
	late final _TranslationsSettingsSectionsEn sections = _TranslationsSettingsSectionsEn._(_root);
	late final _TranslationsSettingsAppearanceEn appearance = _TranslationsSettingsAppearanceEn._(_root);
	late final _TranslationsSettingsDataEn data = _TranslationsSettingsDataEn._(_root);
	late final _TranslationsSettingsMoreEn more = _TranslationsSettingsMoreEn._(_root);
}

// Path: home
class _TranslationsHomeEn {
	_TranslationsHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'A&E Waiting Time';
	late final _TranslationsHomeActionsEn actions = _TranslationsHomeActionsEn._(_root);
	String get badgeText => 'Priority will be accorded to patients triaged as critical, emergency and urgent.';
	late final _TranslationsHomeRefreshIndicatorEn refreshIndicator = _TranslationsHomeRefreshIndicatorEn._(_root);
	late final _TranslationsHomeFilterEn filter = _TranslationsHomeFilterEn._(_root);
	late final _TranslationsHomePromptEn prompt = _TranslationsHomePromptEn._(_root);
}

// Path: waitTimeDetails
class _TranslationsWaitTimeDetailsEn {
	_TranslationsWaitTimeDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get expectedWaitTime => 'Expected Waiting Time (Non-Emergency)';
	late final _TranslationsWaitTimeDetailsActionsEn actions = _TranslationsWaitTimeDetailsActionsEn._(_root);
	String get chartTitle => 'Waiting Time of the Past 6 Hours';
	String get hours => '{value}H';
	late final _TranslationsWaitTimeDetailsInfoEn info = _TranslationsWaitTimeDetailsInfoEn._(_root);
	String get openMaps => 'Open Maps Application';
}

// Path: main
class _TranslationsMainEn {
	_TranslationsMainEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get app_name => 'A&E Live';
	Map<String, String> get tabs => {
		'home': 'Home',
		'lists': 'Lists',
		'settings': 'Settings',
	};
	late final _TranslationsMainClustersEn clusters = _TranslationsMainClustersEn._(_root);
	late final _TranslationsMainDataRemarksEn dataRemarks = _TranslationsMainDataRemarksEn._(_root);
}

// Path: settings.sections
class _TranslationsSettingsSectionsEn {
	_TranslationsSettingsSectionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get appearance => 'Appearance';
	String get data => 'Data Management';
	String get more => 'More';
}

// Path: settings.appearance
class _TranslationsSettingsAppearanceEn {
	_TranslationsSettingsAppearanceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _TranslationsSettingsAppearanceThemeEn theme = _TranslationsSettingsAppearanceThemeEn._(_root);
	late final _TranslationsSettingsAppearanceLanguageEn language = _TranslationsSettingsAppearanceLanguageEn._(_root);
	late final _TranslationsSettingsAppearanceSortingEn sorting = _TranslationsSettingsAppearanceSortingEn._(_root);
}

// Path: settings.data
class _TranslationsSettingsDataEn {
	_TranslationsSettingsDataEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _TranslationsSettingsDataResetEn reset = _TranslationsSettingsDataResetEn._(_root);
}

// Path: settings.more
class _TranslationsSettingsMoreEn {
	_TranslationsSettingsMoreEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get license => 'Open Source License';
	late final _TranslationsSettingsMoreAboutEn about = _TranslationsSettingsMoreAboutEn._(_root);
}

// Path: home.actions
class _TranslationsHomeActionsEn {
	_TranslationsHomeActionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get filter => 'Filter';
	String get refresh => 'Refresh Data';
	String get search => 'Search Hospital';
}

// Path: home.refreshIndicator
class _TranslationsHomeRefreshIndicatorEn {
	_TranslationsHomeRefreshIndicatorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get pullToRefresh => 'Pull to Refresh';
	String get releaseToRefresh => 'Release to Refresh';
	String get refreshing => 'Refreshing...';
	String get dataUpdated => 'Data Updated';
	String get failedToRefresh => 'Failed to Refresh';
	String get lastUpdateAt => 'Last Update At: %T';
}

// Path: home.filter
class _TranslationsHomeFilterEn {
	_TranslationsHomeFilterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get cluster => 'Hospital Cluster';
	late final _TranslationsHomeFilterSortingEn sorting = _TranslationsHomeFilterSortingEn._(_root);
	String get submit => 'Submit';
}

// Path: home.prompt
class _TranslationsHomePromptEn {
	_TranslationsHomePromptEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get noConnection => 'No internet connection.';
	String get serverError => 'Something went wrong with the server, please try again later.';
	String get noSearchResult => 'There is no hospital matches your search criteria.';
	String get selectItem => 'Please select a hospital card from the list to see the details of the hospital.';
}

// Path: waitTimeDetails.actions
class _TranslationsWaitTimeDetailsActionsEn {
	_TranslationsWaitTimeDetailsActionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get call => 'Call Hospital';
	String get maps => 'View Maps';
}

// Path: waitTimeDetails.info
class _TranslationsWaitTimeDetailsInfoEn {
	_TranslationsWaitTimeDetailsInfoEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Hospital Info';
	String get address => 'Address';
	String get contactNo => 'Contact No.';
	String get faxNo => 'Fax No.';
	String get emailAddress => 'Email Address';
	String get website => 'Website';
}

// Path: main.clusters
class _TranslationsMainClustersEn {
	_TranslationsMainClustersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get hke => 'Hong Kong East Cluster';
	String get hkw => 'Hong Kong West Cluster';
	String get klc => 'Kowloon Central Cluster';
	String get kle => 'Kowloon East Cluster';
	String get klw => 'Kowloon West Cluster';
	String get nte => 'New Territories East Cluster';
	String get ntw => 'New Territories West Cluster';
}

// Path: main.dataRemarks
class _TranslationsMainDataRemarksEn {
	_TranslationsMainDataRemarksEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Remarks';
	TextSpan content({required InlineSpanBuilder tapPCD, required InlineSpanBuilder tapHKD}) => TextSpan(children: [
		const TextSpan(text: 'The above data is collated from the waiting time in the past few hours. This is for reference only but not the current estimated waiting time.\n\nA&E Departments need to manage sudden arrival of accident victims and severely-ill patients. We apologise for not being able to provide an accurate estimate of waiting time for patients in general. Please be patient while waiting for consultation.\n\nWaiting time display is capped at 8 hours amid a large number of patients waiting for a long time are being treated in the A&E Department. Patients with minor illnesses can consider seeking alternative medical services from private clinics (as listed in '),
		tapPCD('Primary Care Directory'),
		const TextSpan(text: ' or '),
		tapHKD('Hong Kong Doctors Homepage'),
		const TextSpan(text: ').'),
	]);
	String get pcdUrl => 'https://apps.pcdirectory.gov.hk/mobile/en';
	String get hkdUrl => 'http://www.thkma.org/our_works/hong_kong_doctors/';
}

// Path: settings.appearance.theme
class _TranslationsSettingsAppearanceThemeEn {
	_TranslationsSettingsAppearanceThemeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Display Theme';
	late final _TranslationsSettingsAppearanceThemeOptionsEn options = _TranslationsSettingsAppearanceThemeOptionsEn._(_root);
}

// Path: settings.appearance.language
class _TranslationsSettingsAppearanceLanguageEn {
	_TranslationsSettingsAppearanceLanguageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Display Language';
	late final _TranslationsSettingsAppearanceLanguageOptionsEn options = _TranslationsSettingsAppearanceLanguageOptionsEn._(_root);
}

// Path: settings.appearance.sorting
class _TranslationsSettingsAppearanceSortingEn {
	_TranslationsSettingsAppearanceSortingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Default Sorting';
	late final _TranslationsSettingsAppearanceSortingOptionsEn options = _TranslationsSettingsAppearanceSortingOptionsEn._(_root);
}

// Path: settings.data.reset
class _TranslationsSettingsDataResetEn {
	_TranslationsSettingsDataResetEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Reset All Settings';
	String get message => 'If you\'ve experienced any difficulties while using this app, consider resetting all settings to restore its functionality. Please note that this action will take effect once the app has been restarted.';
	late final _TranslationsSettingsDataResetButtonsEn buttons = _TranslationsSettingsDataResetButtonsEn._(_root);
}

// Path: settings.more.about
class _TranslationsSettingsMoreAboutEn {
	_TranslationsSettingsMoreAboutEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'About This App';
	late final _TranslationsSettingsMoreAboutItemsEn items = _TranslationsSettingsMoreAboutItemsEn._(_root);
}

// Path: home.filter.sorting
class _TranslationsHomeFilterSortingEn {
	_TranslationsHomeFilterSortingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Sorting';
	String get nameInAsd => 'Hospital Name (A-Z)';
	String get nameInDesc => 'Hospital Name (Z-A)';
	String get timeInAsd => 'Waiting Time (ASD.)';
	String get timeInDesc => 'Waiting Time (DESC.)';
}

// Path: settings.appearance.theme.options
class _TranslationsSettingsAppearanceThemeOptionsEn {
	_TranslationsSettingsAppearanceThemeOptionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get light => 'Light Theme';
	String get dark => 'Dark Theme';
	String get system => 'Follow System';
}

// Path: settings.appearance.language.options
class _TranslationsSettingsAppearanceLanguageOptionsEn {
	_TranslationsSettingsAppearanceLanguageOptionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get zhHK => 'Traidtional Chinese (繁體中文)';
	String get zhCN => 'Simplified Chinese (简体中文)';
	String get en => 'English';
}

// Path: settings.appearance.sorting.options
class _TranslationsSettingsAppearanceSortingOptionsEn {
	_TranslationsSettingsAppearanceSortingOptionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get nameInAsd => 'Hospital Name (A-Z)';
	String get nameInDesc => 'Hospital Name (Z-A)';
	String get timeInAsd => 'Waiting Time (ASD.)';
	String get timeInDesc => 'Waiting Time (DESC.)';
}

// Path: settings.data.reset.buttons
class _TranslationsSettingsDataResetButtonsEn {
	_TranslationsSettingsDataResetButtonsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get cancel => 'Cancel';
	String get reset => 'Reset';
}

// Path: settings.more.about.items
class _TranslationsSettingsMoreAboutItemsEn {
	_TranslationsSettingsMoreAboutItemsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get version => 'App Version';
	late final _TranslationsSettingsMoreAboutItemsDataSourceEn dataSource = _TranslationsSettingsMoreAboutItemsDataSourceEn._(_root);
	late final _TranslationsSettingsMoreAboutItemsAppIconSourceEn appIconSource = _TranslationsSettingsMoreAboutItemsAppIconSourceEn._(_root);
	late final _TranslationsSettingsMoreAboutItemsImageSourceEn imageSource = _TranslationsSettingsMoreAboutItemsImageSourceEn._(_root);
}

// Path: settings.more.about.items.dataSource
class _TranslationsSettingsMoreAboutItemsDataSourceEn {
	_TranslationsSettingsMoreAboutItemsDataSourceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Data Source';
	String get value => 'DATA.GOV.HK and Hospital Authority';
}

// Path: settings.more.about.items.appIconSource
class _TranslationsSettingsMoreAboutItemsAppIconSourceEn {
	_TranslationsSettingsMoreAboutItemsAppIconSourceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'App Icon Source';
	String get value => 'Pictogrammers';
	String get url => 'https://pictogrammers.com/';
}

// Path: settings.more.about.items.imageSource
class _TranslationsSettingsMoreAboutItemsImageSourceEn {
	_TranslationsSettingsMoreAboutItemsImageSourceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Image Source';
	String get value => 'unDraw';
	String get url => 'https://undraw.co/license';
}

///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
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
	late final TranslationsHomeEn home = TranslationsHomeEn.internal(_root);
	late final TranslationsListsEn lists = TranslationsListsEn.internal(_root);
	late final TranslationsMainEn main = TranslationsMainEn.internal(_root);
	late final TranslationsSettingsEn settings = TranslationsSettingsEn.internal(_root);
	late final TranslationsSharedEn shared = TranslationsSharedEn.internal(_root);
	late final TranslationsWaitTimeDetailsEn waitTimeDetails = TranslationsWaitTimeDetailsEn.internal(_root);
}

// Path: home
class TranslationsHomeEn {
	TranslationsHomeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'A&E Waiting Time';
	late final TranslationsHomeActionsEn actions = TranslationsHomeActionsEn.internal(_root);
	String get badgeText => 'Priority will be accorded to patients triaged as critical, emergency and urgent.';
	late final TranslationsHomeRefreshIndicatorEn refreshIndicator = TranslationsHomeRefreshIndicatorEn.internal(_root);
	late final TranslationsHomePromptEn prompt = TranslationsHomePromptEn.internal(_root);
}

// Path: lists
class TranslationsListsEn {
	TranslationsListsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Facility Lists';
	late final TranslationsListsCategoriesEn categories = TranslationsListsCategoriesEn.internal(_root);
	late final TranslationsListsHospitalEn hospital = TranslationsListsHospitalEn.internal(_root);
	late final TranslationsListsSocEn soc = TranslationsListsSocEn.internal(_root);
	late final TranslationsListsGocEn goc = TranslationsListsGocEn.internal(_root);
	late final TranslationsListsCmcEn cmc = TranslationsListsCmcEn.internal(_root);
	late final TranslationsListsPromptEn prompt = TranslationsListsPromptEn.internal(_root);
	String get refresh => 'Refresh';
}

// Path: main
class TranslationsMainEn {
	TranslationsMainEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get app_name => 'A&E Live';
	Map<String, dynamic> get tabs => {
		'home': TranslationsMainTabsHomeEn.internal(_root),
		'lists': TranslationsMainTabsListsEn.internal(_root),
		'settings': TranslationsMainTabsSettingsEn.internal(_root),
	};
	late final TranslationsMainClustersEn clusters = TranslationsMainClustersEn.internal(_root);
	late final TranslationsMainDataRemarksEn dataRemarks = TranslationsMainDataRemarksEn.internal(_root);
}

// Path: settings
class TranslationsSettingsEn {
	TranslationsSettingsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Settings';
	String get save => 'Save Settings';
	late final TranslationsSettingsSectionsEn sections = TranslationsSettingsSectionsEn.internal(_root);
	late final TranslationsSettingsAppearanceEn appearance = TranslationsSettingsAppearanceEn.internal(_root);
	late final TranslationsSettingsDataEn data = TranslationsSettingsDataEn.internal(_root);
	late final TranslationsSettingsMoreEn more = TranslationsSettingsMoreEn.internal(_root);
	late final TranslationsSettingsPromptEn prompt = TranslationsSettingsPromptEn.internal(_root);
}

// Path: shared
class TranslationsSharedEn {
	TranslationsSharedEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSharedFilterEn filter = TranslationsSharedFilterEn.internal(_root);
	late final TranslationsSharedFacilityMapsEn facilityMaps = TranslationsSharedFacilityMapsEn.internal(_root);
}

// Path: waitTimeDetails
class TranslationsWaitTimeDetailsEn {
	TranslationsWaitTimeDetailsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get referencedWaitTime => 'Referenced A&E Waiting Time (Non-Urgent)';
	late final TranslationsWaitTimeDetailsActionsEn actions = TranslationsWaitTimeDetailsActionsEn.internal(_root);
	String get chartTitle => 'A&E Waiting Time of the Past 6 Hours';
	String get hours => '{value}H';
	late final TranslationsWaitTimeDetailsInfoEn info = TranslationsWaitTimeDetailsInfoEn.internal(_root);
	late final TranslationsWaitTimeDetailsShareContentEn shareContent = TranslationsWaitTimeDetailsShareContentEn.internal(_root);
}

// Path: home.actions
class TranslationsHomeActionsEn {
	TranslationsHomeActionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get filter => 'Filter';
	String get refresh => 'Refresh Data';
	String get search => 'Search Hospital';
}

// Path: home.refreshIndicator
class TranslationsHomeRefreshIndicatorEn {
	TranslationsHomeRefreshIndicatorEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get pullToRefresh => 'Pull to Refresh';
	String get releaseToRefresh => 'Release to Refresh';
	String get refreshing => 'Refreshing...';
	String get dataUpdated => 'Data Updated';
	String get failedToRefresh => 'Failed to Refresh';
	String get lastUpdateAt => 'Last Update At: %T';
}

// Path: home.prompt
class TranslationsHomePromptEn {
	TranslationsHomePromptEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get noConnection => 'No internet connection.';
	String get serverError => 'Something went wrong with the server, please try again later.';
	String get noSearchResult => 'There is no hospital matches your search criteria.';
	String get selectItem => 'Please select a hospital card from the list to view the details of the hospital.';
}

// Path: lists.categories
class TranslationsListsCategoriesEn {
	TranslationsListsCategoriesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get hospital => 'Hospital/Institution under the Hospial Authority';
	String get soc => 'Specialist Outpatient Clinic under the Hospial Authority';
	String get goc => 'General Outpatient Clinic under the Hospial Authority';
	String get cmc => 'Chinese Medicine Clinics cum Training and Research Centres';
}

// Path: lists.hospital
class TranslationsListsHospitalEn {
	TranslationsListsHospitalEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get search => 'Search Hospital/Institution';
	String get cluster => 'Hospital Cluster';
	String get withAEService => 'Provides A&E services';
	String get withoutAEService => 'No A&E services provided';
	String get noSearchResult => 'There is no hospital/institution matches your search criteria.';
}

// Path: lists.soc
class TranslationsListsSocEn {
	TranslationsListsSocEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get search => 'Search Specialist Outpatient Clinic';
	String get cluster => 'Clinic Cluster';
	String get noSearchResult => 'There is no clinic matches your search criteria.';
}

// Path: lists.goc
class TranslationsListsGocEn {
	TranslationsListsGocEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get search => 'Search General Outpatient Clinic';
	String get cluster => 'Clinic Cluster';
	String get noSearchResult => 'There is no clinic matches your search criteria.';
}

// Path: lists.cmc
class TranslationsListsCmcEn {
	TranslationsListsCmcEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get search => 'Search Chinese Medicine Clinics cum Training and Research Centres';
	String get region => 'Region';
	String get noSearchResult => 'There is no clinic matches your search criteria.';
}

// Path: lists.prompt
class TranslationsListsPromptEn {
	TranslationsListsPromptEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get noConnection => 'No internet connection.';
	String get serverError => 'Something went wrong with the server, please try again later.';
	String get selectCategory => 'Please select a category from the list to view the facility list.';
}

// Path: main.tabs.home
class TranslationsMainTabsHomeEn {
	TranslationsMainTabsHomeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get displayLabel => 'Home';
	String get semanticLabel => 'A&E service waiting time';
}

// Path: main.tabs.lists
class TranslationsMainTabsListsEn {
	TranslationsMainTabsListsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get displayLabel => 'Lists';
	String get semanticLabel => 'Facility Lists';
}

// Path: main.tabs.settings
class TranslationsMainTabsSettingsEn {
	TranslationsMainTabsSettingsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get displayLabel => 'Settings';
	String get semanticLabel => 'Settings';
}

// Path: main.clusters
class TranslationsMainClustersEn {
	TranslationsMainClustersEn.internal(this._root);

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
class TranslationsMainDataRemarksEn {
	TranslationsMainDataRemarksEn.internal(this._root);

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

// Path: settings.sections
class TranslationsSettingsSectionsEn {
	TranslationsSettingsSectionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get appearance => 'Appearance';
	String get data => 'Data Management';
	String get more => 'More';
}

// Path: settings.appearance
class TranslationsSettingsAppearanceEn {
	TranslationsSettingsAppearanceEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSettingsAppearanceThemeEn theme = TranslationsSettingsAppearanceThemeEn.internal(_root);
	late final TranslationsSettingsAppearanceLanguageEn language = TranslationsSettingsAppearanceLanguageEn.internal(_root);
	late final TranslationsSettingsAppearanceTextSizeEn textSize = TranslationsSettingsAppearanceTextSizeEn.internal(_root);
	late final TranslationsSettingsAppearanceSortingEn sorting = TranslationsSettingsAppearanceSortingEn.internal(_root);
}

// Path: settings.data
class TranslationsSettingsDataEn {
	TranslationsSettingsDataEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSettingsDataResetEn reset = TranslationsSettingsDataResetEn.internal(_root);
}

// Path: settings.more
class TranslationsSettingsMoreEn {
	TranslationsSettingsMoreEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get license => 'Open Source Licenses';
	late final TranslationsSettingsMorePrivacyPolicyEn privacyPolicy = TranslationsSettingsMorePrivacyPolicyEn.internal(_root);
	late final TranslationsSettingsMoreTermsConditionsEn termsConditions = TranslationsSettingsMoreTermsConditionsEn.internal(_root);
	late final TranslationsSettingsMoreAboutEn about = TranslationsSettingsMoreAboutEn.internal(_root);
}

// Path: settings.prompt
class TranslationsSettingsPromptEn {
	TranslationsSettingsPromptEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get selectItem => 'Please select an item from the list to update the settings of the app.';
	String get settingsReset => 'All settings have been reset. Please restart the app for the changes to take effect.';
}

// Path: shared.filter
class TranslationsSharedFilterEn {
	TranslationsSharedFilterEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSharedFilterSortingEn sorting = TranslationsSharedFilterSortingEn.internal(_root);
	String get hospitalCluster => 'Hospital Cluster';
	String get clinicCluster => 'Clinic Cluster';
	String get region => 'Region';
	String get district => 'District';
	late final TranslationsSharedFilterActionsEn actions = TranslationsSharedFilterActionsEn.internal(_root);
}

// Path: shared.facilityMaps
class TranslationsSharedFacilityMapsEn {
	TranslationsSharedFacilityMapsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get openMapsApp => 'Open Maps Application';
	String get closeMapsModal => 'Close the Maps Viewer';
}

// Path: waitTimeDetails.actions
class TranslationsWaitTimeDetailsActionsEn {
	TranslationsWaitTimeDetailsActionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get share => 'Share Hospital Info';
	String get call => 'Call Hospital';
	String get maps => 'View Maps';
}

// Path: waitTimeDetails.info
class TranslationsWaitTimeDetailsInfoEn {
	TranslationsWaitTimeDetailsInfoEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Hospital Info';
	String get address => 'Address';
	String get contactNo => 'Contact No.';
	String get faxNo => 'Fax No.';
	String get emailAddress => 'Email Address';
	String get website => 'Website';
}

// Path: waitTimeDetails.shareContent
class TranslationsWaitTimeDetailsShareContentEn {
	TranslationsWaitTimeDetailsShareContentEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String base({required Object hospitalName, required Object waitingTime, required Object address, required Object contactNo}) => '${hospitalName}\nA&E Waiting Time: ${waitingTime}\n--------\nAddress: ${address}\nContact No.: ${contactNo}';
	String faxNo({required Object faxNo}) => '\nFax No.: ${faxNo}';
	String emailAddress({required Object emailAddress}) => '\nEmail Address: ${emailAddress}';
	String website({required Object website}) => '\nWebsite: ${website}';
}

// Path: settings.appearance.theme
class TranslationsSettingsAppearanceThemeEn {
	TranslationsSettingsAppearanceThemeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Display Theme';
	late final TranslationsSettingsAppearanceThemeOptionsEn options = TranslationsSettingsAppearanceThemeOptionsEn.internal(_root);
}

// Path: settings.appearance.language
class TranslationsSettingsAppearanceLanguageEn {
	TranslationsSettingsAppearanceLanguageEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Display Language';
	late final TranslationsSettingsAppearanceLanguageOptionsEn options = TranslationsSettingsAppearanceLanguageOptionsEn.internal(_root);
}

// Path: settings.appearance.textSize
class TranslationsSettingsAppearanceTextSizeEn {
	TranslationsSettingsAppearanceTextSizeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Text Size';
	late final TranslationsSettingsAppearanceTextSizeOptionsEn options = TranslationsSettingsAppearanceTextSizeOptionsEn.internal(_root);
}

// Path: settings.appearance.sorting
class TranslationsSettingsAppearanceSortingEn {
	TranslationsSettingsAppearanceSortingEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Default Sorting of A&E Waiting Time';
	late final TranslationsSettingsAppearanceSortingOptionsEn options = TranslationsSettingsAppearanceSortingOptionsEn.internal(_root);
}

// Path: settings.data.reset
class TranslationsSettingsDataResetEn {
	TranslationsSettingsDataResetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Reset All Settings';
	String get message => 'If you\'ve experienced any difficulties while using this app, consider resetting all settings to restore its functionality. Please note that this action will take effect once the app has been restarted.';
	late final TranslationsSettingsDataResetButtonsEn buttons = TranslationsSettingsDataResetButtonsEn.internal(_root);
}

// Path: settings.more.privacyPolicy
class TranslationsSettingsMorePrivacyPolicyEn {
	TranslationsSettingsMorePrivacyPolicyEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Privacy Policy';
	String get subtitle => '';
}

// Path: settings.more.termsConditions
class TranslationsSettingsMoreTermsConditionsEn {
	TranslationsSettingsMoreTermsConditionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Terms and Conditions';
	String get subtitle => '';
}

// Path: settings.more.about
class TranslationsSettingsMoreAboutEn {
	TranslationsSettingsMoreAboutEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'About This App';
	late final TranslationsSettingsMoreAboutItemsEn items = TranslationsSettingsMoreAboutItemsEn.internal(_root);
}

// Path: shared.filter.sorting
class TranslationsSharedFilterSortingEn {
	TranslationsSharedFilterSortingEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Sorting';
	String get nameInAsd => 'Hospital Name (A-Z)';
	String get nameInDesc => 'Hospital Name (Z-A)';
	String get timeInAsd => 'Waiting Time (ASD.)';
	String get timeInDesc => 'Waiting Time (DESC.)';
}

// Path: shared.filter.actions
class TranslationsSharedFilterActionsEn {
	TranslationsSharedFilterActionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get apply => 'Apply';
	String get reset => 'Reset';
	String get clear => 'Clear';
}

// Path: settings.appearance.theme.options
class TranslationsSettingsAppearanceThemeOptionsEn {
	TranslationsSettingsAppearanceThemeOptionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get light => 'Light Theme';
	String get dark => 'Dark Theme';
	String get system => 'Follow System';
}

// Path: settings.appearance.language.options
class TranslationsSettingsAppearanceLanguageOptionsEn {
	TranslationsSettingsAppearanceLanguageOptionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get zhHK => 'Traditional Chinese (繁體中文)';
	String get zhCN => 'Simplified Chinese (简体中文)';
	String get en => 'English';
}

// Path: settings.appearance.textSize.options
class TranslationsSettingsAppearanceTextSizeOptionsEn {
	TranslationsSettingsAppearanceTextSizeOptionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get defaultSize => 'Default';
	String get largeSize => 'Large';
	String get extraLargeSize => 'Extra-Large';
}

// Path: settings.appearance.sorting.options
class TranslationsSettingsAppearanceSortingOptionsEn {
	TranslationsSettingsAppearanceSortingOptionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get nameInAsd => 'Hospital Name (A-Z)';
	String get nameInDesc => 'Hospital Name (Z-A)';
	String get timeInAsd => 'Waiting Time (ASD.)';
	String get timeInDesc => 'Waiting Time (DESC.)';
}

// Path: settings.data.reset.buttons
class TranslationsSettingsDataResetButtonsEn {
	TranslationsSettingsDataResetButtonsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get cancel => 'Cancel';
	String get reset => 'Reset';
}

// Path: settings.more.about.items
class TranslationsSettingsMoreAboutItemsEn {
	TranslationsSettingsMoreAboutItemsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get version => 'App Version';
	late final TranslationsSettingsMoreAboutItemsGithubEn github = TranslationsSettingsMoreAboutItemsGithubEn.internal(_root);
	late final TranslationsSettingsMoreAboutItemsDataSourceEn dataSource = TranslationsSettingsMoreAboutItemsDataSourceEn.internal(_root);
	late final TranslationsSettingsMoreAboutItemsImageSourceEn imageSource = TranslationsSettingsMoreAboutItemsImageSourceEn.internal(_root);
}

// Path: settings.more.about.items.github
class TranslationsSettingsMoreAboutItemsGithubEn {
	TranslationsSettingsMoreAboutItemsGithubEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'GitHub Repository';
	String get value => 'Licensed under the GPL-3.0 license.';
}

// Path: settings.more.about.items.dataSource
class TranslationsSettingsMoreAboutItemsDataSourceEn {
	TranslationsSettingsMoreAboutItemsDataSourceEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Data Source';
	String get value => 'DATA.GOV.HK and Hospital Authority';
}

// Path: settings.more.about.items.imageSource
class TranslationsSettingsMoreAboutItemsImageSourceEn {
	TranslationsSettingsMoreAboutItemsImageSourceEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Image Source';
	String get value => 'unDraw';
	String get url => 'https://undraw.co/license';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.title': return 'A&E Waiting Time';
			case 'home.actions.filter': return 'Filter';
			case 'home.actions.refresh': return 'Refresh Data';
			case 'home.actions.search': return 'Search Hospital';
			case 'home.badgeText': return 'Priority will be accorded to patients triaged as critical, emergency and urgent.';
			case 'home.refreshIndicator.pullToRefresh': return 'Pull to Refresh';
			case 'home.refreshIndicator.releaseToRefresh': return 'Release to Refresh';
			case 'home.refreshIndicator.refreshing': return 'Refreshing...';
			case 'home.refreshIndicator.dataUpdated': return 'Data Updated';
			case 'home.refreshIndicator.failedToRefresh': return 'Failed to Refresh';
			case 'home.refreshIndicator.lastUpdateAt': return 'Last Update At: %T';
			case 'home.prompt.noConnection': return 'No internet connection.';
			case 'home.prompt.serverError': return 'Something went wrong with the server, please try again later.';
			case 'home.prompt.noSearchResult': return 'There is no hospital matches your search criteria.';
			case 'home.prompt.selectItem': return 'Please select a hospital card from the list to view the details of the hospital.';
			case 'lists.title': return 'Facility Lists';
			case 'lists.categories.hospital': return 'Hospital/Institution under the Hospial Authority';
			case 'lists.categories.soc': return 'Specialist Outpatient Clinic under the Hospial Authority';
			case 'lists.categories.goc': return 'General Outpatient Clinic under the Hospial Authority';
			case 'lists.categories.cmc': return 'Chinese Medicine Clinics cum Training and Research Centres';
			case 'lists.hospital.search': return 'Search Hospital/Institution';
			case 'lists.hospital.cluster': return 'Hospital Cluster';
			case 'lists.hospital.withAEService': return 'Provides A&E services';
			case 'lists.hospital.withoutAEService': return 'No A&E services provided';
			case 'lists.hospital.noSearchResult': return 'There is no hospital/institution matches your search criteria.';
			case 'lists.soc.search': return 'Search Specialist Outpatient Clinic';
			case 'lists.soc.cluster': return 'Clinic Cluster';
			case 'lists.soc.noSearchResult': return 'There is no clinic matches your search criteria.';
			case 'lists.goc.search': return 'Search General Outpatient Clinic';
			case 'lists.goc.cluster': return 'Clinic Cluster';
			case 'lists.goc.noSearchResult': return 'There is no clinic matches your search criteria.';
			case 'lists.cmc.search': return 'Search Chinese Medicine Clinics cum Training and Research Centres';
			case 'lists.cmc.region': return 'Region';
			case 'lists.cmc.noSearchResult': return 'There is no clinic matches your search criteria.';
			case 'lists.prompt.noConnection': return 'No internet connection.';
			case 'lists.prompt.serverError': return 'Something went wrong with the server, please try again later.';
			case 'lists.prompt.selectCategory': return 'Please select a category from the list to view the facility list.';
			case 'lists.refresh': return 'Refresh';
			case 'main.app_name': return 'A&E Live';
			case 'main.tabs.home.displayLabel': return 'Home';
			case 'main.tabs.home.semanticLabel': return 'A&E service waiting time';
			case 'main.tabs.lists.displayLabel': return 'Lists';
			case 'main.tabs.lists.semanticLabel': return 'Facility Lists';
			case 'main.tabs.settings.displayLabel': return 'Settings';
			case 'main.tabs.settings.semanticLabel': return 'Settings';
			case 'main.clusters.hke': return 'Hong Kong East Cluster';
			case 'main.clusters.hkw': return 'Hong Kong West Cluster';
			case 'main.clusters.klc': return 'Kowloon Central Cluster';
			case 'main.clusters.kle': return 'Kowloon East Cluster';
			case 'main.clusters.klw': return 'Kowloon West Cluster';
			case 'main.clusters.nte': return 'New Territories East Cluster';
			case 'main.clusters.ntw': return 'New Territories West Cluster';
			case 'main.dataRemarks.title': return 'Remarks';
			case 'main.dataRemarks.content': return ({required InlineSpanBuilder tapPCD, required InlineSpanBuilder tapHKD}) => TextSpan(children: [
				const TextSpan(text: 'The above data is collated from the waiting time in the past few hours. This is for reference only but not the current estimated waiting time.\n\nA&E Departments need to manage sudden arrival of accident victims and severely-ill patients. We apologise for not being able to provide an accurate estimate of waiting time for patients in general. Please be patient while waiting for consultation.\n\nWaiting time display is capped at 8 hours amid a large number of patients waiting for a long time are being treated in the A&E Department. Patients with minor illnesses can consider seeking alternative medical services from private clinics (as listed in '),
				tapPCD('Primary Care Directory'),
				const TextSpan(text: ' or '),
				tapHKD('Hong Kong Doctors Homepage'),
				const TextSpan(text: ').'),
			]);
			case 'main.dataRemarks.pcdUrl': return 'https://apps.pcdirectory.gov.hk/mobile/en';
			case 'main.dataRemarks.hkdUrl': return 'http://www.thkma.org/our_works/hong_kong_doctors/';
			case 'settings.title': return 'Settings';
			case 'settings.save': return 'Save Settings';
			case 'settings.sections.appearance': return 'Appearance';
			case 'settings.sections.data': return 'Data Management';
			case 'settings.sections.more': return 'More';
			case 'settings.appearance.theme.title': return 'Display Theme';
			case 'settings.appearance.theme.options.light': return 'Light Theme';
			case 'settings.appearance.theme.options.dark': return 'Dark Theme';
			case 'settings.appearance.theme.options.system': return 'Follow System';
			case 'settings.appearance.language.title': return 'Display Language';
			case 'settings.appearance.language.options.zhHK': return 'Traditional Chinese (繁體中文)';
			case 'settings.appearance.language.options.zhCN': return 'Simplified Chinese (简体中文)';
			case 'settings.appearance.language.options.en': return 'English';
			case 'settings.appearance.textSize.title': return 'Text Size';
			case 'settings.appearance.textSize.options.defaultSize': return 'Default';
			case 'settings.appearance.textSize.options.largeSize': return 'Large';
			case 'settings.appearance.textSize.options.extraLargeSize': return 'Extra-Large';
			case 'settings.appearance.sorting.title': return 'Default Sorting of A&E Waiting Time';
			case 'settings.appearance.sorting.options.nameInAsd': return 'Hospital Name (A-Z)';
			case 'settings.appearance.sorting.options.nameInDesc': return 'Hospital Name (Z-A)';
			case 'settings.appearance.sorting.options.timeInAsd': return 'Waiting Time (ASD.)';
			case 'settings.appearance.sorting.options.timeInDesc': return 'Waiting Time (DESC.)';
			case 'settings.data.reset.title': return 'Reset All Settings';
			case 'settings.data.reset.message': return 'If you\'ve experienced any difficulties while using this app, consider resetting all settings to restore its functionality. Please note that this action will take effect once the app has been restarted.';
			case 'settings.data.reset.buttons.cancel': return 'Cancel';
			case 'settings.data.reset.buttons.reset': return 'Reset';
			case 'settings.more.license': return 'Open Source Licenses';
			case 'settings.more.privacyPolicy.title': return 'Privacy Policy';
			case 'settings.more.privacyPolicy.subtitle': return '';
			case 'settings.more.termsConditions.title': return 'Terms and Conditions';
			case 'settings.more.termsConditions.subtitle': return '';
			case 'settings.more.about.title': return 'About This App';
			case 'settings.more.about.items.version': return 'App Version';
			case 'settings.more.about.items.github.title': return 'GitHub Repository';
			case 'settings.more.about.items.github.value': return 'Licensed under the GPL-3.0 license.';
			case 'settings.more.about.items.dataSource.title': return 'Data Source';
			case 'settings.more.about.items.dataSource.value': return 'DATA.GOV.HK and Hospital Authority';
			case 'settings.more.about.items.imageSource.title': return 'Image Source';
			case 'settings.more.about.items.imageSource.value': return 'unDraw';
			case 'settings.more.about.items.imageSource.url': return 'https://undraw.co/license';
			case 'settings.prompt.selectItem': return 'Please select an item from the list to update the settings of the app.';
			case 'settings.prompt.settingsReset': return 'All settings have been reset. Please restart the app for the changes to take effect.';
			case 'shared.filter.sorting.title': return 'Sorting';
			case 'shared.filter.sorting.nameInAsd': return 'Hospital Name (A-Z)';
			case 'shared.filter.sorting.nameInDesc': return 'Hospital Name (Z-A)';
			case 'shared.filter.sorting.timeInAsd': return 'Waiting Time (ASD.)';
			case 'shared.filter.sorting.timeInDesc': return 'Waiting Time (DESC.)';
			case 'shared.filter.hospitalCluster': return 'Hospital Cluster';
			case 'shared.filter.clinicCluster': return 'Clinic Cluster';
			case 'shared.filter.region': return 'Region';
			case 'shared.filter.district': return 'District';
			case 'shared.filter.actions.apply': return 'Apply';
			case 'shared.filter.actions.reset': return 'Reset';
			case 'shared.filter.actions.clear': return 'Clear';
			case 'shared.facilityMaps.openMapsApp': return 'Open Maps Application';
			case 'shared.facilityMaps.closeMapsModal': return 'Close the Maps Viewer';
			case 'waitTimeDetails.referencedWaitTime': return 'Referenced A&E Waiting Time (Non-Urgent)';
			case 'waitTimeDetails.actions.share': return 'Share Hospital Info';
			case 'waitTimeDetails.actions.call': return 'Call Hospital';
			case 'waitTimeDetails.actions.maps': return 'View Maps';
			case 'waitTimeDetails.chartTitle': return 'A&E Waiting Time of the Past 6 Hours';
			case 'waitTimeDetails.hours': return '{value}H';
			case 'waitTimeDetails.info.title': return 'Hospital Info';
			case 'waitTimeDetails.info.address': return 'Address';
			case 'waitTimeDetails.info.contactNo': return 'Contact No.';
			case 'waitTimeDetails.info.faxNo': return 'Fax No.';
			case 'waitTimeDetails.info.emailAddress': return 'Email Address';
			case 'waitTimeDetails.info.website': return 'Website';
			case 'waitTimeDetails.shareContent.base': return ({required Object hospitalName, required Object waitingTime, required Object address, required Object contactNo}) => '${hospitalName}\nA&E Waiting Time: ${waitingTime}\n--------\nAddress: ${address}\nContact No.: ${contactNo}';
			case 'waitTimeDetails.shareContent.faxNo': return ({required Object faxNo}) => '\nFax No.: ${faxNo}';
			case 'waitTimeDetails.shareContent.emailAddress': return ({required Object emailAddress}) => '\nEmail Address: ${emailAddress}';
			case 'waitTimeDetails.shareContent.website': return ({required Object website}) => '\nWebsite: ${website}';
			default: return null;
		}
	}
}


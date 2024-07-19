///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint

part of 'translations.g.dart';

// Path: <root>
class _TranslationsZhHk extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsZhHk.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.zhHk,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-HK>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	@override late final _TranslationsZhHk _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeZhHk home = _TranslationsHomeZhHk._(_root);
	@override late final _TranslationsListsZhHk lists = _TranslationsListsZhHk._(_root);
	@override late final _TranslationsMainZhHk main = _TranslationsMainZhHk._(_root);
	@override late final _TranslationsSettingsZhHk settings = _TranslationsSettingsZhHk._(_root);
	@override late final _TranslationsSharedZhHk shared = _TranslationsSharedZhHk._(_root);
	@override late final _TranslationsWaitTimeDetailsZhHk waitTimeDetails = _TranslationsWaitTimeDetailsZhHk._(_root);
}

// Path: home
class _TranslationsHomeZhHk extends _TranslationsHomeEn {
	_TranslationsHomeZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '急症室等候時間';
	@override late final _TranslationsHomeActionsZhHk actions = _TranslationsHomeActionsZhHk._(_root);
	@override String get badgeText => '急症室會優先診治被分流為危殆、危急和緊急的病人。';
	@override late final _TranslationsHomeRefreshIndicatorZhHk refreshIndicator = _TranslationsHomeRefreshIndicatorZhHk._(_root);
	@override late final _TranslationsHomePromptZhHk prompt = _TranslationsHomePromptZhHk._(_root);
}

// Path: lists
class _TranslationsListsZhHk extends _TranslationsListsEn {
	_TranslationsListsZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '設施目錄';
	@override late final _TranslationsListsCategoriesZhHk categories = _TranslationsListsCategoriesZhHk._(_root);
	@override late final _TranslationsListsHospitalZhHk hospital = _TranslationsListsHospitalZhHk._(_root);
	@override late final _TranslationsListsSocZhHk soc = _TranslationsListsSocZhHk._(_root);
	@override late final _TranslationsListsGocZhHk goc = _TranslationsListsGocZhHk._(_root);
	@override late final _TranslationsListsCmcZhHk cmc = _TranslationsListsCmcZhHk._(_root);
	@override late final _TranslationsListsPromptZhHk prompt = _TranslationsListsPromptZhHk._(_root);
	@override String get refresh => '重新整理';
}

// Path: main
class _TranslationsMainZhHk extends _TranslationsMainEn {
	_TranslationsMainZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get app_name => '急症室現場';
	@override Map<String, dynamic> get tabs => {
		'home': _TranslationsMainTabsHomeZhHk._(_root),
		'lists': _TranslationsMainTabsListsZhHk._(_root),
		'settings': _TranslationsMainTabsSettingsZhHk._(_root),
	};
	@override late final _TranslationsMainClustersZhHk clusters = _TranslationsMainClustersZhHk._(_root);
	@override late final _TranslationsMainDataRemarksZhHk dataRemarks = _TranslationsMainDataRemarksZhHk._(_root);
}

// Path: settings
class _TranslationsSettingsZhHk extends _TranslationsSettingsEn {
	_TranslationsSettingsZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '設定';
	@override String get save => '儲存設定';
	@override late final _TranslationsSettingsSectionsZhHk sections = _TranslationsSettingsSectionsZhHk._(_root);
	@override late final _TranslationsSettingsAppearanceZhHk appearance = _TranslationsSettingsAppearanceZhHk._(_root);
	@override late final _TranslationsSettingsDataZhHk data = _TranslationsSettingsDataZhHk._(_root);
	@override late final _TranslationsSettingsMoreZhHk more = _TranslationsSettingsMoreZhHk._(_root);
	@override late final _TranslationsSettingsPromptZhHk prompt = _TranslationsSettingsPromptZhHk._(_root);
}

// Path: shared
class _TranslationsSharedZhHk extends _TranslationsSharedEn {
	_TranslationsSharedZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSharedFilterZhHk filter = _TranslationsSharedFilterZhHk._(_root);
	@override late final _TranslationsSharedFacilityMapsZhHk facilityMaps = _TranslationsSharedFacilityMapsZhHk._(_root);
}

// Path: waitTimeDetails
class _TranslationsWaitTimeDetailsZhHk extends _TranslationsWaitTimeDetailsEn {
	_TranslationsWaitTimeDetailsZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get estimatedWaitTime => '急症室預計等候時間（非緊急病人）';
	@override late final _TranslationsWaitTimeDetailsActionsZhHk actions = _TranslationsWaitTimeDetailsActionsZhHk._(_root);
	@override String get chartTitle => '過去 6 小時的急症室等候時間';
	@override String get hours => '{value} 小時';
	@override late final _TranslationsWaitTimeDetailsInfoZhHk info = _TranslationsWaitTimeDetailsInfoZhHk._(_root);
	@override late final _TranslationsWaitTimeDetailsShareContentZhHk shareContent = _TranslationsWaitTimeDetailsShareContentZhHk._(_root);
}

// Path: home.actions
class _TranslationsHomeActionsZhHk extends _TranslationsHomeActionsEn {
	_TranslationsHomeActionsZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get filter => '篩選醫院';
	@override String get refresh => '重新整理';
	@override String get search => '搜尋醫院';
}

// Path: home.refreshIndicator
class _TranslationsHomeRefreshIndicatorZhHk extends _TranslationsHomeRefreshIndicatorEn {
	_TranslationsHomeRefreshIndicatorZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get pullToRefresh => '下拉更新資料';
	@override String get releaseToRefresh => '放開即可更新';
	@override String get refreshing => '正在更新⋯⋯';
	@override String get dataUpdated => '資料已更新';
	@override String get failedToRefresh => '資料更新失敗';
	@override String get lastUpdateAt => '最後更新：%T';
}

// Path: home.prompt
class _TranslationsHomePromptZhHk extends _TranslationsHomePromptEn {
	_TranslationsHomePromptZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get noConnection => '沒有網絡連線。';
	@override String get serverError => '伺服器發生錯誤，請稍後再試。';
	@override String get noSearchResult => '沒有符合搜尋條件的醫院。';
	@override String get selectItem => '請在列表中選取一張醫院卡片，以查看醫院的詳情。';
}

// Path: lists.categories
class _TranslationsListsCategoriesZhHk extends _TranslationsListsCategoriesEn {
	_TranslationsListsCategoriesZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get hospital => '醫院管理局轄下的醫院/機構';
	@override String get soc => '醫院管理局轄下的專科門診診所';
	@override String get goc => '醫院管理局轄下的普通科門診診所';
	@override String get cmc => '中醫診所暨教研中心';
}

// Path: lists.hospital
class _TranslationsListsHospitalZhHk extends _TranslationsListsHospitalEn {
	_TranslationsListsHospitalZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get search => '搜尋醫院/機構';
	@override String get cluster => '醫院聯網';
	@override String get withAEService => '提供急症室服務';
	@override String get withoutAEService => '沒有急症室服務';
	@override String get noSearchResult => '沒有符合搜尋條件的醫院/機構。';
}

// Path: lists.soc
class _TranslationsListsSocZhHk extends _TranslationsListsSocEn {
	_TranslationsListsSocZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get search => '搜尋專科門診診所';
	@override String get cluster => '診所聯網';
	@override String get noSearchResult => '沒有符合搜尋條件的診所。';
}

// Path: lists.goc
class _TranslationsListsGocZhHk extends _TranslationsListsGocEn {
	_TranslationsListsGocZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get search => '搜尋普通科門診診所';
	@override String get cluster => '診所聯網';
	@override String get noSearchResult => '沒有符合搜尋條件的診所。';
}

// Path: lists.cmc
class _TranslationsListsCmcZhHk extends _TranslationsListsCmcEn {
	_TranslationsListsCmcZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get search => '搜尋中醫診所暨教研中心';
	@override String get region => '區域';
	@override String get noSearchResult => '沒有符合搜尋條件的診所。';
}

// Path: lists.prompt
class _TranslationsListsPromptZhHk extends _TranslationsListsPromptEn {
	_TranslationsListsPromptZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get noConnection => '沒有網絡連線。';
	@override String get serverError => '伺服器發生錯誤，請稍後再試。';
	@override String get selectCategory => '請在列表中選取一個分類以查看設施目錄。';
}

// Path: main.tabs.home
class _TranslationsMainTabsHomeZhHk extends _TranslationsMainTabsHomeEn {
	_TranslationsMainTabsHomeZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get displayLabel => '主頁';
	@override String get semanticLabel => '急症室服務等候時間';
}

// Path: main.tabs.lists
class _TranslationsMainTabsListsZhHk extends _TranslationsMainTabsListsEn {
	_TranslationsMainTabsListsZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get displayLabel => '目錄';
	@override String get semanticLabel => '設施目錄';
}

// Path: main.tabs.settings
class _TranslationsMainTabsSettingsZhHk extends _TranslationsMainTabsSettingsEn {
	_TranslationsMainTabsSettingsZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get displayLabel => '設定';
	@override String get semanticLabel => '設定';
}

// Path: main.clusters
class _TranslationsMainClustersZhHk extends _TranslationsMainClustersEn {
	_TranslationsMainClustersZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get hke => '港島東醫院聯網';
	@override String get hkw => '港島西醫院聯網';
	@override String get klc => '九龍中醫院聯網';
	@override String get kle => '九龍東醫院聯網';
	@override String get klw => '九龍西醫院聯網';
	@override String get nte => '新界東醫院聯網';
	@override String get ntw => '新界西醫院聯網';
}

// Path: main.dataRemarks
class _TranslationsMainDataRemarksZhHk extends _TranslationsMainDataRemarksEn {
	_TranslationsMainDataRemarksZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '注意事項';
	@override TextSpan content({required InlineSpanBuilder tapPCD, required InlineSpanBuilder tapHKD}) => TextSpan(children: [
		const TextSpan(text: '上述數據是統計過去數小時的最長等候時間，只供參考，並非預計等候時間。\n\n急症室須處理突發意外傷者及危重病人，因此未能準確提供預計等候時間，敬請見諒及耐心等候。\n\n最長等候時間顯示上限為 8 小時，表示急症室正處理大量等候已久的病人。病況輕微病人可考慮使用私營醫療服務（'),
		tapPCD('基層醫療指南'),
		const TextSpan(text: '或'),
		tapHKD('香港醫生網'),
		const TextSpan(text: '）。'),
	]);
	@override String get pcdUrl => 'https://apps.pcdirectory.gov.hk/mobile/tc';
	@override String get hkdUrl => 'http://www.thkma.org/our_works/hong_kong_doctors/';
}

// Path: settings.sections
class _TranslationsSettingsSectionsZhHk extends _TranslationsSettingsSectionsEn {
	_TranslationsSettingsSectionsZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get appearance => '外觀';
	@override String get data => '數據管理';
	@override String get more => '更多';
}

// Path: settings.appearance
class _TranslationsSettingsAppearanceZhHk extends _TranslationsSettingsAppearanceEn {
	_TranslationsSettingsAppearanceZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsAppearanceThemeZhHk theme = _TranslationsSettingsAppearanceThemeZhHk._(_root);
	@override late final _TranslationsSettingsAppearanceLanguageZhHk language = _TranslationsSettingsAppearanceLanguageZhHk._(_root);
	@override late final _TranslationsSettingsAppearanceTextSizeZhHk textSize = _TranslationsSettingsAppearanceTextSizeZhHk._(_root);
	@override late final _TranslationsSettingsAppearanceSortingZhHk sorting = _TranslationsSettingsAppearanceSortingZhHk._(_root);
}

// Path: settings.data
class _TranslationsSettingsDataZhHk extends _TranslationsSettingsDataEn {
	_TranslationsSettingsDataZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsDataResetZhHk reset = _TranslationsSettingsDataResetZhHk._(_root);
}

// Path: settings.more
class _TranslationsSettingsMoreZhHk extends _TranslationsSettingsMoreEn {
	_TranslationsSettingsMoreZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get license => '開放源代碼授權';
	@override late final _TranslationsSettingsMorePrivacyPolicyZhHk privacyPolicy = _TranslationsSettingsMorePrivacyPolicyZhHk._(_root);
	@override late final _TranslationsSettingsMoreTermsConditionsZhHk termsConditions = _TranslationsSettingsMoreTermsConditionsZhHk._(_root);
	@override late final _TranslationsSettingsMoreAboutZhHk about = _TranslationsSettingsMoreAboutZhHk._(_root);
}

// Path: settings.prompt
class _TranslationsSettingsPromptZhHk extends _TranslationsSettingsPromptEn {
	_TranslationsSettingsPromptZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get selectItem => '請在列表中選取一個項目來更改應用程式的設定。';
	@override String get settingsReset => '所有設定已重設。請重新啟動應用程式以使重設生效。';
}

// Path: shared.filter
class _TranslationsSharedFilterZhHk extends _TranslationsSharedFilterEn {
	_TranslationsSharedFilterZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSharedFilterSortingZhHk sorting = _TranslationsSharedFilterSortingZhHk._(_root);
	@override String get hospitalCluster => '醫院聯網';
	@override String get clinicCluster => '診所聯網';
	@override String get region => '區域';
	@override String get district => '地區';
	@override late final _TranslationsSharedFilterActionsZhHk actions = _TranslationsSharedFilterActionsZhHk._(_root);
}

// Path: shared.facilityMaps
class _TranslationsSharedFacilityMapsZhHk extends _TranslationsSharedFacilityMapsEn {
	_TranslationsSharedFacilityMapsZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get openMapsApp => '開啟地圖應用程式';
	@override String get closeMapsModal => '關閉地圖檢視介面';
}

// Path: waitTimeDetails.actions
class _TranslationsWaitTimeDetailsActionsZhHk extends _TranslationsWaitTimeDetailsActionsEn {
	_TranslationsWaitTimeDetailsActionsZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get share => '分享醫院資訊';
	@override String get call => '致電醫院';
	@override String get maps => '查看地圖';
}

// Path: waitTimeDetails.info
class _TranslationsWaitTimeDetailsInfoZhHk extends _TranslationsWaitTimeDetailsInfoEn {
	_TranslationsWaitTimeDetailsInfoZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '醫院資料';
	@override String get address => '地址';
	@override String get contactNo => '電話號碼';
	@override String get faxNo => '傳真號碼';
	@override String get emailAddress => '電郵地址';
	@override String get website => '網址';
}

// Path: waitTimeDetails.shareContent
class _TranslationsWaitTimeDetailsShareContentZhHk extends _TranslationsWaitTimeDetailsShareContentEn {
	_TranslationsWaitTimeDetailsShareContentZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String base({required Object hospitalName, required Object waitingTime, required Object address, required Object contactNo}) => '${hospitalName}\n急症室等候時間：${waitingTime}\n--------\n地址：${address}\n電話號碼：${contactNo}';
	@override String faxNo({required Object faxNo}) => '\n傳真號碼：${faxNo}';
	@override String emailAddress({required Object emailAddress}) => '\n電郵地址：${emailAddress}';
	@override String website({required Object website}) => '\n網址：${website}';
}

// Path: settings.appearance.theme
class _TranslationsSettingsAppearanceThemeZhHk extends _TranslationsSettingsAppearanceThemeEn {
	_TranslationsSettingsAppearanceThemeZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '顯示主題';
	@override late final _TranslationsSettingsAppearanceThemeOptionsZhHk options = _TranslationsSettingsAppearanceThemeOptionsZhHk._(_root);
}

// Path: settings.appearance.language
class _TranslationsSettingsAppearanceLanguageZhHk extends _TranslationsSettingsAppearanceLanguageEn {
	_TranslationsSettingsAppearanceLanguageZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '顯示語言';
	@override late final _TranslationsSettingsAppearanceLanguageOptionsZhHk options = _TranslationsSettingsAppearanceLanguageOptionsZhHk._(_root);
}

// Path: settings.appearance.textSize
class _TranslationsSettingsAppearanceTextSizeZhHk extends _TranslationsSettingsAppearanceTextSizeEn {
	_TranslationsSettingsAppearanceTextSizeZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '文字大小';
	@override late final _TranslationsSettingsAppearanceTextSizeOptionsZhHk options = _TranslationsSettingsAppearanceTextSizeOptionsZhHk._(_root);
}

// Path: settings.appearance.sorting
class _TranslationsSettingsAppearanceSortingZhHk extends _TranslationsSettingsAppearanceSortingEn {
	_TranslationsSettingsAppearanceSortingZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '急症室等候時間預設排序方式';
	@override late final _TranslationsSettingsAppearanceSortingOptionsZhHk options = _TranslationsSettingsAppearanceSortingOptionsZhHk._(_root);
}

// Path: settings.data.reset
class _TranslationsSettingsDataResetZhHk extends _TranslationsSettingsDataResetEn {
	_TranslationsSettingsDataResetZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '重設所有設定';
	@override String get message => '如果您在使用此應用程式時遇到任何問題，請考慮重置所有設置以恢復功能。請注意，此操作將在應用程式重新啟動後生效。';
	@override late final _TranslationsSettingsDataResetButtonsZhHk buttons = _TranslationsSettingsDataResetButtonsZhHk._(_root);
}

// Path: settings.more.privacyPolicy
class _TranslationsSettingsMorePrivacyPolicyZhHk extends _TranslationsSettingsMorePrivacyPolicyEn {
	_TranslationsSettingsMorePrivacyPolicyZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '私隱政策';
	@override String get subtitle => '只提供英文版本';
}

// Path: settings.more.termsConditions
class _TranslationsSettingsMoreTermsConditionsZhHk extends _TranslationsSettingsMoreTermsConditionsEn {
	_TranslationsSettingsMoreTermsConditionsZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '條款及細則';
	@override String get subtitle => '只提供英文版本';
}

// Path: settings.more.about
class _TranslationsSettingsMoreAboutZhHk extends _TranslationsSettingsMoreAboutEn {
	_TranslationsSettingsMoreAboutZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '關於本應用程式';
	@override late final _TranslationsSettingsMoreAboutItemsZhHk items = _TranslationsSettingsMoreAboutItemsZhHk._(_root);
}

// Path: shared.filter.sorting
class _TranslationsSharedFilterSortingZhHk extends _TranslationsSharedFilterSortingEn {
	_TranslationsSharedFilterSortingZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '排序';
	@override String get nameInAsd => '醫院英文名稱（A-Z）';
	@override String get nameInDesc => '醫院英文名稱（Z-A）';
	@override String get timeInAsd => '等候時間（由短至長）';
	@override String get timeInDesc => '等候時間（由長至短）';
}

// Path: shared.filter.actions
class _TranslationsSharedFilterActionsZhHk extends _TranslationsSharedFilterActionsEn {
	_TranslationsSharedFilterActionsZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get apply => '套用';
	@override String get reset => '重設';
	@override String get clear => '清除';
}

// Path: settings.appearance.theme.options
class _TranslationsSettingsAppearanceThemeOptionsZhHk extends _TranslationsSettingsAppearanceThemeOptionsEn {
	_TranslationsSettingsAppearanceThemeOptionsZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get light => '淺色主題';
	@override String get dark => '深色主題';
	@override String get system => '跟隨系統設定';
}

// Path: settings.appearance.language.options
class _TranslationsSettingsAppearanceLanguageOptionsZhHk extends _TranslationsSettingsAppearanceLanguageOptionsEn {
	_TranslationsSettingsAppearanceLanguageOptionsZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get zhHK => '繁體中文';
	@override String get zhCN => '簡體中文 (简体中文)';
	@override String get en => '英文 (English)';
}

// Path: settings.appearance.textSize.options
class _TranslationsSettingsAppearanceTextSizeOptionsZhHk extends _TranslationsSettingsAppearanceTextSizeOptionsEn {
	_TranslationsSettingsAppearanceTextSizeOptionsZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get defaultSize => '預設';
	@override String get largeSize => '大';
	@override String get extraLargeSize => '特大';
}

// Path: settings.appearance.sorting.options
class _TranslationsSettingsAppearanceSortingOptionsZhHk extends _TranslationsSettingsAppearanceSortingOptionsEn {
	_TranslationsSettingsAppearanceSortingOptionsZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get nameInAsd => '醫院英文名稱（A-Z）';
	@override String get nameInDesc => '醫院英文名稱（Z-A）';
	@override String get timeInAsd => '等候時間（由短至長）';
	@override String get timeInDesc => '等候時間（由長至短）';
}

// Path: settings.data.reset.buttons
class _TranslationsSettingsDataResetButtonsZhHk extends _TranslationsSettingsDataResetButtonsEn {
	_TranslationsSettingsDataResetButtonsZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get cancel => '取消';
	@override String get reset => '重設';
}

// Path: settings.more.about.items
class _TranslationsSettingsMoreAboutItemsZhHk extends _TranslationsSettingsMoreAboutItemsEn {
	_TranslationsSettingsMoreAboutItemsZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get version => '應用程式版本';
	@override late final _TranslationsSettingsMoreAboutItemsGithubZhHk github = _TranslationsSettingsMoreAboutItemsGithubZhHk._(_root);
	@override late final _TranslationsSettingsMoreAboutItemsDataSourceZhHk dataSource = _TranslationsSettingsMoreAboutItemsDataSourceZhHk._(_root);
	@override late final _TranslationsSettingsMoreAboutItemsImageSourceZhHk imageSource = _TranslationsSettingsMoreAboutItemsImageSourceZhHk._(_root);
}

// Path: settings.more.about.items.github
class _TranslationsSettingsMoreAboutItemsGithubZhHk extends _TranslationsSettingsMoreAboutItemsGithubEn {
	_TranslationsSettingsMoreAboutItemsGithubZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => 'GitHub 儲存庫';
	@override String get value => '根據 GPL-3.0 許可證授權。';
}

// Path: settings.more.about.items.dataSource
class _TranslationsSettingsMoreAboutItemsDataSourceZhHk extends _TranslationsSettingsMoreAboutItemsDataSourceEn {
	_TranslationsSettingsMoreAboutItemsDataSourceZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '資料來源';
	@override String get value => '資料一線通、醫院管理局';
}

// Path: settings.more.about.items.imageSource
class _TranslationsSettingsMoreAboutItemsImageSourceZhHk extends _TranslationsSettingsMoreAboutItemsImageSourceEn {
	_TranslationsSettingsMoreAboutItemsImageSourceZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '插圖來源';
	@override String get value => 'unDraw';
	@override String get url => 'https://undraw.co/license';
}

///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint

part of 'translations.g.dart';

// Path: <root>
class _TranslationsZhCn extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsZhCn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.zhCn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-CN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	@override late final _TranslationsZhCn _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeZhCn home = _TranslationsHomeZhCn._(_root);
	@override late final _TranslationsListsZhCn lists = _TranslationsListsZhCn._(_root);
	@override late final _TranslationsMainZhCn main = _TranslationsMainZhCn._(_root);
	@override late final _TranslationsSettingsZhCn settings = _TranslationsSettingsZhCn._(_root);
	@override late final _TranslationsSharedZhCn shared = _TranslationsSharedZhCn._(_root);
	@override late final _TranslationsWaitTimeDetailsZhCn waitTimeDetails = _TranslationsWaitTimeDetailsZhCn._(_root);
}

// Path: home
class _TranslationsHomeZhCn extends _TranslationsHomeEn {
	_TranslationsHomeZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '急症室等候时间';
	@override late final _TranslationsHomeActionsZhCn actions = _TranslationsHomeActionsZhCn._(_root);
	@override String get badgeText => '急症室会优先诊治被分流為危殆、危急和紧急的病人。';
	@override late final _TranslationsHomeRefreshIndicatorZhCn refreshIndicator = _TranslationsHomeRefreshIndicatorZhCn._(_root);
	@override late final _TranslationsHomePromptZhCn prompt = _TranslationsHomePromptZhCn._(_root);
}

// Path: lists
class _TranslationsListsZhCn extends _TranslationsListsEn {
	_TranslationsListsZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '设施目录';
	@override late final _TranslationsListsCategoriesZhCn categories = _TranslationsListsCategoriesZhCn._(_root);
	@override late final _TranslationsListsHospitalZhCn hospital = _TranslationsListsHospitalZhCn._(_root);
	@override late final _TranslationsListsSocZhCn soc = _TranslationsListsSocZhCn._(_root);
	@override late final _TranslationsListsGocZhCn goc = _TranslationsListsGocZhCn._(_root);
	@override late final _TranslationsListsCmcZhCn cmc = _TranslationsListsCmcZhCn._(_root);
	@override late final _TranslationsListsPromptZhCn prompt = _TranslationsListsPromptZhCn._(_root);
	@override String get refresh => '重新整理';
}

// Path: main
class _TranslationsMainZhCn extends _TranslationsMainEn {
	_TranslationsMainZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get app_name => '急症室现场';
	@override Map<String, dynamic> get tabs => {
		'home': _TranslationsMainTabsHomeZhCn._(_root),
		'lists': _TranslationsMainTabsListsZhCn._(_root),
		'settings': _TranslationsMainTabsSettingsZhCn._(_root),
	};
	@override late final _TranslationsMainClustersZhCn clusters = _TranslationsMainClustersZhCn._(_root);
	@override late final _TranslationsMainDataRemarksZhCn dataRemarks = _TranslationsMainDataRemarksZhCn._(_root);
}

// Path: settings
class _TranslationsSettingsZhCn extends _TranslationsSettingsEn {
	_TranslationsSettingsZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '设定';
	@override String get save => '储存设定';
	@override late final _TranslationsSettingsSectionsZhCn sections = _TranslationsSettingsSectionsZhCn._(_root);
	@override late final _TranslationsSettingsAppearanceZhCn appearance = _TranslationsSettingsAppearanceZhCn._(_root);
	@override late final _TranslationsSettingsDataZhCn data = _TranslationsSettingsDataZhCn._(_root);
	@override late final _TranslationsSettingsMoreZhCn more = _TranslationsSettingsMoreZhCn._(_root);
	@override late final _TranslationsSettingsPromptZhCn prompt = _TranslationsSettingsPromptZhCn._(_root);
}

// Path: shared
class _TranslationsSharedZhCn extends _TranslationsSharedEn {
	_TranslationsSharedZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSharedFilterZhCn filter = _TranslationsSharedFilterZhCn._(_root);
	@override late final _TranslationsSharedFacilityMapsZhCn facilityMaps = _TranslationsSharedFacilityMapsZhCn._(_root);
}

// Path: waitTimeDetails
class _TranslationsWaitTimeDetailsZhCn extends _TranslationsWaitTimeDetailsEn {
	_TranslationsWaitTimeDetailsZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get estimatedWaitTime => '急症室预计等候时间（非紧急病人）';
	@override late final _TranslationsWaitTimeDetailsActionsZhCn actions = _TranslationsWaitTimeDetailsActionsZhCn._(_root);
	@override String get chartTitle => '过去 6 小时的急症室等候时间';
	@override String get hours => '{value} 小时';
	@override late final _TranslationsWaitTimeDetailsInfoZhCn info = _TranslationsWaitTimeDetailsInfoZhCn._(_root);
	@override late final _TranslationsWaitTimeDetailsShareContentZhCn shareContent = _TranslationsWaitTimeDetailsShareContentZhCn._(_root);
}

// Path: home.actions
class _TranslationsHomeActionsZhCn extends _TranslationsHomeActionsEn {
	_TranslationsHomeActionsZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get filter => '筛选医院';
	@override String get refresh => '重新整理';
	@override String get search => '搜寻医院';
}

// Path: home.refreshIndicator
class _TranslationsHomeRefreshIndicatorZhCn extends _TranslationsHomeRefreshIndicatorEn {
	_TranslationsHomeRefreshIndicatorZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get pullToRefresh => '下拉更新资料';
	@override String get releaseToRefresh => '放开即可更新';
	@override String get refreshing => '正在更新⋯⋯';
	@override String get dataUpdated => '资料已更新';
	@override String get failedToRefresh => '资料更新失败';
	@override String get lastUpdateAt => '最后更新：%T';
}

// Path: home.prompt
class _TranslationsHomePromptZhCn extends _TranslationsHomePromptEn {
	_TranslationsHomePromptZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get noConnection => '没有网络连线。';
	@override String get serverError => '服务器发生错误，请稍后再试。';
	@override String get noSearchResult => '没有符合搜寻条件的医院。';
	@override String get selectItem => '请在列表中选取一张医院卡片，以查看医院的详情。';
}

// Path: lists.categories
class _TranslationsListsCategoriesZhCn extends _TranslationsListsCategoriesEn {
	_TranslationsListsCategoriesZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get hospital => '医院管理局辖下的医院/机构';
	@override String get soc => '医院管理局辖下的专科门诊诊所';
	@override String get goc => '医院管理局辖下的普通科门诊诊所';
	@override String get cmc => '中医诊所暨教研中心';
}

// Path: lists.hospital
class _TranslationsListsHospitalZhCn extends _TranslationsListsHospitalEn {
	_TranslationsListsHospitalZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get search => '搜寻医院/机构';
	@override String get cluster => '医院联网';
	@override String get withAEService => '提供急症室服务';
	@override String get withoutAEService => '没有急症室服务';
	@override String get noSearchResult => '没有符合搜寻条件的医院/机构。';
}

// Path: lists.soc
class _TranslationsListsSocZhCn extends _TranslationsListsSocEn {
	_TranslationsListsSocZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get search => '搜寻专科门诊诊所';
	@override String get cluster => '诊所联网';
	@override String get noSearchResult => '没有符合搜寻条件的诊所。';
}

// Path: lists.goc
class _TranslationsListsGocZhCn extends _TranslationsListsGocEn {
	_TranslationsListsGocZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get search => '搜寻普通科门诊诊所';
	@override String get cluster => '诊所联网';
	@override String get noSearchResult => '没有符合搜寻条件的诊所。';
}

// Path: lists.cmc
class _TranslationsListsCmcZhCn extends _TranslationsListsCmcEn {
	_TranslationsListsCmcZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get search => '搜寻中医诊所暨教研中心';
	@override String get region => '区域';
	@override String get noSearchResult => '没有符合搜寻条件的诊所。';
}

// Path: lists.prompt
class _TranslationsListsPromptZhCn extends _TranslationsListsPromptEn {
	_TranslationsListsPromptZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get noConnection => '没有网络连线。';
	@override String get serverError => '服务器发生错误，请稍后再试。';
	@override String get selectCategory => '请在列表中选取一个分类以查看设施目录。';
}

// Path: main.tabs.home
class _TranslationsMainTabsHomeZhCn extends _TranslationsMainTabsHomeEn {
	_TranslationsMainTabsHomeZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get displayLabel => '主页';
	@override String get semanticLabel => '急症室服务等候时间';
}

// Path: main.tabs.lists
class _TranslationsMainTabsListsZhCn extends _TranslationsMainTabsListsEn {
	_TranslationsMainTabsListsZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get displayLabel => '目录';
	@override String get semanticLabel => '设施目录';
}

// Path: main.tabs.settings
class _TranslationsMainTabsSettingsZhCn extends _TranslationsMainTabsSettingsEn {
	_TranslationsMainTabsSettingsZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get displayLabel => '设定';
	@override String get semanticLabel => '设定';
}

// Path: main.clusters
class _TranslationsMainClustersZhCn extends _TranslationsMainClustersEn {
	_TranslationsMainClustersZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get hke => '港岛东医院联网';
	@override String get hkw => '港岛西医院联网';
	@override String get klc => '九龙中医院联网';
	@override String get kle => '九龙东医院联网';
	@override String get klw => '九龙西医院联网';
	@override String get nte => '新界东医院联网';
	@override String get ntw => '新界西医院联网';
}

// Path: main.dataRemarks
class _TranslationsMainDataRemarksZhCn extends _TranslationsMainDataRemarksEn {
	_TranslationsMainDataRemarksZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '注意事项';
	@override TextSpan content({required InlineSpanBuilder tapPCD, required InlineSpanBuilder tapHKD}) => TextSpan(children: [
		const TextSpan(text: '上述数据是统计过去数小时的最长等候时间，只供参考，并非预计等候时间。\n\n急症室须处理突发意外伤者及危重病人，因此未能准确提供预计等候时间，敬请见谅及耐心等候。\n\n最长等候时间显示上限为 8 小时，表示急症室正处理大量等候已久的病人。病况轻微病人可考虑使用私营医疗服务（'),
		tapPCD('基层医疗指南'),
		const TextSpan(text: '或'),
		tapHKD('香港医生网'),
		const TextSpan(text: '）。'),
	]);
	@override String get pcdUrl => 'https://apps.pcdirectory.gov.hk/mobile/sc';
	@override String get hkdUrl => 'http://www.thkma.org/our_works/hong_kong_doctors/';
}

// Path: settings.sections
class _TranslationsSettingsSectionsZhCn extends _TranslationsSettingsSectionsEn {
	_TranslationsSettingsSectionsZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get appearance => '外观';
	@override String get data => '数据管理';
	@override String get more => '更多';
}

// Path: settings.appearance
class _TranslationsSettingsAppearanceZhCn extends _TranslationsSettingsAppearanceEn {
	_TranslationsSettingsAppearanceZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsAppearanceThemeZhCn theme = _TranslationsSettingsAppearanceThemeZhCn._(_root);
	@override late final _TranslationsSettingsAppearanceLanguageZhCn language = _TranslationsSettingsAppearanceLanguageZhCn._(_root);
	@override late final _TranslationsSettingsAppearanceTextSizeZhCn textSize = _TranslationsSettingsAppearanceTextSizeZhCn._(_root);
	@override late final _TranslationsSettingsAppearanceSortingZhCn sorting = _TranslationsSettingsAppearanceSortingZhCn._(_root);
}

// Path: settings.data
class _TranslationsSettingsDataZhCn extends _TranslationsSettingsDataEn {
	_TranslationsSettingsDataZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsDataResetZhCn reset = _TranslationsSettingsDataResetZhCn._(_root);
}

// Path: settings.more
class _TranslationsSettingsMoreZhCn extends _TranslationsSettingsMoreEn {
	_TranslationsSettingsMoreZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get license => '开放源代码授权';
	@override late final _TranslationsSettingsMorePrivacyPolicyZhCn privacyPolicy = _TranslationsSettingsMorePrivacyPolicyZhCn._(_root);
	@override late final _TranslationsSettingsMoreTermsConditionsZhCn termsConditions = _TranslationsSettingsMoreTermsConditionsZhCn._(_root);
	@override late final _TranslationsSettingsMoreAboutZhCn about = _TranslationsSettingsMoreAboutZhCn._(_root);
}

// Path: settings.prompt
class _TranslationsSettingsPromptZhCn extends _TranslationsSettingsPromptEn {
	_TranslationsSettingsPromptZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get selectItem => '请在列表中选取一个项目来更改应用程序的设定。';
	@override String get settingsReset => '所有设定已重设。请重新启动应用程序以使重设生效。';
}

// Path: shared.filter
class _TranslationsSharedFilterZhCn extends _TranslationsSharedFilterEn {
	_TranslationsSharedFilterZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSharedFilterSortingZhCn sorting = _TranslationsSharedFilterSortingZhCn._(_root);
	@override String get hospitalCluster => '医院联网';
	@override String get clinicCluster => '诊所联网';
	@override String get region => '区域';
	@override String get district => '地区';
	@override late final _TranslationsSharedFilterActionsZhCn actions = _TranslationsSharedFilterActionsZhCn._(_root);
}

// Path: shared.facilityMaps
class _TranslationsSharedFacilityMapsZhCn extends _TranslationsSharedFacilityMapsEn {
	_TranslationsSharedFacilityMapsZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get openMapsApp => '开启地图应用程序';
	@override String get closeMapsModal => '关闭地图检视界面';
}

// Path: waitTimeDetails.actions
class _TranslationsWaitTimeDetailsActionsZhCn extends _TranslationsWaitTimeDetailsActionsEn {
	_TranslationsWaitTimeDetailsActionsZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get share => '分享医院资讯';
	@override String get call => '致电医院';
	@override String get maps => '查看地图';
}

// Path: waitTimeDetails.info
class _TranslationsWaitTimeDetailsInfoZhCn extends _TranslationsWaitTimeDetailsInfoEn {
	_TranslationsWaitTimeDetailsInfoZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '医院资料';
	@override String get address => '地址';
	@override String get contactNo => '电话号码';
	@override String get faxNo => '传真号码';
	@override String get emailAddress => '电邮地址';
	@override String get website => '网址';
}

// Path: waitTimeDetails.shareContent
class _TranslationsWaitTimeDetailsShareContentZhCn extends _TranslationsWaitTimeDetailsShareContentEn {
	_TranslationsWaitTimeDetailsShareContentZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String base({required Object hospitalName, required Object waitingTime, required Object address, required Object contactNo}) => '${hospitalName}\n急症室等候时间：${waitingTime}\n--------\n地址：${address}\n电话号码：${contactNo}';
	@override String faxNo({required Object faxNo}) => '\n传真号码：${faxNo}';
	@override String emailAddress({required Object emailAddress}) => '\n电邮地址：${emailAddress}';
	@override String website({required Object website}) => '\n网址：${website}';
}

// Path: settings.appearance.theme
class _TranslationsSettingsAppearanceThemeZhCn extends _TranslationsSettingsAppearanceThemeEn {
	_TranslationsSettingsAppearanceThemeZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '显示主题';
	@override late final _TranslationsSettingsAppearanceThemeOptionsZhCn options = _TranslationsSettingsAppearanceThemeOptionsZhCn._(_root);
}

// Path: settings.appearance.language
class _TranslationsSettingsAppearanceLanguageZhCn extends _TranslationsSettingsAppearanceLanguageEn {
	_TranslationsSettingsAppearanceLanguageZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '显示语言';
	@override late final _TranslationsSettingsAppearanceLanguageOptionsZhCn options = _TranslationsSettingsAppearanceLanguageOptionsZhCn._(_root);
}

// Path: settings.appearance.textSize
class _TranslationsSettingsAppearanceTextSizeZhCn extends _TranslationsSettingsAppearanceTextSizeEn {
	_TranslationsSettingsAppearanceTextSizeZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '文字大小';
	@override late final _TranslationsSettingsAppearanceTextSizeOptionsZhCn options = _TranslationsSettingsAppearanceTextSizeOptionsZhCn._(_root);
}

// Path: settings.appearance.sorting
class _TranslationsSettingsAppearanceSortingZhCn extends _TranslationsSettingsAppearanceSortingEn {
	_TranslationsSettingsAppearanceSortingZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '急症室等候时间默认排序方式';
	@override late final _TranslationsSettingsAppearanceSortingOptionsZhCn options = _TranslationsSettingsAppearanceSortingOptionsZhCn._(_root);
}

// Path: settings.data.reset
class _TranslationsSettingsDataResetZhCn extends _TranslationsSettingsDataResetEn {
	_TranslationsSettingsDataResetZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '重设所有设定';
	@override String get message => '如果您在使用此应用程序时遇到任何问题，请考虑重置所有设置以恢复功能。请注意，此操作将在应用程序重新启动后生效。';
	@override late final _TranslationsSettingsDataResetButtonsZhCn buttons = _TranslationsSettingsDataResetButtonsZhCn._(_root);
}

// Path: settings.more.privacyPolicy
class _TranslationsSettingsMorePrivacyPolicyZhCn extends _TranslationsSettingsMorePrivacyPolicyEn {
	_TranslationsSettingsMorePrivacyPolicyZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '隐私政策';
	@override String get subtitle => '只提供英文版本';
}

// Path: settings.more.termsConditions
class _TranslationsSettingsMoreTermsConditionsZhCn extends _TranslationsSettingsMoreTermsConditionsEn {
	_TranslationsSettingsMoreTermsConditionsZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '条款及细则';
	@override String get subtitle => '只提供英文版本';
}

// Path: settings.more.about
class _TranslationsSettingsMoreAboutZhCn extends _TranslationsSettingsMoreAboutEn {
	_TranslationsSettingsMoreAboutZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '关于本应用程序';
	@override late final _TranslationsSettingsMoreAboutItemsZhCn items = _TranslationsSettingsMoreAboutItemsZhCn._(_root);
}

// Path: shared.filter.sorting
class _TranslationsSharedFilterSortingZhCn extends _TranslationsSharedFilterSortingEn {
	_TranslationsSharedFilterSortingZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '排序';
	@override String get nameInAsd => '医院英文名称（A-Z）';
	@override String get nameInDesc => '医院英文名称（Z-A）';
	@override String get timeInAsd => '等候时间（由短至长）';
	@override String get timeInDesc => '等候时间（由长至短）';
}

// Path: shared.filter.actions
class _TranslationsSharedFilterActionsZhCn extends _TranslationsSharedFilterActionsEn {
	_TranslationsSharedFilterActionsZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get apply => '套用';
	@override String get reset => '重设';
	@override String get clear => '清除';
}

// Path: settings.appearance.theme.options
class _TranslationsSettingsAppearanceThemeOptionsZhCn extends _TranslationsSettingsAppearanceThemeOptionsEn {
	_TranslationsSettingsAppearanceThemeOptionsZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get light => '浅色主题';
	@override String get dark => '深色主题';
	@override String get system => '跟随系统设定';
}

// Path: settings.appearance.language.options
class _TranslationsSettingsAppearanceLanguageOptionsZhCn extends _TranslationsSettingsAppearanceLanguageOptionsEn {
	_TranslationsSettingsAppearanceLanguageOptionsZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get zhHK => '繁体中文 (繁體中文)';
	@override String get zhCN => '简体中文';
	@override String get en => '英文 (English)';
}

// Path: settings.appearance.textSize.options
class _TranslationsSettingsAppearanceTextSizeOptionsZhCn extends _TranslationsSettingsAppearanceTextSizeOptionsEn {
	_TranslationsSettingsAppearanceTextSizeOptionsZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get defaultSize => '默认';
	@override String get largeSize => '大';
	@override String get extraLargeSize => '特大';
}

// Path: settings.appearance.sorting.options
class _TranslationsSettingsAppearanceSortingOptionsZhCn extends _TranslationsSettingsAppearanceSortingOptionsEn {
	_TranslationsSettingsAppearanceSortingOptionsZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get nameInAsd => '医院英文名称（A-Z）';
	@override String get nameInDesc => '医院英文名称（Z-A）';
	@override String get timeInAsd => '等候时间（由短至长）';
	@override String get timeInDesc => '等候时间（由长至短）';
}

// Path: settings.data.reset.buttons
class _TranslationsSettingsDataResetButtonsZhCn extends _TranslationsSettingsDataResetButtonsEn {
	_TranslationsSettingsDataResetButtonsZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get cancel => '取消';
	@override String get reset => '重设';
}

// Path: settings.more.about.items
class _TranslationsSettingsMoreAboutItemsZhCn extends _TranslationsSettingsMoreAboutItemsEn {
	_TranslationsSettingsMoreAboutItemsZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get version => '应用程序版本';
	@override late final _TranslationsSettingsMoreAboutItemsDataSourceZhCn dataSource = _TranslationsSettingsMoreAboutItemsDataSourceZhCn._(_root);
	@override late final _TranslationsSettingsMoreAboutItemsImageSourceZhCn imageSource = _TranslationsSettingsMoreAboutItemsImageSourceZhCn._(_root);
}

// Path: settings.more.about.items.dataSource
class _TranslationsSettingsMoreAboutItemsDataSourceZhCn extends _TranslationsSettingsMoreAboutItemsDataSourceEn {
	_TranslationsSettingsMoreAboutItemsDataSourceZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '资料来源';
	@override String get value => '资料一线通、医院管理局';
}

// Path: settings.more.about.items.imageSource
class _TranslationsSettingsMoreAboutItemsImageSourceZhCn extends _TranslationsSettingsMoreAboutItemsImageSourceEn {
	_TranslationsSettingsMoreAboutItemsImageSourceZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '插图来源';
	@override String get value => 'unDraw';
	@override String get url => 'https://undraw.co/license';
}

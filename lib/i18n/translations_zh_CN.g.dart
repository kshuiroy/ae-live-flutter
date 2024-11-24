///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsZhCn extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZhCn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.zhCn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-CN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsZhCn _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeZhCn home = _TranslationsHomeZhCn._(_root);
	@override late final _TranslationsListsZhCn lists = _TranslationsListsZhCn._(_root);
	@override late final _TranslationsMainZhCn main = _TranslationsMainZhCn._(_root);
	@override late final _TranslationsSettingsZhCn settings = _TranslationsSettingsZhCn._(_root);
	@override late final _TranslationsSharedZhCn shared = _TranslationsSharedZhCn._(_root);
	@override late final _TranslationsWaitTimeDetailsZhCn waitTimeDetails = _TranslationsWaitTimeDetailsZhCn._(_root);
}

// Path: home
class _TranslationsHomeZhCn extends TranslationsHomeEn {
	_TranslationsHomeZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '急症室等候时间';
	@override late final _TranslationsHomeActionsZhCn actions = _TranslationsHomeActionsZhCn._(_root);
	@override String get badgeText => '急症室会优先诊治被分流為危殆、危急和紧急的病人。';
	@override late final _TranslationsHomeRefreshIndicatorZhCn refreshIndicator = _TranslationsHomeRefreshIndicatorZhCn._(_root);
	@override late final _TranslationsHomePromptZhCn prompt = _TranslationsHomePromptZhCn._(_root);
}

// Path: lists
class _TranslationsListsZhCn extends TranslationsListsEn {
	_TranslationsListsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

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
class _TranslationsMainZhCn extends TranslationsMainEn {
	_TranslationsMainZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

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
class _TranslationsSettingsZhCn extends TranslationsSettingsEn {
	_TranslationsSettingsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

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
class _TranslationsSharedZhCn extends TranslationsSharedEn {
	_TranslationsSharedZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSharedFilterZhCn filter = _TranslationsSharedFilterZhCn._(_root);
	@override late final _TranslationsSharedFacilityMapsZhCn facilityMaps = _TranslationsSharedFacilityMapsZhCn._(_root);
}

// Path: waitTimeDetails
class _TranslationsWaitTimeDetailsZhCn extends TranslationsWaitTimeDetailsEn {
	_TranslationsWaitTimeDetailsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get referencedWaitTime => '急症室参考等候时间（非紧急病人）';
	@override late final _TranslationsWaitTimeDetailsActionsZhCn actions = _TranslationsWaitTimeDetailsActionsZhCn._(_root);
	@override String get chartTitle => '过去 6 小时的急症室等候时间';
	@override String get hours => '{value} 小时';
	@override late final _TranslationsWaitTimeDetailsInfoZhCn info = _TranslationsWaitTimeDetailsInfoZhCn._(_root);
	@override late final _TranslationsWaitTimeDetailsShareContentZhCn shareContent = _TranslationsWaitTimeDetailsShareContentZhCn._(_root);
}

// Path: home.actions
class _TranslationsHomeActionsZhCn extends TranslationsHomeActionsEn {
	_TranslationsHomeActionsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get filter => '筛选医院';
	@override String get refresh => '重新整理';
	@override String get search => '搜寻医院';
}

// Path: home.refreshIndicator
class _TranslationsHomeRefreshIndicatorZhCn extends TranslationsHomeRefreshIndicatorEn {
	_TranslationsHomeRefreshIndicatorZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get pullToRefresh => '下拉更新资料';
	@override String get releaseToRefresh => '放开即可更新';
	@override String get refreshing => '正在更新⋯⋯';
	@override String get dataUpdated => '资料已更新';
	@override String get failedToRefresh => '资料更新失败';
	@override String get lastUpdateAt => '最后更新：%T';
}

// Path: home.prompt
class _TranslationsHomePromptZhCn extends TranslationsHomePromptEn {
	_TranslationsHomePromptZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get noConnection => '没有网络连线。';
	@override String get serverError => '服务器发生错误，请稍后再试。';
	@override String get noSearchResult => '没有符合搜寻条件的医院。';
	@override String get selectItem => '请在列表中选取一张医院卡片，以查看医院的详情。';
}

// Path: lists.categories
class _TranslationsListsCategoriesZhCn extends TranslationsListsCategoriesEn {
	_TranslationsListsCategoriesZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get hospital => '医院管理局辖下的医院/机构';
	@override String get soc => '医院管理局辖下的专科门诊诊所';
	@override String get goc => '医院管理局辖下的普通科门诊诊所';
	@override String get cmc => '中医诊所暨教研中心';
}

// Path: lists.hospital
class _TranslationsListsHospitalZhCn extends TranslationsListsHospitalEn {
	_TranslationsListsHospitalZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get search => '搜寻医院/机构';
	@override String get cluster => '医院联网';
	@override String get withAEService => '提供急症室服务';
	@override String get withoutAEService => '没有急症室服务';
	@override String get noSearchResult => '没有符合搜寻条件的医院/机构。';
}

// Path: lists.soc
class _TranslationsListsSocZhCn extends TranslationsListsSocEn {
	_TranslationsListsSocZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get search => '搜寻专科门诊诊所';
	@override String get cluster => '诊所联网';
	@override String get noSearchResult => '没有符合搜寻条件的诊所。';
}

// Path: lists.goc
class _TranslationsListsGocZhCn extends TranslationsListsGocEn {
	_TranslationsListsGocZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get search => '搜寻普通科门诊诊所';
	@override String get cluster => '诊所联网';
	@override String get noSearchResult => '没有符合搜寻条件的诊所。';
}

// Path: lists.cmc
class _TranslationsListsCmcZhCn extends TranslationsListsCmcEn {
	_TranslationsListsCmcZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get search => '搜寻中医诊所暨教研中心';
	@override String get region => '区域';
	@override String get noSearchResult => '没有符合搜寻条件的诊所。';
}

// Path: lists.prompt
class _TranslationsListsPromptZhCn extends TranslationsListsPromptEn {
	_TranslationsListsPromptZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get noConnection => '没有网络连线。';
	@override String get serverError => '服务器发生错误，请稍后再试。';
	@override String get selectCategory => '请在列表中选取一个分类以查看设施目录。';
}

// Path: main.tabs.home
class _TranslationsMainTabsHomeZhCn extends TranslationsMainTabsHomeEn {
	_TranslationsMainTabsHomeZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get displayLabel => '主页';
	@override String get semanticLabel => '急症室服务等候时间';
}

// Path: main.tabs.lists
class _TranslationsMainTabsListsZhCn extends TranslationsMainTabsListsEn {
	_TranslationsMainTabsListsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get displayLabel => '目录';
	@override String get semanticLabel => '设施目录';
}

// Path: main.tabs.settings
class _TranslationsMainTabsSettingsZhCn extends TranslationsMainTabsSettingsEn {
	_TranslationsMainTabsSettingsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get displayLabel => '设定';
	@override String get semanticLabel => '设定';
}

// Path: main.clusters
class _TranslationsMainClustersZhCn extends TranslationsMainClustersEn {
	_TranslationsMainClustersZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

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
class _TranslationsMainDataRemarksZhCn extends TranslationsMainDataRemarksEn {
	_TranslationsMainDataRemarksZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

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
class _TranslationsSettingsSectionsZhCn extends TranslationsSettingsSectionsEn {
	_TranslationsSettingsSectionsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get appearance => '外观';
	@override String get data => '数据管理';
	@override String get more => '更多';
}

// Path: settings.appearance
class _TranslationsSettingsAppearanceZhCn extends TranslationsSettingsAppearanceEn {
	_TranslationsSettingsAppearanceZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsAppearanceThemeZhCn theme = _TranslationsSettingsAppearanceThemeZhCn._(_root);
	@override late final _TranslationsSettingsAppearanceLanguageZhCn language = _TranslationsSettingsAppearanceLanguageZhCn._(_root);
	@override late final _TranslationsSettingsAppearanceTextSizeZhCn textSize = _TranslationsSettingsAppearanceTextSizeZhCn._(_root);
	@override late final _TranslationsSettingsAppearanceSortingZhCn sorting = _TranslationsSettingsAppearanceSortingZhCn._(_root);
}

// Path: settings.data
class _TranslationsSettingsDataZhCn extends TranslationsSettingsDataEn {
	_TranslationsSettingsDataZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsDataResetZhCn reset = _TranslationsSettingsDataResetZhCn._(_root);
}

// Path: settings.more
class _TranslationsSettingsMoreZhCn extends TranslationsSettingsMoreEn {
	_TranslationsSettingsMoreZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get license => '开放源代码授权';
	@override late final _TranslationsSettingsMorePrivacyPolicyZhCn privacyPolicy = _TranslationsSettingsMorePrivacyPolicyZhCn._(_root);
	@override late final _TranslationsSettingsMoreTermsConditionsZhCn termsConditions = _TranslationsSettingsMoreTermsConditionsZhCn._(_root);
	@override late final _TranslationsSettingsMoreAboutZhCn about = _TranslationsSettingsMoreAboutZhCn._(_root);
}

// Path: settings.prompt
class _TranslationsSettingsPromptZhCn extends TranslationsSettingsPromptEn {
	_TranslationsSettingsPromptZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get selectItem => '请在列表中选取一个项目来更改应用程序的设定。';
	@override String get settingsReset => '所有设定已重设。请重新启动应用程序以使重设生效。';
}

// Path: shared.filter
class _TranslationsSharedFilterZhCn extends TranslationsSharedFilterEn {
	_TranslationsSharedFilterZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSharedFilterSortingZhCn sorting = _TranslationsSharedFilterSortingZhCn._(_root);
	@override String get hospitalCluster => '医院联网';
	@override String get clinicCluster => '诊所联网';
	@override String get region => '区域';
	@override String get district => '地区';
	@override late final _TranslationsSharedFilterActionsZhCn actions = _TranslationsSharedFilterActionsZhCn._(_root);
}

// Path: shared.facilityMaps
class _TranslationsSharedFacilityMapsZhCn extends TranslationsSharedFacilityMapsEn {
	_TranslationsSharedFacilityMapsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get openMapsApp => '开启地图应用程序';
	@override String get closeMapsModal => '关闭地图检视界面';
}

// Path: waitTimeDetails.actions
class _TranslationsWaitTimeDetailsActionsZhCn extends TranslationsWaitTimeDetailsActionsEn {
	_TranslationsWaitTimeDetailsActionsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get share => '分享医院资讯';
	@override String get call => '致电医院';
	@override String get maps => '查看地图';
}

// Path: waitTimeDetails.info
class _TranslationsWaitTimeDetailsInfoZhCn extends TranslationsWaitTimeDetailsInfoEn {
	_TranslationsWaitTimeDetailsInfoZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '医院资料';
	@override String get address => '地址';
	@override String get contactNo => '电话号码';
	@override String get faxNo => '传真号码';
	@override String get emailAddress => '电邮地址';
	@override String get website => '网址';
}

// Path: waitTimeDetails.shareContent
class _TranslationsWaitTimeDetailsShareContentZhCn extends TranslationsWaitTimeDetailsShareContentEn {
	_TranslationsWaitTimeDetailsShareContentZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String base({required Object hospitalName, required Object waitingTime, required Object address, required Object contactNo}) => '${hospitalName}\n急症室等候时间：${waitingTime}\n--------\n地址：${address}\n电话号码：${contactNo}';
	@override String faxNo({required Object faxNo}) => '\n传真号码：${faxNo}';
	@override String emailAddress({required Object emailAddress}) => '\n电邮地址：${emailAddress}';
	@override String website({required Object website}) => '\n网址：${website}';
}

// Path: settings.appearance.theme
class _TranslationsSettingsAppearanceThemeZhCn extends TranslationsSettingsAppearanceThemeEn {
	_TranslationsSettingsAppearanceThemeZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '显示主题';
	@override late final _TranslationsSettingsAppearanceThemeOptionsZhCn options = _TranslationsSettingsAppearanceThemeOptionsZhCn._(_root);
}

// Path: settings.appearance.language
class _TranslationsSettingsAppearanceLanguageZhCn extends TranslationsSettingsAppearanceLanguageEn {
	_TranslationsSettingsAppearanceLanguageZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '显示语言';
	@override late final _TranslationsSettingsAppearanceLanguageOptionsZhCn options = _TranslationsSettingsAppearanceLanguageOptionsZhCn._(_root);
}

// Path: settings.appearance.textSize
class _TranslationsSettingsAppearanceTextSizeZhCn extends TranslationsSettingsAppearanceTextSizeEn {
	_TranslationsSettingsAppearanceTextSizeZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '文字大小';
	@override late final _TranslationsSettingsAppearanceTextSizeOptionsZhCn options = _TranslationsSettingsAppearanceTextSizeOptionsZhCn._(_root);
}

// Path: settings.appearance.sorting
class _TranslationsSettingsAppearanceSortingZhCn extends TranslationsSettingsAppearanceSortingEn {
	_TranslationsSettingsAppearanceSortingZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '急症室等候时间默认排序方式';
	@override late final _TranslationsSettingsAppearanceSortingOptionsZhCn options = _TranslationsSettingsAppearanceSortingOptionsZhCn._(_root);
}

// Path: settings.data.reset
class _TranslationsSettingsDataResetZhCn extends TranslationsSettingsDataResetEn {
	_TranslationsSettingsDataResetZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '重设所有设定';
	@override String get message => '如果您在使用此应用程序时遇到任何问题，请考虑重置所有设置以恢复功能。请注意，此操作将在应用程序重新启动后生效。';
	@override late final _TranslationsSettingsDataResetButtonsZhCn buttons = _TranslationsSettingsDataResetButtonsZhCn._(_root);
}

// Path: settings.more.privacyPolicy
class _TranslationsSettingsMorePrivacyPolicyZhCn extends TranslationsSettingsMorePrivacyPolicyEn {
	_TranslationsSettingsMorePrivacyPolicyZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '隐私政策';
	@override String get subtitle => '只提供英文版本';
}

// Path: settings.more.termsConditions
class _TranslationsSettingsMoreTermsConditionsZhCn extends TranslationsSettingsMoreTermsConditionsEn {
	_TranslationsSettingsMoreTermsConditionsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '条款及细则';
	@override String get subtitle => '只提供英文版本';
}

// Path: settings.more.about
class _TranslationsSettingsMoreAboutZhCn extends TranslationsSettingsMoreAboutEn {
	_TranslationsSettingsMoreAboutZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '关于本应用程序';
	@override late final _TranslationsSettingsMoreAboutItemsZhCn items = _TranslationsSettingsMoreAboutItemsZhCn._(_root);
}

// Path: shared.filter.sorting
class _TranslationsSharedFilterSortingZhCn extends TranslationsSharedFilterSortingEn {
	_TranslationsSharedFilterSortingZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '排序';
	@override String get nameInAsd => '医院英文名称（A-Z）';
	@override String get nameInDesc => '医院英文名称（Z-A）';
	@override String get timeInAsd => '等候时间（由短至长）';
	@override String get timeInDesc => '等候时间（由长至短）';
}

// Path: shared.filter.actions
class _TranslationsSharedFilterActionsZhCn extends TranslationsSharedFilterActionsEn {
	_TranslationsSharedFilterActionsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get apply => '套用';
	@override String get reset => '重设';
	@override String get clear => '清除';
}

// Path: settings.appearance.theme.options
class _TranslationsSettingsAppearanceThemeOptionsZhCn extends TranslationsSettingsAppearanceThemeOptionsEn {
	_TranslationsSettingsAppearanceThemeOptionsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get light => '浅色主题';
	@override String get dark => '深色主题';
	@override String get system => '跟随系统设定';
}

// Path: settings.appearance.language.options
class _TranslationsSettingsAppearanceLanguageOptionsZhCn extends TranslationsSettingsAppearanceLanguageOptionsEn {
	_TranslationsSettingsAppearanceLanguageOptionsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get zhHK => '繁体中文 (繁體中文)';
	@override String get zhCN => '简体中文';
	@override String get en => '英文 (English)';
}

// Path: settings.appearance.textSize.options
class _TranslationsSettingsAppearanceTextSizeOptionsZhCn extends TranslationsSettingsAppearanceTextSizeOptionsEn {
	_TranslationsSettingsAppearanceTextSizeOptionsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get defaultSize => '默认';
	@override String get largeSize => '大';
	@override String get extraLargeSize => '特大';
}

// Path: settings.appearance.sorting.options
class _TranslationsSettingsAppearanceSortingOptionsZhCn extends TranslationsSettingsAppearanceSortingOptionsEn {
	_TranslationsSettingsAppearanceSortingOptionsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get nameInAsd => '医院英文名称（A-Z）';
	@override String get nameInDesc => '医院英文名称（Z-A）';
	@override String get timeInAsd => '等候时间（由短至长）';
	@override String get timeInDesc => '等候时间（由长至短）';
}

// Path: settings.data.reset.buttons
class _TranslationsSettingsDataResetButtonsZhCn extends TranslationsSettingsDataResetButtonsEn {
	_TranslationsSettingsDataResetButtonsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get cancel => '取消';
	@override String get reset => '重设';
}

// Path: settings.more.about.items
class _TranslationsSettingsMoreAboutItemsZhCn extends TranslationsSettingsMoreAboutItemsEn {
	_TranslationsSettingsMoreAboutItemsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get version => '应用程序版本';
	@override late final _TranslationsSettingsMoreAboutItemsGithubZhCn github = _TranslationsSettingsMoreAboutItemsGithubZhCn._(_root);
	@override late final _TranslationsSettingsMoreAboutItemsDataSourceZhCn dataSource = _TranslationsSettingsMoreAboutItemsDataSourceZhCn._(_root);
	@override late final _TranslationsSettingsMoreAboutItemsImageSourceZhCn imageSource = _TranslationsSettingsMoreAboutItemsImageSourceZhCn._(_root);
}

// Path: settings.more.about.items.github
class _TranslationsSettingsMoreAboutItemsGithubZhCn extends TranslationsSettingsMoreAboutItemsGithubEn {
	_TranslationsSettingsMoreAboutItemsGithubZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => 'GitHub 储存库';
	@override String get value => '根据 GPL-3.0 许可证授权。';
}

// Path: settings.more.about.items.dataSource
class _TranslationsSettingsMoreAboutItemsDataSourceZhCn extends TranslationsSettingsMoreAboutItemsDataSourceEn {
	_TranslationsSettingsMoreAboutItemsDataSourceZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '资料来源';
	@override String get value => '资料一线通、医院管理局';
}

// Path: settings.more.about.items.imageSource
class _TranslationsSettingsMoreAboutItemsImageSourceZhCn extends TranslationsSettingsMoreAboutItemsImageSourceEn {
	_TranslationsSettingsMoreAboutItemsImageSourceZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '插图来源';
	@override String get value => 'unDraw';
	@override String get url => 'https://undraw.co/license';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsZhCn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.title': return '急症室等候时间';
			case 'home.actions.filter': return '筛选医院';
			case 'home.actions.refresh': return '重新整理';
			case 'home.actions.search': return '搜寻医院';
			case 'home.badgeText': return '急症室会优先诊治被分流為危殆、危急和紧急的病人。';
			case 'home.refreshIndicator.pullToRefresh': return '下拉更新资料';
			case 'home.refreshIndicator.releaseToRefresh': return '放开即可更新';
			case 'home.refreshIndicator.refreshing': return '正在更新⋯⋯';
			case 'home.refreshIndicator.dataUpdated': return '资料已更新';
			case 'home.refreshIndicator.failedToRefresh': return '资料更新失败';
			case 'home.refreshIndicator.lastUpdateAt': return '最后更新：%T';
			case 'home.prompt.noConnection': return '没有网络连线。';
			case 'home.prompt.serverError': return '服务器发生错误，请稍后再试。';
			case 'home.prompt.noSearchResult': return '没有符合搜寻条件的医院。';
			case 'home.prompt.selectItem': return '请在列表中选取一张医院卡片，以查看医院的详情。';
			case 'lists.title': return '设施目录';
			case 'lists.categories.hospital': return '医院管理局辖下的医院/机构';
			case 'lists.categories.soc': return '医院管理局辖下的专科门诊诊所';
			case 'lists.categories.goc': return '医院管理局辖下的普通科门诊诊所';
			case 'lists.categories.cmc': return '中医诊所暨教研中心';
			case 'lists.hospital.search': return '搜寻医院/机构';
			case 'lists.hospital.cluster': return '医院联网';
			case 'lists.hospital.withAEService': return '提供急症室服务';
			case 'lists.hospital.withoutAEService': return '没有急症室服务';
			case 'lists.hospital.noSearchResult': return '没有符合搜寻条件的医院/机构。';
			case 'lists.soc.search': return '搜寻专科门诊诊所';
			case 'lists.soc.cluster': return '诊所联网';
			case 'lists.soc.noSearchResult': return '没有符合搜寻条件的诊所。';
			case 'lists.goc.search': return '搜寻普通科门诊诊所';
			case 'lists.goc.cluster': return '诊所联网';
			case 'lists.goc.noSearchResult': return '没有符合搜寻条件的诊所。';
			case 'lists.cmc.search': return '搜寻中医诊所暨教研中心';
			case 'lists.cmc.region': return '区域';
			case 'lists.cmc.noSearchResult': return '没有符合搜寻条件的诊所。';
			case 'lists.prompt.noConnection': return '没有网络连线。';
			case 'lists.prompt.serverError': return '服务器发生错误，请稍后再试。';
			case 'lists.prompt.selectCategory': return '请在列表中选取一个分类以查看设施目录。';
			case 'lists.refresh': return '重新整理';
			case 'main.app_name': return '急症室现场';
			case 'main.tabs.home.displayLabel': return '主页';
			case 'main.tabs.home.semanticLabel': return '急症室服务等候时间';
			case 'main.tabs.lists.displayLabel': return '目录';
			case 'main.tabs.lists.semanticLabel': return '设施目录';
			case 'main.tabs.settings.displayLabel': return '设定';
			case 'main.tabs.settings.semanticLabel': return '设定';
			case 'main.clusters.hke': return '港岛东医院联网';
			case 'main.clusters.hkw': return '港岛西医院联网';
			case 'main.clusters.klc': return '九龙中医院联网';
			case 'main.clusters.kle': return '九龙东医院联网';
			case 'main.clusters.klw': return '九龙西医院联网';
			case 'main.clusters.nte': return '新界东医院联网';
			case 'main.clusters.ntw': return '新界西医院联网';
			case 'main.dataRemarks.title': return '注意事项';
			case 'main.dataRemarks.content': return ({required InlineSpanBuilder tapPCD, required InlineSpanBuilder tapHKD}) => TextSpan(children: [
				const TextSpan(text: '上述数据是统计过去数小时的最长等候时间，只供参考，并非预计等候时间。\n\n急症室须处理突发意外伤者及危重病人，因此未能准确提供预计等候时间，敬请见谅及耐心等候。\n\n最长等候时间显示上限为 8 小时，表示急症室正处理大量等候已久的病人。病况轻微病人可考虑使用私营医疗服务（'),
				tapPCD('基层医疗指南'),
				const TextSpan(text: '或'),
				tapHKD('香港医生网'),
				const TextSpan(text: '）。'),
			]);
			case 'main.dataRemarks.pcdUrl': return 'https://apps.pcdirectory.gov.hk/mobile/sc';
			case 'main.dataRemarks.hkdUrl': return 'http://www.thkma.org/our_works/hong_kong_doctors/';
			case 'settings.title': return '设定';
			case 'settings.save': return '储存设定';
			case 'settings.sections.appearance': return '外观';
			case 'settings.sections.data': return '数据管理';
			case 'settings.sections.more': return '更多';
			case 'settings.appearance.theme.title': return '显示主题';
			case 'settings.appearance.theme.options.light': return '浅色主题';
			case 'settings.appearance.theme.options.dark': return '深色主题';
			case 'settings.appearance.theme.options.system': return '跟随系统设定';
			case 'settings.appearance.language.title': return '显示语言';
			case 'settings.appearance.language.options.zhHK': return '繁体中文 (繁體中文)';
			case 'settings.appearance.language.options.zhCN': return '简体中文';
			case 'settings.appearance.language.options.en': return '英文 (English)';
			case 'settings.appearance.textSize.title': return '文字大小';
			case 'settings.appearance.textSize.options.defaultSize': return '默认';
			case 'settings.appearance.textSize.options.largeSize': return '大';
			case 'settings.appearance.textSize.options.extraLargeSize': return '特大';
			case 'settings.appearance.sorting.title': return '急症室等候时间默认排序方式';
			case 'settings.appearance.sorting.options.nameInAsd': return '医院英文名称（A-Z）';
			case 'settings.appearance.sorting.options.nameInDesc': return '医院英文名称（Z-A）';
			case 'settings.appearance.sorting.options.timeInAsd': return '等候时间（由短至长）';
			case 'settings.appearance.sorting.options.timeInDesc': return '等候时间（由长至短）';
			case 'settings.data.reset.title': return '重设所有设定';
			case 'settings.data.reset.message': return '如果您在使用此应用程序时遇到任何问题，请考虑重置所有设置以恢复功能。请注意，此操作将在应用程序重新启动后生效。';
			case 'settings.data.reset.buttons.cancel': return '取消';
			case 'settings.data.reset.buttons.reset': return '重设';
			case 'settings.more.license': return '开放源代码授权';
			case 'settings.more.privacyPolicy.title': return '隐私政策';
			case 'settings.more.privacyPolicy.subtitle': return '只提供英文版本';
			case 'settings.more.termsConditions.title': return '条款及细则';
			case 'settings.more.termsConditions.subtitle': return '只提供英文版本';
			case 'settings.more.about.title': return '关于本应用程序';
			case 'settings.more.about.items.version': return '应用程序版本';
			case 'settings.more.about.items.github.title': return 'GitHub 储存库';
			case 'settings.more.about.items.github.value': return '根据 GPL-3.0 许可证授权。';
			case 'settings.more.about.items.dataSource.title': return '资料来源';
			case 'settings.more.about.items.dataSource.value': return '资料一线通、医院管理局';
			case 'settings.more.about.items.imageSource.title': return '插图来源';
			case 'settings.more.about.items.imageSource.value': return 'unDraw';
			case 'settings.more.about.items.imageSource.url': return 'https://undraw.co/license';
			case 'settings.prompt.selectItem': return '请在列表中选取一个项目来更改应用程序的设定。';
			case 'settings.prompt.settingsReset': return '所有设定已重设。请重新启动应用程序以使重设生效。';
			case 'shared.filter.sorting.title': return '排序';
			case 'shared.filter.sorting.nameInAsd': return '医院英文名称（A-Z）';
			case 'shared.filter.sorting.nameInDesc': return '医院英文名称（Z-A）';
			case 'shared.filter.sorting.timeInAsd': return '等候时间（由短至长）';
			case 'shared.filter.sorting.timeInDesc': return '等候时间（由长至短）';
			case 'shared.filter.hospitalCluster': return '医院联网';
			case 'shared.filter.clinicCluster': return '诊所联网';
			case 'shared.filter.region': return '区域';
			case 'shared.filter.district': return '地区';
			case 'shared.filter.actions.apply': return '套用';
			case 'shared.filter.actions.reset': return '重设';
			case 'shared.filter.actions.clear': return '清除';
			case 'shared.facilityMaps.openMapsApp': return '开启地图应用程序';
			case 'shared.facilityMaps.closeMapsModal': return '关闭地图检视界面';
			case 'waitTimeDetails.referencedWaitTime': return '急症室参考等候时间（非紧急病人）';
			case 'waitTimeDetails.actions.share': return '分享医院资讯';
			case 'waitTimeDetails.actions.call': return '致电医院';
			case 'waitTimeDetails.actions.maps': return '查看地图';
			case 'waitTimeDetails.chartTitle': return '过去 6 小时的急症室等候时间';
			case 'waitTimeDetails.hours': return '{value} 小时';
			case 'waitTimeDetails.info.title': return '医院资料';
			case 'waitTimeDetails.info.address': return '地址';
			case 'waitTimeDetails.info.contactNo': return '电话号码';
			case 'waitTimeDetails.info.faxNo': return '传真号码';
			case 'waitTimeDetails.info.emailAddress': return '电邮地址';
			case 'waitTimeDetails.info.website': return '网址';
			case 'waitTimeDetails.shareContent.base': return ({required Object hospitalName, required Object waitingTime, required Object address, required Object contactNo}) => '${hospitalName}\n急症室等候时间：${waitingTime}\n--------\n地址：${address}\n电话号码：${contactNo}';
			case 'waitTimeDetails.shareContent.faxNo': return ({required Object faxNo}) => '\n传真号码：${faxNo}';
			case 'waitTimeDetails.shareContent.emailAddress': return ({required Object emailAddress}) => '\n电邮地址：${emailAddress}';
			case 'waitTimeDetails.shareContent.website': return ({required Object website}) => '\n网址：${website}';
			default: return null;
		}
	}
}


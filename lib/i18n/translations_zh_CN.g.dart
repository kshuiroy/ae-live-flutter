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
	@override late final _TranslationsWaitTimeDetailsZhCn waitTimeDetails = _TranslationsWaitTimeDetailsZhCn._(_root);
	@override late final _TranslationsMainZhCn main = _TranslationsMainZhCn._(_root);
}

// Path: home
class _TranslationsHomeZhCn extends _TranslationsHomeEn {
	_TranslationsHomeZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '急症室等候时间';
	@override late final _TranslationsHomeActionsZhCn actions = _TranslationsHomeActionsZhCn._(_root);
	@override late final _TranslationsHomeRefreshIndicatorZhCn refreshIndicator = _TranslationsHomeRefreshIndicatorZhCn._(_root);
	@override late final _TranslationsHomeFilterZhCn filter = _TranslationsHomeFilterZhCn._(_root);
}

// Path: waitTimeDetails
class _TranslationsWaitTimeDetailsZhCn extends _TranslationsWaitTimeDetailsEn {
	_TranslationsWaitTimeDetailsZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get expectedWaitTime => '预计等候时间（非紧急病人）';
	@override late final _TranslationsWaitTimeDetailsActionsZhCn actions = _TranslationsWaitTimeDetailsActionsZhCn._(_root);
	@override String get chartTitle => '过去 6 小时的等候时间';
	@override String get hours => '{value} 小时';
	@override late final _TranslationsWaitTimeDetailsInfoZhCn info = _TranslationsWaitTimeDetailsInfoZhCn._(_root);
}

// Path: main
class _TranslationsMainZhCn extends _TranslationsMainEn {
	_TranslationsMainZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get app_name => '急症室现场';
	@override Map<String, String> get tabs => {
		'home': '主页',
		'lists': '目录',
		'settings': '设定',
	};
	@override late final _TranslationsMainClustersZhCn clusters = _TranslationsMainClustersZhCn._(_root);
	@override late final _TranslationsMainDataRemarksZhCn dataRemarks = _TranslationsMainDataRemarksZhCn._(_root);
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

// Path: home.filter
class _TranslationsHomeFilterZhCn extends _TranslationsHomeFilterEn {
	_TranslationsHomeFilterZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get cluster => '医院联网';
	@override late final _TranslationsHomeFilterSortingZhCn sorting = _TranslationsHomeFilterSortingZhCn._(_root);
	@override String get submit => '提交';
}

// Path: waitTimeDetails.actions
class _TranslationsWaitTimeDetailsActionsZhCn extends _TranslationsWaitTimeDetailsActionsEn {
	_TranslationsWaitTimeDetailsActionsZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get call => '致电医院';
	@override String get maps => '开启地图';
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
}

// Path: home.filter.sorting
class _TranslationsHomeFilterSortingZhCn extends _TranslationsHomeFilterSortingEn {
	_TranslationsHomeFilterSortingZhCn._(_TranslationsZhCn root) : this._root = root, super._(root);

	@override final _TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '排序';
	@override String get nameInAsd => '医院名称（顺序）';
	@override String get nameInDesc => '医院名称（倒序）';
	@override String get timeInAsd => '等候时间（由短至长）';
	@override String get timeInDesc => '等候时间（由长至短）';
}

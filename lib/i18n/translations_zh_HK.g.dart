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
	@override late final _TranslationsWaitTimeDetailsZhHk waitTimeDetails = _TranslationsWaitTimeDetailsZhHk._(_root);
	@override late final _TranslationsMainZhHk main = _TranslationsMainZhHk._(_root);
}

// Path: home
class _TranslationsHomeZhHk extends _TranslationsHomeEn {
	_TranslationsHomeZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '急症室等候時間';
	@override late final _TranslationsHomeActionsZhHk actions = _TranslationsHomeActionsZhHk._(_root);
	@override late final _TranslationsHomeRefreshIndicatorZhHk refreshIndicator = _TranslationsHomeRefreshIndicatorZhHk._(_root);
	@override late final _TranslationsHomeFilterZhHk filter = _TranslationsHomeFilterZhHk._(_root);
}

// Path: waitTimeDetails
class _TranslationsWaitTimeDetailsZhHk extends _TranslationsWaitTimeDetailsEn {
	_TranslationsWaitTimeDetailsZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get expectedWaitTime => '預計等候時間（非緊急病人）';
	@override late final _TranslationsWaitTimeDetailsActionsZhHk actions = _TranslationsWaitTimeDetailsActionsZhHk._(_root);
	@override String get chartTitle => '過去 6 小時的等候時間';
	@override String get hours => '{value} 小時';
	@override late final _TranslationsWaitTimeDetailsInfoZhHk info = _TranslationsWaitTimeDetailsInfoZhHk._(_root);
}

// Path: main
class _TranslationsMainZhHk extends _TranslationsMainEn {
	_TranslationsMainZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get app_name => '急症室現場';
	@override Map<String, String> get tabs => {
		'home': '主頁',
		'lists': '目錄',
		'settings': '設定',
	};
	@override late final _TranslationsMainClustersZhHk clusters = _TranslationsMainClustersZhHk._(_root);
	@override late final _TranslationsMainDataRemarksZhHk dataRemarks = _TranslationsMainDataRemarksZhHk._(_root);
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

// Path: home.filter
class _TranslationsHomeFilterZhHk extends _TranslationsHomeFilterEn {
	_TranslationsHomeFilterZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get cluster => '醫院聯網';
	@override late final _TranslationsHomeFilterSortingZhHk sorting = _TranslationsHomeFilterSortingZhHk._(_root);
	@override String get submit => '提交';
}

// Path: waitTimeDetails.actions
class _TranslationsWaitTimeDetailsActionsZhHk extends _TranslationsWaitTimeDetailsActionsEn {
	_TranslationsWaitTimeDetailsActionsZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get call => '致電醫院';
	@override String get maps => '開啟地圖';
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
}

// Path: home.filter.sorting
class _TranslationsHomeFilterSortingZhHk extends _TranslationsHomeFilterSortingEn {
	_TranslationsHomeFilterSortingZhHk._(_TranslationsZhHk root) : this._root = root, super._(root);

	@override final _TranslationsZhHk _root; // ignore: unused_field

	// Translations
	@override String get title => '排序';
	@override String get nameInAsd => '醫院名稱（順序）';
	@override String get nameInDesc => '醫院名稱（倒序）';
	@override String get timeInAsd => '等候時間（由短至長）';
	@override String get timeInDesc => '等候時間（由長至短）';
}

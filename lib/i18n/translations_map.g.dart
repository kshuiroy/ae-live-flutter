///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint

part of 'translations.g.dart';

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.title': return 'A&E Waiting Time';
			case 'home.actions.filter': return 'Filter';
			case 'home.actions.refresh': return 'Refresh Data';
			case 'home.actions.search': return 'Search Hospital';
			case 'home.refreshIndicator.pullToRefresh': return 'Pull to Refresh';
			case 'home.refreshIndicator.releaseToRefresh': return 'Release to Refresh';
			case 'home.refreshIndicator.refreshing': return 'Refreshing...';
			case 'home.refreshIndicator.dataUpdated': return 'Data Updated';
			case 'home.refreshIndicator.failedToRefresh': return 'Failed to Refresh';
			case 'home.refreshIndicator.lastUpdateAt': return 'Last Update At: %T';
			case 'home.filter.cluster': return 'Hospital Cluster';
			case 'home.filter.sorting.title': return 'Sorting';
			case 'home.filter.sorting.nameInAsd': return 'Hospital Name (A-Z)';
			case 'home.filter.sorting.nameInDesc': return 'Hospital Name (Z-A)';
			case 'home.filter.sorting.timeInAsd': return 'Waiting Time (ASD.)';
			case 'home.filter.sorting.timeInDesc': return 'Waiting Time (DESC.)';
			case 'home.filter.submit': return 'Submit';
			case 'waitTimeDetails.expectedWaitTime': return 'Expected Waiting Time (Non-Emergency)';
			case 'waitTimeDetails.actions.call': return 'Call Hospital';
			case 'waitTimeDetails.actions.maps': return 'Open Maps';
			case 'waitTimeDetails.chartTitle': return 'Waiting Time of the Past 6 Hours';
			case 'waitTimeDetails.hours': return '{value}H';
			case 'waitTimeDetails.info.title': return 'Hospital Info';
			case 'waitTimeDetails.info.address': return 'Address';
			case 'waitTimeDetails.info.contactNo': return 'Contact No.';
			case 'waitTimeDetails.info.faxNo': return 'Fax No.';
			case 'waitTimeDetails.info.emailAddress': return 'Email Address';
			case 'waitTimeDetails.info.website': return 'Website';
			case 'main.app_name': return 'A&E Live';
			case 'main.tabs.home': return 'Home';
			case 'main.tabs.lists': return 'Lists';
			case 'main.tabs.settings': return 'Settings';
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
			default: return null;
		}
	}
}

extension on _TranslationsZhCn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.title': return '急症室等候时间';
			case 'home.actions.filter': return '筛选医院';
			case 'home.actions.refresh': return '重新整理';
			case 'home.actions.search': return '搜寻医院';
			case 'home.refreshIndicator.pullToRefresh': return '下拉更新资料';
			case 'home.refreshIndicator.releaseToRefresh': return '放开即可更新';
			case 'home.refreshIndicator.refreshing': return '正在更新⋯⋯';
			case 'home.refreshIndicator.dataUpdated': return '资料已更新';
			case 'home.refreshIndicator.failedToRefresh': return '资料更新失败';
			case 'home.refreshIndicator.lastUpdateAt': return '最后更新：%T';
			case 'home.filter.cluster': return '医院联网';
			case 'home.filter.sorting.title': return '排序';
			case 'home.filter.sorting.nameInAsd': return '医院名称（顺序）';
			case 'home.filter.sorting.nameInDesc': return '医院名称（倒序）';
			case 'home.filter.sorting.timeInAsd': return '等候时间（由短至长）';
			case 'home.filter.sorting.timeInDesc': return '等候时间（由长至短）';
			case 'home.filter.submit': return '提交';
			case 'waitTimeDetails.expectedWaitTime': return '预计等候时间（非紧急病人）';
			case 'waitTimeDetails.actions.call': return '致电医院';
			case 'waitTimeDetails.actions.maps': return '开启地图';
			case 'waitTimeDetails.chartTitle': return '过去 6 小时的等候时间';
			case 'waitTimeDetails.hours': return '{value} 小时';
			case 'waitTimeDetails.info.title': return '医院资料';
			case 'waitTimeDetails.info.address': return '地址';
			case 'waitTimeDetails.info.contactNo': return '电话号码';
			case 'waitTimeDetails.info.faxNo': return '传真号码';
			case 'waitTimeDetails.info.emailAddress': return '电邮地址';
			case 'waitTimeDetails.info.website': return '网址';
			case 'main.app_name': return '急症室现场';
			case 'main.tabs.home': return '主页';
			case 'main.tabs.lists': return '目录';
			case 'main.tabs.settings': return '设定';
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
			default: return null;
		}
	}
}

extension on _TranslationsZhHk {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.title': return '急症室等候時間';
			case 'home.actions.filter': return '篩選醫院';
			case 'home.actions.refresh': return '重新整理';
			case 'home.actions.search': return '搜尋醫院';
			case 'home.refreshIndicator.pullToRefresh': return '下拉更新資料';
			case 'home.refreshIndicator.releaseToRefresh': return '放開即可更新';
			case 'home.refreshIndicator.refreshing': return '正在更新⋯⋯';
			case 'home.refreshIndicator.dataUpdated': return '資料已更新';
			case 'home.refreshIndicator.failedToRefresh': return '資料更新失敗';
			case 'home.refreshIndicator.lastUpdateAt': return '最後更新：%T';
			case 'home.filter.cluster': return '醫院聯網';
			case 'home.filter.sorting.title': return '排序';
			case 'home.filter.sorting.nameInAsd': return '醫院名稱（順序）';
			case 'home.filter.sorting.nameInDesc': return '醫院名稱（倒序）';
			case 'home.filter.sorting.timeInAsd': return '等候時間（由短至長）';
			case 'home.filter.sorting.timeInDesc': return '等候時間（由長至短）';
			case 'home.filter.submit': return '提交';
			case 'waitTimeDetails.expectedWaitTime': return '預計等候時間（非緊急病人）';
			case 'waitTimeDetails.actions.call': return '致電醫院';
			case 'waitTimeDetails.actions.maps': return '開啟地圖';
			case 'waitTimeDetails.chartTitle': return '過去 6 小時的等候時間';
			case 'waitTimeDetails.hours': return '{value} 小時';
			case 'waitTimeDetails.info.title': return '醫院資料';
			case 'waitTimeDetails.info.address': return '地址';
			case 'waitTimeDetails.info.contactNo': return '電話號碼';
			case 'waitTimeDetails.info.faxNo': return '傳真號碼';
			case 'waitTimeDetails.info.emailAddress': return '電郵地址';
			case 'waitTimeDetails.info.website': return '網址';
			case 'main.app_name': return '急症室現場';
			case 'main.tabs.home': return '主頁';
			case 'main.tabs.lists': return '目錄';
			case 'main.tabs.settings': return '設定';
			case 'main.clusters.hke': return '港島東醫院聯網';
			case 'main.clusters.hkw': return '港島西醫院聯網';
			case 'main.clusters.klc': return '九龍中醫院聯網';
			case 'main.clusters.kle': return '九龍東醫院聯網';
			case 'main.clusters.klw': return '九龍西醫院聯網';
			case 'main.clusters.nte': return '新界東醫院聯網';
			case 'main.clusters.ntw': return '新界西醫院聯網';
			case 'main.dataRemarks.title': return '注意事項';
			case 'main.dataRemarks.content': return ({required InlineSpanBuilder tapPCD, required InlineSpanBuilder tapHKD}) => TextSpan(children: [
				const TextSpan(text: '上述數據是統計過去數小時的最長等候時間，只供參考，並非預計等候時間。\n\n急症室須處理突發意外傷者及危重病人，因此未能準確提供預計等候時間，敬請見諒及耐心等候。\n\n最長等候時間顯示上限為 8 小時，表示急症室正處理大量等候已久的病人。病況輕微病人可考慮使用私營醫療服務（'),
				tapPCD('基層醫療指南'),
				const TextSpan(text: '或'),
				tapHKD('香港醫生網'),
				const TextSpan(text: '）。'),
			]);
			default: return null;
		}
	}
}

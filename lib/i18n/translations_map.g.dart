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
			case 'settings.appearance.language.options.zhHK': return 'Traidtional Chinese (繁體中文)';
			case 'settings.appearance.language.options.zhCN': return 'Simplified Chinese (简体中文)';
			case 'settings.appearance.language.options.en': return 'English';
			case 'settings.appearance.sorting.title': return 'Default Sorting';
			case 'settings.appearance.sorting.options.nameInAsd': return 'Hospital Name (A-Z)';
			case 'settings.appearance.sorting.options.nameInDesc': return 'Hospital Name (Z-A)';
			case 'settings.appearance.sorting.options.timeInAsd': return 'Waiting Time (ASD.)';
			case 'settings.appearance.sorting.options.timeInDesc': return 'Waiting Time (DESC.)';
			case 'settings.data.reset.title': return 'Reset All Settings';
			case 'settings.data.reset.message': return 'If you\'ve experienced any difficulties while using this app, consider resetting all settings to restore its functionality. Please note that this action will take effect once the app has been restarted.';
			case 'settings.data.reset.buttons.cancel': return 'Cancel';
			case 'settings.data.reset.buttons.reset': return 'Reset';
			case 'settings.more.license': return 'Open Source License';
			case 'settings.more.about.title': return 'About This App';
			case 'settings.more.about.items.version': return 'App Version';
			case 'settings.more.about.items.dataSource.title': return 'Data Source';
			case 'settings.more.about.items.dataSource.value': return 'DATA.GOV.HK and Hospital Authority';
			case 'settings.more.about.items.appIconSource.title': return 'App Icon Source';
			case 'settings.more.about.items.appIconSource.value': return 'Pictogrammers';
			case 'settings.more.about.items.appIconSource.url': return 'https://pictogrammers.com/';
			case 'settings.more.about.items.imageSource.title': return 'Image Source';
			case 'settings.more.about.items.imageSource.value': return 'unDraw';
			case 'settings.more.about.items.imageSource.url': return 'https://undraw.co/license';
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
			case 'home.filter.cluster': return 'Hospital Cluster';
			case 'home.filter.sorting.title': return 'Sorting';
			case 'home.filter.sorting.nameInAsd': return 'Hospital Name (A-Z)';
			case 'home.filter.sorting.nameInDesc': return 'Hospital Name (Z-A)';
			case 'home.filter.sorting.timeInAsd': return 'Waiting Time (ASD.)';
			case 'home.filter.sorting.timeInDesc': return 'Waiting Time (DESC.)';
			case 'home.filter.submit': return 'Submit';
			case 'home.prompt.noConnection': return 'No internet connection.';
			case 'home.prompt.serverError': return 'Something went wrong with the server, please try again later.';
			case 'home.prompt.noSearchResult': return 'There is no hospital matches your search criteria.';
			case 'home.prompt.selectItem': return 'Please select a hospital card from the list to see the details of the hospital.';
			case 'lists.title': return 'Lists';
			case 'lists.categories.hospital': return 'Hospital/Institution';
			case 'lists.categories.soc': return 'Specialist Outpatient Clinic';
			case 'lists.categories.goc': return 'General Outpatient Clinic';
			case 'lists.categories.cmc': return 'Chinese Medicine Clinics cum Training and Research Centres';
			case 'lists.hospital.search': return 'Search Hospital/Institution';
			case 'lists.hospital.cluster': return 'Hospital Cluster';
			case 'lists.hospital.withAEService': return 'Provides A&E services';
			case 'lists.hospital.withoutAEService': return 'No A&E services provided';
			case 'lists.soc.search': return 'Search Specialist Outpatient Clinic';
			case 'lists.soc.cluster': return 'Clinic Cluster';
			case 'lists.goc.search': return 'Search General Outpatient Clinic';
			case 'lists.goc.cluster': return 'Clinic Cluster';
			case 'lists.cmc.search': return 'Search Chinese Medicine Clinics cum Training and Research Centres';
			case 'lists.cmc.cluster': return 'Clinic Cluster';
			case 'waitTimeDetails.expectedWaitTime': return 'Expected Waiting Time (Non-Emergency)';
			case 'waitTimeDetails.actions.call': return 'Call Hospital';
			case 'waitTimeDetails.actions.maps': return 'View Maps';
			case 'waitTimeDetails.chartTitle': return 'Waiting Time of the Past 6 Hours';
			case 'waitTimeDetails.hours': return '{value}H';
			case 'waitTimeDetails.info.title': return 'Hospital Info';
			case 'waitTimeDetails.info.address': return 'Address';
			case 'waitTimeDetails.info.contactNo': return 'Contact No.';
			case 'waitTimeDetails.info.faxNo': return 'Fax No.';
			case 'waitTimeDetails.info.emailAddress': return 'Email Address';
			case 'waitTimeDetails.info.website': return 'Website';
			case 'waitTimeDetails.openMaps': return 'Open Maps Application';
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
			case 'main.dataRemarks.pcdUrl': return 'https://apps.pcdirectory.gov.hk/mobile/en';
			case 'main.dataRemarks.hkdUrl': return 'http://www.thkma.org/our_works/hong_kong_doctors/';
			default: return null;
		}
	}
}

extension on _TranslationsZhCn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
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
			case 'settings.appearance.sorting.title': return '默认排序方式';
			case 'settings.appearance.sorting.options.nameInAsd': return '医院英文名称（A-Z）';
			case 'settings.appearance.sorting.options.nameInDesc': return '医院英文名称（Z-A）';
			case 'settings.appearance.sorting.options.timeInAsd': return '等候时间（由短至长）';
			case 'settings.appearance.sorting.options.timeInDesc': return '等候时间（由长至短）';
			case 'settings.data.reset.title': return '重设所有设定';
			case 'settings.data.reset.message': return '如果您在使用此应用程序时遇到任何问题，请考虑重置所有设置以恢复功能。请注意，此操作将在应用程序重新启动后生效。';
			case 'settings.data.reset.buttons.cancel': return '取消';
			case 'settings.data.reset.buttons.reset': return '重设';
			case 'settings.more.license': return '开放源代码授权';
			case 'settings.more.about.title': return '关于本应用程序';
			case 'settings.more.about.items.version': return '应用程序版本';
			case 'settings.more.about.items.dataSource.title': return '资料来源';
			case 'settings.more.about.items.dataSource.value': return '资料一线通、医院管理局';
			case 'settings.more.about.items.appIconSource.title': return '应用程序标志来源';
			case 'settings.more.about.items.appIconSource.value': return 'Pictogrammers';
			case 'settings.more.about.items.appIconSource.url': return 'https://pictogrammers.com/';
			case 'settings.more.about.items.imageSource.title': return '插图来源';
			case 'settings.more.about.items.imageSource.value': return 'unDraw';
			case 'settings.more.about.items.imageSource.url': return 'https://undraw.co/license';
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
			case 'home.filter.cluster': return '医院联网';
			case 'home.filter.sorting.title': return '排序';
			case 'home.filter.sorting.nameInAsd': return '医院英文名称（A-Z）';
			case 'home.filter.sorting.nameInDesc': return '医院英文名称（Z-A）';
			case 'home.filter.sorting.timeInAsd': return '等候时间（由短至长）';
			case 'home.filter.sorting.timeInDesc': return '等候时间（由长至短）';
			case 'home.filter.submit': return '提交';
			case 'home.prompt.noConnection': return '没有网络连线。';
			case 'home.prompt.serverError': return '服务器发生错误，请稍后再试。';
			case 'home.prompt.noSearchResult': return '没有符合搜寻条件的医院。';
			case 'home.prompt.selectItem': return '请在列表中选取一张医院卡片，以查看医院的详情。';
			case 'lists.title': return '设施目录';
			case 'lists.categories.hospital': return '医院/机构';
			case 'lists.categories.soc': return '专科门诊诊所';
			case 'lists.categories.goc': return '普通科门诊诊所';
			case 'lists.categories.cmc': return '中医诊所暨教研中心';
			case 'lists.hospital.search': return '搜寻医院/机构';
			case 'lists.hospital.cluster': return '医院联网';
			case 'lists.hospital.withAEService': return '提供急症室服务';
			case 'lists.hospital.withoutAEService': return '没有急症室服务';
			case 'lists.soc.search': return '搜寻专科门诊诊所';
			case 'lists.soc.cluster': return '诊所联网';
			case 'lists.goc.search': return '搜寻普通科门诊诊所';
			case 'lists.goc.cluster': return '诊所联网';
			case 'lists.cmc.search': return '搜寻中医诊所暨教研中心';
			case 'lists.cmc.cluster': return '诊所联网';
			case 'waitTimeDetails.expectedWaitTime': return '预计等候时间（非紧急病人）';
			case 'waitTimeDetails.actions.call': return '致电医院';
			case 'waitTimeDetails.actions.maps': return '查看地图';
			case 'waitTimeDetails.chartTitle': return '过去 6 小时的等候时间';
			case 'waitTimeDetails.hours': return '{value} 小时';
			case 'waitTimeDetails.info.title': return '医院资料';
			case 'waitTimeDetails.info.address': return '地址';
			case 'waitTimeDetails.info.contactNo': return '电话号码';
			case 'waitTimeDetails.info.faxNo': return '传真号码';
			case 'waitTimeDetails.info.emailAddress': return '电邮地址';
			case 'waitTimeDetails.info.website': return '网址';
			case 'waitTimeDetails.openMaps': return '开启地图应用程序';
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
			case 'main.dataRemarks.pcdUrl': return 'https://apps.pcdirectory.gov.hk/mobile/sc';
			case 'main.dataRemarks.hkdUrl': return 'http://www.thkma.org/our_works/hong_kong_doctors/';
			default: return null;
		}
	}
}

extension on _TranslationsZhHk {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'settings.title': return '設定';
			case 'settings.save': return '儲存設定';
			case 'settings.sections.appearance': return '外觀';
			case 'settings.sections.data': return '數據管理';
			case 'settings.sections.more': return '更多';
			case 'settings.appearance.theme.title': return '顯示主題';
			case 'settings.appearance.theme.options.light': return '淺色主題';
			case 'settings.appearance.theme.options.dark': return '深色主題';
			case 'settings.appearance.theme.options.system': return '跟隨系統設定';
			case 'settings.appearance.language.title': return '顯示語言';
			case 'settings.appearance.language.options.zhHK': return '繁體中文';
			case 'settings.appearance.language.options.zhCN': return '簡體中文 (简体中文)';
			case 'settings.appearance.language.options.en': return '英文 (English)';
			case 'settings.appearance.sorting.title': return '預設排序方式';
			case 'settings.appearance.sorting.options.nameInAsd': return '醫院英文名稱（A-Z）';
			case 'settings.appearance.sorting.options.nameInDesc': return '醫院英文名稱（Z-A）';
			case 'settings.appearance.sorting.options.timeInAsd': return '等候時間（由短至長）';
			case 'settings.appearance.sorting.options.timeInDesc': return '等候時間（由長至短）';
			case 'settings.data.reset.title': return '重設所有設定';
			case 'settings.data.reset.message': return '如果您在使用此應用程式時遇到任何問題，請考慮重置所有設置以恢復功能。請注意，此操作將在應用程式重新啟動後生效。';
			case 'settings.data.reset.buttons.cancel': return '取消';
			case 'settings.data.reset.buttons.reset': return '重設';
			case 'settings.more.license': return '開放源代碼授權';
			case 'settings.more.about.title': return '關於本應用程式';
			case 'settings.more.about.items.version': return '應用程式版本';
			case 'settings.more.about.items.dataSource.title': return '資料來源';
			case 'settings.more.about.items.dataSource.value': return '資料一線通、醫院管理局';
			case 'settings.more.about.items.appIconSource.title': return '應用程式標誌來源';
			case 'settings.more.about.items.appIconSource.value': return 'Pictogrammers';
			case 'settings.more.about.items.appIconSource.url': return 'https://pictogrammers.com/';
			case 'settings.more.about.items.imageSource.title': return '插圖來源';
			case 'settings.more.about.items.imageSource.value': return 'unDraw';
			case 'settings.more.about.items.imageSource.url': return 'https://undraw.co/license';
			case 'home.title': return '急症室等候時間';
			case 'home.actions.filter': return '篩選醫院';
			case 'home.actions.refresh': return '重新整理';
			case 'home.actions.search': return '搜尋醫院';
			case 'home.badgeText': return '急症室會優先診治被分流為危殆、危急和緊急的病人。';
			case 'home.refreshIndicator.pullToRefresh': return '下拉更新資料';
			case 'home.refreshIndicator.releaseToRefresh': return '放開即可更新';
			case 'home.refreshIndicator.refreshing': return '正在更新⋯⋯';
			case 'home.refreshIndicator.dataUpdated': return '資料已更新';
			case 'home.refreshIndicator.failedToRefresh': return '資料更新失敗';
			case 'home.refreshIndicator.lastUpdateAt': return '最後更新：%T';
			case 'home.filter.cluster': return '醫院聯網';
			case 'home.filter.sorting.title': return '排序';
			case 'home.filter.sorting.nameInAsd': return '醫院英文名稱（A-Z）';
			case 'home.filter.sorting.nameInDesc': return '醫院英文名稱（Z-A）';
			case 'home.filter.sorting.timeInAsd': return '等候時間（由短至長）';
			case 'home.filter.sorting.timeInDesc': return '等候時間（由長至短）';
			case 'home.filter.submit': return '提交';
			case 'home.prompt.noConnection': return '沒有網絡連線。';
			case 'home.prompt.serverError': return '伺服器發生錯誤，請稍後再試。';
			case 'home.prompt.noSearchResult': return '沒有符合搜尋條件的醫院。';
			case 'home.prompt.selectItem': return '請在列表中選取一張醫院卡片，以查看醫院的詳情。';
			case 'lists.title': return '設施目錄';
			case 'lists.categories.hospital': return '醫院/機構';
			case 'lists.categories.soc': return '專科門診診所';
			case 'lists.categories.goc': return '普通科門診診所';
			case 'lists.categories.cmc': return '中醫診所暨教研中心';
			case 'lists.hospital.search': return '搜尋醫院/機構';
			case 'lists.hospital.cluster': return '醫院聯網';
			case 'lists.hospital.withAEService': return '提供急症室服務';
			case 'lists.hospital.withoutAEService': return '沒有急症室服務';
			case 'lists.soc.search': return '搜尋專科門診診所';
			case 'lists.soc.cluster': return '診所聯網';
			case 'lists.goc.search': return '搜尋普通科門診診所';
			case 'lists.goc.cluster': return '診所聯網';
			case 'lists.cmc.search': return '搜尋中醫診所暨教研中心';
			case 'lists.cmc.cluster': return '診所聯網';
			case 'waitTimeDetails.expectedWaitTime': return '預計等候時間（非緊急病人）';
			case 'waitTimeDetails.actions.call': return '致電醫院';
			case 'waitTimeDetails.actions.maps': return '查看地圖';
			case 'waitTimeDetails.chartTitle': return '過去 6 小時的等候時間';
			case 'waitTimeDetails.hours': return '{value} 小時';
			case 'waitTimeDetails.info.title': return '醫院資料';
			case 'waitTimeDetails.info.address': return '地址';
			case 'waitTimeDetails.info.contactNo': return '電話號碼';
			case 'waitTimeDetails.info.faxNo': return '傳真號碼';
			case 'waitTimeDetails.info.emailAddress': return '電郵地址';
			case 'waitTimeDetails.info.website': return '網址';
			case 'waitTimeDetails.openMaps': return '開啟地圖應用程式';
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
			case 'main.dataRemarks.pcdUrl': return 'https://apps.pcdirectory.gov.hk/mobile/tc';
			case 'main.dataRemarks.hkdUrl': return 'http://www.thkma.org/our_works/hong_kong_doctors/';
			default: return null;
		}
	}
}

<p align="center">
    <img src="assets/external/readme_app_icon.png" alt="Logo of A&E Live" style="width: 160px; display: block;" />
</p>

<h1 align="center">A&E Live (急症室現場)</h1>

This application provides the waiting time of Accident & Emergency service in all public hospitals in Hong Kong.

<div align="center">

![License](https://img.shields.io/github/license/kshuiroy/ae-live-flutter)

</div>

<h2 align="center">Download the App</h2>

<div align="center">

<a href="https://play.google.com/store/apps/details?id=dev.kshrsoftware.aelive" target="_blank">
    <img src="assets/external/readme_google_play_badge.png" alt="Get It On Google Play" style="width: 180px;" />
</a>

</div>

## 注意事項 Caution

急症室會優先診治被分流為危殆、危急和緊急的病人。

下列數據是統計過去數小時其他病人的最長等候時間，只供參考，並非現時預計等候時間。

急症室須處理突發意外傷者及危重病人，因此未能準確提供預計等候時間，敬請見諒及耐心等候。

病況輕微的病人可考慮使用私營醫療服務（[基層醫療指南](https://apps.pcdirectory.gov.hk/public/tc)或[香港醫生網](https://www.thkma.org/doctor.php)）。

---

Priority will be accorded to patients triaged as critical, emergency and urgent.

The following data is collated from the waiting time of other patients in the past few hours. This is for reference only but not the current estimated waiting time.

A&E Departments need to manage sudden arrival of accident victims and severely-ill patients. We apologise for not being able to provide an accurate estimate of waiting time. Please be patient while waiting for consultation.

Patients with minor illnesses can consider seeking alternative medical services from private clinics (as listed in [Primary Care Directory](https://apps.pcdirectory.gov.hk/public/en) or [Hong Kong Doctors Homepage](https://www.thkma.org/doctor.php)).

## Pre-requisites

To start development, please make sure the development machine has the following SDK and IDE installed:

-   [Flutter SDK: >= 3.24.5](https://docs.flutter.dev/get-started/install)
-   [Visual Studio Code](https://code.visualstudio.com/)
-   [Android Studio: >= Koala | 2024.1.1](https://developer.android.com/studio)
-   Install the following SDKs and IDE also if you're using **macOS**:
    -   Xcode: >= 15.0
    -   Ruby: >= 3.3.0
    -   CocoaPods: >= 1.16.2

## Useful Commands

The followings are some useful commands that can help you, or required to use during development:

```bash
# Generate/Update i18n resources
dart run slang

# Update app icon
dart run flutter_launcher_icons -f flutter_launcher_icons.yaml

# Update splash screen
dart run flutter_native_splash:create --path=flutter_native_splash.yaml

# Start debugging
flutter run

# Build Android App Bundle (Production)
flutter build appbundle
```

## Open data used in this app

This app used the following open data:

-   [Accident and Emergency Waiting Time by Hospital (English)](https://www.ha.org.hk/opendata/aed/aedwtdata-en.json)
-   [Accident and Emergency Waiting Time by Hospital (Traditional Chinese)](https://www.ha.org.hk/opendata/aed/aedwtdata-tc.json)
-   [Accident and Emergency Waiting Time by Hospital (Simplified Chinese)](https://www.ha.org.hk/opendata/aed/aedwtdata-sc.json)
-   [Hospital Authority Hospital/Institution List by Cluster](https://www.ha.org.hk/opendata/facility-hosp.json)
-   [Hospital Authority Specialist Outpatient Clinic List by Cluster](https://www.ha.org.hk/opendata/facility-sop.json)
-   [Hospital Authority General Outpatient Clinic List by Cluster](https://www.ha.org.hk/opendata/facility-gop.json)
-   [List of Chinese Medicine Clinics cum Training and Research Centres](https://www.ha.org.hk/opendata/cmctr/facility-cmctr.json)
-   [Average Number of General Outpatient Clinic Quota for the Preceding 4 Weeks for 18 Districts (English)](https://www.ha.org.hk/pas_gopc/pas_gopc_avg_quota_pdf/g0_9uo7a_p-en.json)
-   [Average Number of General Outpatient Clinic Quota for the Preceding 4 Weeks for 18 Districts (Traditional Chinese)](https://www.ha.org.hk/pas_gopc/pas_gopc_avg_quota_pdf/g0_9uo7a_p-tc.json)
-   [Average Number of General Outpatient Clinic Quota for the Preceding 4 Weeks for 18 Districts (Simplified Chinese)](https://www.ha.org.hk/pas_gopc/pas_gopc_avg_quota_pdf/g0_9uo7a_p-sc.json)

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6311A97F5
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Apr 2020 11:08:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DE3CC36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Apr 2020 09:08:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 224B9C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2020 09:08:10 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03F93Lo1031604; Wed, 15 Apr 2020 11:08:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=2X09NMmV+6u1u40FOiHj8G6vQ0U1kviqNE6/egkArAc=;
 b=ple4Y6mYn8OAZuRudklHM1O7i8TXh8vHncrv17Ynm5arOmlt6vGitEcA7cp8zRvjUrrp
 UpQHlejrrzpxtHoQwwV8G+NvRa8YAkmwMAPqh3SKQOkUUwrYyyV1LTVeDTvDUXVwkADD
 VKK9lTGBbF4QWBiInZlfREMU0B671vxQM8NTponyjlrSpQZuzbzcqxLn6ubFt0nNVoLY
 qyCUqt3vsPOPDlmJbN8rQylT3K4+/5hXaJJJEEuej5kMeV91K9dtnSfrYZLGbwoOKI9+
 mYBpsglFctHAg0fpeQRQ3PIUgVDlD9ciZWyRE8v8MsBs7fTmBZ8TEKl4gGvryAnDriNY LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30dn8rtpvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Apr 2020 11:08:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0B39A100034;
 Wed, 15 Apr 2020 11:08:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D46F32AA9E8;
 Wed, 15 Apr 2020 11:08:04 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Apr
 2020 11:08:04 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 15 Apr 2020 11:08:04 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Tom Rini <trini@konsulko.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PULL] Pull request: u-boot-stm/next =u-boot-stm32-20200415
Thread-Index: AQHWEwVf6XbSmgZrV0SXK8XuzAaTeA==
Date: Wed, 15 Apr 2020 09:08:04 +0000
Message-ID: <b59678ac-356a-5118-6948-5913e7b63dda@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <0C28394A88BB8E4B983DFB749CFDB5E7@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-15_01:2020-04-14,
 2020-04-15 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, Marek
 Vasut <marex@denx.de>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Christophe ROULLIER <christophe.roullier@st.com>
Subject: [Uboot-stm32] [PULL] Pull request: u-boot-stm/next
	=u-boot-stm32-20200415
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkgVG9tDQoNCg0KUGxlYXNlIHB1bGwgdGhlIHUtYm9vdC1zdG0gbmV4dCBicmFuY2guDQoNCkNJ
IHN0YXR1czogaHR0cHM6Ly9naXRsYWIuZGVueC5kZS91LWJvb3QvY3VzdG9kaWFucy91LWJvb3Qt
c3RtL3BpcGVsaW5lcy8yNzU5DQoNClRoYW5rcw0KDQpQYXRyaWNlDQoNClRoZSBmb2xsb3dpbmcg
Y2hhbmdlcyBzaW5jZSBjb21taXQgMTQyYTA3ZjJhNDQyNjJkNzZmZWM2MDllMWZjZGU1MTc5NGE0
NTZlYjoNCg0KwqAgTWVyZ2UgYnJhbmNoICdtYXN0ZXInIG9mIGdpdDovL2dpdC5kZW54LmRlL3Ut
Ym9vdC1tYXJ2ZWxsICgyMDIwLTA0LTE0IDA4OjQ3OjA3IC0wNDAwKQ0KDQphcmUgYXZhaWxhYmxl
IGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCg0KwqAgaHR0cHM6Ly9naXRsYWIuZGVueC5kZS91
LWJvb3QvY3VzdG9kaWFucy91LWJvb3Qtc3RtIHRhZ3MvdS1ib290LXN0bTMyLTIwMjAwNDE1DQoN
CmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA3MWJhMmNiMGQ2NzhkMmMyOWRhZGQ1ZmNj
YTYxY2UzOTQyODc2ZWU2Og0KDQrCoCBib2FyZDogc3RtMzJtcDE6IGNvcnJlY3QgQ09ORklHX0lT
X0VOQUJMRUQgdXNhZ2UgZm9yIExFRCAoMjAyMC0wNC0xNSAwOToxMDoxMiArMDIwMCkNCg0KDQot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQotIFJlcGxhY2UgU1RNMzJNUDFfVFJVU1RFRCBieSBURkFCT09UIGZsYWcNCi0gRW5h
YmxlIGJvb3RkLCBpbWluZm8sIGlteHRyYWN0IG9uIFNUIGRlZmNvbmZpZw0KLSBSZW5hbWUgTEVE
cyB0byBtYXRjaCBzaWxrc2NyZWVuIG9uIEFWOTYNCi0gQWRkIEtTODg1MS0xNk1MTCBldGhlcm5l
dCBvbiBGTUMyDQotIERlZmluZSBGTUMyIGJhc2UgYWRkcmVzcw0KLSBuZXQ6IGR3Y19ldGhfcW9z
OiBpbXBsZW1lbnQgcmVzZXQtZ3Bpb3MgZm9yIHN0bTMyDQotIG5ldDogZHdjX2V0aF9xb3M6IGlt
cGxlbWVudCBwaHkgcmVnIGFuZCBtYXgtc3BlZWQgZm9yIHN0bTMyDQoNCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkNocmlz
dG9waGUgUm91bGxpZXIgKDEpOg0KwqDCoMKgwqDCoCBuZXQ6IGR3Y19ldGhfcW9zOiBpbXBsZW1l
bnQgcmVzZXQtZ3Bpb3MgZm9yIHN0bTMyDQoNCk1hcmVrIFZhc3V0ICgzKToNCsKgwqDCoMKgwqAg
QVJNOiBkdHM6IHN0bTMyOiBEZWZpbmUgRk1DMiBiYXNlIGFkZHJlc3MNCsKgwqDCoMKgwqAgQVJN
OiBkdHM6IHN0bTMyOiBBZGQgS1M4ODUxLTE2TUxMIGV0aGVybmV0IG9uIEZNQzINCsKgwqDCoMKg
wqAgQVJNOiBkdHM6IHN0bTMyOiBSZW5hbWUgTEVEcyB0byBtYXRjaCBzaWxrc2NyZWVuIG9uIEFW
OTYNCg0KUGF0cmljayBEZWxhdW5heSAoNCk6DQrCoMKgwqDCoMKgIG5ldDogZHdjX2V0aF9xb3M6
IGltcGxlbWVudCBwaHkgcmVnIGFuZCBtYXgtc3BlZWQgZm9yIHN0bTMyDQrCoMKgwqDCoMKgIGNv
bmZpZ3M6IHN0bTMybXAxOiByZXBsYWNlIFNUTTMyTVAxX1RSVVNURUQgYnkgVEZBQk9PVA0KwqDC
oMKgwqDCoCBBUk06IHN0bTMyOiBFbmFibGUgYm9vdGQsIGltaW5mbywgaW14dHJhY3Qgb24gU1Qg
ZGVmY29uZmlnDQrCoMKgwqDCoMKgIGJvYXJkOiBzdG0zMm1wMTogY29ycmVjdCBDT05GSUdfSVNf
RU5BQkxFRCB1c2FnZSBmb3IgTEVEDQoNCsKgYXJjaC9hcm0vS2NvbmZpZ8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgKw0KwqBhcmNoL2Fy
bS9kdHMvc3RtMzJtcDE1N2EtYXZlbmdlcjk2LmR0c8KgwqDCoMKgIHzCoCA2ICstLQ0KwqBhcmNo
L2FybS9kdHMvc3RtMzJtcDE1eHgtZGhjb20tdS1ib290LmR0c2kgfCA2OCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQrCoGFyY2gvYXJtL21hY2gtc3RtMzJtcC9LY29uZmlnwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCAyMSArKystLS0tLS0NCsKgYXJjaC9hcm0vbWFjaC1zdG0zMm1w
L2JzZWMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxOCArKysrLS0tLQ0KwqBhcmNo
L2FybS9tYWNoLXN0bTMybXAvY3B1LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAx
MCArKy0tLQ0KwqBhcmNoL2FybS9tYWNoLXN0bTMybXAvaW5jbHVkZS9tYWNoL3N0bTMyLmggfMKg
IDEgKw0KwqBib2FyZC9kaGVsZWN0cm9uaWNzL2RoX3N0bTMybXAxL2JvYXJkLmPCoMKgwqAgfCA1
OCArKysrKysrKysrKysrKysrKysrKysrLS0NCsKgYm9hcmQvc3Qvc3RtMzJtcDEvc3RtMzJtcDEu
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDYgKy0tDQrCoGNvbmZpZ3Mvc3RtMzJt
cDE1X2Jhc2ljX2RlZmNvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMyAtLQ0KwqBjb25maWdz
L3N0bTMybXAxNV9kaGNvbV9iYXNpY19kZWZjb25maWfCoMKgwqAgfMKgIDEgKw0KwqBjb25maWdz
L3N0bTMybXAxNV9vcHRlZV9kZWZjb25maWfCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgKw0KwqBj
b25maWdzL3N0bTMybXAxNV90cnVzdGVkX2RlZmNvbmZpZ8KgwqDCoMKgwqDCoMKgIHzCoCA0ICst
DQrCoGRyaXZlcnMvY2xrL2Nsa19zdG0zMm1wMS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDIgKy0NCsKgZHJpdmVycy9uZXQvZHdjX2V0aF9xb3MuY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA3MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0N
CsKgZHJpdmVycy9yYW0vc3RtMzJtcDEvc3RtMzJtcDFfcmFtLmPCoMKgwqDCoMKgwqDCoCB8wqAg
MiArLQ0KwqBpbmNsdWRlL2NvbmZpZ3Mvc3RtMzJtcDEuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCAyICstDQrCoDE3IGZpbGVzIGNoYW5nZWQsIDIyOCBpbnNlcnRpb25zKCsp
LCA0OCBkZWxldGlvbnMoLSkNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 687691CDC71
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 16:02:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33646C36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 14:02:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4B3DC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 14:02:42 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BDRvCn007343; Mon, 11 May 2020 16:00:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=nHjkh+jrqKUJX1uJOA6J+NkPDt8cKr7CtbfvV0iZjpI=;
 b=Bdq5hth5ywlFbCQVCLnDDjSwpAdVq5tFXMIsyvt1fxQBhahdsIP5Td2HW2jaSUJUGbo8
 dhFWiyQRNbR1pdpp5Tc9W3e5R22/3egOx7PH9NlBOakR/caZyEe6hEZ+pisP3BZtzvW0
 a9dumAhsc3qFOX5PbPtWFP7htSzy1oC3ezi4jHskppv+3ARePJem3l0W1dargFETQaxy
 n1vqEh0EHdpUrXMbVFJDPReSAM8G4xl1ZltK5Lej5CokpeQoas+QcRTITkH1spEGGP/G
 jEcKTfPFwO6ryp4i2gh9G0eWmANmkLFY9VnApVkj3EEQIPOxXLErolc5Mx2fKjASFSBz IQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30wj01tx6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 16:00:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ABFE210002A;
 Mon, 11 May 2020 16:00:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A0DD42AE6CC;
 Mon, 11 May 2020 16:00:47 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 May
 2020 16:00:47 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 11 May 2020 16:00:47 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] mmc: stm32_sdmmc2: change the displayed config name
Thread-Index: AQHWHsRFvQkrkmRGIky1DHp+hd3Mo6ii2hIA
Date: Mon, 11 May 2020 14:00:47 +0000
Message-ID: <8841d57c-63fd-a4de-b3ea-ee2139f392c9@st.com>
References: <20200430095210.1.I4bda9fd7fdf1c7fe42323749ad1977dc690e14db@changeid>
In-Reply-To: <20200430095210.1.I4bda9fd7fdf1c7fe42323749ad1977dc690e14db@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <DBDE4E50B0E2A24F84C2814954839457@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_06:2020-05-11,
 2020-05-11 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [Uboot-stm32] [PATCH] mmc: stm32_sdmmc2: change the displayed
	config name
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

DQpPbiA0LzMwLzIwIDk6NTIgQU0sIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6DQo+IENoYW5nZSB0
aGUgbW1jIGRpc3BsYXllZCBuYW1lIGluIFUtQm9vdCBmb3Igc3RtMzJfc2RtbWMyIGRyaXZlciB0
bw0KPiDigJxTVE0zMiBTRC9NTUPigJ0uDQo+DQo+IFRoaXMgc3RtMzJfc2RtbWMyIGRyaXZlciBp
cyBmb3IgdmVyc2lvbiAyIG9mIHRoZSBTVCBIVyBJUCBTRE1NQyBidXQgdGhlDQo+IGRpc3BsYXll
ZCBuYW1lICJTVE0zMiBTRE1NQzIiIGlzIGNvbmZ1c2luZyBmb3IgdXNlciwgYmV0d2VlbiB0aGUN
Cj4gaW5zdGFuY2Ugb2YgU0RNTUMgYW5kIHRoZSBkZXZpY2UgaWRlbnRpZmllciBvZiBNTUMuDQo+
DQo+IEZvciBleGFtcGxlIG9uIEVWMSBib2FyZCwgd2UgaGF2ZToNCj4NCj4gU1RNMzJNUDE+IG1t
YyBsaXN0DQo+ICBTVE0zMiBTRE1NQzI6IDAgKFNEKQ0KPiAgU1RNMzIgU0RNTUMyOiAxIChlTU1D
KQ0KPg0KPiBDaGFuZ2VkIHRvIG1vcmUgY2xlYXI6DQo+DQo+IFNUTTMyTVAxPiBtbWMgbGlzdA0K
PiAgU1RNMzIgU0QvTU1DOiAwIChTRCkNCj4gIFNUTTMyIFNEL01NQzogMSAoZU1NQykNCj4NCj4g
U2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBzdC5jb20+
DQo+IC0tLQ0KPg0KPiAgZHJpdmVycy9tbWMvc3RtMzJfc2RtbWMyLmMgfCAyICstDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbW1jL3N0bTMyX3NkbW1jMi5jIGIvZHJpdmVycy9tbWMvc3RtMzJfc2RtbWMy
LmMNCj4gaW5kZXggNmYzYjJhZDY1My4uZmE2ZmM5NGFkOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9tbWMvc3RtMzJfc2RtbWMyLmMNCj4gKysrIGIvZHJpdmVycy9tbWMvc3RtMzJfc2RtbWMyLmMN
Cj4gQEAgLTY3NCw3ICs2NzQsNyBAQCBzdGF0aWMgaW50IHN0bTMyX3NkbW1jMl9wcm9iZShzdHJ1
Y3QgdWRldmljZSAqZGV2KQ0KPiAgCWNmZy0+Zl9tYXggPSBkZXZfcmVhZF91MzJfZGVmYXVsdChk
ZXYsICJtYXgtZnJlcXVlbmN5IiwgNTIwMDAwMDApOw0KPiAgCWNmZy0+dm9sdGFnZXMgPSBNTUNf
VkREXzMyXzMzIHwgTU1DX1ZERF8zM18zNCB8IE1NQ19WRERfMTY1XzE5NTsNCj4gIAljZmctPmJf
bWF4ID0gQ09ORklHX1NZU19NTUNfTUFYX0JMS19DT1VOVDsNCj4gLQljZmctPm5hbWUgPSAiU1RN
MzIgU0RNTUMyIjsNCj4gKwljZmctPm5hbWUgPSAiU1RNMzIgU0QvTU1DIjsNCj4gIA0KPiAgCWNm
Zy0+aG9zdF9jYXBzID0gMDsNCj4gIAlpZiAoY2ZnLT5mX21heCA+IDI1MDAwMDAwKQ0KDQpSZXZp
ZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAc3QuY29tPg0KDQpUaGFu
a3MNCg0KUGF0cmljZQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK

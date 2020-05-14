Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1811D2BA2
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 11:41:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C13C7C36B10
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 09:41:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C0E9C36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 09:41:04 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04E9cP1t012260; Thu, 14 May 2020 11:41:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=FuC6h96V5/bU4j66EiiCk0yrXhCijEH69Qw0J2azeWc=;
 b=r01F9lABJqoBX5lruYegyUVmve5ZVLLtXnzlwfqzcUSgTKs1kdXfSIhrsqEZgLuYLlm2
 iE/J5eJiMiZ9pNTWV/QOoX6MxJyg5PsTB1qKnYQCww+GcyBn1nDhXnNbpMTF+x3U+fPN
 fJINluZ6h1Jf6FAGt7GZBG0P8M2vKXV+ujOkVMiEeD9+MObIl0rLGLz+VlIBe7XRYLZv
 9c8TYBPPZ7Q4QwyAwBTotLPtgYUIjlXS4s+/K/IgkYiNUC9n8PqDyerOEii+pINDK+TN
 kqHSa3Ut4Ca5X1UbWPei2/0VFyvQOf7jH7AYwqYKUzZmwua9aY75W18xwDwecY+3Rv5f 3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vna5eg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 11:41:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB3D2100034;
 Thu, 14 May 2020 11:41:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A19332AF97A;
 Thu, 14 May 2020 11:40:59 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 14 May
 2020 11:40:59 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 14 May 2020 11:40:59 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] mmc: stm32_sdmmc2: change the displayed config name
Thread-Index: AQHWHsRFvQkrkmRGIky1DHp+hd3Mo6inadzQ
Date: Thu, 14 May 2020 09:40:58 +0000
Message-ID: <3768666dd21c482f884c7e109aa092fd@SFHDAG6NODE3.st.com>
References: <20200430095210.1.I4bda9fd7fdf1c7fe42323749ad1977dc690e14db@changeid>
In-Reply-To: <20200430095210.1.I4bda9fd7fdf1c7fe42323749ad1977dc690e14db@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_02:2020-05-13,
 2020-05-14 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Peng Fan <peng.fan@nxp.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
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

SGksDQoNCj4gRnJvbTogUGF0cmljayBERUxBVU5BWSA8cGF0cmljay5kZWxhdW5heUBzdC5jb20+
DQo+IFNlbnQ6IGpldWRpIDMwIGF2cmlsIDIwMjAgMDk6NTINCj4gDQo+IENoYW5nZSB0aGUgbW1j
IGRpc3BsYXllZCBuYW1lIGluIFUtQm9vdCBmb3Igc3RtMzJfc2RtbWMyIGRyaXZlciB0bw0KPiDi
gJxTVE0zMiBTRC9NTUPigJ0uDQo+IA0KPiBUaGlzIHN0bTMyX3NkbW1jMiBkcml2ZXIgaXMgZm9y
IHZlcnNpb24gMiBvZiB0aGUgU1QgSFcgSVAgU0RNTUMgYnV0IHRoZQ0KPiBkaXNwbGF5ZWQgbmFt
ZSAiU1RNMzIgU0RNTUMyIiBpcyBjb25mdXNpbmcgZm9yIHVzZXIsIGJldHdlZW4gdGhlIGluc3Rh
bmNlIG9mDQo+IFNETU1DIGFuZCB0aGUgZGV2aWNlIGlkZW50aWZpZXIgb2YgTU1DLg0KPiANCj4g
Rm9yIGV4YW1wbGUgb24gRVYxIGJvYXJkLCB3ZSBoYXZlOg0KPiANCj4gU1RNMzJNUDE+IG1tYyBs
aXN0DQo+ICBTVE0zMiBTRE1NQzI6IDAgKFNEKQ0KPiAgU1RNMzIgU0RNTUMyOiAxIChlTU1DKQ0K
PiANCj4gQ2hhbmdlZCB0byBtb3JlIGNsZWFyOg0KPiANCj4gU1RNMzJNUDE+IG1tYyBsaXN0DQo+
ICBTVE0zMiBTRC9NTUM6IDAgKFNEKQ0KPiAgU1RNMzIgU0QvTU1DOiAxIChlTU1DKQ0KPiANCj4g
U2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBzdC5jb20+
DQo+IC0tLQ0KPiANCj4gIGRyaXZlcnMvbW1jL3N0bTMyX3NkbW1jMi5jIHwgMiArLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KDQpBcHBsaWVk
IHRvIHUtYm9vdC1zdG0vbWFzdGVyLCB0aGFua3MhDQoNClJlZ2FyZHMNCg0KUGF0cmljaw0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0z
MiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9v
dC1zdG0zMgo=

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F34402647B9
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 16:07:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF6A3C3FAFE
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 14:07:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 796EFC3FAE3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 14:07:06 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08AE71Tv006376; Thu, 10 Sep 2020 16:07:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=goGhhfXJfRMPWYz/AHUkoLgLsjL9d+w+ASulB7iHLRU=;
 b=UzykRLiJZ+qC1d//V3AzzrpBDFdxuKagW64NbuFwm+aIFxB1Qi47BmPnTJcaMFuVSiPE
 KKCDty74NOLxIRB0v3WQR/q6My/JS1MWRCCG1xgOistQRxC2eSrqLNqp9bB4/mDOEKFs
 pDJEh2XiIe5Zz4WOaWzskeZiXIV8z+6GMw/9f9/V+uq6Yvgnq56HR146cXvlIZ3JTlDz
 hrTpuaRIAM/D/wEbBSU4q5AN6T6RyXTROKUNCf5kdN8CH2qdozrBpJiz2yWD4LjxBVkY
 Vxi1Qnq4bkTFF9axATv3TSwhsf/8lTkMU0cXg+sXToJStRubEMYglYAw37F7pctUnKlo wQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c051kkkf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 16:07:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D38AA10002A;
 Thu, 10 Sep 2020 16:06:55 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag6node4.st.com [10.75.127.80])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C5DA12ADA16;
 Thu, 10 Sep 2020 16:06:55 +0200 (CEST)
Received: from GPXDAG6NODE4.st.com (10.75.127.80) by GPXDAG6NODE4.st.com
 (10.75.127.80) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Sep
 2020 16:06:55 +0200
Received: from GPXDAG6NODE4.st.com ([fe80::4c1e:1db5:6168:d6fc]) by
 GPXDAG6NODE4.st.com ([fe80::4c1e:1db5:6168:d6fc%19]) with mapi id
 15.00.1473.003; Thu, 10 Sep 2020 16:06:55 +0200
From: Yannick FERTRE <yannick.fertre@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/2] video: stm32_dsi: Convert to use APIs which support
 live DT
Thread-Index: AQHWhsAYQkCcsbUOcEG0kywpA95E7KlhyECA
Date: Thu, 10 Sep 2020 14:06:55 +0000
Message-ID: <7c1abd8c-f352-18ab-6191-c18406977ebc@st.com>
References: <20200909154413.28064-1-patrick.delaunay@st.com>
 <20200909154413.28064-2-patrick.delaunay@st.com>
In-Reply-To: <20200909154413.28064-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <5A8D36F22EBAC5428367A8D08B134B1D@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-10_03:2020-09-10,
 2020-09-10 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/2] video: stm32_dsi: Convert to use APIs
 which support live DT
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

UmV2aWV3ZWQtYnk6IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPg0KDQoN
Ck9uIDkvOS8yMCA1OjQ0IFBNLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOg0KPiBVc2Ugb2Zub2Rl
XyBvciBkZXZfIEFQSXMgaW5zdGVhZCBvZiBmZHRfIGFuZCBmZHRkZWNfIEFQSXMgc28gdGhhdCB0
aGUNCj4gZHJpdmVyIGNhbiBzdXBwb3J0IGxpdmUgRFQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQ
YXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4NCj4gLS0tDQo+IA0KPiAg
IGRyaXZlcnMvdmlkZW8vc3RtMzIvc3RtMzJfZHNpLmMgfCAzICstLQ0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3ZpZGVvL3N0bTMyL3N0bTMyX2RzaS5jIGIvZHJpdmVycy92aWRlby9zdG0zMi9zdG0z
Ml9kc2kuYw0KPiBpbmRleCAyODMxNTEzOThiLi45ZDVhYmFjYzJiIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL3ZpZGVvL3N0bTMyL3N0bTMyX2RzaS5jDQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vc3Rt
MzIvc3RtMzJfZHNpLmMNCj4gQEAgLTM1OSw4ICszNTksNyBAQCBzdGF0aWMgaW50IHN0bTMyX2Rz
aV9hdHRhY2goc3RydWN0IHVkZXZpY2UgKmRldikNCj4gICANCj4gICAJcmV0ID0gcGFuZWxfZ2V0
X2Rpc3BsYXlfdGltaW5nKHByaXYtPnBhbmVsLCAmdGltaW5ncyk7DQo+ICAgCWlmIChyZXQpIHsN
Cj4gLQkJcmV0ID0gZmR0ZGVjX2RlY29kZV9kaXNwbGF5X3RpbWluZyhnZC0+ZmR0X2Jsb2IsDQo+
IC0JCQkJCQkgICBkZXZfb2Zfb2Zmc2V0KHByaXYtPnBhbmVsKSwNCj4gKwkJcmV0ID0gb2Zub2Rl
X2RlY29kZV9kaXNwbGF5X3RpbWluZyhkZXZfb2Zub2RlKHByaXYtPnBhbmVsKSwNCj4gICAJCQkJ
CQkgICAwLCAmdGltaW5ncyk7DQo+ICAgCQlpZiAocmV0KSB7DQo+ICAgCQkJZGV2X2VycihkZXYs
ICJkZWNvZGUgZGlzcGxheSB0aW1pbmcgZXJyb3IgJWRcbiIsIHJldCk7DQo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5n
IGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

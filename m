Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A0610383B
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 12:06:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31523C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 11:06:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84631C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 11:06:14 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKB25rD016468; Wed, 20 Nov 2019 12:06:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=vpB/PU3ChSM1e6f5FyPojv29ZHRI7IUw9cuLy7O4CaQ=;
 b=VqRlO3mupWerhkKT2Q1hhtISfm0uip+UEKPbIuV7jK1BAdARzyrOFevqRPPrNTQkwZl0
 CLhdQYCkDaTcK/NADPynS9LZUZRAkK355xseVYJTEUL5Zpoe9nmgAM7Ok2OhPwMkP/J8
 mYkmAyjFimOAkpjx9l4QmGw8ayYMZS8PAOKbYztYWWW744gVcPtgXGcHe7GduRL6QYY9
 xdB7tAEfb9AV0QeryBCDCFh34epdWmGzkUiJdTjHTDPuWfJqfUltbtZhTuTOnctejX2q
 +ipmObGRT6HWPSQhJIACtAvwYHriBgM1c7GEPZ9He0Bj6hb1LTbyAxXOwXXPa6J2v1Es UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wa9usda9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 12:06:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1042C10002A;
 Wed, 20 Nov 2019 12:06:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 065EF2BEC54;
 Wed, 20 Nov 2019 12:06:11 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 20 Nov
 2019 12:06:10 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 20 Nov 2019 12:06:10 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/2] video: bmp: Fix video_splash_align_axis()
Thread-Index: AQHVn496RkzxevRHN0a2+cBSXyp/+KeT4/zQ
Date: Wed, 20 Nov 2019 11:06:10 +0000
Message-ID: <f7540c4f9c3b4869a6752b900c9a14f7@SFHDAG6NODE3.st.com>
References: <20191120104418.1179-1-patrice.chotard@st.com>
 <20191120104418.1179-2-patrice.chotard@st.com>
In-Reply-To: <20191120104418.1179-2-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_03:2019-11-15,2019-11-20 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Yannick FERTRE <yannick.fertre@st.com>, Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/2] video: bmp: Fix
	video_splash_align_axis()
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

SGksDQoNCj4gRnJvbTogUGF0cmljZSBDSE9UQVJEIDxwYXRyaWNlLmNob3RhcmRAc3QuY29tPg0K
PiBTZW50OiBtZXJjcmVkaSAyMCBub3ZlbWJyZSAyMDE5IDExOjQ0DQo+IA0KPiBJbiBjYXNlIHRo
ZSBwYW5lbF9zaXplIGlzIHNtYWxsZXIgdGhhbiBwaWN0dXJlX3NpemUsIHdlIG11c3QgaW5zdXJl
IHRoYXQNCj4gcGFuZWxfcGljdHVyZV9kZWx0YSBzdG9yZXMgdGhlIGFic29sdXRlIHZhbHVlIG9m
IGRpZmZlcmVuY2UgYmV0d2VlbiBwYW5lbF9zaXplDQo+IGFuZCBwaWN0dXJlX3NpemUuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBzdC5jb20+
DQo+IENDOiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4NCj4gLS0tDQo+
IA0KPiAgZHJpdmVycy92aWRlby92aWRlb19ibXAuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdmlkZW8vdmlkZW9fYm1wLmMgYi9kcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jIGluZGV4DQo+
IDE5M2YzN2QyNzUuLmRjNjI1OGNlNzggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vdmlk
ZW9fYm1wLmMNCj4gKysrIGIvZHJpdmVycy92aWRlby92aWRlb19ibXAuYw0KPiBAQCAtMTU3LDcg
KzE1Nyw3IEBAIF9fd2VhayB2b2lkIGZiX3B1dF93b3JkKHVjaGFyICoqZmIsIHVjaGFyICoqZnJv
bSkNCj4gc3RhdGljIHZvaWQgdmlkZW9fc3BsYXNoX2FsaWduX2F4aXMoaW50ICpheGlzLCB1bnNp
Z25lZCBsb25nIHBhbmVsX3NpemUsDQo+ICAJCQkJICAgIHVuc2lnbmVkIGxvbmcgcGljdHVyZV9z
aXplKQ0KPiAgew0KPiAtCXVuc2lnbmVkIGxvbmcgcGFuZWxfcGljdHVyZV9kZWx0YSA9IHBhbmVs
X3NpemUgLSBwaWN0dXJlX3NpemU7DQo+ICsJdW5zaWduZWQgbG9uZyBwYW5lbF9waWN0dXJlX2Rl
bHRhID0gYWJzKHBhbmVsX3NpemUgLSBwaWN0dXJlX3NpemUpOw0KDQpJIHRoaW5rIHRoaXMgcGF0
Y2ggY2F1c2UgYWxpZ25tZW50IGlzc3VlIGlmIHBpY3R1cmVfc2l6ZSA+IHBhbmVsX3NpemUuIChu
b3QgYWxsaWduZSBhIHRoZSBsZWZ0L3VwIGNvcm5lcikuDQoNCkkgdGhpbmsgaXQgaXMgYmVldGVy
IHRvIGNoYW5nZSB0eXBlOg0KDQorIGxvbmcgcGFuZWxfcGljdHVyZV9kZWx0YSA9IHBhbmVsX3Np
emUgLSBwaWN0dXJlX3NpemU7DQoNCkFzIHZhbHVlIGlzIGNyb3BwZWQgdG8gMCBpbiB0aGUgbmV4
dCBsaW5lczoNCg0KKmF4aXMgPSBtYXgoMCwgKGludClheGlzX2FsaWdubWVudCk7DQoNCg0KDQo+
ICAJdW5zaWduZWQgbG9uZyBheGlzX2FsaWdubWVudDsNCj4gDQo+ICAJaWYgKCpheGlzID09IEJN
UF9BTElHTl9DRU5URVIpDQo+IC0tDQo+IDIuMTcuMQ0KDQoNClJlZ2FyZHMNCg0KUGF0cmljaw0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3Rt
MzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJv
b3Qtc3RtMzIK

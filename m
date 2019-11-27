Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C16510AC31
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Nov 2019 09:49:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBD6AC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Nov 2019 08:49:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E9C4C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 08:49:40 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAR8l0fC018337; Wed, 27 Nov 2019 09:49:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=/U9RLVow2adv38gXbc+SpzfTjl4xFwHNutLfcUPslf8=;
 b=W6drE/OrkBNfksucVeLbMEEqj8UIH7yEeIewnMgAFWWE7zARaKlIT4lGFPzWL3/X0q3J
 Ln18ChNYdfQrTjMQBf99y5z/SPAaNqfisEcQErKXL2Hjf7w93sRX3+7tL56djyaor22P
 pUDe6FCuLTxhU2lgSkINpH3u0abUl08juxAduD9FUTJK9dkzYBmthbCUIYF75fK98y9I
 Nen3EUXnoakhFpny75HnEfTstJvEBd3qhEkyJOSNKZj8VnPy08MbRb0s1QRG9v1dxoZl
 CzpvGu29NfpwHkcRuXdz+W7soBC3qs31yVj4A7PMfXwROb6ZHwt1xnbna6RiTkMQ/gVC bA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2whcxkje4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 09:49:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 017A710002A;
 Wed, 27 Nov 2019 09:49:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D38822AC078;
 Wed, 27 Nov 2019 09:49:25 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Nov
 2019 09:49:25 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 27 Nov 2019 09:49:25 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, Patrick DELAUNAY
 <patrick.delaunay@st.com>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] board_f.c: Insure gd->new_bootstage alignment
Thread-Index: AQHVo5b8nMk4YyxpKkWVHbr0Um2wiqedXd5ggABLtQCAAP2eAA==
Date: Wed, 27 Nov 2019 08:49:25 +0000
Message-ID: <ad242f08-5478-8ac8-64af-025da10da41a@st.com>
References: <20191125134811.16462-1-patrice.chotard@st.com>
 <a4bdcd488930473dbeb01c6e9d678398@SFHDAG6NODE3.st.com>
 <217ce077-0e80-5f94-cb7b-511f8c527b1f@gmx.de>
In-Reply-To: <217ce077-0e80-5f94-cb7b-511f8c527b1f@gmx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <FEB25D973A2DC54C9B265675DACF0B9D@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_02:2019-11-27,2019-11-27 signatures=0
Cc: Stephen Warren <swarren@nvidia.com>, Simon Glass <sjg@chromium.org>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Trevor Woerner <trevor@toganlabs.com>, Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH] board_f.c: Insure gd->new_bootstage
	alignment
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

SGkgSGVpbnJpY2gNCg0KT24gMTEvMjYvMTkgNjo0MSBQTSwgSGVpbnJpY2ggU2NodWNoYXJkdCB3
cm90ZToNCj4gT24gMTEvMjYvMTkgMToxNiBQTSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToNCj4+
IEhpLA0KPj4NCj4+PiBGcm9tOiBQYXRyaWNlIENIT1RBUkQgPHBhdHJpY2UuY2hvdGFyZEBzdC5j
b20+DQo+Pj4gU2VudDogbHVuZGkgMjUgbm92ZW1icmUgMjAxOSAxNDo0OA0KPj4+DQo+Pj4gSW4g
cmVzZXJ2ZV9ib290c3RhZ2UoKSwgaW4gY2FzZSBzaXplIGlzIG9kZCwgZ2QtPm5ld19ib290c3Rh
Z2UgaXMgbm90IGFsaWduZWQuIEluDQo+Pj4gYm9vdHN0YWdlX3JlbG9jYXRlKCksIHRoZSBwbGF0
Zm9ybSBoYW5ncyB3aGVuIGdldHRpbmcgYWNjZXNzIHRvIGRhdGEtDQo+Pj4+IHJlY29yZFtpXS5u
YW1lLg0KPj4+IFRvIGF2b2lkIHRoaXMgaXNzdWUsIG1ha2UgZ2QtPm5ld19ib290c3RhZ2UgMTYg
Ynl0ZSBhbGlnbmVkLg0KPj4+DQo+Pj4gRml4ZXM6IGFjOWNkNDgwNWM4YiAoImJvb3RzdGFnZTog
Q29ycmVjdCByZWxvY2F0aW9uIGFsZ29yaXRobSIpDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBQ
YXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBzdC5jb20+DQo+Pj4gUmV2aWV3ZWQtYnk6
IFZpa2FzIE1BTk9DSEEgPHZpa2FzLm1hbm9jaGFAc3QuY29tPg0KPj4+IC0tLQ0KPj4NCj4+IFRo
aXMgcGF0Y2ggaXMgbWFuZGF0b3J5IGZvciBzdG0zMm1wMSAoQVJNIHBsYWZvcm0gd2l0aCBib290
c3RhZ2UgZmVhdHVyZSBhY3RpdmF0ZWQpLg0KPj4NCj4+IFdpdGhvdXQgdGhpcyBwYXRjaCwgdGhl
IGJvb3QgZmFpbGVkIGZvciB2MjAyMC4wMS1yYzMgKGNyYXNoIGhhcyBzdHJ1Y3QgcG9pbnRlciBu
ZXdfYm9vdHN0YWdlIGlzIG5vdCBhbGlnbmVkKS4NCj4+DQo+PiBSZXZpZXdlZC1ieTogUGF0cmlj
ayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBzdC5jb20+DQo+PiBUZXN0ZWQtYnk6IFBhdHJp
Y2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAc3QuY29tPg0KPj4NCj4+PiDCoCBjb21tb24v
Ym9hcmRfZi5jIHwgMSArDQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+
Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvY29tbW9uL2JvYXJkX2YuYyBiL2NvbW1vbi9ib2FyZF9mLmMg
aW5kZXggZTM1OTFjYmFlYi4uOWNkNGNmYWY1Zg0KPj4+IDEwMDY0NA0KPj4+IC0tLSBhL2NvbW1v
bi9ib2FyZF9mLmMNCj4+PiArKysgYi9jb21tb24vYm9hcmRfZi5jDQo+Pj4gQEAgLTU1OSw2ICs1
NTksNyBAQCBzdGF0aWMgaW50IHJlc2VydmVfYm9vdHN0YWdlKHZvaWQpDQo+Pj4gwqDCoMKgwqDC
oCBpbnQgc2l6ZSA9IGJvb3RzdGFnZV9nZXRfc2l6ZSgpOw0KPj4+DQo+Pj4gwqDCoMKgwqDCoCBn
ZC0+c3RhcnRfYWRkcl9zcCAtPSBzaXplOw0KPj4+ICvCoMKgwqAgZ2QtPnN0YXJ0X2FkZHJfc3Ag
PSBBTElHTl9ET1dOKGdkLT5zdGFydF9hZGRyX3NwLCAxNik7DQo+DQo+IEEgY29tbWVudCBpbiB0
aGUgY29kZSBkZXNjcmliaW5nIHdoeSB0aGlzIEFMSUdOX0RPV04oKSBpcyBkb25lIHdvdWxkIGJl
DQo+IGhlbHBmdWwuDQoNCk9rIGkgd2lsbCBhZGQgYSBjb21tZW50IGFib3V0IHRoYXQuDQoNCg0K
Pg0KPiBJcyB0aGlzIHZhbHVlIHN1ZmZpY2llbnQgZm9yIGFsbCBib2FyZHM/DQoNCkkgc2ltcGx5
IHJldXNlIHRoZSBzYW1lIGFsaWdubWVudCBhbHJlYWR5IGFwcGxpZWQgZm9yIG90aGVyIG1lbW9y
eSBhcmVhIDoNCg0KwqDCoMKgIF8gc3RhcnRfYWRkcl9zcCBpbiByZXNlcnZlX3N0YWNrcygpDQoN
CsKgwqDCoCBfIG5ld19ibG9ibGlzdCBpbiByZXNlcnZlX2Jsb2JsaXN0KCkNCg0KDQpUaGFua3MN
Cg0KUGF0cmljZQ0KDQoNCj4NCj4gSSBmb3VuZCByZWZlcmVuY2VzIGZvcjoNCj4NCj4geDg2XzY0
IEFCSTogaHR0cHM6Ly9yZXZpZXdzLmxsdm0ub3JnL0QzMDA0OTogMTYgYnl0ZXMNCj4gQVJNdjg6
IEFSTXY4IEluc3RydWN0aW9uIFNldCBPdmVydmlldzogcXVhZCB3b3JkLCAxNiBieXRlcw0KPg0K
PiBCZXN0IHJlZ2FyZHMNCj4NCj4gSGVpbnJpY2gNCj4NCj4+PiDCoMKgwqDCoMKgIGdkLT5uZXdf
Ym9vdHN0YWdlID0gbWFwX3N5c21lbShnZC0+c3RhcnRfYWRkcl9zcCwgc2l6ZSk7DQo+Pj4gwqDC
oMKgwqDCoCBkZWJ1ZygiUmVzZXJ2aW5nICUjeCBCeXRlcyBmb3IgYm9vdHN0YWdlIGF0OiAlMDhs
eFxuIiwgc2l6ZSwNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdkLT5zdGFydF9hZGRyX3Nw
KTsNCj4+PiAtLSANCj4+PiAyLjE3LjENCj4+DQo+PiBUaGFua3MNCj4+DQo+PiBQYXRyaWNrDQo+
Pg0KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9v
dC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by91Ym9vdC1zdG0zMgo=

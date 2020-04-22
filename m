Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 570A61B39BB
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 10:13:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17DA5C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 08:13:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A5EAC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 08:13:14 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03M7xH7O020168; Wed, 22 Apr 2020 10:13:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=pPw5pAzxYQzbB1GlcHTGH7iLr7XsDYyiSF/HABLcFRc=;
 b=Vh3msVJR8YFzo0Ez7AsxSAQlBU+4GY3OfrjFJo2IoV4Dh9ZsHpnjMaYYbWJlaJHr13bq
 lQGeG36y8X1CLwrTz5PionbF0k1y3Gy6yCOQVbYNwTLsLyHamHS+TFEcFz2z4xCvpjIm
 mqyEe6UxZ7YPishAPKnji47P5MkvB7ExWyhWjWV70/b0E3RKqGNuWWINbxCdd8zc5VRb
 e2TgrssK4Wdyw5pC16P4u4II+eZVxAdFC4kBZdIqH5NfRWxHazC4LLj07AzXfqF6BgTM
 itbEzq6CTkFRgLjSNlrK4KZHNBnjh7SNYHi32QI4uPXIC1jCeBl59OheNGU41026xq39 vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fqawcymw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 10:13:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 280A910002A;
 Wed, 22 Apr 2020 10:13:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 19E7321E68A;
 Wed, 22 Apr 2020 10:13:12 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Apr
 2020 10:13:11 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 22 Apr 2020 10:13:11 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [PATCH v1 2/2] cmd: bind: allow to bind driver with driver data
Thread-Index: AQHWF+ZnkC8aR0kh4U603vGdAVt/wKiDtXkAgAD07IA=
Date: Wed, 22 Apr 2020 08:13:11 +0000
Message-ID: <7f7534e9-5351-c6de-8784-a62d284d6d0b@st.com>
References: <20200421140840.25729-1-patrice.chotard@st.com>
 <20200421140840.25729-3-patrice.chotard@st.com>
 <CAPnjgZ2h+xuUshDeUCtGQu81oHJ+poproR1B4oXiuS=yFzA-Yw@mail.gmail.com>
In-Reply-To: <CAPnjgZ2h+xuUshDeUCtGQu81oHJ+poproR1B4oXiuS=yFzA-Yw@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <0731348B9B0EC940AAA3445F54ECF687@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-22_02:2020-04-21,
 2020-04-22 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v1 2/2] cmd: bind: allow to bind driver
	with driver data
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

DQpPbiA0LzIxLzIwIDc6MzYgUE0sIFNpbW9uIEdsYXNzIHdyb3RlOg0KPiBIaSBQYXRyaWNlLA0K
Pg0KPiBPbiBUdWUsIDIxIEFwciAyMDIwIGF0IDA4OjA5LCBQYXRyaWNlIENob3RhcmQgPHBhdHJp
Y2UuY2hvdGFyZEBzdC5jb20+IHdyb3RlOg0KPj4gSW5pdGlhbCBpbXBsZW1lbnRhdGlvbiBpbnZv
a2VzIGRldmljZV9iaW5kX3dpdGhfZHJpdmVyX2RhdGEoKQ0KPj4gd2l0aCBkcml2ZXJfZGF0YSBw
YXJhbWV0ZXIgZXF1YWwgdG8gMC4NCj4+IEZvciBkcml2ZXIgd2l0aCBkcml2ZXIgZGF0YSwgdGhl
IGJpbmQgY29tbWFuZCBjYW4ndCBiaW5kDQo+PiBjb3JyZWN0bHkgdGhpcyBkcml2ZXIgb3IgZXZl
biB3b3JzZSBjYXVzZXMgZGF0YSBhYm9ydC4NCj4+DQo+PiBBZGQgZmluZF91ZGV2aWNlX2lkKCkg
dG8gcGFyc2UgdGhlIGRyaXZlcidzIG9mX21hdGNoIGxpc3QNCj4+IGFuZCByZXR1cm4gdGhlIGVu
dHJ5IGNvcnJlc3BvbmRpbmcgdG8gdGhlIGRyaXZlciBjb21wYXRpYmxlIHN0cmluZy4NCj4+IFRo
aXMgYWxsb3dzIHRvIGdldCBhY2Nlc3MgdG8gZHJpdmVyX2RhdGEgYW5kIHRvIHVzZSBpdCBhcw0K
Pj4gcGFyYW1ldGVycyBvZiBkZXZpY2VfYmluZF93aXRoX2RyaXZlcl9kYXRhKCkuDQo+Pg0KPj4g
U2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAc3QuY29tPg0K
Pj4gQ2M6IEplYW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNvbT4NCj4+DQo+PiAtLS0N
Cj4+DQo+PiAgY21kL2JpbmQuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+
PiAgMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+
IFRoZSB0aGluZyBJIGRvbid0IHF1aXRlIGdldCBoZXJlIGlzIHdoeSB0aGUgZHJpdmVyIG5hbWUg
bmVlZHMgdG8gYmUNCj4gc3BlY2lmaWVkLiBJZiB0aGUgZGV2aWNlIHRyZWUgbm9kZSBpcyBwcmVz
ZW50LCBhbmQgaXQgaGFzIGEgY29tcGF0aWJsZQ0KDQpTb3JyeSwgaSBkaWRuJ3QgZ2V0IHlvdXIg
cG9pbnQgd2hlbiB5b3Ugc2FpZCAid2h5IHRoZSBkcml2ZXIgbmFtZSBuZWVkcyB0byBiZSBzcGVj
aWZpZWQiDQoNCldoaWNoIHBhcnQgb2YgdGhpcyBwYXRjaCBkbyB5b3UgbWFkZSByZWZlcmVuY2Ug
dG8gPw0KDQo+IHN0cmluZywgY2FuJ3QgRE0gZmluZCB0aGUgZHJpdmVyIGFuZCBiaW5kIGEgZGV2
aWNlIGF1dG9tYXRpY2FsbHk/DQo+DQo+IEFsc28sIGlzIHRoZXJlIGFueSBkb2NzIGZvciB0aGlz
IGNvbW1hbmQ/IEl0IHdvdWxkIGJlIGdvb2QgdG8gYWRkIHRvDQoNCklzIHdoYXQgaW4gY21kL2Jp
bmQuYyBub3QgZW5vdWdoID8NCg0KDQpVX0JPT1RfQ01EKA0KwqDCoMKgIGJpbmQswqDCoMKgIDQs
wqDCoMKgIDAswqDCoMKgIGRvX2JpbmRfdW5iaW5kLA0KwqDCoMKgICJCaW5kIGEgZGV2aWNlIHRv
IGEgZHJpdmVyIiwNCsKgwqDCoCAiPG5vZGUgcGF0aD4gPGRyaXZlcj5cbiINCsKgwqDCoCAiYmlu
ZCA8Y2xhc3M+IDxpbmRleD4gPGRyaXZlcj5cbiINCik7DQoNClVfQk9PVF9DTUQoDQrCoMKgwqAg
dW5iaW5kLMKgwqDCoCA0LMKgwqDCoCAwLMKgwqDCoCBkb19iaW5kX3VuYmluZCwNCsKgwqDCoCAi
VW5iaW5kIGEgZGV2aWNlIGZyb20gYSBkcml2ZXIiLA0KwqDCoMKgICI8bm9kZSBwYXRoPlxuIg0K
wqDCoMKgICJ1bmJpbmQgPGNsYXNzPiA8aW5kZXg+XG4iDQrCoMKgwqAgInVuYmluZCA8Y2xhc3M+
IDxpbmRleD4gPGRyaXZlcj5cbiINCik7DQoNCg0KPiBkb2MvZHJpdmVyLW1vZGVsIGFuZCBhbHNv
IGFkZCBhIHNpbXBsZSB0ZXN0Lg0KDQpPayBpIHdpbGwgYWRkIGFuIGFkZGl0aW9ubmFsIHRlc3Qg
dG8gdGVzdC9weS90ZXN0cy90ZXN0X2JpbmQucHkNCg0KVGhhbmtzDQoNClBhdHJpY2UNCg0KPg0K
PiBSZWdhcmRzLA0KPiBTaW1vbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

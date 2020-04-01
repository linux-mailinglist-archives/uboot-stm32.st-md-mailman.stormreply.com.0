Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 673F419A62D
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 09:22:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DA58C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 07:22:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E6FAC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 07:22:29 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0317HFpc029467; Wed, 1 Apr 2020 09:22:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Ql40rePg5D6Kh++9+UKprSiXEieQu84tJUBugpDRZPo=;
 b=Gkjo2XC2tvRj+N5kMswAm/9w0fjGO9E8QYVbHcOyQuuMkBUf8QeqOTcYjRxAjGOo52+P
 yeMZpAhRnx+d2Jkm5ReP6gW+7hZf+6KXF92npBwDBiezVwrYsn3jnz3J5DA0A+WeUDqx
 XR5pYTM9vcKGjNHGVV/2C13F3iIfKfkBZsqWFT5oTQxSBLY9HkxBr2QNQU9pibBpT0or
 +0Ym4ZjPrzwZNAFbwwuI/ImHDaCfIlx2CBMlMP0UyrXAEPwFEC+yQ4QpFBpqKW1ljWrE
 k7gysZrvGivMtB8zF1N3QMKo/SD5VDz6z5Bgl9aNjq/iQaR4ulvTJwS33UPH6WKT8ZCH uA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301vkduty5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 09:22:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7628A100034;
 Wed,  1 Apr 2020 09:22:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A62F2123CC;
 Wed,  1 Apr 2020 09:22:25 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Apr
 2020 09:22:25 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 1 Apr 2020 09:22:25 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 03/16] arm: stm32mp: reset to default environment when
 serial# change
Thread-Index: AQHWB3YfFIzIKA5veU2rNWXf5FKVhahjvCAA
Date: Wed, 1 Apr 2020 07:22:24 +0000
Message-ID: <bf7a1bac-1f58-7928-e807-dbcfccd78198@st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.3.I8f6df6d28ce5b4b601ced711af3699d95e1576fb@changeid>
In-Reply-To: <20200331180330.3.I8f6df6d28ce5b4b601ced711af3699d95e1576fb@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <BC71961CFC82DE489D96E502A3DBF82A@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 03/16] arm: stm32mp: reset to default
 environment when serial# change
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

SGkgUGF0cmlja8KgwqDCoA0KDQpPbiAzLzMxLzIwIDY6MDQgUE0sIFBhdHJpY2sgRGVsYXVuYXkg
d3JvdGU6DQo+IFNlcmlhbCBudW1iZXIgaXMgZmlyc3QgY2hlY2tlZCBhbmQsIGluIGNhc2Ugb2Yg
bWlzbWF0Y2gsIGFsbA0KPiBlbnZpcm9ubWVudCB2YXJpYWJsZXMgYXJlIHJlc2V0IHRvIHRoZWly
IGRlZmF1bHQgdmFsdWUuDQo+DQo+IFRoaXMgcGF0Y2ggYWxsb3dzIHRvIGRldGVjdCB0aGF0IGVu
dmlyb25tZW50IGlzIHNhdmVkIGluIGEgcmVtb3ZhYmxlDQo+IGRldmljZSwgYXMgYSBTRCBjYXJk
LCBhbmQgcmV1c2VkIG9uIGEgb3RoZXIgYm9hcmQsIHBvdGVudGlhbGx5IHdpdGgNCj4gaW5jb21w
YXRpYmxlIHZhcmlhYmxlcy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8
cGF0cmljay5kZWxhdW5heUBzdC5jb20+DQo+IC0tLQ0KPg0KPiAgYXJjaC9hcm0vbWFjaC1zdG0z
Mm1wL2NwdS5jIHwgMjAgKysrKysrKysrKysrKysrLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
NSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm0vbWFjaC1zdG0zMm1wL2NwdS5jIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2NwdS5jDQo+IGlu
ZGV4IDlhYTU3OTQzMzQuLjM2NWMyYWE0ZjcgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtL21hY2gt
c3RtMzJtcC9jcHUuYw0KPiArKysgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvY3B1LmMNCj4gQEAg
LTUxMSw4ICs1MTEsOSBAQCBfX3dlYWsgaW50IHNldHVwX21hY19hZGRyZXNzKHZvaWQpDQo+ICAJ
CXJldHVybiAtRUlOVkFMOw0KPiAgCX0NCj4gIAlwcl9kZWJ1ZygiT1RQIE1BQyBhZGRyZXNzID0g
JXBNXG4iLCBlbmV0YWRkcik7DQo+IC0JcmV0ID0gIWV0aF9lbnZfc2V0X2VuZXRhZGRyKCJldGhh
ZGRyIiwgZW5ldGFkZHIpOw0KPiAtCWlmICghcmV0KQ0KPiArDQo+ICsJcmV0ID0gZXRoX2Vudl9z
ZXRfZW5ldGFkZHIoImV0aGFkZHIiLCBlbmV0YWRkcik7DQo+ICsJaWYgKHJldCkNCj4gIAkJcHJf
ZXJyKCJGYWlsZWQgdG8gc2V0IG1hYyBhZGRyZXNzICVwTSBmcm9tIE9UUDogJWRcbiIsDQo+ICAJ
CSAgICAgICBlbmV0YWRkciwgcmV0KTsNCj4gICNlbmRpZg0KPiBAQCAtNTIyLDEzICs1MjMsMTMg
QEAgX193ZWFrIGludCBzZXR1cF9tYWNfYWRkcmVzcyh2b2lkKQ0KPiAgDQo+ICBzdGF0aWMgaW50
IHNldHVwX3NlcmlhbF9udW1iZXIodm9pZCkNCj4gIHsNCj4gKwljaGFyICpzZXJpYWxfZW52Ow0K
PiAgCWNoYXIgc2VyaWFsX3N0cmluZ1syNV07DQo+ICAJdTMyIG90cFszXSA9IHswLCAwLCAwIH07
DQo+ICAJc3RydWN0IHVkZXZpY2UgKmRldjsNCj4gIAlpbnQgcmV0Ow0KPiAgDQo+IC0JaWYgKGVu
dl9nZXQoInNlcmlhbCMiKSkNCj4gLQkJcmV0dXJuIDA7DQo+ICsJc2VyaWFsX2VudiA9IGVudl9n
ZXQoInNlcmlhbCMiKTsNCj4gIA0KPiAgCXJldCA9IHVjbGFzc19nZXRfZGV2aWNlX2J5X2RyaXZl
cihVQ0xBU1NfTUlTQywNCj4gIAkJCQkJICBETV9HRVRfRFJJVkVSKHN0bTMybXBfYnNlYyksDQo+
IEBAIC01NDIsNiArNTQzLDE1IEBAIHN0YXRpYyBpbnQgc2V0dXBfc2VyaWFsX251bWJlcih2b2lk
KQ0KPiAgCQlyZXR1cm4gcmV0Ow0KPiAgDQo+ICAJc3ByaW50ZihzZXJpYWxfc3RyaW5nLCAiJTA4
WCUwOFglMDhYIiwgb3RwWzBdLCBvdHBbMV0sIG90cFsyXSk7DQo+ICsNCj4gKwlpZiAoc2VyaWFs
X2Vudikgew0KPiArCQlpZiAoIXN0cmNtcChzZXJpYWxfc3RyaW5nLCBzZXJpYWxfZW52KSkNCj4g
KwkJCXJldHVybiAwOw0KPiArCQkvKiBGb3IgaW52YWxpZCBlbnZpcm9tbmVudCAoc2VyaWFsIyBj
aGFuZ2UpLCByZXNldCB0byBkZWZhdWx0ICovDQo+ICsJCWVudl9zZXRfZGVmYXVsdCgic2VyaWFs
IG51bWJlciBtaXNtYXRjaCIsIDApOw0KPiArCX0NCj4gKw0KPiArCS8qIHNhdmUgc2VyaWFsIG51
bWJlciAqLw0KPiAgCWVudl9zZXQoInNlcmlhbCMiLCBzZXJpYWxfc3RyaW5nKTsNCj4gIA0KPiAg
CXJldHVybiAwOw0KPiBAQCAtNTQ5LDkgKzU1OSw5IEBAIHN0YXRpYyBpbnQgc2V0dXBfc2VyaWFs
X251bWJlcih2b2lkKQ0KPiAgDQo+ICBpbnQgYXJjaF9taXNjX2luaXQodm9pZCkNCj4gIHsNCj4g
KwlzZXR1cF9zZXJpYWxfbnVtYmVyKCk7DQo+ICAJc2V0dXBfYm9vdF9tb2RlKCk7DQo+ICAJc2V0
dXBfbWFjX2FkZHJlc3MoKTsNCj4gLQlzZXR1cF9zZXJpYWxfbnVtYmVyKCk7DQo+ICANCj4gIAly
ZXR1cm4gMDsNCj4gIH0NCg0KUmV2aWV3ZWQtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5j
aG90YXJkQHN0LmNvbT4NCg0KVGhhbmtzDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

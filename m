Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF67849AA2
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Jun 2019 09:32:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F893C94C18
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Jun 2019 07:32:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8968C94C17
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 07:32:14 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5I7QlaB001442; Tue, 18 Jun 2019 09:32:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=51GFlYe9y3ATZa20zMCmApdfFjhoLKRqzQbFyHLHoaI=;
 b=ELK02WaDjqqrsn3EQjf6exxjjbb5xv0fW/CX78lRVwMFL4LPw1EG75iFPgIx/WpzJMiM
 WOJ7I0vQ80vqNEQ66Ey30XgJTsQ5KxaRTf2dmaRtuN70Ye8FFPgNWXdsrnjm/Wkr3LWk
 Lab3pHmWAGXrC+OhOdtSyzYvAtMmLCU/6a5IJRWN7dvwSBoQ/JG6Kra9oZTnw6RRMX7M
 Iv9JFs/Wo8YwdHRyKB70xDnpAFWdme1lje+bhl98hiDy67sa7/Ju/IXB0umUK8B28IIC
 +jKR0CWSQ1dBgl3AlNERXi7S2eEt/iWX6oUlVA9wzJhbt8HotU82dBQJhvpvCoB5KamT QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t68n3myr5-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 18 Jun 2019 09:32:08 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AE27D4D;
 Tue, 18 Jun 2019 07:32:06 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6AE1C15C3;
 Tue, 18 Jun 2019 07:32:06 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 18 Jun
 2019 09:32:05 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 18 Jun 2019 09:32:05 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/2] usb: dwc2: correctly handle binding for
 g-tx-fifo-size
Thread-Index: AQHVIqGCAXdXZ24bvUmPX7KusNDYFqaf4vcAgAEk0ZA=
Date: Tue, 18 Jun 2019 07:32:05 +0000
Message-ID: <82d09e04026247b390ba89690bfdd719@SFHDAG6NODE3.st.com>
References: <1560510512-15015-1-git-send-email-patrick.delaunay@st.com>
 <7f9736b4-9be1-2b4f-b29b-5f612a092de9@denx.de>
In-Reply-To: <7f9736b4-9be1-2b4f-b29b-5f612a092de9@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-18_04:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>, Lukasz Majewski <lukma@denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] usb: dwc2: correctly handle binding
 for g-tx-fifo-size
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

SGkgTWFyZWssDQoNCj4gRnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+DQo+IFNlbnQ6
IGx1bmRpIDE3IGp1aW4gMjAxOSAxNzo1NA0KPiANCj4gT24gNi8xNC8xOSAxOjA4IFBNLCBQYXRy
aWNrIERlbGF1bmF5IHdyb3RlOg0KPiA+IE1hbmFnZSBnLXR4LWZpZm8tc2l6ZSBhcyBhIGFycmF5
IGFzIHNwZWNpZnkgaW4gdGhlIGJpbmRpbmcuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXRy
aWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4NCj4gPiAtLS0NCj4gPg0KPiA+
ICBhcmNoL2FybS9kdHMvc3RtMzJtcDE1N2MtZXYxLXUtYm9vdC5kdHNpIHwgIDQgLS0tLQ0KPiA+
ICBkcml2ZXJzL3VzYi9nYWRnZXQvZHdjMl91ZGNfb3RnLmMgICAgICAgIHwgMTcgKysrKysrKysr
KysrKysrKy0NCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1l
djEtdS1ib290LmR0c2kNCj4gPiBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1ldjEtdS1ib290
LmR0c2kNCj4gPiBpbmRleCA1YjE5ZTQ0Li45OTQwOTJhIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gv
YXJtL2R0cy9zdG0zMm1wMTU3Yy1ldjEtdS1ib290LmR0c2kNCj4gPiArKysgYi9hcmNoL2FybS9k
dHMvc3RtMzJtcDE1N2MtZXYxLXUtYm9vdC5kdHNpDQo+ID4gQEAgLTU2LDEwICs1Niw2IEBADQo+
ID4gIAl9Ow0KPiA+ICB9Ow0KPiA+DQo+ID4gLSZ1c2JvdGdfaHMgew0KPiA+IC0JZy10eC1maWZv
LXNpemUgPSA8NTc2PjsNCj4gDQo+IFNob3VsZCB0aGlzIHJlYWxseSBiZSBpbiB0aGlzIHBhdGNo
ID8NCg0KQXMgSSBjaGFuZ2UgdGhlIGJpbmRpbmcgcGFyc2luZywgdGhlIHN0bTMybXAxIHdpbGwg
ZG9uJ3Qgd29yayB3aXRob3V0IHRoaXMgcGF0Y2guDQpJIG1ha2UgYSBjb21tdW4gcGF0Y2ggb25s
eSB0byBhbGxvdyBiaXNlYywgYnV0IEkgY2FuIHNwbGl0IHRoZSBzZXJpZSB3aXRoIDIgcGF0Y2hl
cy4NCg0KPiANCj4gPiAtfTsNCj4gPiAtDQo+ID4gICZ2M3YzIHsNCj4gPiAgCXJlZ3VsYXRvci1h
bHdheXMtb247DQo+ID4gIH07DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC9k
d2MyX3VkY19vdGcuYw0KPiA+IGIvZHJpdmVycy91c2IvZ2FkZ2V0L2R3YzJfdWRjX290Zy5jDQo+
ID4gaW5kZXggNDk0YWI1My4uN2U2YjVmYyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3VzYi9n
YWRnZXQvZHdjMl91ZGNfb3RnLmMNCj4gPiArKysgYi9kcml2ZXJzL3VzYi9nYWRnZXQvZHdjMl91
ZGNfb3RnLmMNCj4gPiBAQCAtMTAzOSw2ICsxMDM5LDggQEAgc3RhdGljIGludCBkd2MyX3VkY19v
dGdfb2ZkYXRhX3RvX3BsYXRkYXRhKHN0cnVjdA0KPiB1ZGV2aWNlICpkZXYpDQo+ID4gIAlpbnQg
bm9kZSA9IGRldl9vZl9vZmZzZXQoZGV2KTsNCj4gPiAgCXVsb25nIGRydmRhdGE7DQo+ID4gIAl2
b2lkICgqc2V0X3BhcmFtcykoc3RydWN0IGR3YzJfcGxhdF9vdGdfZGF0YSAqZGF0YSk7DQo+ID4g
Kwl1MzIgdHhfZmlmb19zel9hcnJheVtEV0MyX01BWF9IV19FTkRQT0lOVFNdOw0KPiANCj4gQ2Fu
J3QgeW91IGp1c3QgcmVhZCBkaXJlY3RseSBpbnRvIHBsYXRkYXRhLT50eF9maWZvX3N6X2FycmF5
W10gYmVsb3csIGFuZCB0aHVzIGRyb3ANCj4gdGhpcyB0ZW1wb3JhcnkgdmFyaWFibGUgPw0KDQpJ
dCB3YXMgdGhlIGNhc2UgaW4gaW4gbXkgZmlyc3QgaW50ZXJuYWwgdmVyc2lvbi4NCg0KaWYgKHBs
YXRkYXRhLT50eF9maWZvX3N6X25iKSB7DQoJCXJldCA9IGRldl9yZWFkX3UzMl9hcnJheShkZXYs
ICJnLXR4LWZpZm8tc2l6ZSIsDQoJCQkJCSAmcGxhdGRhdGEtPnR4X2ZpZm9fc3pfYXJyYXksDQoJ
CQkJCSBwbGF0ZGF0YS0+dHhfZmlmb19zel9uYik7DQoJCWlmIChyZXQpDQoJCQlyZXR1cm4gcmV0
Ow0KCX0NCg0KQW5kIEkgYWRkIGl0IHRvIGF2b2lkIHRoZSB3YXJuaW5nIC8gcG90ZW50aWFsIGlz
c3VlOg0KDQovbG9jYWwvaG9tZS9mcnEwNzYzMi92aWV3cy91LWJvb3QvdS1ib290L2RyaXZlcnMv
dXNiL2dhZGdldC9kd2MyX3VkY19vdGcuYzoxMDYyOjc6IA0KCXdhcm5pbmc6IHBhc3NpbmcgYXJn
dW1lbnQgMyBvZiDigJhkZXZfcmVhZF91MzJfYXJyYXnigJkgZnJvbSBpbmNvbXBhdGlibGUgcG9p
bnRlciB0eXBlIFstV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQ0KICAgICAgICZwbGF0ZGF0
YS0+dHhfZmlmb19zel9hcnJheSwNCiAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4N
CkluIGZpbGUgaW5jbHVkZWQgZnJvbSAvbG9jYWwvaG9tZS9mcnEwNzYzMi92aWV3cy91LWJvb3Qv
dS1ib290L2luY2x1ZGUvZG0uaDoxMiwNCiAgICAgICAgICAgICBmcm9tIC9sb2NhbC9ob21lL2Zy
cTA3NjMyL3ZpZXdzL3UtYm9vdC91LWJvb3QvZHJpdmVycy91c2IvZ2FkZ2V0L2R3YzJfdWRjX290
Zy5jOjIyOg0KCS9sb2NhbC9ob21lL2ZycTA3NjMyL3ZpZXdzL3UtYm9vdC91LWJvb3QvaW5jbHVk
ZS9kbS9yZWFkLmg6NzEwOjE1OiBub3RlOiBleHBlY3RlZCDigJh1MzIgKuKAmSB7YWthIOKAmHVu
c2lnbmVkIGludCAq4oCZfSBidXQgYXJndW1lbnQgaXMgb2YgdHlwZSDigJh1bnNpZ25lZCBpbnQg
KCopWzE2XeKAmQ0KICAgICAgICAgIHUzMiAqb3V0X3ZhbHVlcywgc2l6ZV90IHN6KQ0KICAgICAg
ICAgIH5+fn5+Xn5+fn5+fn5+fg0KDQo+IGJ0dyBpcyB0aGlzIGZpeCBmb3IgY3VycmVudCByZWxl
YXNlIG9yIG5leHQgPw0KDQpJIGhvcGUgaXQgZm9yIHRoZSB2MjAxOS4wNyAoYXMgaXQgaXMgb25s
eSBpbXBhY3QgdGhlIHN0bTMybXAxIGFyY2gvYm9hcmQpLiANCkJ1dCBpdCBpcyBub3QgYmxvY2tp
bmcuDQoNCj4gDQo+ID4gKwlpbnQgcmV0LCBpOw0KPiA+DQo+ID4gIAlpZiAodXNiX2dldF9kcl9t
b2RlKG5vZGUpICE9IFVTQl9EUl9NT0RFX1BFUklQSEVSQUwpIHsNCj4gPiAgCQlkZXZfZGJnKGRl
diwgIkludmFsaWQgbW9kZVxuIik7DQo+ID4gQEAgLTEwNTAsNyArMTA1MiwyMCBAQCBzdGF0aWMg
aW50IGR3YzJfdWRjX290Z19vZmRhdGFfdG9fcGxhdGRhdGEoc3RydWN0DQo+IHVkZXZpY2UgKmRl
dikNCj4gPiAgCXBsYXRkYXRhLT5yeF9maWZvX3N6ID0gZGV2X3JlYWRfdTMyX2RlZmF1bHQoZGV2
LCAiZy1yeC1maWZvLXNpemUiLCAwKTsNCj4gPiAgCXBsYXRkYXRhLT5ucF90eF9maWZvX3N6ID0g
ZGV2X3JlYWRfdTMyX2RlZmF1bHQoZGV2LA0KPiA+ICAJCQkJCQkgICAgICAgImctbnAtdHgtZmlm
by1zaXplIiwgMCk7DQo+ID4gLQlwbGF0ZGF0YS0+dHhfZmlmb19zeiA9IGRldl9yZWFkX3UzMl9k
ZWZhdWx0KGRldiwgImctdHgtZmlmby1zaXplIiwgMCk7DQo+ID4gKw0KPiA+ICsJcGxhdGRhdGEt
PnR4X2ZpZm9fc3pfbmIgPQ0KPiA+ICsJCWRldl9yZWFkX3NpemUoZGV2LCAiZy10eC1maWZvLXNp
emUiKSAvIHNpemVvZih1MzIpOw0KPiA+ICsJaWYgKHBsYXRkYXRhLT50eF9maWZvX3N6X25iID4g
RFdDMl9NQVhfSFdfRU5EUE9JTlRTKQ0KPiA+ICsJCXBsYXRkYXRhLT50eF9maWZvX3N6X25iID0g
RFdDMl9NQVhfSFdfRU5EUE9JTlRTOw0KPiA+ICsJaWYgKHBsYXRkYXRhLT50eF9maWZvX3N6X25i
KSB7DQo+ID4gKwkJcmV0ID0gZGV2X3JlYWRfdTMyX2FycmF5KGRldiwgImctdHgtZmlmby1zaXpl
IiwNCj4gPiArCQkJCQkgdHhfZmlmb19zel9hcnJheSwNCj4gPiArCQkJCQkgcGxhdGRhdGEtPnR4
X2ZpZm9fc3pfbmIpOw0KPiA+ICsJCWlmIChyZXQpDQo+ID4gKwkJCXJldHVybiByZXQ7DQo+ID4g
KwkJZm9yIChpID0gMDsgaSA8IHBsYXRkYXRhLT50eF9maWZvX3N6X25iOyBpKyspDQo+ID4gKwkJ
CXBsYXRkYXRhLT50eF9maWZvX3N6X2FycmF5W2ldID0gdHhfZmlmb19zel9hcnJheVtpXTsNCj4g
PiArCX0NCj4gPg0KPiA+ICAJcGxhdGRhdGEtPmZvcmNlX2Jfc2Vzc2lvbl92YWxpZCA9DQo+ID4g
IAkJZGV2X3JlYWRfYm9vbChkZXYsICJ1LWJvb3QsZm9yY2UtYi1zZXNzaW9uLXZhbGlkIik7DQo+
ID4NCj4gDQo+IA0KPiAtLQ0KPiBCZXN0IHJlZ2FyZHMsDQo+IE1hcmVrIFZhc3V0DQoNClJlZ2Fy
ZHMNCg0KUGF0cmljaw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK

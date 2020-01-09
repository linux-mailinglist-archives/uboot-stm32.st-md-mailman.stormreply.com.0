Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFF0135451
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jan 2020 09:30:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCE29C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jan 2020 08:30:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E8CAC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2020 08:29:58 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0098Trqn031882; Thu, 9 Jan 2020 09:29:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=BQA4j3m0Io+5RIXSIcfhsGoSjZpHJW3KWDse4pDI7Fg=;
 b=g1JE5KNBWHXKAP9ASOZkfv9IVa4LlRY42XJb6n0OT980IKTO30O0QVRzodGSHzb90Pt3
 d4XY+MzHzFLN/V7t7UrTwyxJbjdpnsqV0YyvLBv0S4SJdTCismZrwf+LB8xiNO8Cl/rV
 WGBDbGqC/dob85euDumXWq8+SLTaReaG97HbxEligNpMl/IHaDLl+QUTme5qJc0tJiAC
 ZflOHIBE7V8AEoqP9QMUSrC5HQkxo28HWkSMnXdFazVU9fDA8VCuVKBMkKOF922Fqe24
 uISKiLx+Wunow1dQXov2Tmm67t6PofR/QGClZ48M94eAtV2sEsx19DwaxDAugEFE2T6X /w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xakur0agq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2020 09:29:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7F81310002A;
 Thu,  9 Jan 2020 09:29:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7536622119A;
 Thu,  9 Jan 2020 09:29:55 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Jan
 2020 09:29:55 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 9 Jan 2020 09:29:55 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [PATCH v2 02/14] dm: core: add ofnode and dev function to
 iterate on node property
Thread-Index: AQHVpDZhjCIGo9iUDEK3ioPfZ+bRdafSBaKAgBA6d/A=
Date: Thu, 9 Jan 2020 08:29:55 +0000
Message-ID: <a93e22c503ac45d99be61342198d608d@SFHDAG6NODE3.st.com>
References: <20191126084911.19761-1-patrick.delaunay@st.com>
 <20191126084911.19761-3-patrick.delaunay@st.com>
 <CAPnjgZ1YrAf5VQTTsXge6SLhU=hNV9SwZoa=nyeVozQ8PHzW-A@mail.gmail.com>
In-Reply-To: <CAPnjgZ1YrAf5VQTTsXge6SLhU=hNV9SwZoa=nyeVozQ8PHzW-A@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-09_01:2020-01-08,
 2020-01-09 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 02/14] dm: core: add ofnode and dev
 function to iterate on node property
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

SGksDQoNCj4gRnJvbTogU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+DQo+IFNlbnQ6IGx1
bmRpIDMwIGTDqWNlbWJyZSAyMDE5IDAyOjIxDQo+IA0KPiBPbiBUdWUsIDI2IE5vdiAyMDE5IGF0
IDAxOjQ5LCBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4NCj4gd3Jv
dGU6DQo+ID4NCj4gPiBBZGQgZnVuY3Rpb25zIHRvIGl0ZXJhdGUgb24gYWxsIHByb3BlcnR5IHdp
dGggbGl2ZXRyZWUNCj4gPiAtIGRldl9yZWFkX2ZpcnN0X3Byb3ANCj4gPiAtIGRldl9yZWFkX25l
eHRfcHJvcA0KPiA+IC0gZGV2X3JlYWRfcHJvcF9ieV9wcm9wDQo+ID4gYW5kDQo+ID4gLSBvZm5v
ZGVfZ2V0X2ZpcnN0X3Byb3BlcnR5DQo+ID4gLSBvZm5vZGVfZ2V0X25leHRfcHJvcGVydHkNCj4g
PiAtIG9mbm9kZV9nZXRfcHJvcGVydHlfYnlfcHJvcA0KPiA+DQo+ID4gRm9yIGV4YW1wbGU6DQo+
ID4gc3RydWN0IG9mcHJvcCBwcm9wZXJ0eTsNCj4gPg0KPiA+IGRldl9mb3JfZWFjaF9wcm9wZXJ0
eShwcm9wZXJ0eSwgY29uZmlnKSB7DQo+ID4gICAgICAgICB2YWx1ZSA9IGRldl9yZWFkX3Byb3Bf
YnlfcHJvcCgmcHJvcGVydHksICZwcm9wbmFtZSwgJmxlbik7DQo+ID4NCj4gPiBvcjoNCj4gPiBm
b3IgKHByb3AgPSBvZm5vZGVfZ2V0X2ZpcnN0X3Byb3BlcnR5KGRldl9vZm5vZGUoZGV2KSk7DQo+
ID4gICAgICBwcm9wOw0KPiA+ICAgICAgcHJvcCA9IG9mbm9kZV9nZXRfbmV4dF9wcm9wZXJ0eShk
ZXZfb2Zub2RlKGRldikscHJvcCkpDQo+ID4gew0KPiA+ICAgICAgdmFsdWUgPSBvZm5vZGVfZ2V0
X3Byb3BlcnR5X2J5X3Byb3AoZGV2X29mbm9kZShkZXYpLCBwcm9wLA0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnByb3BuYW1lLCAmbGVuKTsgLi4uLg0KPiA+
IH0NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVs
YXVuYXlAc3QuY29tPg0KPiA+IC0tLQ0KPiA+DQo+ID4gQ2hhbmdlcyBpbiB2MjoNCj4gPiAtIElk
ZW50aWZ5IHByb3BlcnR5IHdpdGggYSBuZXcgc3RydWN0IG9mcHJvcCBhcyBwcm9wb3NlZA0KPiA+
ICAgYnkgU2ltb24gR2xhc3MNCj4gPiAtIEFkZCBkZXZfIGl0ZXJhdGUgZnVuY3Rpb25zDQo+ID4N
Cj4gPiAgZHJpdmVycy9jb3JlL29mX2FjY2Vzcy5jIHwgMzIgKysrKysrKysrKysrKysrKysrKw0K
PiA+ICBkcml2ZXJzL2NvcmUvb2Zub2RlLmMgICAgfCA0OCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQo+ID4gIGRyaXZlcnMvY29yZS9yZWFkLmMgICAgICB8IDE2ICsrKysrKysrKysNCj4g
PiAgaW5jbHVkZS9kbS9vZl9hY2Nlc3MuaCAgIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKysr
DQo+ID4gIGluY2x1ZGUvZG0vb2Zub2RlLmggICAgICB8IDYzICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0NCj4gPiAgaW5jbHVkZS9kbS9yZWFkLmggICAgICAgIHwgNjcNCj4g
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICA2IGZpbGVzIGNo
YW5nZWQsIDI2NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBUaGVzZSBsb29r
IGdvb2QsIGJ1dCBwbGVhc2UgYWRkIGEgZmV3IHNpbXBsZSB0ZXN0cyBsaWtlIGluIHlvdXIgY29t
bWl0IG1lc3NhZ2UuDQo+IA0KPiBTZWUgdGVzdC9kbS9vZm5vZGUuYywgb3IgeW91IGNvdWxkIGFk
ZCB0ZXN0L2RtL3JlYWQuYyBhbmQganVzdCB1c2UgdGhlIHJlYWQNCj4gaW50ZXJmYWNlIHdoaWNo
IHdvdWxkIGJlIGdvb2QgZW5vdWdoIEl0IHRoaW5rLCBzaW5jZSB0ZXN0cyBydW4gd2l0aCBhbmQg
d2l0aG91dA0KPiBsaXZldHJlZS4NCg0KT2sgSSB3aWxsIGFkZCAgaXQuDQoNClJlZ2FyZHMNClBh
dHJpY2sNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B490190896
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 10:11:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0377C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 09:11:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65249C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 09:11:46 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02O98njD001764; Tue, 24 Mar 2020 10:11:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=nh5IyJJwRE9yzPgRGep5jsvR0ZE1TNaZo+wx6Dr1RaA=;
 b=dq20Hbz14Isbk4RC9GZWVNg7jtsywJJuZme+CKArc4/GiO87ZJfMT+LRbWCrleuWN6Xv
 fxTgNdG6kJcsvzomxUbmHJyDji9Fgx76JtdO5QJLwNfwvB32zDe561UGBFFJ13Ob3toz
 4bbl+XP1Xneia5+sxM2bou3rFUCUCOnQ4ul0M5w6hMhrT5NCrNiplGvYItHTaH/PKlb3
 SsH/0md9xfglLsstbxP2wm1Cj91jWbD0bSzPjdskbnwqC9TPNZS3ZY/OJyAJ9iluoGFc
 EPBtFsxlurYIPbbgM0OT3SlfEYs7i+vpbxdrHHaLjz3e7eHEY8BXTYAtz3DhMdh64w4W nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw9jyxgr7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 10:11:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1B3E210002A;
 Tue, 24 Mar 2020 10:11:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CFE81220F70;
 Tue, 24 Mar 2020 10:11:42 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Mar
 2020 10:11:42 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 24 Mar 2020 10:11:42 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH v2] board: stm32mp1: add finished good in
 board identifier OTP
Thread-Index: AQHWAbw7ivYGVE1TlU2dIkarK/RYdw==
Date: Tue, 24 Mar 2020 09:11:42 +0000
Message-ID: <6ff586e8-97e0-0b15-5341-455c82def1a6@st.com>
References: <20200324080500.5116-1-patrick.delaunay@st.com>
In-Reply-To: <20200324080500.5116-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <5EAEF09420D10E48848A89A39520563E@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_02:2020-03-23,
 2020-03-24 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2] board: stm32mp1: add finished good in
 board identifier OTP
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

SGkgUGF0cmljaw0KDQpPbiAzLzI0LzIwIDk6MDUgQU0sIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6
DQo+IFVwZGF0ZSB0aGUgY29tbWFuZCBzdGJvYXJkIHRvIHN1cHBvcnQgdGhlIHVwZGF0ZWQgY29k
aW5nIG9mIE9UUCA1OSB3aXRoDQo+IGZpbmlzaGVkIGdvb2QuDQo+DQo+IFRoZSBTVCBwcm9kdWN0
IGNvZGlmaWNhdGlvbiBoYXZlIHNldmVyYWwgZWxlbWVudA0KPiAtICJDb21tZXJjaWFsIFByb2R1
Y3QgTmFtZSIgKENQTik6IHR5cGUgb2YgcHJvZHVjdCBib2FyZCAoREtYLCBFVlgpDQo+ICAgYXNz
b2NpYXRlZCB0byB0aGUgYm9hcmQgSUQgIk1CeHh4eCINCj4gLSAiRmluaXNoZWQgR29vZCIgb3Ig
IkZpbmlzaCBHb29kIiAoRkcpOg0KPiAgIGVmZmVjdGl2ZSBjb250ZW50IG9mIHRoZSBwcm9kdWN0
IHdpdGhvdXQgY2hpcCBTVE0zMk1QMSAoTENELCBXaWZpLCDigKYpDQo+IC0gQk9NOiBjb3N0IHZh
cmlhbnQgZm9yIHNhbWUgRkcNCj4gICAoZm9yIGV4YW1wbGUsIHNldmVyYWwgcHJvdmlkZXIgb2Yg
dGhlIHNhbWUgY29tcG9uZW50KQ0KPg0KPiBGb3IgZXhhbXBsZQ0KPiAtIGNvbW1lcmNpYWwgcHJv
ZHVjdCA9IFNUTTMyTVAxNTdDLUVWMQ0KPiAtIEZpbmlzaGVkIEdvb2QgPSBFVkEzMk1QMTU3QTEk
QVUxDQo+DQo+IEJvb3RoIGluZm9ybWF0aW9uIGFyZSB3cml0dGVuIG9uIGJvYXJkIGFuZCB0aGlz
IGluZm9ybWF0aW9uIGlzIGFsc28gc2F2ZWQNCj4gaW4gT1RQNTk6DQoNCnMvQm9vdGgvQm90aA0K
DQpzL3RoaXMgaW5mb3JtYXRpb24gaXMvdGhlc2UgaW5mb3JtYXRpb24gYXJlDQoNCg0KPg0KPiBi
aXQgWzMxOjE2XSAoaGV4KSA9PiBCb2FyZCBpZCwgTUJ4eHh4DQo+IGJpdCBbMTU6MTJdIChkZWMp
ID0+IFZhcmlhbnQgQ1BOICgxLi4uLjE1KQ0KPiBiaXQgWzExOjhdICAoZGVjKSA9PiBSZXZpc2lv
biBib2FyZCAoaW5kZXggd2l0aCBBID0gMSwgWiA9IDI2KQ0KPiBiaXQgWzc6NF0gICAoZGVjKSA9
PiBWYXJpYW50IEZHIDogZmluaXNoZWQgZ29vZCAoTkVXKQ0KPiBiaXQgWzM6MF0gICAoZGVjKSA9
PiBCT00gKDAxLCAuLi4uIDI1NSkNCj4NCj4gVGhlIHVwZGF0ZWQgY29tbWFuZCBpczoNCj4gICBz
dGJvYXJkIFsteV0gPEJvYXJkPiA8VmFyQ1BOPiA8UmV2aXNpb24+IDxWYXJGRz4gPEJPTT4NCj4N
Cj4gQW5kIHRoZSBkaXNwbGF5ZWQgU1RNaWNyb2VsZWN0cm9uaWNzIGJvYXJkIGlkZW50aWZpY2F0
aW9uIGlzOg0KPiAgIEJvYXJkOiBNQjxCb2FyZD4gVmFyPFZhckNQTj4uPFZhckZHPiBSZXYuPFJl
dmlzaW9uPi08Qk9NPg0KPg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxw
YXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4NCj4gLS0tDQo+DQo+IENoYW5nZXMgaW4gdjI6DQo+IC0g
dXBkYXRlIGNvbW1pdCBtZXNzYWdlDQo+IC0gYWRkIGNvbW1lbnRzIGluIGNtZF9zdGJvYXJkLmMN
Cj4NCj4gIGJvYXJkL3N0L2NvbW1vbi9jbWRfc3Rib2FyZC5jIHwgNjAgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0NCj4gIGJvYXJkL3N0L3N0bTMybXAxL3N0bTMybXAxLmMgIHwg
IDQgKystDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9u
cygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvYm9hcmQvc3QvY29tbW9uL2NtZF9zdGJvYXJkLmMgYi9i
b2FyZC9zdC9jb21tb24vY21kX3N0Ym9hcmQuYw0KPiBpbmRleCAxNTczZTM1NDEwLi43OGY5OWRh
ZWFkIDEwMDY0NA0KPiAtLS0gYS9ib2FyZC9zdC9jb21tb24vY21kX3N0Ym9hcmQuYw0KPiArKysg
Yi9ib2FyZC9zdC9jb21tb24vY21kX3N0Ym9hcmQuYw0KPiBAQCAtMSw2ICsxLDMyIEBADQo+ICAv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsgT1IgQlNELTMtQ2xhdXNlDQo+ICAv
Kg0KPiAgICogQ29weXJpZ2h0IChDKSAyMDE5LCBTVE1pY3JvZWxlY3Ryb25pY3MgLSBBbGwgUmln
aHRzIFJlc2VydmVkDQo+ICsgKg0KPiArICogdGhlIHN0IGNvbW1hbmQgc3Rib2FyZCBzdXBwb3J0
cyB0aGUgU1RNaWNyb2VsZWN0cm9uaWNzIGJvYXJkIGlkZW50aWZpY2F0aW9uDQo+ICsgKiBzYXZl
ZCBpbiBPVFAgNTkuDQo+ICsgKg0KPiArICogVGhlIFNUIHByb2R1Y3QgY29kaWZpY2F0aW9uIGhh
dmUgc2V2ZXJhbCBlbGVtZW50DQo+ICsgKiAtICJDb21tZXJjaWFsIFByb2R1Y3QgTmFtZSIgKENQ
Tik6IHR5cGUgb2YgcHJvZHVjdCBib2FyZCAoREtYLCBFVlgpDQo+ICsgKiAgIGFzc29jaWF0ZWQg
dG8gdGhlIGJvYXJkIElEICJNQnh4eHgiDQo+ICsgKiAtICJGaW5pc2hlZCBHb29kIiBvciAiRmlu
aXNoIEdvb2QiIChGRyk6DQo+ICsgKiAgIGVmZmVjdGl2ZSBjb250ZW50IG9mIHRoZSBwcm9kdWN0
IHdpdGhvdXQgY2hpcCBTVE0zMk1QMXh4IChMQ0QsIFdpZmks4oCmKQ0KPiArICogLSBCT006IGNv
c3QgdmFyaWFudCBmb3Igc2FtZSBGRyAoZm9yIGV4YW1wbGUsIHNldmVyYWwgcHJvdmlkZXIgb2Yg
dGhlIHNhbWUNCj4gKyAqICAgY29tcG9uZW50KQ0KPiArICoNCj4gKyAqIEZvciBleGFtcGxlDQo+
ICsgKiAtIGNvbW1lcmNpYWwgcHJvZHVjdCA9IFNUTTMyTVAxNTdDLUVWMSBmb3IgYm9hcmQgTUIx
MjYzDQo+ICsgKiAtIEZpbmlzaGVkIEdvb2QgPSBFVkEzMk1QMTU3QTEkQVUxDQo+ICsgKg0KPiAr
ICogQm9vdGggaW5mb3JtYXRpb24gYXJlIHdyaXR0ZW4gb24gYm9hcmQgYW5kIHRoaXMgaW5mb3Jt
YXRpb24gaXMgYWxzbyBzYXZlZA0KPiArICogaW4gT1RQNTksIHdpdGg6DQo+ICsgKiBiaXQgWzMx
OjE2XSAoaGV4KSA9PiBCb2FyZCBpZCwgTUJ4eHh4DQo+ICsgKiBiaXQgWzE1OjEyXSAoZGVjKSA9
PiBWYXJpYW50IENQTiAoMS4uLi4xNSkNCj4gKyAqIGJpdCBbMTE6OF0gIChkZWMpID0+IFJldmlz
aW9uIGJvYXJkIChpbmRleCB3aXRoIEEgPSAxLCBaID0gMjYpDQo+ICsgKiBiaXQgWzc6NF0gICAo
ZGVjKSA9PiBWYXJpYW50IEZHIDogZmluaXNoZWQgZ29vZCBpbmRleA0KPiArICogYml0IFszOjBd
ICAgKGRlYykgPT4gQk9NICgwMSwgLi4uLiAyNTUpDQo+ICsgKg0KPiArICogYW5kIGRpc3BsYXll
ZCB3aXRoIHRoZSBmb3JtYXQ6DQo+ICsgKiAgIEJvYXJkOiBNQjxCb2FyZD4gVmFyPFZhckNQTj4u
PFZhckZHPiBSZXYuPFJldmlzaW9uPi08Qk9NPg0KPiAgICovDQo+ICANCj4gICNpZm5kZWYgQ09O
RklHX1NQTF9CVUlMRA0KPiBAQCAtMTMsNiArMzksNyBAQA0KPiAgc3RhdGljIGJvb2wgY2hlY2tf
c3Rib2FyZCh1MTYgYm9hcmQpDQo+ICB7DQo+ICAJdW5zaWduZWQgaW50IGk7DQo+ICsJLyogbGlz
dCBvZiBzdXBwb3J0ZWQgU1QgYm9hcmRzICovDQo+ICAJY29uc3QgdTE2IHN0X2JvYXJkX2lkW10g
PSB7DQo+ICAJCTB4MTI3MiwNCj4gIAkJMHgxMjYzLA0KPiBAQCAtMzEsOSArNTgsMTEgQEAgc3Rh
dGljIGJvb2wgY2hlY2tfc3Rib2FyZCh1MTYgYm9hcmQpDQo+ICANCj4gIHN0YXRpYyB2b2lkIGRp
c3BsYXlfc3Rib2FyZCh1MzIgb3RwKQ0KPiAgew0KPiAtCXByaW50ZigiQm9hcmQ6IE1CJTA0eCBW
YXIlZCBSZXYuJWMtJTAyZFxuIiwNCj4gKwkvKiBkaXNwbGF5IGJvYXJkIGluZGVudGlmaWNhdGlv
biB3aXRoIE9QVCBjb2RpbmcgKi8NCj4gKwlwcmludGYoIkJvYXJkOiBNQiUwNHggVmFyJWQuJWQg
UmV2LiVjLSUwMmRcbiIsDQo+ICAJICAgICAgIG90cCA+PiAxNiwNCj4gIAkgICAgICAgKG90cCA+
PiAxMikgJiAweEYsDQo+ICsJICAgICAgIChvdHAgPj4gNCkgJiAweEYsDQo+ICAJICAgICAgICgo
b3RwID4+IDgpICYgMHhGKSAtIDEgKyAnQScsDQo+ICAJICAgICAgIG90cCAmIDB4Rik7DQo+ICB9
DQo+IEBAIC00NCwxNCArNzMsMTQgQEAgc3RhdGljIGludCBkb19zdGJvYXJkKGNtZF90YmxfdCAq
Y21kdHAsIGludCBmbGFnLCBpbnQgYXJnYywNCj4gIAlpbnQgcmV0Ow0KPiAgCXUzMiBvdHAsIGxv
Y2s7DQo+ICAJdTggcmV2aXNpb247DQo+IC0JdW5zaWduZWQgbG9uZyBib2FyZCwgdmFyaWFudCwg
Ym9tOw0KPiArCXVuc2lnbmVkIGxvbmcgYm9hcmQsIHZhcl9jcG4sIHZhcl9mZywgYm9tOw0KPiAg
CXN0cnVjdCB1ZGV2aWNlICpkZXY7DQo+IC0JaW50IGNvbmZpcm1lZCA9IGFyZ2MgPT0gNiAmJiAh
c3RyY21wKGFyZ3ZbMV0sICIteSIpOw0KPiArCWludCBjb25maXJtZWQgPSBhcmdjID09IDcgJiYg
IXN0cmNtcChhcmd2WzFdLCAiLXkiKTsNCj4gIA0KPiAgCWFyZ2MgLT0gMSArIGNvbmZpcm1lZDsN
Cj4gIAlhcmd2ICs9IDEgKyBjb25maXJtZWQ7DQo+ICANCj4gLQlpZiAoYXJnYyAhPSAwICYmIGFy
Z2MgIT0gNCkNCj4gKwlpZiAoYXJnYyAhPSAwICYmIGFyZ2MgIT0gNSkNCj4gIAkJcmV0dXJuIENN
RF9SRVRfVVNBR0U7DQo+ICANCj4gIAlyZXQgPSB1Y2xhc3NfZ2V0X2RldmljZV9ieV9kcml2ZXIo
VUNMQVNTX01JU0MsDQo+IEBAIC05NSw4ICsxMjQsOCBAQCBzdGF0aWMgaW50IGRvX3N0Ym9hcmQo
Y21kX3RibF90ICpjbWR0cCwgaW50IGZsYWcsIGludCBhcmdjLA0KPiAgCQlyZXR1cm4gQ01EX1JF
VF9VU0FHRTsNCj4gIAl9DQo+ICANCj4gLQlpZiAoc3RyaWN0X3N0cnRvdWwoYXJndlsxXSwgMTAs
ICZ2YXJpYW50KSA8IDAgfHwNCj4gLQkgICAgdmFyaWFudCA9PSAwIHx8IHZhcmlhbnQgPiAxNSkg
ew0KPiArCWlmIChzdHJpY3Rfc3RydG91bChhcmd2WzFdLCAxMCwgJnZhcl9jcG4pIDwgMCB8fA0K
PiArCSAgICB2YXJfY3BuID09IDAgfHwgdmFyX2NwbiA+IDE1KSB7DQo+ICAJCXByaW50ZigiYXJn
dW1lbnQgJWQgaW52YWxpZDogJXNcbiIsIDIsIGFyZ3ZbMV0pOw0KPiAgCQlyZXR1cm4gQ01EX1JF
VF9VU0FHRTsNCj4gIAl9DQo+IEBAIC0xMDcsMTMgKzEzNiwyMSBAQCBzdGF0aWMgaW50IGRvX3N0
Ym9hcmQoY21kX3RibF90ICpjbWR0cCwgaW50IGZsYWcsIGludCBhcmdjLA0KPiAgCQlyZXR1cm4g
Q01EX1JFVF9VU0FHRTsNCj4gIAl9DQo+ICANCj4gLQlpZiAoc3RyaWN0X3N0cnRvdWwoYXJndlsz
XSwgMTAsICZib20pIDwgMCB8fA0KPiArCWlmIChzdHJpY3Rfc3RydG91bChhcmd2WzNdLCAxMCwg
JnZhcl9mZykgPCAwIHx8DQo+ICsJICAgIHZhcl9mZyA+IDE1KSB7DQo+ICsJCXByaW50ZigiYXJn
dW1lbnQgJWQgaW52YWxpZDogJXNcbiIsIDQsIGFyZ3ZbM10pOw0KPiArCQlyZXR1cm4gQ01EX1JF
VF9VU0FHRTsNCj4gKwl9DQo+ICsNCj4gKwlpZiAoc3RyaWN0X3N0cnRvdWwoYXJndls0XSwgMTAs
ICZib20pIDwgMCB8fA0KPiAgCSAgICBib20gPT0gMCB8fCBib20gPiAxNSkgew0KPiAgCQlwcmlu
dGYoImFyZ3VtZW50ICVkIGludmFsaWQ6ICVzXG4iLCA0LCBhcmd2WzNdKTsNCj4gIAkJcmV0dXJu
IENNRF9SRVRfVVNBR0U7DQo+ICAJfQ0KPiAgDQo+IC0Jb3RwID0gKGJvYXJkIDw8IDE2KSB8ICh2
YXJpYW50IDw8IDEyKSB8IChyZXZpc2lvbiA8PCA4KSB8IGJvbTsNCj4gKwkvKiBzdCBib2FyZCBp
bmRlbnRpZmljYXRpb24gdmFsdWUgKi8NCj4gKwlvdHAgPSAoYm9hcmQgPDwgMTYpIHwgKHZhcl9j
cG4gPDwgMTIpIHwgKHJldmlzaW9uIDw8IDgpIHwNCj4gKwkgICAgICAodmFyX2ZnIDw8IDQpIHwg
Ym9tOw0KPiAgCWRpc3BsYXlfc3Rib2FyZChvdHApOw0KPiAgCXByaW50ZigiPT4gT1RQWyVkXSA9
ICUwOFhcbiIsIEJTRUNfT1RQX0JPQVJELCBvdHApOw0KPiAgDQo+IEBAIC0xNTMsMTUgKzE5MCwx
NiBAQCBzdGF0aWMgaW50IGRvX3N0Ym9hcmQoY21kX3RibF90ICpjbWR0cCwgaW50IGZsYWcsIGlu
dCBhcmdjLA0KPiAgCXJldHVybiBDTURfUkVUX1NVQ0NFU1M7DQo+ICB9DQo+ICANCj4gLVVfQk9P
VF9DTUQoc3Rib2FyZCwgNiwgMCwgZG9fc3Rib2FyZCwNCj4gK1VfQk9PVF9DTUQoc3Rib2FyZCwg
NywgMCwgZG9fc3Rib2FyZCwNCj4gIAkgICAicmVhZC93cml0ZSBib2FyZCByZWZlcmVuY2UgaW4g
T1RQIiwNCj4gIAkgICAiXG4iDQo+ICAJICAgIiAgUHJpbnQgY3VycmVudCBib2FyZCBpbmZvcm1h
dGlvblxuIg0KPiAtCSAgICJzdGJvYXJkIFsteV0gPEJvYXJkPiA8VmFyaWFudD4gPFJldmlzaW9u
PiA8Qk9NPlxuIg0KPiArCSAgICJzdGJvYXJkIFsteV0gPEJvYXJkPiA8VmFyQ1BOPiA8UmV2aXNp
b24+IDxWYXJGRz4gPEJPTT5cbiINCj4gIAkgICAiICBXcml0ZSBib2FyZCBpbmZvcm1hdGlvblxu
Ig0KPiAgCSAgICIgIC0gQm9hcmQ6IHh4eHgsIGV4YW1wbGUgMTI2NCBmb3IgTUIxMjY0XG4iDQo+
IC0JICAgIiAgLSBWYXJpYW50OiAxIC4uLiAxNVxuIg0KPiArCSAgICIgIC0gVmFyQ1BOOiAxLi4u
MTVcbiINCj4gIAkgICAiICAtIFJldmlzaW9uOiBBLi4uT1xuIg0KPiArCSAgICIgIC0gVmFyRkc6
IDAuLi4xNVxuIg0KPiAgCSAgICIgIC0gQk9NOiAxLi4uMTVcbiIpOw0KPiAgDQo+ICAjZW5kaWYN
Cj4gZGlmZiAtLWdpdCBhL2JvYXJkL3N0L3N0bTMybXAxL3N0bTMybXAxLmMgYi9ib2FyZC9zdC9z
dG0zMm1wMS9zdG0zMm1wMS5jDQo+IGluZGV4IGMzNmU3NjU1YzAuLmY4NzUxMTAwNzYgMTAwNjQ0
DQo+IC0tLSBhL2JvYXJkL3N0L3N0bTMybXAxL3N0bTMybXAxLmMNCj4gKysrIGIvYm9hcmQvc3Qv
c3RtMzJtcDEvc3RtMzJtcDEuYw0KPiBAQCAtMTA4LDEzICsxMDgsMTUgQEAgaW50IGNoZWNrYm9h
cmQodm9pZCkNCj4gIAkJCQkJICBETV9HRVRfRFJJVkVSKHN0bTMybXBfYnNlYyksDQo+ICAJCQkJ
CSAgJmRldik7DQo+ICANCj4gKwkvKiBkaXNwbGF5IHRoZSBTVE1pY3JvZWxlY3Ryb25pY3MgYm9h
cmQgaWRlbnRpZmljYXRpb24gKi8NCj4gIAlpZiAoIXJldCkNCj4gIAkJcmV0ID0gbWlzY19yZWFk
KGRldiwgU1RNMzJfQlNFQ19TSEFET1coQlNFQ19PVFBfQk9BUkQpLA0KPiAgCQkJCSZvdHAsIHNp
emVvZihvdHApKTsNCj4gIAlpZiAocmV0ID4gMCAmJiBvdHApIHsNCj4gLQkJcHJpbnRmKCJCb2Fy
ZDogTUIlMDR4IFZhciVkIFJldi4lYy0lMDJkXG4iLA0KPiArCQlwcmludGYoIkJvYXJkOiBNQiUw
NHggVmFyJWQuJWQgUmV2LiVjLSUwMmRcbiIsDQo+ICAJCSAgICAgICBvdHAgPj4gMTYsDQo+ICAJ
CSAgICAgICAob3RwID4+IDEyKSAmIDB4RiwNCj4gKwkJICAgICAgIChvdHAgPj4gNCkgJiAweEYs
DQo+ICAJCSAgICAgICAoKG90cCA+PiA4KSAmIDB4RikgLSAxICsgJ0EnLA0KPiAgCQkgICAgICAg
b3RwICYgMHhGKTsNCj4gIAl9DQoNClJldmlld2VkLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJp
Y2UuY2hvdGFyZEBzdC5jb20+DQoNClRoYW5rcw0KDQpQYXRyaWNlDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QK
VWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

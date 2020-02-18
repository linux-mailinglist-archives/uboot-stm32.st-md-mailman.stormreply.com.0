Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B04D1162707
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 14:21:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49852C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 13:21:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37A9FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 13:21:20 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01IDHtTA018808; Tue, 18 Feb 2020 14:21:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=s2NxJcVROhikNR42Ep6XOOikLNW13sduuhNGn6TVfVE=;
 b=cGYo4uWiuRJHj4lhGfza6uwsiPvz0zrlfG+SK1aa+lniyPtHMxlAKAuu2m72r/tkV92p
 JGH4AqZgrMNsbUCDREHqD3gBTpUrwoWJ7hc/Tr3Xj2d6kE5wRmx1iOBphx8ADHrUeFSs
 /E8zKzvEYPrHXBuUoQ++LEUVdr8+D1ZeQY0YjBZImDxksTJmfkSrHBRwTM3Gf9QoxOQC
 9wWQoBb5dw4U+fOlv9MA4GRu2hZa+I3DJaNcYSCS+ZJzWOnJKiT3zmww963hG1YwIpdM
 wmLH0s8NnrYaKWqY16VMFA9ZRvD5JT51GBYTla4l5lc8gT2AzvOzNxK2Bi6F+fTINzRf wQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y66ne1ku1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2020 14:21:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6775A10002A;
 Tue, 18 Feb 2020 14:21:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B1A62B1311;
 Tue, 18 Feb 2020 14:21:07 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Feb
 2020 14:21:07 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 18 Feb 2020 14:21:07 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [PATCH v2] dm: core: Move "/chosen" and "/firmware" node scan
Thread-Index: AQHV4p4guLBmCvtmyUG7R/BqzCdg/6getkIAgAJA19A=
Date: Tue, 18 Feb 2020 13:21:06 +0000
Message-ID: <8c0cacecbe1f43bd995e288b0e9e9dd4@SFHDAG6NODE3.st.com>
References: <20200213184800.13968-1-patrick.delaunay@st.com>
 <CAPnjgZ0oAPNwJFbEwQyE8CnxjGF3G96APJF249gTtXUt1QLMUg@mail.gmail.com>
In-Reply-To: <CAPnjgZ0oAPNwJFbEwQyE8CnxjGF3G96APJF249gTtXUt1QLMUg@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-18_02:2020-02-17,
 2020-02-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Jens Wiklander <jens.wiklander@linaro.org>, Rajan Vaja <rajan.vaja@xilinx.com>
Subject: Re: [Uboot-stm32] [PATCH v2] dm: core: Move "/chosen" and
	"/firmware" node scan
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
bmRpIDE3IGbDqXZyaWVyIDIwMjAgMDQ6NTYNCj4gDQo+IEhpIFBhdHJpY2ssDQo+IA0KPiBPbiBU
aHUsIDEzIEZlYiAyMDIwIGF0IDExOjQ4LCBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1
bmF5QHN0LmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBVc2UgdGhlIG5ldyBmdW5jdGlvbiBkbV9z
Y2FuX2ZkdF9vZm5vZGVfcGF0aCgpIHRvIHNjYW4gYWxsIHRoZSBub2Rlcw0KPiA+IHdoaWNoIGFy
ZW4ndCBkZXZpY2VzIHRoZW1zZWx2ZXMgYnV0IG1heSBjb250YWluIHNvbWU6DQo+ID4gLSAiL2No
b3NlbiINCj4gPiAtICIvY2xvY2tzIg0KPiA+IC0gIi9maXJtd2FyZSINCj4gPg0KPiA+IFRoZSBw
YXRjaCByZW1vdmVzIHRoZSBzdHJjbXAgY2FsbCBpbiByZWN1cnNpdmUgZnVuY3Rpb24NCj4gPiBk
bV9zY2FuX2ZkdF9saXZlKCkgYW5kIGFsc28gY29ycmVjdHMgYSBjb25mbGljdCB3aXRoIHRoZSAy
IGFwcGxpZWQNCj4gPiBwYXRjaGVzIGluIHRoZSBjb21taXQgMTcxMmNhMjE5MjRiICgiZG06IGNv
cmU6IFNjYW4gL2Zpcm13YXJlIG5vZGUgYnkNCj4gPiBkZWZhdWx0IikgYW5kIGluIHRoZSBjb21t
aXQgNzQ3NTU4ZDAxNDU3ICgiZG06IGZkdDogc2NhbiBmb3IgZGV2aWNlcw0KPiA+IHVuZGVyIC9m
aXJtd2FyZSB0b28iKTogdGhlIHN1Ym5vZGVzIG9mICIvZmlybXdhcmUiIChvcHRlZSBmb3IgZXhh
bXBsZSkNCj4gPiBhcmUgYm91bmQgMiB0aW1lcy4NCj4gPg0KPiA+IEZvciBleGFtcGxlIHRoZSBk
bSB0cmVlIGNvbW1hbmQgcmVzdWx0IG9uIFNUTTMyTVAxIGlzOg0KPiA+DQo+ID4gU1RNMzJNUD4g
ZG0gdHJlZQ0KPiA+ICBDbGFzcyAgICAgSW5kZXggIFByb2JlZCAgRHJpdmVyICAgICAgICAgICAg
ICAgIE5hbWUNCj4gPiAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgcm9vdCAgICAgICAgICAwICBbICsgXSAgIHJvb3RfZHJp
dmVyICAgICAgICAgICByb290X2RyaXZlcg0KPiA+ICBmaXJtd2FyZSAgICAgIDAgIFsgICBdICAg
cHNjaSAgICAgICAgICAgICAgICAgIHwtLSBwc2NpDQo+ID4gIHN5c3Jlc2V0ICAgICAgMCAgWyAg
IF0gICBwc2NpLXN5c3Jlc2V0ICAgICAgICAgfCAgIGAtLSBwc2NpLXN5c3Jlc2V0DQo+ID4gIHNp
bXBsZV9idXMgICAgMCAgWyArIF0gICBnZW5lcmljX3NpbXBsZV9idXMgICAgfC0tIHNvYw0KPiA+
IC4uLg0KPiA+ICB0ZWUgICAgICAgICAgIDAgIFsgKyBdICAgb3B0ZWUgICAgICAgICAgICAgICAg
IHwtLSBvcHRlZQ0KPiA+IC4uLg0KPiA+ICB0ZWUgICAgICAgICAgIDEgIFsgICBdICAgb3B0ZWUg
ICAgICAgICAgICAgICAgIGAtLSBvcHRlZQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGF0cmlj
ayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBzdC5jb20+DQo+ID4gLS0tDQo+ID4NCj4gPiBD
aGFuZ2VzIGluIHYyOg0KPiA+IC0gdXBkYXRlIGNvbW1pdCBtZXNzYWdlIChTZXJpZS1jYyA9PiBT
ZXJpZXMtY2MpDQo+ID4NCj4gPiAgZHJpdmVycy9jb3JlL3Jvb3QuYyB8IDUyDQo+ID4gKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxNyBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkNCj4gDQo+IA0KPiBUaGlzIGxv
b2tzIGdvb2QgdG8gbWUsIGJ1dCBwbGVhc2UgY2FuIHlvdSBhZGRyZXNzIHRoZSB0ZXN0IGZhaWx1
cmUgKG1ha2UNCj4gcWNoZWNrKT8NCg0KSSBmb3JnZXQgdG8gZXhlY3V0ZSBpdCwgc29ycnkuDQoN
CldvcmsgaW4gcHJvZ3Jlc3MuLi4uDQoNCiANCj4gUmVnYXJkcywNCj4gU2ltb24NCg0KUGF0cmlj
aw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qt
c3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
dWJvb3Qtc3RtMzIK

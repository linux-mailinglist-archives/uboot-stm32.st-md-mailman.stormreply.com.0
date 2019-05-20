Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7864122D4B
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 09:41:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 652DACB409F
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 07:41:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9764CB409E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 07:41:14 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4K7VVdm009305; Mon, 20 May 2019 09:41:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=LKPqR3BZFR9sRGzCkn+zjHtOChSoo/WZAyB1DbACG2I=;
 b=tCfucnUPX5vGtqMtuXa+ekFiDirEWNsGnm/bhxsxCH1+HsrBTtyv+lXHWpDM5sdrUkBK
 oxeSK4MnSe9qLtFesSbJEh35i9tKF/d9L7899KKDKnsZX6BJxGLINMw14hb3adodTTag
 kXcgSQgFE/fFWFzVuTMbbi8gyRrYIPsGlImBfeVduqj6SX9e473Y3uU7bbT4AQX3ZR+J
 0gOWYh3DVES1pcLEa2ocHfyZTUV9tPcbw+VBVdZWp6wSktAfV9w5OF9newiOFyReXeXW
 GkLzrrNxLZ3iMMGx+HO5Qrs3A70ALr4KN7ntQ1tml5wRbNYHOHgElrWk9cW4dmV0BzUi Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sj7ttt2s7-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 20 May 2019 09:41:11 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9037A31;
 Mon, 20 May 2019 07:41:09 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 67EA01522;
 Mon, 20 May 2019 07:41:09 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 20 May
 2019 09:41:08 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1347.000; Mon, 20 May 2019 09:41:08 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [PATCH 1/2] fdt: Allow indicating a node is for U-Boot proper
 only
Thread-Index: AQHUvHJ7XseUiF1Kx066WkBV516K6qXPpW0AgAExywCAAazqIIACDKuAgAEwIaCABMZ6YP//8RkAgAAs74CAlus+gIACtIOA
Date: Mon, 20 May 2019 07:41:08 +0000
Message-ID: <87a2b2904a744f31ad107c20030625fd@SFHDAG6NODE3.st.com>
References: <1549275292-3134-1-git-send-email-patrick.delaunay@st.com>
 <CAPnjgZ02cTKAp5GNPMGEMUPkhw74dFF620-4Z3MLS_ADhpcf6g@mail.gmail.com>
 <53f1641f-7c55-9a34-8655-7bc41bc01d26@denx.de>
 <0e9b24dbc05f49308306a4bf9db948a7@SFHDAG6NODE3.st.com>
 <13efb4ac-ef65-ea70-d2a1-47a804091efa@denx.de>
 <0f3d9121c5e946fb9758681a0a3ce3e3@SFHDAG6NODE3.st.com>
 <7b9ebc03-2f5d-8ac7-cb0c-ceea5b99093b@denx.de>
 <c7301e129cda446fb209944908388118@SFHDAG6NODE3.st.com>
 <CAPnjgZ3oiY4FTs9qq0O5iO8bysks7xpY-VQz7XB-pBafRsM0gQ@mail.gmail.com>
In-Reply-To: <CAPnjgZ3oiY4FTs9qq0O5iO8bysks7xpY-VQz7XB-pBafRsM0gQ@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_04:, , signatures=0
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/2] fdt: Allow indicating a node is for
 U-Boot proper only
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

SGkgU2ltb24sDQoNCg0KPiANCj4gSGkgUGF0cmljaywNCj4gDQo+IE9uIE1vbiwgMTEgRmViIDIw
MTkgYXQgMDc6MzQsIFBhdHJpY2sgREVMQVVOQVkgPHBhdHJpY2suZGVsYXVuYXlAc3QuY29tPg0K
PiB3cm90ZToNCj4gPg0KPiA+IEhpIE1hcmVrLA0KPiA+DQo+ID4gPiBGcm9tOiBNYXJlayBWYXN1
dCA8bWFyZXhAZGVueC5kZT4NCj4gPiA+IFNlbnQ6IGx1bmRpIDExIGbDqXZyaWVyIDIwMTkgMTI6
NTgNCj4gPiA+DQo+ID4gPiBPbiAyLzExLzE5IDEyOjU2IFBNLCBQYXRyaWNrIERFTEFVTkFZIHdy
b3RlOg0KPiA+ID4gPiBIaSBNYXJlayBhbmQgU2ltb24NCj4gPiA+ID4NCj4gPiA+ID4+IEZyb206
IFBhdHJpY2sgREVMQVVOQVkNCj4gPiA+ID4+IFNlbnQ6IHZlbmRyZWRpIDggZsOpdnJpZXIgMjAx
OSAxMzo0Nw0KPiA+ID4gPj4NCj4gPiA+ID4+IEhpIE1hcmVrLA0KPiA+ID4gPj4NCj4gPiA+ID4+
PiBGcm9tOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4NCj4gPiA+ID4+PiBTZW50OiBqZXVk
aSA3IGbDqXZyaWVyIDIwMTkgMTg6NDgNCj4gPiA+ID4+Pg0KPiA+ID4gPj4+IE9uIDIvNy8xOSA2
OjQwIFBNLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOg0KPiA+ID4gPj4+PiBIaSBNYXJlaywNCj4g
PiA+ID4+Pj4NCj4gPiA+ID4+Pj4+IEZyb206IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPg0K
PiA+ID4gPj4+Pj4gU2VudDogbWFyZGkgNSBmw6l2cmllciAyMDE5IDA5OjU1DQo+ID4gPiA+Pj4+
Pg0KPiA+ID4gPj4+Pj4gT24gMi80LzE5IDM6NDAgUE0sIFNpbW9uIEdsYXNzIHdyb3RlOg0KPiA+
ID4gPj4+Pj4+IE9uIE1vbiwgNCBGZWIgMjAxOSBhdCAwMzoxNSwgUGF0cmljayBEZWxhdW5heQ0K
PiA+ID4gPj4+Pj4+IDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4NCj4gPiA+ID4+Pj4+IHdyb3Rl
Og0KPiA+ID4gPj4+Pj4+Pg0KPiA+ID4gPj4+Pj4+PiBUaGlzIGFkZCBtaXNzaW5nIHBhcnRzIGZv
ciBwcmV2aW91cyBjb21taXQgMDZmOTQ0NjFhOWY0DQo+ID4gPiA+Pj4+Pj4+ICgiZmR0OiBBbGxv
dyBpbmRpY2F0aW5nIGEgbm9kZSBpcyBmb3IgVS1Cb290IHByb3BlciBvbmx5IikNCj4gPiA+ID4+
Pj4+Pj4NCj4gPiA+ID4+Pj4+Pj4gQXQgcHJlc2VudCBpdCBpcyBub3QgcG9zc2libGUgdG8gc3Bl
Y2lmeSB0aGF0IGEgbm9kZSBzaG91bGQNCj4gPiA+ID4+Pj4+Pj4gYmUgdXNlZCBiZWZvcmUgcmVs
b2NhdGlvbiAoaW4gVS1Cb290IHByb3Blcikgd2l0aG91dCBpdCBhbHNvDQo+ID4gPiA+Pj4+Pj4+
IGVuZGluZyB1cCBpbiBTUEwgYW5kIFRQTCBkZXZpY2UgdHJlZXMuIEFkZCBhIG5ldyAidS1ib290
LGRtLXByZS0NCj4gcHJvcGVyIg0KPiA+ID4gPj4+Pj4+PiBib29sZWFuIHByb3BlcnR5DQo+ID4g
PiA+Pj4+PiBmb3IgdGhpcy4NCj4gPiA+ID4+Pj4+Pj4NCj4gPiA+ID4+Pj4+Pj4NCj4gPiA+ID4+
Pj4+Pj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBz
dC5jb20+DQo+ID4gPiA+Pj4+Pj4NCj4gPiA+ID4gLi4uDQo+ID4gPiA+Pj4+IE5COiB3ZSBjb3Vs
ZCBhbHNvIHJlbW92ZSB0aGUgdGFncw0KPiA+ID4gPj4+PiB1LWJvb3QsZG0tcHJlLXJlbG9jL3Ut
Ym9vdCxkbS1zcGwNCj4gPiA+ID4+Pj4gOiB3ZQ0KPiA+ID4gPj4+IGNhbiBnYWluIHBsYWNlIGlu
IHNwbCBkdGINCj4gPiA+ID4+Pj4gICAgICAgIFRoZXNlIHRhZ3MgYXJlIG5vdCBuZWVkZWQgYXMg
YmluZGluZyBpcyBtYW5kYXRvcnkgaW4gU1BMDQo+ID4gPiA+Pj4+IGJ1aWxkIGZvciBBTEwNCj4g
PiA+ID4+PiBub2RlICBwcmVzZW50IGluIFNQTCBkZXZpY2UgdHJlZQ0KPiA+ID4gPj4+PiAgICAg
ICBvdGhlcnMgbm9kZSBhcmUgY2xlYW5lZCBieSBmZHRncmVwIChidXQgaW1wYWN0IGluIFNQTA0K
PiA+ID4gPj4+PiBjb2RlKQ0KPiA+ID4gPj4NCj4gPiA+ID4+IEZpbmFsbHkgSSB3aWxsIHNlbnQg
YSBwYXRjaCBmb3IgdGhpcyBwcm9wb3NhbCAodG9kYXkgSSBob3BlKSA9Pg0KPiA+ID4gPj4gT24g
bXkgYm9hcmQgc3RtMzJtcDEtZXYxLCB0aGUgU1BMIGRldmljZSB0cmVlIGlzIHJlZHVjZWQgYnkg
NzkwDQo+ID4gPiA+PiBieXRlcw0KPiA+ID4gPg0KPiA+ID4gPiBGWUk6IHBhdGNoIHNlbnQgd2l0
aCBodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gvMTAzOTc1Ni8NCj4gDQo+IFRoYXQg
cGF0Y2ggd2FzIGFwcGxpZWQuDQo+IA0KPiBCdXQgd2hhdCBpcyB0aGUgc3RhdHVzIG9mIHRoaXMg
cGF0Y2gsIGFuZCB0aGUgc2Vjb25kIG9uZSBpbiB0aGlzIHNlcmllcz8NCj4gDQo+IElmIHRoZXNl
IGFyZSBzdGlsbCBuZWVkZWQgY2FuIHlvdSBwbGVhc2UgcmVzZW5kIHRoZW0sIHJlYmFzZWQ/DQoN
ClllcyAsIEkgbmVlZCB0byBzZW50IGEgdXBkYXRlLg0KSSBmaW5pc2gganVzdCBpdCAoaW5jbHVk
ZSB0ZXN0cykgRnJpZGF5LCBJIHdpbGwgc2VudCBpdCB0b2RheQ0KDQo+IFJlZ2FyZHMsDQo+IFNp
bW9uDQoNClJlZ2FyZHMNClBhdHJpY2sNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK

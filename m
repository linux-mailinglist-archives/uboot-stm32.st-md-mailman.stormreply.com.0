Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6FA4A249
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Jun 2019 15:34:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B662FCA907C
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Jun 2019 13:34:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 466A3CA907B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 13:34:13 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5IDY4Xn004659; Tue, 18 Jun 2019 15:34:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=THiYj3Aotgcxm9RfyTrW9FdPbHDu01CTE+Kul84npb0=;
 b=I6PCYciZrZiamPtd7mNAm3ducik11tvxbb0RUK7pfK4xdfyjLWn9M72eP6cd15vaZdvm
 tJOLKToHCcgv2Hr4L4ttwtKFIlYyptljTDZrFWeGOnNH7WRJYHLXsxmzfeTXKIpLysd8
 bK9LkoGGXhikJikQNVpaufqE4iTW1sy3HXUYCgEbdsDeGaIXV+Is563cgZKXVOR9h2SV
 ewgzCilnfoPtNq/gU4GZ9UmAJo161L8txjfpcNBai16BhBo1t5cH0pvyYSb8tKrRhN+A
 dkV11PPUFv9CLY7Wbf6DxOgxpcicGvxbPW4nqfUaD6oidna/qAiszQqik3Wu8gQOJqoD SQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t4peu8pfp-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 18 Jun 2019 15:34:06 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DDBB13D;
 Tue, 18 Jun 2019 13:33:50 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B191A2903;
 Tue, 18 Jun 2019 13:33:50 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 18 Jun
 2019 15:33:50 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 18 Jun 2019 15:33:50 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/2] usb: dwc2: correctly handle binding for
 g-tx-fifo-size
Thread-Index: AQHVIqGCAXdXZ24bvUmPX7KusNDYFqaf4vcAgAEk0ZCAABhIAIAATvzg
Date: Tue, 18 Jun 2019 13:33:50 +0000
Message-ID: <b01140936fb0479697d5347e9e0bd6b4@SFHDAG6NODE3.st.com>
References: <1560510512-15015-1-git-send-email-patrick.delaunay@st.com>
 <7f9736b4-9be1-2b4f-b29b-5f612a092de9@denx.de>
 <82d09e04026247b390ba89690bfdd719@SFHDAG6NODE3.st.com>
 <df98be38-1e69-97c3-244e-5482bc5edf41@denx.de>
In-Reply-To: <df98be38-1e69-97c3-244e-5482bc5edf41@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-18_07:, , signatures=0
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

SGkgTWFyZWsNCg0KPiBGcm9tOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4NCj4gU2VudDog
bWFyZGkgMTgganVpbiAyMDE5IDEyOjQ5DQo+IA0KPiBPbiA2LzE4LzE5IDk6MzIgQU0sIFBhdHJp
Y2sgREVMQVVOQVkgd3JvdGU6DQo+ID4gSGkgTWFyZWssDQo+ID4NCj4gPj4gRnJvbTogTWFyZWsg
VmFzdXQgPG1hcmV4QGRlbnguZGU+DQo+ID4+IFNlbnQ6IGx1bmRpIDE3IGp1aW4gMjAxOSAxNzo1
NA0KPiA+Pg0KPiA+PiBPbiA2LzE0LzE5IDE6MDggUE0sIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6
DQo+ID4+PiBNYW5hZ2UgZy10eC1maWZvLXNpemUgYXMgYSBhcnJheSBhcyBzcGVjaWZ5IGluIHRo
ZSBiaW5kaW5nLg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2sgRGVsYXVuYXkg
PHBhdHJpY2suZGVsYXVuYXlAc3QuY29tPg0KPiA+Pj4gLS0tDQo+ID4+Pg0KPiA+Pj4gIGFyY2gv
YXJtL2R0cy9zdG0zMm1wMTU3Yy1ldjEtdS1ib290LmR0c2kgfCAgNCAtLS0tDQo+ID4+PiAgZHJp
dmVycy91c2IvZ2FkZ2V0L2R3YzJfdWRjX290Zy5jICAgICAgICB8IDE3ICsrKysrKysrKysrKysr
KystDQo+ID4+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2Mt
ZXYxLXUtYm9vdC5kdHNpDQo+ID4+PiBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1ldjEtdS1i
b290LmR0c2kNCj4gPj4+IGluZGV4IDViMTllNDQuLjk5NDA5MmEgMTAwNjQ0DQo+ID4+PiAtLS0g
YS9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2MtZXYxLXUtYm9vdC5kdHNpDQo+ID4+PiArKysgYi9h
cmNoL2FybS9kdHMvc3RtMzJtcDE1N2MtZXYxLXUtYm9vdC5kdHNpDQo+ID4+PiBAQCAtNTYsMTAg
KzU2LDYgQEANCj4gPj4+ICAJfTsNCj4gPj4+ICB9Ow0KPiA+Pj4NCj4gPj4+IC0mdXNib3RnX2hz
IHsNCj4gPj4+IC0JZy10eC1maWZvLXNpemUgPSA8NTc2PjsNCj4gPj4NCj4gPj4gU2hvdWxkIHRo
aXMgcmVhbGx5IGJlIGluIHRoaXMgcGF0Y2ggPw0KPiA+DQo+ID4gQXMgSSBjaGFuZ2UgdGhlIGJp
bmRpbmcgcGFyc2luZywgdGhlIHN0bTMybXAxIHdpbGwgZG9uJ3Qgd29yayB3aXRob3V0IHRoaXMN
Cj4gcGF0Y2guDQo+ID4gSSBtYWtlIGEgY29tbXVuIHBhdGNoIG9ubHkgdG8gYWxsb3cgYmlzZWMs
IGJ1dCBJIGNhbiBzcGxpdCB0aGUgc2VyaWUgd2l0aCAyDQo+IHBhdGNoZXMuDQo+ID4NCj4gPj4N
Cj4gPj4+IC19Ow0KPiA+Pj4gLQ0KPiA+Pj4gICZ2M3YzIHsNCj4gPj4+ICAJcmVndWxhdG9yLWFs
d2F5cy1vbjsNCj4gPj4+ICB9Ow0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdl
dC9kd2MyX3VkY19vdGcuYw0KPiA+Pj4gYi9kcml2ZXJzL3VzYi9nYWRnZXQvZHdjMl91ZGNfb3Rn
LmMNCj4gPj4+IGluZGV4IDQ5NGFiNTMuLjdlNmI1ZmMgMTAwNjQ0DQo+ID4+PiAtLS0gYS9kcml2
ZXJzL3VzYi9nYWRnZXQvZHdjMl91ZGNfb3RnLmMNCj4gPj4+ICsrKyBiL2RyaXZlcnMvdXNiL2dh
ZGdldC9kd2MyX3VkY19vdGcuYw0KPiA+Pj4gQEAgLTEwMzksNiArMTAzOSw4IEBAIHN0YXRpYyBp
bnQNCj4gPj4+IGR3YzJfdWRjX290Z19vZmRhdGFfdG9fcGxhdGRhdGEoc3RydWN0DQo+ID4+IHVk
ZXZpY2UgKmRldikNCj4gPj4+ICAJaW50IG5vZGUgPSBkZXZfb2Zfb2Zmc2V0KGRldik7DQo+ID4+
PiAgCXVsb25nIGRydmRhdGE7DQo+ID4+PiAgCXZvaWQgKCpzZXRfcGFyYW1zKShzdHJ1Y3QgZHdj
Ml9wbGF0X290Z19kYXRhICpkYXRhKTsNCj4gPj4+ICsJdTMyIHR4X2ZpZm9fc3pfYXJyYXlbRFdD
Ml9NQVhfSFdfRU5EUE9JTlRTXTsNCj4gPj4NCj4gPj4gQ2FuJ3QgeW91IGp1c3QgcmVhZCBkaXJl
Y3RseSBpbnRvIHBsYXRkYXRhLT50eF9maWZvX3N6X2FycmF5W10gYmVsb3csDQo+ID4+IGFuZCB0
aHVzIGRyb3AgdGhpcyB0ZW1wb3JhcnkgdmFyaWFibGUgPw0KPiA+DQo+ID4gSXQgd2FzIHRoZSBj
YXNlIGluIGluIG15IGZpcnN0IGludGVybmFsIHZlcnNpb24uDQo+ID4NCj4gPiBpZiAocGxhdGRh
dGEtPnR4X2ZpZm9fc3pfbmIpIHsNCj4gPiAJCXJldCA9IGRldl9yZWFkX3UzMl9hcnJheShkZXYs
ICJnLXR4LWZpZm8tc2l6ZSIsDQo+ID4gCQkJCQkgJnBsYXRkYXRhLT50eF9maWZvX3N6X2FycmF5
LA0KPiA+IAkJCQkJIHBsYXRkYXRhLT50eF9maWZvX3N6X25iKTsNCj4gPiAJCWlmIChyZXQpDQo+
ID4gCQkJcmV0dXJuIHJldDsNCj4gPiAJfQ0KPiA+DQo+ID4gQW5kIEkgYWRkIGl0IHRvIGF2b2lk
IHRoZSB3YXJuaW5nIC8gcG90ZW50aWFsIGlzc3VlOg0KPiA+DQo+ID4gL2xvY2FsL2hvbWUvZnJx
MDc2MzIvdmlld3MvdS1ib290L3UtDQo+IGJvb3QvZHJpdmVycy91c2IvZ2FkZ2V0L2R3YzJfdWRj
X290Zy5jOjEwNjI6NzoNCj4gPiAJd2FybmluZzogcGFzc2luZyBhcmd1bWVudCAzIG9mIOKAmGRl
dl9yZWFkX3UzMl9hcnJheeKAmSBmcm9tIGluY29tcGF0aWJsZQ0KPiBwb2ludGVyIHR5cGUgWy1X
aW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNdDQo+ID4gICAgICAgICZwbGF0ZGF0YS0+dHhfZmlm
b19zel9hcnJheSwNCj4gPiAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+ID4g
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9sb2NhbC9ob21lL2ZycTA3NjMyL3ZpZXdzL3UtYm9vdC91
LWJvb3QvaW5jbHVkZS9kbS5oOjEyLA0KPiA+ICAgICAgICAgICAgICBmcm9tIC9sb2NhbC9ob21l
L2ZycTA3NjMyL3ZpZXdzL3UtYm9vdC91LQ0KPiBib290L2RyaXZlcnMvdXNiL2dhZGdldC9kd2My
X3VkY19vdGcuYzoyMjoNCj4gPiAJL2xvY2FsL2hvbWUvZnJxMDc2MzIvdmlld3MvdS1ib290L3Ut
Ym9vdC9pbmNsdWRlL2RtL3JlYWQuaDo3MTA6MTU6IG5vdGU6DQo+IGV4cGVjdGVkIOKAmHUzMiAq
4oCZIHtha2Eg4oCYdW5zaWduZWQgaW50ICrigJl9IGJ1dCBhcmd1bWVudCBpcyBvZiB0eXBlIOKA
mHVuc2lnbmVkIGludCAoKilbMTZd4oCZDQo+ID4gICAgICAgICAgIHUzMiAqb3V0X3ZhbHVlcywg
c2l6ZV90IHN6KQ0KPiA+ICAgICAgICAgICB+fn5+fl5+fn5+fn5+fn4NCj4gDQo+IExvb2tzIGxp
a2UgR0NDIGlzIGNvbXBsYWluaW5nIGJlY2F1c2UgeW91J3JlIHBhc3NpbmcgYW4gYXJyYXkgb2Yg
cG9pbnRlcnMgdG8NCj4gZGV2X3JlYWRfdTMyX2FycmF5KCkgLCBpbnN0ZWFkIG9mIHBsYWluIHBv
aW50ZXIgLg0KPiANCj4gVHJ5DQo+IA0KPiAgCQlyZXQgPSBkZXZfcmVhZF91MzJfYXJyYXkoZGV2
LCAiZy10eC1maWZvLXNpemUiLA0KPiAtIAkJCQkJICZwbGF0ZGF0YS0+dHhfZmlmb19zel9hcnJh
eSwNCj4gKyAJCQkJCSBwbGF0ZGF0YS0+dHhfZmlmb19zel9hcnJheSwNCj4gIAkJCQkJIHBsYXRk
YXRhLT50eF9maWZvX3N6X25iKTsNCg0KWW91IGFyZSByaWdodCwgaXQgaXMgd29ya2luZw0KSSBk
b24ndCBkb3VibGUgY2hlY2sgdGhlIHR5cGUgb2YgdGhlIGJ1ZmZlciA6LTwNCj0+IEkgd2lsbCBw
dXNoIHVwZGF0ZSBpbiBWMg0KDQo+ID4+IGJ0dyBpcyB0aGlzIGZpeCBmb3IgY3VycmVudCByZWxl
YXNlIG9yIG5leHQgPw0KPiA+DQo+ID4gSSBob3BlIGl0IGZvciB0aGUgdjIwMTkuMDcgKGFzIGl0
IGlzIG9ubHkgaW1wYWN0IHRoZSBzdG0zMm1wMSBhcmNoL2JvYXJkKS4NCj4gPiBCdXQgaXQgaXMg
bm90IGJsb2NraW5nLg0KPiANCj4gT0sNCj4gDQo+IC0tDQo+IEJlc3QgcmVnYXJkcywNCj4gTWFy
ZWsgVmFzdXQNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL3Vib290LXN0bTMyCg==

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B53CA1356DA
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jan 2020 11:30:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71D03C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jan 2020 10:30:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DC16C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2020 10:30:55 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 009ARpZ7015961; Thu, 9 Jan 2020 11:30:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=jBXl5oulDplX8kjr+1+RCfbOUmTXan7/CaZU//OkrzY=;
 b=rD2vZDrEYA6wk+AMN3IFfdcMTxvCBuOWMtw3u50lQ9LKfhnxjFNRaIXATe5EsxlmV1KS
 da5mcluaqraNVAOX+UQyGDgC0Hs/VFRgvIH7P3dKiKzeiIBgxaoj5aexuy3Nrx1Vi8V4
 u2a07lUKKmqhdJyyav2KV9oVD3jwlTyjG3xLAktl552g6plVq//OSydrSJEPcoUZs1AB
 9t6Hwwx4SGq9Vom5DoAhi6KbqgC8R1uqH8hnX8jcgLYiVHY2zQVRJ/MxRGzG39kRWYMk
 j+oB/x2T+6P5vlH3K7Zv2sNVMH5s5Nuu89nw9WMr4GkJMqAac4mk2DT+KPbNA/YH6tok 0Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xakm5s1wc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2020 11:30:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9432E100034;
 Thu,  9 Jan 2020 11:30:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 81F392AABD9;
 Thu,  9 Jan 2020 11:30:48 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 9 Jan
 2020 11:30:48 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 9 Jan 2020 11:30:48 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [PATCH v2 14/14] test: pinmux: add pincontrol-gpio for pin
 configuration
Thread-Index: AQHVpDZnfMHi26cI50eZNRJTqPP6iafSBa8AgBBg1uA=
Date: Thu, 9 Jan 2020 10:30:48 +0000
Message-ID: <18b4104304ad49e8a11d27ddcf0345ed@SFHDAG6NODE3.st.com>
References: <20191126084911.19761-1-patrick.delaunay@st.com>
 <20191126084911.19761-15-patrick.delaunay@st.com>
 <CAPnjgZ2NNfwvxkY7jx9gWU0cWRDX_QMrYYrUCsdmf61pw_RHeA@mail.gmail.com>
In-Reply-To: <CAPnjgZ2NNfwvxkY7jx9gWU0cWRDX_QMrYYrUCsdmf61pw_RHeA@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-09_02:2020-01-09,
 2020-01-09 signatures=0
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Alex Marginean <alexandru.marginean@nxp.com>, Lukasz
 Majewski <lukma@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 14/14] test: pinmux: add
 pincontrol-gpio for pin configuration
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

SGkgU2ltb24sDQoNCj4gRnJvbTogU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+DQo+IFNl
bnQ6IGx1bmRpIDMwIGTDqWNlbWJyZSAyMDE5IDAyOjIxDQo+IA0KPiBPbiBUdWUsIDI2IE5vdiAy
MDE5IGF0IDAxOjQ5LCBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4N
Cj4gd3JvdGU6DQo+ID4NCj4gPiBBZGQgYSBzaW1wbGUgcGluY29udHJvbCBhc3NvY2lhdGVkIHRv
IHRoZSBzYW5kYm94IGdwaW8gZHJpdmVyLCB0aGF0DQo+ID4gYWxsb3dzIHRvIGNoZWNrIHBpbiBj
b25maWd1cmF0aW9uIHdpdGggdGhlIGNvbW1hbmQgcGlubXV4Lg0KPiA+DQo+ID4gVGhlIHBtdXgg
dGVzdCBpcyBhbHNvIHVwZGF0ZWQgdG8gdGVzdCBiZWhhdmlvciB3aXRoIDIgcGluY29udHJvbHMu
DQo+ID4NCj4gPiBFeGFtcGxlIHRvIGNoZWNrIExFRCBwaW4gY29uZmlndXJhdGlvbjoNCj4gPg0K
PiA+ID0+IHBpbm11eCBsaXN0DQo+ID4gfCBEZXZpY2UgICAgICAgICAgICAgICAgICAgICAgICB8
IERyaXZlciAgICAgICAgICAgICAgICAgICAgICAgIHwgUGFyZW50DQo+ID4gfCBwaW5jdHJsLWdw
aW8gICAgICAgICAgICAgICAgICB8IHNhbmRib3hfcGluY3RybF9ncGlvICAgICAgICAgIHwgcm9v
dF9kcml2ZXINCj4gPiB8IHBpbmN0cmwgICAgICAgICAgICAgICAgICAgICAgIHwgc2FuZGJveF9w
aW5jdHJsICAgICAgICAgICAgICAgfCByb290X2RyaXZlcg0KPiA+DQo+ID4gPT4gcGlubXV4IGRl
diBwaW5jdHJsLWdwaW8NCj4gPg0KPiA+ID0+IHBpbm11eCBzdGF0dXMNCj4gPg0KPiA+IGEwICAg
ICAgICA6IGdwaW8gaW5wdXQgLg0KPiA+IGExICAgICAgICA6IGdwaW8gaW5wdXQgLg0KPiA+IGEy
ICAgICAgICA6IGdwaW8gaW5wdXQgLg0KPiA+IGEzICAgICAgICA6IGdwaW8gaW5wdXQgLg0KPiA+
IGE0ICAgICAgICA6IGdwaW8gaW5wdXQgLg0KPiA+IGE1ICAgICAgICA6IGdwaW8gb3V0cHV0IC4N
Cj4gPiBhNiAgICAgICAgOiBncGlvIG91dHB1dCAuDQo+ID4gLi4uDQo+ID4NCj4gPiBTZXJpZS1j
YzogSGVpa28gU2Nob2NoZXIgPGhzQGRlbnguZGU+DQo+ID4gU2VyaWUtY2M6IFNpbW9uIEdsYXNz
IDxzamdAY2hyb21pdW0ub3JnPg0KPiANCj4gU2VyaWVzLWNjIDotKQ0KDQpPdXBzIDotKQ0KDQog
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1
bmF5QHN0LmNvbT4NCj4gPg0KPiA+IC0tLQ0KPiA+DQo+ID4gQ2hhbmdlcyBpbiB2MjoNCj4gPiAt
IEFkYXB0IHNhbmRib3hfcGluY3RybF9ncGlvIGRyaXZlciB3aXRoIHRoZSBzYXZlZCBkaXJfZmxh
Z3MgaW4NCj4gPiAgIHNhbmRib3ggZ3BpbyBkcml2ZXINCj4gPiAtIHJlYmFzZSBvbiB2MjAyMC4w
MS1yYzMNCj4gPg0KPiA+ICBhcmNoL3NhbmRib3gvZHRzL3Rlc3QuZHRzICAgIHwgIDQ4ICsrKysr
LS0tLQ0KPiA+ICBkcml2ZXJzL2dwaW8vc2FuZGJveC5jICAgICAgIHwgMTk1ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIHRlc3QvcHkvdGVzdHMvdGVzdF9waW5tdXgu
cHkgfCAgMTAgKysNCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAyMzEgaW5zZXJ0aW9ucygrKSwgMjIg
ZGVsZXRpb25zKC0pDQo+IA0KPiBSZXZpZXdlZC1ieTogU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1
bS5vcmc+DQoNClRoYW5rcyBmb3IgdGhlIHJldmlldw0KDQpJIGFtIHByZXBhcmluZyBhIHYzLg0K
DQpEbyB5b3UgdGhpbmsgSSBuZWVkIHRvIHNwbGl0IHRoZSBwYXRjaCANCglbUEFUQ0ggdjIgMDgv
MTRdIGdwaW86IGFkZCBvcHMgZm9yIGNvbmZpZ3VyYXRpb24gd2l0aCBkaXIgZmxhZ3MNCg0KUmVn
YXJkcy4NCg0KUGF0cmljaw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK

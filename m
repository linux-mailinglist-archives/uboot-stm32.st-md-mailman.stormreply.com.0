Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4601E151B0A
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Feb 2020 14:17:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0324FC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Feb 2020 13:17:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EB98C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Feb 2020 13:17:04 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 014DFdDT011938; Tue, 4 Feb 2020 14:17:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Gs1+85nYRXDdmFrPynv/0r8codzAV2sLsJ2UThaIy3o=;
 b=MbJ5Da/r7YlhrQvcamFwGu2naHqZCOA/CRA8qeW/CpSEulKd0dSQvdLSZKoHTgQM6wlg
 1DFL1uD6FNdpgsvHxQxRv63bZjExnvIl2x+fe4K3JxcRua3FfsgmOl9tbEmtB6f2hxEy
 VA8XFNac4IrdnfQp/kZXZponENg2YUn91BEN4g9KnWMrQH8MkmgWFLap+4WEyrZ0ehgp
 JVE77SlGkUNhal5kUwGp6kF/X35h+Tiv+AQqLT1RCwX5lrYYj89R8her4mBwuU7gh4vC
 wptD55wc8lQA2QRCrGmU5y+h5lUuJlGlYM2aVQ3uRpAVnoOGGJ8r1ueMZb57wK+ZoeYK HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xw0019qgp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Feb 2020 14:17:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F0F84100039;
 Tue,  4 Feb 2020 14:16:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DC11C2BF9CF;
 Tue,  4 Feb 2020 14:16:55 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Feb
 2020 14:16:55 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 4 Feb 2020 14:16:55 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 4/9] ARM: dts: stm32mp1: move FDCAN to PLL4_R
Thread-Index: AQHV1brt0TuVWBqyKk67jzeWED/NPqf/7R6AgAHj0lCAAJtUgIAB/ktwgAO1egCAApyTwA==
Date: Tue, 4 Feb 2020 13:16:55 +0000
Message-ID: <64487d994ae046898418881ad86b1039@SFHDAG6NODE3.st.com>
References: <20200128091106.28552-1-patrick.delaunay@st.com>
 <20200128101041.4.Ide537d091d8ee33f89ee50edad59ea237e517e42@changeid>
 <231eb0d9-9bf3-ac62-0177-f7ee6dfb644d@denx.de>
 <adb487b28fac45b6b147464b1bb53641@SFHDAG6NODE3.st.com>
 <a7dcac3d-beaa-b641-e4f0-ab75622e7edd@denx.de>
 <357d83958e34432bb052af1509bc2487@SFHDAG6NODE3.st.com>
 <b2227c18-e343-4683-6def-47eb5ab82031@denx.de>
In-Reply-To: <b2227c18-e343-4683-6def-47eb5ab82031@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-04_04:2020-02-04,
 2020-02-04 signatures=0
Cc: Antonio BORNEO <antonio.borneo@st.com>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Gerald BAEZA <gerald.baeza@st.com>
Subject: Re: [Uboot-stm32] [PATCH 4/9] ARM: dts: stm32mp1: move FDCAN to
	PLL4_R
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
ZGltYW5jaGUgMiBmw6l2cmllciAyMDIwIDE4OjI4DQo+IA0KPiBPbiAxLzMxLzIwIDk6MTUgQU0s
IFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6DQo+ID4gSGkgTWFyZWssDQo+IA0KPiBIaSwNCj4gDQo+
ID4+IEZyb206IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPg0KPiA+PiBTZW50OiBqZXVkaSAz
MCBqYW52aWVyIDIwMjAgMDM6MjMNCj4gPj4NCj4gPj4gT24gMS8yOS8yMCA1OjUxIFBNLCBQYXRy
aWNrIERFTEFVTkFZIHdyb3RlOg0KPiA+Pj4gSGkgTWFyZWssDQo+ID4+DQo+ID4+IEhpLA0KPiA+
Pg0KPiA+Pj4+IEZyb206IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPg0KPiA+Pj4+IFNlbnQ6
IG1hcmRpIDI4IGphbnZpZXIgMjAyMCAxMzoxNg0KPiA+Pj4+DQo+ID4+Pj4gT24gMS8yOC8yMCAx
MDoxMSBBTSwgUGF0cmljayBEZWxhdW5heSB3cm90ZToNCj4gPj4+Pj4gRnJvbTogQW50b25pbyBC
b3JuZW8gPGFudG9uaW8uYm9ybmVvQHN0LmNvbT4NCj4gPj4+Pj4NCj4gPj4+Pj4gTFREQyBtb2Rp
ZmllcyB0aGUgY2xvY2sgZnJlcXVlbmN5IHRvIGFkYXB0IGl0IHRvIHRoZSBkaXNwbGF5LiBTdWNo
DQo+ID4+Pj4+IGZyZXF1ZW5jeSBjaGFuZ2UgaXMgbm90IGRldGVjdGVkIGJ5IHRoZSBGRENBTiBk
cml2ZXIgdGhhdCBpbnN0ZWFkDQo+ID4+Pj4+IGNhY2hlIHRoZSB2YWx1ZSBhdCBwcm9iZSBhbmQg
cHJldGVuZCB0byB1c2UgaXQgbGF0ZXIuDQo+ID4+Pj4+DQo+ID4+Pj4+IEtlZXAgdGhlIExUREMg
YWxvbmUgb24gUExMNF9RIGJ5IG1vdmluZyB0aGUgRkRDQU4gdG8gUExMNF9SLg0KPiA+Pj4+DQo+
ID4+Pj4gTm93IHRoaXMgbG9va3MgbGlrZSBhIGdyaXNseSB3b3JrYXJvdW5kLiBDYW4geW91IGZp
eCB0aGUgTFREQw0KPiA+Pj4+IGRyaXZlciB0byBkbyBzb21ldGhpbmcgc2FuZSBvbiBib2FyZHMg
d2hpY2ggZGlkbid0IHVwZGF0ZSBib290bG9hZGVyIHlldCA/DQo+ID4+Pg0KPiA+Pj4gSW4gZmFj
dCBpdCBtb3JlIGEgaXNzdWUgaW4gdGhlIGluaXRpYWwgY2xvY2stdHJlZSB1c2VkIHdoZW4gSQ0K
PiA+Pj4gdXBzdHJlYW0gdGhlIFNUIGJvYXJkIHRoZSBmaXJzdCB0aW1lLi4uIGJhc2VkIG9uIG91
ciBkZWxpdmVyeSB2MS4wLjANCj4gPj4+DQo+ID4+PiBJdCBpcyBhbHJlYWR5IGNvcnJlY3RlZCBp
biBkb3duc3RyZWFtIG9uIHYxLjEuMDoNCj4gPj4+ICsgRm9yIFUtQm9vdCA9DQo+ID4+PiArIGh0
dHBzOi8vZ2l0aHViLmNvbS9TVE1pY3JvZWxlY3Ryb25pY3MvdS1ib290L2NvbW1pdC9kNjJmMTRk
ZWNlMzJlNA0KPiA+Pj4gKyAxYw0KPiA+Pj4gKyAyODU0YjlmZjQ0YWNhN2I4Mzg0YWE4YTAgRm9y
IFRGLUEgPQ0KPiA+Pj4gKyBodHRwczovL2dpdGh1Yi5jb20vU1RNaWNyb2VsZWN0cm9uaWNzL2Fy
bS10cnVzdGVkLWZpcm13YXJlL2NvbW1pdC8NCj4gPj4+ICsgOWENCj4gPj4+ICsgMjRjZWRhNmMz
YmEwNjBkOWFjZjJiMjZkMDY5ZmVkZGU5ZjA4MDcNCj4gPj4+DQo+ID4+PiBUaGUgTFREQy9EU0kg
bmVlZCB0byBzZXQgdGhlIHBpeGVsIGNsb2NrIGFjY29yZGluZyB0aGUgcGFuZWwNCj4gPj4+IGNv
bmZpZ3VyYXRpb24gYW5kDQo+ID4+IHNldHRpbmdzOiBpdCBpcyBub3JtYWwgYW5kIG5lZWRlZC4N
Cj4gPj4+DQo+ID4+PiBCdXQgSWYgdGhlIHBpeGVsIGNsb2NrIGlzIHNoYXJlZCB3aXRoIEZEQ0FO
LCB3aGljaCBleHBlY3RzIHRoYXQgaXRzDQo+ID4+PiBpbnB1dCBjbG9jayBpcw0KPiA+PiBmaXhl
ZCwgYW4gaXNzdWUgb2NjdXIgd2hlbiB0aGUgcGl4ZWwgY2xvY2sgY2hhbmdlLg0KPiA+Pg0KPiA+
PiBJIHVuZGVyc3RhbmQgdGhlIHByb2JsZW0geW91IGFyZSB0cnlpbmcgdG8gc29sdmUuDQo+ID4+
DQo+ID4+IFdoYXQgSSB0aGluayB5b3UgYXJlIG1pc3NpbmcgaXMgdGhhdCBub3QgZXZlcnlvbmUg
d2lsbCB1cGRhdGUNCj4gPj4gQVRGL1UtQm9vdC9MaW51eCBpbiBsb2Nrc3RlcC4gVGhhdCBpcyB0
aGUgcHJvYmxlbSB5b3UgbmVlZCB0byBkZWFsIHdpdGggaGVyZS4NCj4gPg0KPiA+IEkgdW5kZXJz
dG9vZCB0aGUgcG9zc2libGUgaXNzdWUgYW5kIEkgaG9wZSB0aGF0IEkgd2lsbCBiZSBub3QgdGhl
IGNhc2UNCj4gPiAoYXQgbGVhc3QgZm9yIHRoZSBTVCBNaWNyb2VsZWN0cm9uaWNzIGJvYXJkcyku
DQo+IA0KPiBEbyBJIHVuZGVyc3RhbmQgaXQgY29ycmVjdGx5IHRoYXQgeW91IGV4cGVjdCB0aGUg
Y3VzdG9tZXJzIHdobyBidXkgdGhlIFNUIGNoaXAgdG8NCj4gdXBkYXRlIGJvb3Rsb2FkZXIgaW4g
bG9ja3N0ZXAgd2l0aCB0aGUga2VybmVsIGluIHN5c3RlbXMgd2hpY2ggYXJlIGRlcGxveWVkIHRv
ZGF5DQo+ID8NCj4gDQo+IE5vLCB0aGlzIGRvZXMgbm90IHdvcmsuIElmIHlvdSBoYXZlIGEgd29y
a2luZyBib290bG9hZGVyIGFuZCB5b3VyIGtlcm5lbCBmYWlscyB0bw0KPiBzdGFydCwgdGhhdCBp
cyBzb21ldGhpbmcgeW91IGNhbiByZWNvdmVyIGZyb20sIElmIHlvdXIgYm9vdGxvYWRlciBmYWls
cyB0byBzdGFydCBhbmQNCj4geW91IG5lZWQgdG8gZGlnIGFuIGVtYmVkZGVkIHN5c3RlbSBidXJp
ZWQgd2hvLWtub3dzLXdoZXJlIG9yIHJlY2FsbCBhIGxvdCBvZg0KPiBzeXN0ZW1zIGJlY2F1c2Ug
b2YgYSBmYWlsZWQgYm9vdGxvYWRlciB1cGRhdGUsIHRoYXQgd291bGQgYmUgYSBkaXNhc3Rlci4N
Cg0KTm8sIHdlIGRvbid0IGV4cGVjdCBhIGJvb3Rsb2FkZXIgdXBkYXRlciBmb3IgYWxsIHRoZSBj
dXJyZW50IGN1c3RvbWVycy4NCiANCldlIGZvdW5kIHRoaXMgd2Vha25lc3MgaW4gdGhlIGNsb2Nr
IHRyZWUgY29uZmlndXJhdGlvbiB1c2VkIGluIFNUIGJvYXJkIA0KYWZ0ZXIgb3VyIGZpcnN0IGRl
bGl2ZXJ5IGFuZCB3ZSBoYXZlIGFscmVhZHkgcHJvdmlkZSB0aGUgcGF0Y2ggKGluIGRvd25zdHJl
YW0pDQp0byBjbGllbnRzLiBTbyB3ZSBob3BlIHRoZXkgYWxyZWFkeSB1c2UgdGhpcyBjb3JyZWN0
aW9uIGluIHRoZSAgYm9vdGxvYWRlcnMNCnVzZWQgaW4gY3VycmVudCBwcm9kdWN0cy4NCg0KSG93
ZXZlciB0aGlzIGNsb2NrIGlzc3VlIG9ubHkgb2NjdXIgZm9yIGZldyBjYXNlLCB3aGVuIEZEQ0FO
IGFuZCBMVERDIGFyZSANCnVzZWQgaW4gcGFyYWxsZWwgb24gdGhlIGJvYXJkcyBhbmQgb25seSBp
ZiBMVERDIGNoYW5nZSB0aGUgcGl4ZWwgY2xvY2suDQoNClNvIGl0IHNob3VsZCBiZSBvY2N1cnMg
b25seSBmb3IgZmV3IGN1c3RvbWVyIGFuZCB0aGUgaXNzdWUgaXMgbm90IGJsb2NraW5nIGZvcg0K
bW9zdCBvZiB0aGUgY2FzZXMuDQoNCj4gPiBXZSBhcmUgYXdhcmUgb2YgdGhlIHBvc3NpYmxlIGlz
c3VlIHRvIGZpeGUgdGhlc2UgY2xvY2tzIGluIGZpcnN0IHN0YWdlDQo+ID4gYm9vdGxvYWRlciBi
dXQgYWZ0ZXIgYSBsb25nIGRlYmF0ZSwgd2UgZG9uJ3QgZm91bmQgYSBiZXR0ZXIgc29sdXRpb24s
IHdpdGggdGhlDQo+IGNvbnN0cmFpbnRzOg0KPiA+IC0gTTQgZmlybXdhcmUgcmVxdWlyZSBjbG9j
ayBpbml0aWFsaXphdGlvbiBiZWZvcmUgc3RhcnQgYW5kIGl0IGNhbiBiZQ0KPiA+IGxvYWRlZCBi
eSBVLUJvb3QNCj4gPiAtIGNsb2NrIHRyZWUgaXMgZ2VuZXJhdGVkIGJ5IEN1YmVNWCB0b29scyB3
aGljaCBnZW5lcmF0ZSBkZXZpY2UgdHJlZQ0KPiA+IChmb3IgYm9vdGxvYWRlcnMgYW5kIGtlcm5l
bCkNCj4gPiAtICJhc3NpZ25lZC1jbG9jayIgbWFuYWdlbWVudCBpbiBMaW51eCBrZXJuZWwgY291
bGQgbGVhZCB1cyB0byBhIHJhY2UNCj4gPiBjb25kaXRpb24gZm9yIHNoYXJlZCBjbG9jaw0KPiA+
DQo+ID4gV2Ugc3BlbnQgYSBsb25nIHRpbWUgdG8gZm91bmQgYSBjbG9jayB0cmVlIHdoaWNoIHJl
c3BlY3QgYWxsIHRoZQ0KPiA+IGNvbnN0cmFpbnRzIG9mIHRoZSBTT0MgYmVmb3JlIHRvIG91ciBm
aXJzdCByZWxlYXNlIHYxLjAgYW5kIGJlZm9yZSBJIHVwc3RyZWFtIHRoZQ0KPiBzdG0zMm1wMSBz
dXBwb3J0IGluIFUtQm9vdC4NCj4gPg0KPiA+IFRoZW4gSSB3YWl0IGEgeWVhciBiZWZvcmUgdG8g
dXBzdHJlYW0gdGhlIHBhdGNoZXMgb24gY2xvY2sgdHJlZQ0KPiA+IGluaXRpYWxpemF0aW9uIChh
bmQgdGhlIHNlY29uZCByZWxlYXNlIHYxLjIpIHRvIGF2b2lkIHRvbyBtYW55IGl0ZXJhdGlvbi4N
Cj4gPiAgQW5kIHRoaXMgcGF0Y2ggb24gRkRDQU4gaXMgdGhlIG9ubHkgaXNzdWUgZm91bmQgb24g
dGhlIGluaXRpYWwgY2xvY2sgdHJlZS4NCj4gPg0KPiA+IFRvZGF5IEkgdGhpbmsgKGhvcGU/KSBp
dCB3aWxsIGJlIHRoZSBsYXN0IHBhdGNoIG9uIHRoaXMgcGFydC4NCj4gDQo+IFlvdSB3aWxsIGtl
ZXAgZmluZGluZyBjbG9jayBpc3N1ZXMgYW5kIG5vICwgdGhpcyB3aWxsIG5vdCBiZSB0aGUgbGFz
dCBwYXRjaCB3aGljaA0KPiBmaXhlcyBhIGNsb2NrIGlzc3VlLg0KPiANCj4gU28gd2hhdCBzb2x1
dGlvbiBpcyB0aGVyZSBmb3IgdGhvc2Ugd2hvIGNhbiBvbmx5IHVwZGF0ZSB0aGUga2VybmVsID8N
Cg0KWWVzLCB0aGlzIGlzc3VlIGNhbiBhbHNvIHNvbHZlZCBieSBhIHBhdGNoIGluIExpbnV4IERU
IHRvIGNoYW5nZSB0aGUgY2xvY2sgdHJlZToNCg0KJm1fY2FuMSB7DQoJYXNzaWduZWQtY2xvY2tz
ID0gPCZyY2MgRkRDQU5fSyA+Ow0KCWFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8JnJjYyBQTEw0
X1I+Ow0KIH07DQoNCkl0IGlzIHRoZSBzb2x1dGlvbiByZWNvbW1lbmRlZCBmb3IgYW55IGN1c3Rv
bWVyIHdoaWNoIGNhbid0L3dhbid0IHVwZGF0ZSB0aGUgYm9vdGxvYWRlcnMuDQoNCkFuZCBJIGFn
cmVlIHRoYXQgdGhpcyBpc3N1ZSBhbHNvIGhpZ2hsaWdodCBhIGlzc3VlIGluIHRoZSBGRENBTiBk
cml2ZXIsIHdoaWNoIHNob3VsZCB1c2UNCnRoZSBBUEkgJ2Nsa19yYXRlX2V4Y2x1c2l2ZV9nZXQo
Y2xrKScgdG8gcHJldmVudCBtb2RpZmljYXRpb24gYnkgTFREQyBjbG9jay4NCg0KVGhlIGN1cnJl
bnQgcGF0Y2ggaXMgb25seSB0byBwcm92aWRlIGEgYmV0dGVyICJvZmZpY2lhbCIgY2xvY2sgdHJl
ZSBpbiBVLUJvb3QgdXBzdHJlYW0sIA0KYXMgd2Uga25vd24gdGhlIFNUIGJvYXJkIGlzIHVzZWQg
YXMgcmVmZXJlbmNlIGJ5IG1hbnkgY2xpZW50IGFuZCBhbHNvIHRvIGFsaWduIHRoZSBjbG9ja3Mg
DQp1c2VkIGluIGRvd25zdHJlYW0gKGh0dHBzOi8vZ2l0aHViLmNvbS9TVE1pY3JvZWxlY3Ryb25p
Y3MvdS1ib290KSBhbmQgaW4gdXBzdHJlYW0uDQoNCkJ1dCBpZiB5b3UgcHJlZmVyIGtlcHQgdGhl
IGN1cnJlbnQgY2xvY2sgdHJlZSBmb3IgREggUEtEMiBib2FyZCAod2l0aCBwb3RlbnRpYWwgaXNz
dWUgb24gRkRDQU4pLCANCkkgY2FuIHJldmVydCBteSBtb2RpZmljYXRpb24gb24gc3RtMzJtcDE1
eHgtZGhjb20tcGRrMi11LWJvb3QuZHRzaS4NCg0KSSBwcm9wb3NlIHRoaXMgbW9kaWZpY2F0aW9u
IG9ubHkgYmVjYXVzZSBpdCBzZWVtcyB5b3UgaGF2ZSB0aGUgc2FtZSBjbG9jay10cmVlIHRoYW4g
U1QgYm9hcmRzDQogKGV4Y2VwdCBDTEtfRVRIX1BMTDRQIHZzICBDTEtfRVRIX0RJU0FCTEVEIGJ1
dCBpcyBpcyBwcm9iYWJseSBsaW5rZWQgdG8gdGhlIGV0aGVybmV0DQpQSFkgY29uZmlndXJhdGlv
bikNCg0KUmVnYXJkcw0KDQpQYXRyaWNrDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

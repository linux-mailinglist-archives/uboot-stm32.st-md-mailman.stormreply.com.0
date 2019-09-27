Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19311C040D
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Sep 2019 13:23:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8684C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Sep 2019 11:23:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBB09C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Sep 2019 11:23:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8RBLVYv005847; Fri, 27 Sep 2019 13:23:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=1W9f9SLHpDW+/rud/JqM85Pf3ERxyBMGU2+v3l6epp4=;
 b=OeM+ey2ZME8gjkMxPiIY0smPV6580KvIFMyV5IXYrezeXql5KWxwy6SBQND4nP2sNy0N
 +qNjdjDBdHcuNPLj4YqP1cobwBUGPnnnELLRazM91bzqCiXBiTucHjBrAZpsS/6rO/jW
 Zd2V6kIIyi+EXafaFDFrXgHURdtRND4P2iluSRAQJyShh2v9Bir+eQfwuGnJZr5ymLMJ
 eUUDYB99rgY0WF3//Z30BN84COT/C78QyBwbqniRAkdIcoB3zjKSgWY3agkCNRXmu/Ae
 PBwW/VuK1vWucDEjelZo85DkBQDJFB1VRUcOO3kBJVONKesw3sclG0MVWzzDUXoGJOCK 2w== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v590bctsp-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 27 Sep 2019 13:23:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 97E9924;
 Fri, 27 Sep 2019 11:23:10 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E9D8C2B5E37;
 Fri, 27 Sep 2019 13:23:09 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 27 Sep
 2019 13:23:09 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 27 Sep 2019 13:23:09 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Thread-Topic: [PATCH] cmd: mtd: solve bad block support in erase command
Thread-Index: AQHVb4PaQhRwaswpEESsidJ0/gIEzqc0KLIAgAmOt+D//+V2gIABmTag
Date: Fri, 27 Sep 2019 11:23:09 +0000
Message-ID: <28f17168780c42a3bf4766f9e58bb691@SFHDAG6NODE3.st.com>
References: <20190920072012.17841-1-patrick.delaunay@st.com>
 <e9bfec17-f534-ce8a-fba0-067f8a1c7131@denx.de>
 <fa7563df3038453da3bda06da03fb51d@SFHDAG6NODE3.st.com>
 <20190926114231.4b3f0a7b@xps13>
In-Reply-To: <20190926114231.4b3f0a7b@xps13>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-27_06:2019-09-25,2019-09-27 signatures=0
Cc: Christophe KERELLO <christophe.kerello@st.com>,
 Quentin Schulz <quentin.schulz@bootlin.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] cmd: mtd: solve bad block support in
	erase command
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

SGkgTWlxdWVsDQoNCj4gRnJvbTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4NCj4gU2VudDogamV1ZGkgMjYgc2VwdGVtYnJlIDIwMTkgMTE6NDMNCj4gDQo+IEhpIFBh
dHJpY2ssDQo+IA0KPiBQYXRyaWNrIERFTEFVTkFZIDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4g
d3JvdGUgb24gVGh1LCAyNiBTZXAgMjAxOQ0KPiAwOTozMTo0NiArMDAwMDoNCj4gDQo+ID4gSGkg
U3RlZmFuLA0KPiA+DQo+ID4gPiBGcm9tOiBTdGVmYW4gUm9lc2UgPHNyQGRlbnguZGU+DQo+ID4g
PiBTZW50OiB2ZW5kcmVkaSAyMCBzZXB0ZW1icmUgMjAxOSAxMToyMA0KPiA+ID4NCj4gPiA+IEhp
IFBhdHJpY2ssDQo+ID4gPg0KPiA+ID4gT24gMjAuMDkuMTkgMDk6MjAsIFBhdHJpY2sgRGVsYXVu
YXkgd3JvdGU6DQo+ID4gPiA+IFRoaXMgcGF0Y2ggbW9kaWZ5IHRoZSBsb29wIGluIG10ZCBlcmFz
ZSBjb21tYW5kIHRvIGVyYXNlIG9uZSBieQ0KPiA+ID4gPiBvbmUgdGhlIGJsb2NrcyBpbiB0aGUg
cmVxdWVzdGVkIGFyZWEuDQo+ID4gPiA+DQo+ID4gPiA+IEl0IHNvbHZlcyBpc3N1ZSBvbiAibXRk
IGVyYXNlIiBjb21tYW5kIG9uIG5hbmQgd2l0aCBleGlzdGluZyBiYWQNCj4gPiA+ID4gYmxvY2ss
IHRoZSBjb21tYW5kIGlzIGludGVycnVwdGVkIG9uIHRoZSBmaXJzdCBiYWQgYmxvY2sgd2l0aCB0
aGUgdHJhY2U6DQo+ID4gPiA+IAkiU2tpcHBpbmcgYmFkIGJsb2NrIGF0IDB4ZmZmZmZmZmZmZmZm
ZmZmZiINCj4gPiA+ID4NCj4gPiA+ID4gSW4gTVREIGRyaXZlciAobmFuZC9yYXcpLCB3aGVuIGEg
YmFkIGJsb2NrIGlzIHByZXNlbnQgb24gdGhlIE1URA0KPiA+ID4gPiBkZXZpY2UsIHRoZSBlcmFz
ZV9vcC5mYWlsX2FkZHIgaXMgbm90IHVwZGF0ZWQgYW5kIHdlIGhhdmUgdGhlDQo+ID4gPiA+IGlu
aXRpYWwgdmFsdWUgTVREX0ZBSUxfQUREUl9VTktOT1dOID0gKFVMTCktMS4NCj4gPiA+DQo+ID4g
PiBTbyBoZXJlIGlzIHRoZSBkaWZmZXJlbmNlPyBJIHJlbWVtYmVyIHRlc3RpbmcgdGhpcyBvbiBh
IGJvYXJkIHdpdGgNCj4gPiA+IFNQSSBOQU5EIGFuZCBoZXJlIGl0IHdvcmtlZCBjb3JyZWN0bHku
IEJ1dCB5b3VyIHRlc3QgY2FzZSBpcyB3aXRoIFJBVw0KPiBOQU5EPw0KPiA+DQo+ID4gWWVzIHdp
dGggUkFXIG5hbmQuDQo+ID4NCj4gPiBpdCBpcyB0aGUgZGlmZmVyZW5jZSB0aGUgVS1Cb290IGNv
ZGUsIGZvciBTUEkgbmFuIHVzZToNCj4gPiAJaW50IG5hbmRkZXZfbXRkX2VyYXNlKCkNCj4gPg0K
PiA+IHRoZSBmYWlsIGFkZHJlc3MgaXMgYWx3YXlzIHVwZGF0ZWQNCj4gPiAJPT4gZWluZm8tPmZh
aWxfYWRkciA9IG5hbmRkZXZfcG9zX3RvX29mZnMobmFuZCwgJnBvcyk7DQo+ID4NCj4gPg0KPiA+
ID4gRG8geW91IGhhdmUgYSBjaGFuZ2UgdG8gYWxzbyB0ZXN0IHRoaXMgb24gYSBib2FyZCB3aXRo
IFNQSSBOQU5EPw0KPiA+DQo+ID4gSSBkbyB0aGUgdGVzdCAgYSBTUEktTkFORCB0b2RheS4NCj4g
Pg0KPiA+IFRoZSBtdGQgZXJhc2UgY29tbWFuZCB3YXMgZnVuY3Rpb25hbCBvbiBTUEktQU5ORCBi
ZWZvcmUgbXkgcGF0Y2ggOg0KPiA+IEkgY3JlYXRlIDIgYmFkIGJsb2NrIG1hbnVhbGx5IGFuZCB0
aGV5IGFyZSBjb3JyZWN0bHkgc2tpcHBlZC4NCj4gPg0KPiA+IFNUTTMyTVA+IG10ZCBsaXN0DQo+
ID4gTGlzdCBvZiBNVEQgZGV2aWNlczoNCj4gPiAqIHNwaS1uYW5kMA0KPiA+ICAgLSBkZXZpY2U6
IHNwaS1uYW5kQDANCj4gPiAgIC0gcGFyZW50OiBxc3BpQDU4MDAzMDAwDQo+ID4gICAtIGRyaXZl
cjogc3BpX25hbmQNCj4gPiAgIC0gdHlwZTogTkFORCBmbGFzaA0KPiA+ICAgLSBibG9jayBzaXpl
OiAweDIwMDAwIGJ5dGVzDQo+ID4gICAtIG1pbiBJL086IDB4ODAwIGJ5dGVzDQo+ID4gICAtIE9P
QiBzaXplOiAxMjggYnl0ZXMNCj4gPiAgIC0gT09CIGF2YWlsYWJsZTogNjIgYnl0ZXMNCj4gPiAg
IC0gMHgwMDAwMDAwMDAwMDAtMHgwMDAwMTAwMDAwMDAgOiAic3BpLW5hbmQwIg0KPiA+IAkgIC0g
MHgwMDAwMDAwMDAwMDAtMHgwMDAwMDAyMDAwMDAgOiAiZnNibCINCj4gPiAJICAtIDB4MDAwMDAw
MjAwMDAwLTB4MDAwMDAwNDAwMDAwIDogInNzYmwxIg0KPiA+IAkgIC0gMHgwMDAwMDA0MDAwMDAt
MHgwMDAwMDA2MDAwMDAgOiAic3NibDIiDQo+ID4gCSAgLSAweDAwMDAwMDYwMDAwMC0weDAwMDAx
MDAwMDAwMCA6ICJVQkkiDQo+ID4NCj4gPiBTVE0zMk1QPiBtdGQgZXJhc2Ugc3BpLW5hbmQwIDB4
MDAwMDAwMDAgMHgxMDAwMDAwMA0KPiA+IEVyYXNpbmcgMHgwMDAwMDAwMCAuLi4gMHgwZmZmZmZm
ZiAoMjA0OCBlcmFzZWJsb2NrKHMpKQ0KPiA+IDB4MGZkMDAwMDA6IGJhZCBibG9jaw0KPiA+IDB4
MGZkMjAwMDA6IGJhZCBibG9jaw0KPiA+IGF0dGVtcHQgdG8gZXJhc2UgYSBiYWQvcmVzZXJ2ZWQg
YmxvY2sgQGZkMDAwMDAgU2tpcHBpbmcgYmFkIGJsb2NrIGF0DQo+ID4gMHgwZmQwMDAwMCBhdHRl
bXB0IHRvIGVyYXNlIGEgYmFkL3Jlc2VydmVkIGJsb2NrIEBmZDIwMDAwIFNraXBwaW5nIGJhZA0K
PiA+IGJsb2NrIGF0IDB4MGZkMjAwMDANCj4gPiAweDBmZDAwMDAwOiBiYWQgYmxvY2sNCj4gPiAw
eDBmZDIwMDAwOiBiYWQgYmxvY2sNCj4gPg0KPiA+DQo+ID4gPiBUaGFua3MsDQo+ID4gPiBTdGVm
YW4NCj4gPiA+DQo+ID4NCj4gPiBXaGF0IGl0IGlzIHRoZSBiZXR0ZXIgc29sdXRpb24gZm9yIHlv
dSA/DQo+ID4NCj4gPiAgdXBkYXRlIHRoZSBNVEQgY29tbWFuZCAobXkgcGF0Y2gpIG9yIGFsbGln
biB0aGUgYmVoYXZpb3Igb2YgdGhlIDIgTVREDQo+ID4gZGV2aWNlcw0KPiA+IC0gTVREIFJBVyBO
QU5EIChuYW5kX2Jhc2UuYzo6IG5hbmRfZXJhc2VfbmFuZCkNCj4gPiAtIE1URCBTUEkgTkFORCAo
Y29yZS5jOjogbmFuZGRldl9tdGRfZXJhc2UpDQo+IA0KPiBEbyB5b3UgdGhpbmsgaXQgaXMgZWFz
eSB0byBtYWtlIHVzZSBvZiBuYW5kZGV2X210ZF9lcmFzZSgpIGZyb20gdGhlIHJhdyBOQU5EDQo+
IGNvcmU/IEl0IGlzIHByb2JhYmx5IGEgbGl0dGxlIGJpdCBtb3JlIGVsZWdhbnQgKGFuZCBlZmZp
Y2llbnQpIHRvIGRvIGFsbCBpbiBvbmUgZ28gdGhhbg0KPiBpdGVyYXRpbmcgb3ZlciBlYWNoIGJs
b2NrICh3aGlsZSB0aGVyZSBpcyBhIGhlbHBlciBpbiB0aGUgY29yZSB0byBkbyB0aGF0KS4NCg0K
DQpZZXMsIEkgYWdyZWU6IGl0IHdpbGwgYmUgbW9yZSBlbGVnYW50Lg0KDQpCdXQsICBJIGFtIG5v
dCBjb21mb3J0YWJsZSB3aXRoIE1URCBSYXcgTkFORCBmcmFtZXdvcmsuDQoNCkJhc2VkIG9uIGEg
cXVpY2sgY2hlY2sgYmV0d2VlbiBMaW51eCBLZXJuZWwgNS4zIGFuZCBVLUJvb3QsIGl0IHNlZW1z
IHRoYXQgVS1Cb290DQpSYXcgTkFORCBmcmFtZXdvcmsgaXMgYWxpZ25lZCB3aXRoIEtlcm5lbCA0
LjE5IFJhdyBOQU5EIGZyYW1ld29yay4NClRvIGJlIGFibGUgdG8gdXNlIG5hbmRkZXZfbXRkX2Vy
YXNlIEFQSSwgd2Ugc2hvdWxkIGJhY2twb3J0IFJhdyBOQU5EIGZyYW1ld29yaw0KZnJvbSBLZXJu
ZWwgNS4zIGJlY2F1c2UgbmFuZGRldl9tdGRfZXJhc2UgY2FuIGJlIHVzZWQgb25seSBpZiBtZW1v
cmcgc3RydWN0dXJlDQppcyBwcm9wZXJseSBzZXQgKGhhcyBiZWVuIGRvbmUgb24gS2VybmVsIDUu
MikuDQoNCkkgaGF2ZSBub3QgY2hlY2tlZCBhbGwgcG90ZW50aWFsIGltcGFjdHMgdG8gdXNlIHRo
aXMgQVBJLCBidXQgYSBiYWNrcG9ydCBmb3JtIEtlcm5lbA0KUmF3IE5BTkQgZnJhbWV3b3JrIGlz
IG5lZWRlZCBpbiBVLUJvb3QgaW4gYSBmaXJzdCBzdGVwLg0KDQpBcyAgSSBhbSBub3QgY29tZm9y
dGFibGUgd2l0aCBNVEQgZnJhbWV3b3JrcywgSSB0aGluayB0aGF0IG15IHBhdGNoIGNvdWxkIGJl
IGN1cnJlbnRseQ0KYXBwbGllZCB0byBzb2x2ZSB0aGlzIGlzc3VlLCBhbmQgaW4gYSBzZWNvbmQg
c3RlcCwgd2hlbiBhIE1URCBleHBlcnQgd2lsbCBiYWNrcG9ydCB0aGUNCmZyYW1ld29yaywgaXQg
Y291bGQgYmUgcmVtb3ZlZC4NCg0KUFM6IEEgb3RoZXIgc29sdXRpb24gd2l0aCBtaW5pbWl6ZSB0
aGUgaW1wYWN0cyBpbiBNVEQsIGl0IGlzIHRvIGNoYW5nZQ0KICAgICAgb25seSBuYW5kX2Jhc2Uu
YzpuYW5kX2VyYXNlX25hbmQoKSwgdG8gdXBkYXRlIHRoZSBmYWlsX2FkZHI6DQoNCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tIGluZGV4IGFiYThhYzAxOWQuLjUwNTQyYTJiOWEgMTAwNjQ0IEBAIC0z
NTU0LDYgKzM1NTQsOCBAQCBpbnQgbmFuZF9lcmFzZV9uYW5kKHN0cnVjdCBtdGRfaW5mbyAqbXRk
LCBzdHJ1Y3QgZXJhc2VfaW5mbyAqaW5zdHIsDQogCQkJcHJfd2FybigiJXM6IGF0dGVtcHQgdG8g
ZXJhc2UgYSBiYWQgYmxvY2sgYXQgcGFnZSAweCUwOHhcbiIsDQogCQkJCSAgICBfX2Z1bmNfXywg
cGFnZSk7DQogCQkJaW5zdHItPnN0YXRlID0gTVREX0VSQVNFX0ZBSUxFRDsNCisJCQlpbnN0ci0+
ZmFpbF9hZGRyID0NCisJCQkJKChsb2ZmX3QpcGFnZSA8PCBjaGlwLT5wYWdlX3NoaWZ0KTsNCiAJ
CQlnb3RvIGVyYXNlX2V4aXQ7DQogCQl9DQoNCkJ1dCBhcyBpdCBpcyBhbHNvIGEgY29tbW9uIE1U
RCBwYXJ0IHdpdGggTGludXgga2VybmVsIHNvIEkgY29udGludWUgdG8gcHJlZmVyDQpteSBwYXRj
aCBvbiBVLUJvb3Qgb25seSBjb2RlLg0KDQo+IA0KPiBUaGFua3MsDQo+IE1pcXXDqGwNCg0KUmVn
YXJkcw0KUGF0cmljaw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK

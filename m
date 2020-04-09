Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A75F91A398C
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Apr 2020 20:06:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30E60C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Apr 2020 18:06:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7449EC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Apr 2020 18:06:15 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 039I3CmZ009001; Thu, 9 Apr 2020 20:06:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=uBXlo0PEKGXWUpkm5qODyUC5kXqYnI32RMROEu/Aefs=;
 b=jxwjG7I7ROOziH8E7O1VCxtxtvpiRXFZchW8WW6QUnwiMHE/6yr82Ce03mHvtgvyIQm+
 x7hdryHSRDz4vQE+fW2TVtmGMh2xc4r33mq5Yll0bm38tEy++dcyQgp7v7fg/Btp0ItD
 ASYsNGcp9ajuHKrTQJnKIuU08ACl51JXeaTL+hAFrwJwRpt4zqZp6B+e/GIlOMMtA9zl
 Zbu6+FXv0yhqGSG/zxW7Us5KO/REpOmZxZ3+MEzS/lDymzDBvhYT9Lezyptuu896N5yR
 cF9JsuJzi4wE7ZecXxf2MNTcbA7CDPQ/Y7eS97YNUYwI8bskY40AgRyts0WSkhrIEPnK SQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3091qkc0t8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Apr 2020 20:06:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB2A1100039;
 Thu,  9 Apr 2020 20:06:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9F3DA2BE24E;
 Thu,  9 Apr 2020 20:06:02 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 9 Apr
 2020 20:06:02 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 9 Apr 2020 20:06:02 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/3] arm: caches: add DCACHE_DEFAULT_OPTION
Thread-Index: AQHWCZHnGsMjphwTIUWt6WPls6zgHKhnySMAgAfBaYCAAQKw0P//71sAgACb6ZA=
Date: Thu, 9 Apr 2020 18:06:02 +0000
Message-ID: <af7aab29c615462ca2e6190fc524736a@SFHDAG6NODE3.st.com>
References: <20200403102815.1.I64599059b66bacb531db38c67273754a145dbad8@changeid>
 <20200403102815.2.Ib6abcb05422a74bc6bc03daa71b15c98c99dbc5d@changeid>
 <ea5a59e9-dd9f-f2b6-a210-d99b417cb8f2@denx.de>
 <faf4ef59ca6a49c7a8a032726468fe43@SFHDAG6NODE3.st.com>
 <6e789fd398524ffbbdd6122278d72564@SFHDAG6NODE3.st.com>
 <0dda916f-0573-6f02-a774-cc4e463759e4@denx.de>
In-Reply-To: <0dda916f-0573-6f02-a774-cc4e463759e4@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-09_06:2020-04-07,
 2020-04-09 signatures=0
Cc: Tom Rini <trini@konsulko.com>,
 Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Rajesh Ravi <rajesh.ravi@broadcom.com>,
 Simon Glass <sjg@chromium.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 Trevor Woerner <trevor@toganlabs.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] arm: caches: add DCACHE_DEFAULT_OPTION
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

RGVhciBNYXJlaywNCg0KPiBTZW50OiBqZXVkaSA5IGF2cmlsIDIwMjAgMTI6MjENCj4gVG86IFBh
dHJpY2sgREVMQVVOQVkgPHBhdHJpY2suZGVsYXVuYXlAc3QuY29tPjsgdS1ib290QGxpc3RzLmRl
bnguZGUNCj4gDQo+IE9uIDQvOS8yMCAxMjowMSBQTSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToN
Cj4gPiBEZWFyIE1hcmVrLA0KPiANCj4gSGksDQo+IA0KPiA+PiBGcm9tOiBVYm9vdC1zdG0zMiA8
dWJvb3Qtc3RtMzItYm91bmNlc0BzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tPg0KPiA+PiBP
biBCZWhhbGYgT2YgUGF0cmljayBERUxBVU5BWQ0KPiA+Pg0KPiA+PiBEZWFyIE1hcmVrLA0KPiA+
Pg0KPiA+Pj4gRnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+DQo+ID4+PiBTZW50OiB2
ZW5kcmVkaSAzIGF2cmlsIDIwMjAgMjM6MjkNCj4gPj4+DQo+ID4+PiBPbiA0LzMvMjAgMTA6Mjgg
QU0sIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6DQo+ID4+Pj4gQWRkIHRoZSBuZXcgZmxhZ3MgRENB
Q0hFX0RFRkFVTFRfT1BUSU9OIHRvIGRlZmluZSB0aGUgZGVmYXVsdA0KPiA+Pj4+IG9wdGlvbiB0
byB1c2UgYWNjb3JkaW5nIHRoZSBjb21waWxhdGlvbiBmbGFncw0KPiA+Pj4+IENPTkZJR19TWVNf
QVJNX0NBQ0hFX1dSSVRFVEhST1VHSCBvcg0KPiA+Pj4gQ09ORklHX1NZU19BUk1fQ0FDSEVfV1JJ
VEVBTExPQy4NCj4gPj4+DQo+ID4+PiBDYW4ndCB5b3UgdW5pZnkgdGhlc2UgbWFjcm9zIGludG8g
YSBzaW5nbGUgS2NvbmZpZyAic2VsZWN0Ig0KPiA+Pj4gc3RhdGVtZW50IGluc3RlYWQgLCBhbmQg
dGhlbiBqdXN0IHNlbGVjdCB0aGUgbWF0Y2hpbmcgY2FjaGUgY29uZmlndXJhdGlvbiBpbg0KPiBL
Y29uZmlnID8NCj4gPj4NCj4gPj4gWWVzIEkgd2lsbCB0cnksIHdpdGggMiBzdGVwcw0KPiA+PiAt
IG1pZ3JhdGUgZXhpc3RpbmcgQ09ORklHX1NZU19BUk1fQ0FDSEVfLi4uLiBpbiBLY29uZmlnDQo+
ID4NCj4gPiBGaXJzdCBzdGVwIGRvbmUuLi4NCj4gPiBJIHdpbGwgcHVzaCBpdCBhcyBhIHNlcGFy
YXRlIHBhdGNoc2V0IEkgdGhpbmsuDQo+ID4NCj4gPj4gLSBhZGQgbmV3IG9wdGlvbiBDT05GSUdf
U1lTX0FSTV9DQUNIRV9PUFRJT04NCj4gPg0KPiA+IEluIGZhY3QgaXQgaXMgdG8gZGlmZmljdWx0
IHRvIHVzZSBzZWxlY3QgYmVjYXVzZSBlYWNoIGRlZmluZXMNCj4gPiBEQ0FDSEVfWFhYIHZhbHVl
IGNhbiBoYXZlIHNldmVyYWwgdmFsdWVzDQo+ID4NCj4gPiB0aGV5IGFyZSBidWlsZCBhY2NvcmRp
bmcgQ09ORklHX0FSTTY0IC8gTFBBRQ0KPiA+DQo+ID4gQnV0LCBJIGNhbid0IHVzZSB0aGlzIGRl
ZmluZSBpbiBLY29uZmlnDQo+ID4NCj4gPiBJIHRyeSA6DQo+ID4gb3B0aW9uCUFSTV9PUFRJT04N
Cj4gPiAJaW50ICJvcHRpb24iDQo+ID4gCWRlZmF1bHQgRENBQ0hFX1dSSVRFVEhST1VHSFQgaWYN
Cj4gQ09ORklHX1NZU19BUk1fQ0FDSEVfV1JJVEVUSFJPVUdIDQo+ID4gCWRlZmF1bHQgRENBQ0hF
XyBXUklURUFMTE9DIGlmIENPTkZJR19TWVNfQVJNX0NBQ0hFXw0KPiBXUklURUFMTE9DDQo+ID4g
CWRlZmF1bHQgRENBQ0hFX1dSSVRFQkFDSyBpZg0KPiBDT05GSUdfU1lTX0FSTV9DQUNIRV9XUklU
RUJBQ0sNCj4gPg0KPiA+IGludCBhbmQgaGV4IGlzIGludmFsaWQsIGFuZCBzdHJpbmcgY2FuJ3Qg
YmUgdXNlIHdpdGggIiIuDQo+ID4NCj4gPiBBbmQgSSBkb24ndCBmb3VuZCB3YXkgdG8gYnVpbGQg
aXQgYXV0b21hdGljYWxseSB3aGVuIG9wdGlvbiBpcyBhY3RpdmF0ZWQuDQo+ID4NCj4gPiBBbnkg
aWRlYSA/DQo+IA0KPiBNYXliZSB5b3UgY2FuIGhhdmUgYSBzZWxlY3QgaW4gdGhlIEtjb25maWcg
dG8gc2V0IHNvbWUgZGlmZmVyZW50bHkgbmFtZWQgb3B0aW9uLA0KPiBlLmcuDQo+IA0KPiBEQ0FD
SEVfTU9ERV9XUklURXtUSFJPVUdILEFMTE9DLEJBQ0t9DQo+IA0KPiBhbmQgdGhlbiBhbiBpZmRl
ZiBpbiBzb21lIGhlYWRlciBmaWxlLCBlLmcuDQo+IA0KPiAjaWZkZWYgQ09ORklHX0RDQUNIRV9N
T0RFX1dSSVRFVEhST1VHSA0KPiAjZGVmaW5lIEFSTV9DQUNIRV9NT0RFIERDQUNIRV9XUklURVRI
Uk9VR0ggLi4uDQo+IA0KPiBBbmQgdGhlbiB1c2UgQVJNX0NBQ0hFX01PREUgd2hlcmUgeW91IG5l
ZWQgYSB2YWx1ZSBhbmQNCj4gQ09ORklHX0RDQUNIRV9NT0RFey4uLn0gd2hlcmUgeW91IG5lZWQg
YSBjb25maWcgb3B0aW9uIGNoZWNrLg0KPiANCj4gRG9lcyB0aGlzIHdvcmsgPw0KDQpJIHRyeSB3
aXRoIHN0cmluZyBhbmQgZGVmYXVsdCAoYXMgc2VsZWN0IGlzIGFsbG93ZWQgb24gZm9yIGJvbGVh
biBvciB0cmlzYXRlKSwNCkFuZCBJIGZhaWxlZCA6LTwNCg0KSSBkb24ndCBmb3VuZCBhIHdheSB0
byBoYXZlIHRoZSBkZS1zdHJpbmdmaWNhdGUgdGhlIEtDb25maWcgb3B0aW9uDQp0byBnZW5lcmF0
ZWQgdGhlIGNvcnJlY3QgZGVmaW5lDQoNCmNvbmZpZyBTWVNfQVJNX0NBQ0hFX1BPTElDWQ0KCXN0
cmluZyAiTmFtZSBvZiB0aGUgQVJNIGRhdGEgd3JpdGUgY2FjaGUgcG9saWN5Ig0KCWRlZmF1bHQg
V1JJVEVCQUNLIGlmIFNZU19BUk1fQ0FDSEVfV1JJVEVCQUNLDQoJZGVmYXVsdCBXUklURVRIUk9V
R0ggaWYgU1lTX0FSTV9DQUNIRV9XUklURUJBQ0sNCglkZWZhdWx0IFdSSVRFQUxMT0MgaWYgU1lT
X0FSTV9DQUNIRV9XUklURUFMTE9DDQoNCiNkZWZpbmUgRENBQ0hFX0RFRkFVTFRfT1BUSU9OCURD
QUNIRV8gIyMgQ09ORklHX1NZU19BUk1fQ0FDSEVfUE9MSUNZDQoNCj0+IGVycm9yOiDigJhEQ0FD
SEVfQ09ORklHX1NZU19BUk1fQ0FDSEVfUE9MSUNZ4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBp
biB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmENPTkZJR19TWVNfQVJNX0NBQ0hFX1BP
TElDWeKAmT8NCg0KI2RlZmluZSBEQ0FDSEVfT1BUSU9OKHMpCURDQUNIRV8gIyMgQ09ORklHX1NZ
U19BUk1fQ0FDSEVfUE9MSUNZDQoNCiNkZWZpbmUgRENBQ0hFX0RFRkFVTFRfT1BUSU9OCURDQUNI
RV9PUFRJT04oQ09ORklHX1NZU19BUk1fQ0FDSEVfUE9MSUNZKQ0KDQphcmNoL2FybS9pbmNsdWRl
L2FzbS9zeXN0ZW0uaDo0ODg6MjY6IGVycm9yOiDigJhEQ0FDSEVf4oCZIHVuZGVjbGFyZWQgKGZp
cnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmERDQUNIRV9PRkbigJk/
DQphcmNoL2FybS9saWIvY2FjaGUtY3AxNS5jOjk5OjI1OiBlcnJvcjogZXhwZWN0ZWQg4oCYKeKA
mSBiZWZvcmUgc3RyaW5nIGNvbnN0YW50DQoNClRoZSBzdHJpbmdpZmljYXRpb24gaXMgcG9zc2li
bGUgYnV0IG5vdCB0aGUgaW52ZXJzZSBvcGVyYXRpb24gKHJlbW92ZSB0aGUgcXVvdGUpLi4uDQoN
CkluIG15IC5jb25maWcsIENPTkZJR19TWVNfQVJNX0NBQ0hFX1BPTElDWT0iV1JJVEVCQUNLIg0K
DQpSZWdhcmRzDQoNClBhdHJpY2sNCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

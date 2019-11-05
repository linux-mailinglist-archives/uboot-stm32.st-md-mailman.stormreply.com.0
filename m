Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8851F006F
	for <lists+uboot-stm32@lfdr.de>; Tue,  5 Nov 2019 15:57:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F9E2C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue,  5 Nov 2019 14:57:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4246C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2019 14:57:19 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA5Eq5Ur008247; Tue, 5 Nov 2019 15:57:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=p8dl4R/xsGggXMPf39fFEwFpTI6h7nWD8YWH5t+z6y4=;
 b=POinpf8mAeLyu3cEfNgIGJJL9QGKkjyIJhUbm7OQC2DqtL1rs8P0dHWZD+CYWBe+BqO1
 jibiiHuanMn74MJouv66BlNGEsKDQNZFEhSWMHYWjuZHKCee0LRaj/ebSHgp0l+Bv7PH
 VjbC6ZphFP87eEGUGVZJ5TjXaBlmzMokjrA1KRi226C3970RRFYMo9TxJgvjBEIW+pCs
 2yxX8zHEVkWZ50jc86ns3D4fgS1AUzM37qZwry/XD7NSa47txQWJBJ7ZLHHsC65mDLOG
 WR9DywN8sc9+v7Ekr+ReD10u42PjdGx1T52pg2cYv4DZL/sIbNKxSLlb2tFDVwrZ4qbi sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w1054r12j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 15:57:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F2C24100034;
 Tue,  5 Nov 2019 15:57:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E7F5A2C38DD;
 Tue,  5 Nov 2019 15:57:15 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 Nov
 2019 15:57:15 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 5 Nov 2019 15:57:15 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: =?utf-8?B?QmFydG9zeiBCacWCYXM=?= <bartosz.bilas@hotmail.com>
Thread-Topic: [U-Boot] [PATCH] stm32mp1: configs: fix checking the presence of
 an environment
Thread-Index: AQHVjNU4+WE+prDYN0OrwEa8M3bnmKdxR23QgAf+CQCAACgtAIADR7vQ
Date: Tue, 5 Nov 2019 14:57:15 +0000
Message-ID: <6b1cc07ee796445c90c3a0e932373b6c@SFHDAG6NODE3.st.com>
References: <VI1PR05MB4733FA3D45034F7B15EE9D08F7670@VI1PR05MB4733.eurprd05.prod.outlook.com>
 <b88103917685448fb193eef6cc3877cc@SFHDAG6NODE3.st.com>
 <VI1PR05MB4733AE3FCD54F3BC723AD9CBF77C0@VI1PR05MB4733.eurprd05.prod.outlook.com>
 <VI1PR05MB473373D570636703BE9DD30BF77C0@VI1PR05MB4733.eurprd05.prod.outlook.com>
In-Reply-To: <VI1PR05MB473373D570636703BE9DD30BF77C0@VI1PR05MB4733.eurprd05.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-11-05_05:2019-11-05,2019-11-05 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH] stm32mp1: configs: fix checking
 the presence of an environment
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

SGkgQmFydG9zeg0KDQo+IEZyb206IEJhcnRvc3ogQmnFgmFzIDxiYXJ0b3N6LmJpbGFzQGhvdG1h
aWwuY29tPg0KPiBTZW50OiBkaW1hbmNoZSAzIG5vdmVtYnJlIDIwMTkgMTM6MzkNCj4gDQo+IEhl
bGxvIFBhdHJpY2ssDQo+IA0KPiBPbiAxMS8zLzE5IDExOjE1IEFNLCBCYXJ0b3N6IEJpxYJhcyB3
cm90ZToNCj4gPiBIZWxsbyBQYXRyaWNrLA0KPiA+DQo+ID4gc29ycnkgZm9yIHRoZSBsYXRlIGFu
c3dlciBidXQgSSdsbCB0cnkgdG8gZXhwbGFpbiB5b3UgbXkgaXNzdWUuDQo+ID4NCj4gPiBPbiAx
MC8yOS8xOSA5OjM4IEFNLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOg0KPiA+DQo+ID4gSGkgQmFy
dG9zeiwNCj4gPg0KPiA+IFBsZWFzZSBhZCBnZXQgbWFpbnRhaW5lcnMgb3IgdG9vbHMvcGF0bWFu
IHRvIHNlbnQgcGF0Y2ggZm9yIHN0bTMybXAxIHBsYXRmb3JtLg0KPiA+DQo+ID4gT2ssIEknbGwg
cmVtZW1iZXIgYWJvdXQgdGhhdC4NCj4gPg0KPiA+DQo+ID4NCj4gPg0KPiA+DQo+ID4gRnJvbTog
VS1Cb290DQo+ID4gPHUtYm9vdC1ib3VuY2VzQGxpc3RzLmRlbnguZGU+PG1haWx0bzp1LWJvb3Qt
Ym91bmNlc0BsaXN0cy5kZW54LmRlPiBPbg0KPiA+IEJlaGFsZiBPZiBCYXJ0b3N6IEJpbGFzDQo+
ID4gU2VudDogZGltYW5jaGUgMjcgb2N0b2JyZSAyMDE5IDE1OjQ2DQo+ID4gVG86IHUtYm9vdEBs
aXN0cy5kZW54LmRlPG1haWx0bzp1LWJvb3RAbGlzdHMuZGVueC5kZT4NCj4gPiBTdWJqZWN0OiBb
VS1Cb290XSBbUEFUQ0hdIHN0bTMybXAxOiBjb25maWdzOiBmaXggY2hlY2tpbmcgdGhlIHByZXNl
bmNlDQo+ID4gb2YgYW4gZW52aXJvbm1lbnQNCj4gPg0KPiA+IEV4ZWN1dGUgZW52IGNoZWNrIGNv
bW1hbmQgd2l0aGluIGV4dHJhIGVudiBzZXR0aW5ncyBzZWN0aW9uIGluc3RlYWQgb2YNCj4gPiBi
b290Y21kIHdoZXJlYnkgd2UgYXJlIGFibGUgdG8gbW91bnQgcm9vdGZzIHBhcnRpdGlvbiBmcm9t
IHNkIGNhcmQgcHJvcGVybHkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEJpbGFz
DQo+ID4gPGJhcnRvc3ouYmlsYXNAaG90bWFpbC5jb20+PG1haWx0bzpiYXJ0b3N6LmJpbGFzQGhv
dG1haWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgaW5jbHVkZS9jb25maWdzL3N0bTMybXAxLmggfCAy
ICstDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2NvbmZpZ3Mvc3RtMzJtcDEuaCBiL2luY2x1
ZGUvY29uZmlncy9zdG0zMm1wMS5oDQo+ID4gaW5kZXggOTg4OTkyYjMzNi4uY2FkYzAzNThmZCAx
MDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2NvbmZpZ3Mvc3RtMzJtcDEuaA0KPiA+ICsrKyBiL2lu
Y2x1ZGUvY29uZmlncy9zdG0zMm1wMS5oDQo+ID4gQEAgLTExNSw3ICsxMTUsNiBAQA0KPiA+ICAg
ICAgICAgICJpZiB0ZXN0ICR7Ym9vdF9kZXZpY2V9ID0gc2VyaWFsIHx8IHRlc3QgJHtib290X2Rl
dmljZX0gPSB1c2I7IiBcDQo+ID4gICAgICAgICAgInRoZW4gc3RtMzJwcm9nICR7Ym9vdF9kZXZp
Y2V9ICR7Ym9vdF9pbnN0YW5jZX07ICIgXA0KPiA+ICAgICAgICAgICJlbHNlICIgXA0KPiA+IC0g
ICAgICAgICAgICAgICAicnVuIGVudl9jaGVjazsiIFwNCj4gPiAgICAgICAgICAgICAgICAgICJp
ZiB0ZXN0ICR7Ym9vdF9kZXZpY2V9ID0gbW1jOyIgXA0KPiA+ICAgICAgICAgICAgICAgICAgInRo
ZW4gZW52IHNldCBib290X3RhcmdldHMgXCJtbWMke2Jvb3RfaW5zdGFuY2V9XCI7IGZpOyIgXA0K
PiA+ICAgICAgICAgICAgICAgICAgImlmIHRlc3QgJHtib290X2RldmljZX0gPSBuYW5kOyIgXCBA
QCAtMTYwLDYgKzE1OSw3DQo+ID4gQEANCj4gPiAgICAgICAgICAiaW5pdHJkX2hpZ2g9MHhmZmZm
ZmZmZlwwIiBcDQo+ID4gICAgICAgICAgImFsdGJvb3RjbWQ9cnVuIGJvb3RjbWRcMCIgXA0KPiA+
ICAgICAgICAgICJlbnZfZGVmYXVsdD0xXDAiIFwNCj4gPiArICAgICAgICJydW4gZW52X2NoZWNr
OyIgXA0KPiA+DQo+ID4NCj4gPg0KPiA+IEl0IGlzIG5vdCBhIGNvcnJlY3QgcGxhY2UsIHRoaXMg
ZGVmaW5lIENPTkZJR19FWFRSQV9FTlZfU0VUVElOR1Mgb25seSB0aGUNCj4gZGVmYXVsdCBlbnZp
cm9ubWVudCAob25seSBzZXQgZW52IHZhcmlhYmxlKS4NCj4gPiBPbmx5ICJib290Y21kIiAgb3Ig
InByZWJvb3QiIGlzIHJlYWxseSBleGVjdXRlZCwgdGhpcyBjb21tYW5kIHdpbGwgYmUgbmV2ZXIN
Cj4gZXhlY3V0ZWQgaGVyZS4NCj4gPg0KPiA+DQo+ID4NCj4gPiAgICAgICAgICAiZW52X2NoZWNr
PWlmIHRlc3QgJGVudl9kZWZhdWx0IC1lcSAxOyJcDQo+ID4gICAgICAgICAgICAgICAgICAiIHRo
ZW4gZW52IHNldCBlbnZfZGVmYXVsdCAwO2VudiBzYXZlO2ZpXDAiIFwNCj4gPiAgICAgICAgICBT
VE0zMk1QX0JPT1RDTUQgXA0KPiA+IC0tDQo+ID4NCj4gPg0KPiA+DQo+ID4gQ2FuIHlvdSBleHBs
YWluIHlvdSBpc3N1ZSBhbmQgdGhlIGJvYXJkIHVzZWQuDQo+ID4NCj4gPiBUaGUgcHJvYmxlbSB3
aGljaCBJJ3ZlIGVuY291bnRlcmVkIGlzIHRoYXQgSSdtIG5vdCBhYmxlIHRvIGJvb3QgbXkgcm9v
dGZzDQo+IHBhcnRpdGlvbiBwcm9wZXJseSB1c2luZyB0aGUgbGF0ZXN0IFUtQm9vdCB2ZXJzaW9u
ICgyMDE5LjEwKSB1c2luZyBzdG0zMm1wMTU3Yy0NCj4gZGsyIGJvYXJkIChJJ3ZlIGJlZW4gZ2V0
dGluZyBrZXJuZWwgcGFuaWMgYmVjYXVzZSBpdCB3YXNuJ3QgYWJsZSB0byBtb3VudCBwYXJ0aXRp
b24pLg0KPiBPbiB0aGUgcHJldmlvdXMgdmVyc2lvbiAoMjAxOS4wNykgdGhlcmUgaXMgbm8gYW55
IHByb2JsZW1zIHdpdGggdGhhdC4gSSd2ZSB1c2VkIGdpdA0KPiBiaXNlY3QgdG8gY2hlY2sgd2hp
Y2ggY29tbWl0IGNhdXNlcyB0aGUgcHJvYmxlbSBhbmQgaXQgdHVybmVkIG91dCB0aGF0IHRoZQ0K
PiBwcm9ibGVtIGlzIHdpdGggY29tbWl0IDIyYmVkN2VlNDk4OGFhZGZhZWYwYzBkYTk3NDZiZjg1
NDE1NDllZDQuDQo+ID4NCj4gPg0KPiA+DQo+ID4gSSB0aGluayB5b3VyIHBhdGNoIG9ubHkgbWFz
ayB0aGUgaXNzdWUsIGFzIGVudmlyb25tZW50IGlzIG5vdCBzYXZlZCwgVS1Cb290DQo+IG5ldmVy
IHdyaXRlIGluIEVYVDQgZmlsZSBzeXN0ZW0uDQo+ID4gWW91IHNob3VsZCBoYXZlIGFnYWluIHRo
ZSBpc3N1ZSBpZiB5b3UgZXhlY3V0ZSBtYW51YWxseSBieSB0aGUgY29tbWFuZCAiZW52DQo+IHNh
dmUiLg0KPiA+DQo+ID4gSG1tLCBpdCBtYWtlcyBzZW5zZS4NCj4gPg0KPiA+DQo+ID4NCj4gPiBU
b2RheSBJIGhhdmUgbm8gaXNzdWUgb24gbXkgc2lkZSB3aXRoIGVudmlyb25tZW50IGluIGV4dDQg
ZmlsZSBzeXN0ZW0NCj4gPiAoZ2VuZXJhdGVkIGJ5IGRvbndzdHJlYW4geW9jdG8pOyB0aGUgcmVx
dWVzdHMgZG9uZSBieSBVLUJvb3QgYXJlIGFjY2VwdGFibGUgaWYNCj4gdGhlIGV4dDQgZmlsZSBz
eXN0ZW0gaXMgZ2VuZXJhdGVkIHdpdGggb25seSB0aGUgZmVhdHVyZXMgc3VwcG9ydGVkIGJ5IFUt
Qm9vdC4NCj4gPg0KPiA+IEkgdXNlIGJ1aWxkcm9vdCBhbmQgaWYgeW91IHdhbm5hIHlvdSBjYW4g
YnVpbGQgYW5kIGNoZWNrIHRoYXQgaW1hZ2UgeW91cnNlbGYuDQo+IEhlcmUgaXMgYSBsaW5rIHRv
IGd1aWRlDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9idWlsZHJvb3QvYnVpbGRyb290L3RyZWUvbWFz
dGVyL2JvYXJkL3N0bWljcm9lbGVjdHJvbmljcy9zdG0zMm0NCj4gcDE1N2MtZGsyIGJ1dCByZW1l
bWJlciB0byBjb21tZW50IHRoaXMgbGluZSAtPg0KPiBCUjJfR0xPQkFMX1BBVENIX0RJUj0iYm9h
cmQvc3RtaWNyb2VsZWN0cm9uaWNzL3N0bTMybXAxNTdjLQ0KPiBkazIvcGF0Y2hlcyIgaW4gc3Rt
MzJtcDE1N2NfZGsyX2RlZmNvbmZpZyBmaWxlIHRvIGRpc2FibGUgbXkgZmF1bHR5IHBhdGNoLg0K
PiA+DQo+ID4NCj4gPg0KPiA+IEJ1dCB3ZSBzb2x2ZWQgaXNzdWUgd2l0aCBsYXRlc3QgZXh0NCB0
b29sczsgc2luY2UgZTJmc3Byb2dzIDEuNDMgYXQgbGVhc3QsIHdlIGhhdmUNCj4gYXNjZW5kYW5j
ZSBpbmNvbXBhdGliaWxpdHkgYXMgbmV3IGVuYWJsZSBmZWF0dXJlcyBhcmUgZW5hYmxlIGJ5IGRl
ZmF1bHQgPQ0KPiBtZXRhZGF0YV9jc3VtIGFuZCBkaXJfaW5kZXguDQo+ID4NCj4gPiBXZSByZW1v
dmUgdGhlbSB3aXRoIHRoZSBta2ZzLmV4dDQgb3B0aW9uOiAtTyBebWV0YWRhdGFfY3N1bSxeZGly
X2luZGV4DQo+ID4NCj4gPiBFeGFtcGxlIDogbWtmcy5leHQ0IC1MIHJvb3RmcyAtTyBebWV0YWRh
dGFfY3N1bSxeZGlyX2luZGV4IC9kZXYvc2RiNA0KPiA+DQo+ID4gSSdsbCBjaGVjayB0aGF0IGFu
ZCBsZXQgeW91IGtub3cgYWJvdXQgdGhlIHJlc3VsdHMuDQo+IA0KPiBJJ3ZlIHByZXBhcmVkIHNk
IGNhcmQgd2l0aCBkaXNhYmxlZCB0aG9zZSBvcHRpb25zIGFuZCBpdCB3b3JrcyB3ZWxsLiBJIHRo
aW5rIHdlIGNhbg0KPiByZWplY3QgdGhhdCBwYXRjaCB0aGVuLg0KDQpUaGFua3MgZm9yIHRoZSBm
ZWVkYmFjaywgDQoNClBhdGNoIHJlamVjdGVkIDotKQ0KDQo+IA0KPiANCj4gQmVzdA0KPiBCYXJ0
ZWsNCj4gPg0KPiA+DQo+ID4NCj4gPiBGb3IgZGV0YWlscyBvZiByZXN0cmljdGlvbiwgc2VlIGNv
bW1pdCAxMGE3YTFiOCA6IHVwZGF0ZSB3aXRoIGhhc2ggdHJlZSBkaXJlY3RvcnkNCj4gb2YgRVhU
NCBub3Qgc3VwcG9ydCBieSBVLUJvb3QgKEVYVDRfSU5ERVhfRkwpDQo+ID4NCj4gPiBUaGFua3MN
Cj4gPg0KPiA+DQo+ID4NCg0KUmVnYXJkcyANClBhdHJpY2sNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9v
dC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==

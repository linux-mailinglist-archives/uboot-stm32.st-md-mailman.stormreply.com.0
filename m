Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FA6135F35
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jan 2020 18:24:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D3DCC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jan 2020 17:24:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60228C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2020 17:24:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 009H3wkp018114; Thu, 9 Jan 2020 18:23:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=w+AZWvp1gjn1EOO9G+axtfOm6HdFNaGmtVid3mCx+2I=;
 b=TG2PV1yeFjBUs1o1nkMZPCwHB+zvZcEAkeM2+5f6kg2p8uFwCUDUfz77QbToPh6nWxXL
 l0ixgAE+I6oEN2t2EfNRB40XTowvfy/bmaLoJ+MvWUbeo/19mK3W4EXAbMqNdsmAgx7O
 Pw7m2ADYTUsQB46kgtdiAQfKGPgzcMnBTgzqBUlTif9vyhji/7UN7XPEdI6Fg1nCxON3
 Lp0+8vuHZiUdmh4qWEG5uayiuqbqVNdJ04xLXBj5AABsFqM062PrljycshpR1xH7iLeW
 UuXsiMmNLb9fASJY6WS5ASfuwl8NOzdty8E/Yrgsdqyop4ZxidqanOTk20370K8wJq6f Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2xakkb36jj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2020 18:23:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D15F010002A;
 Thu,  9 Jan 2020 18:23:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B4EDD2BD3E8;
 Thu,  9 Jan 2020 18:23:51 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Jan
 2020 18:23:51 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 9 Jan 2020 18:23:51 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>, Tom Rini <trini@konsulko.com>
Thread-Topic: [PATCH v3] board_f.c: Insure gd->new_bootstage	alignment
Thread-Index: AdXFUeZcON90i5hYRYmBZ1BXivHD+ABvtQJA
Date: Thu, 9 Jan 2020 17:23:51 +0000
Message-ID: <b781d83eb3ec445a882db1064573d38e@SFHDAG6NODE3.st.com>
References: <ce453f43d50442a48588ba3a1004fd9b@SFHDAG6NODE3.st.com>
In-Reply-To: <ce453f43d50442a48588ba3a1004fd9b@SFHDAG6NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-09_03:2020-01-09,
 2020-01-09 signatures=0
Cc: Stephen Warren <swarren@nvidia.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Joe Hershberger <joe.hershberger@ni.com>, Trevor
 Woerner <trevor@toganlabs.com>, Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v3] board_f.c: Insure
	gd->new_bootstage	alignment
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

SGksDQoNCj4gRnJvbTogUGF0cmljayBERUxBVU5BWQ0KPiBTZW50OiBtYXJkaSA3IGphbnZpZXIg
MjAyMCAxMzowNw0KPiANCj4gSGkgUGF0cmljZSBhbmQgVG9tDQo+IA0KPiA+IFNlbnQ6IG1lcmNy
ZWRpIDE4IGTDqWNlbWJyZSAyMDE5IDEwOjEwDQo+ID4NCj4gPiBIaSBTaW1vbiwNCj4gPg0KPiA+
ID4gRnJvbTogU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+DQo+ID4gPiBTZW50OiBtYXJk
aSAxNyBkw6ljZW1icmUgMjAxOSAxNjo0Ng0KPiA+ID4NCj4gPiA+IEhpIFBhdHJpY2UsDQo+ID4g
Pg0KPiA+ID4gT24gV2VkLCAyNyBOb3YgMjAxOSBhdCAwMjoxMSwgUGF0cmljZSBDaG90YXJkDQo+
ID4gPiA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4NCj4gPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+
ID4gSW4gcmVzZXJ2ZV9ib290c3RhZ2UoKSwgaW4gY2FzZSBzaXplIGlzIG9kZCwgZ2QtPm5ld19i
b290c3RhZ2UgaXMNCj4gPiA+ID4gbm90IGFsaWduZWQuIEluIGJvb3RzdGFnZV9yZWxvY2F0ZSgp
LCB0aGUgcGxhdGZvcm0gaGFuZ3Mgd2hlbg0KPiA+ID4gPiBnZXR0aW5nIGFjY2VzcyB0byBkYXRh
LT5yZWNvcmRbaV0ubmFtZS4NCj4gPiA+ID4gVG8gYXZvaWQgdGhpcyBpc3N1ZSwgbWFrZSBnZC0+
bmV3X2Jvb3RzdGFnZSAxNiBieXRlIGFsaWduZWQuDQo+ID4gPiA+DQo+ID4gPiA+IFRvIGluc3Vy
ZSB0aGF0IG5ld19ib290c3RhZ2UgaXMgMTYgYnl0ZSBhbGlnbmVkIChhdCBsZWFzdCBuZWVkZWQN
Cj4gPiA+ID4gZm9yDQo+ID4gPiA+IHg4Nl82NCBhbmQgQVJNdjgpIGFuZCBuZXdfYm9vdHN0YWdl
IHN0YXJ0cyBkb3duIHRvIGdldCBlbm91Z2gNCj4gPiA+ID4gc3BhY2UsIEFMSUdOX0RPV04gbWFj
cm8gaXMgdXNlZC4NCj4gPiA+ID4NCj4gPiA+ID4gRml4ZXM6IGFjOWNkNDgwNWM4YiAoImJvb3Rz
dGFnZTogQ29ycmVjdCByZWxvY2F0aW9uIGFsZ29yaXRobSIpDQo+ID4gPiA+DQo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4NCj4g
PiA+ID4gUmV2aWV3ZWQtYnk6IFZpa2FzIE1BTk9DSEEgPHZpa2FzLm1hbm9jaGFAc3QuY29tPg0K
PiA+ID4gPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBz
dC5jb20+DQo+ID4gPiA+IFRlc3RlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxh
dW5heUBzdC5jb20+DQo+ID4NCj4gPiBGb3IgaW5mb3JtYXRpb24sIFBhdHJpY2UgaXMgYWJzZW50
IGZvciBwZXJzb25hbCByZWFzb24gdXAgdG8gYmVnaW5uaW5nIG5leHQgeWVhci4NCj4gPiBEb24n
dCB3YWl0IGEgZmFzdCBhbnN3ZXIuDQo+ID4NCj4gPiA+IEZvciB0aGlzIHBhdGNoIEkgdGhpbmsg
aXQgd291bGQgYmUgYmV0dGVyIHRvIHVwZGF0ZSByZXNlcnZlX2ZkdCgpIHRvDQo+ID4gPiBrZWVw
IHRoaW5ncyBhbGlnbmVkLCBhc3N1bWluZyB0aGF0IGlzIHRoZSBwcm9ibGVtLg0KPiA+DQo+ID4g
SSBkb24ndCBzdXJlIHRoYXQgc29sdmUgdGhlIGlzc3VlLA0KPiA+IGZvciBtZSB0aGUgcHJvYmxl
bSBpcyBvbmx5IGZvciB0aGUgYm9vdHN0YWdlIHN0cnVjdCAoZ2QtPmJvb3RzdGFnZSkNCj4gPiBB
bmQNCj4gPiByZXNlcnZlX2ZkdCgpIGFscmVhZHkgYWxsaWduZSBzaXplIG9uIDMyIGJ5dGVzDQo+
ID4NCj4gPiBJZiBJIHJlbWVtYmVyIHRoZSBQYXRyaWNlIGFuYWx5c2lzOg0KPiA+DQo+ID4gMS0g
Ym9vdHN0YWdlX2dldF9zaXplIHJldHVybiBhIG9kZCB2YWx1ZSAob3IgYXQgbGVhc3Qgbm90IDE2
IGJ5dGVzDQo+ID4gYWxpZ25lZCBJIGRvbid0IHJlbWVtYmVyKS4NCj4gPg0KPiA+IDItIEluIHJl
c2VydmVfYm9vdHN0YWdlKCkNCj4gPiAJaW50IHNpemUgPSBib290c3RhZ2VfZ2V0X3NpemUoKTsN
Cj4gPiAJZ2QtPnN0YXJ0X2FkZHJfc3AgLT0gc2l6ZQ0KPiA+IAk9PiBpdCBpcyBhIHVuYWxpZ25l
ZCBhZGRyZXNzIGV2ZW4gaWYgZ2QtPnN0YXJ0X2FkZHJfc3AgaXMgMzIgYnl0ZXMNCj4gPiBhbGxp
Z25lZA0KPiA+DQo+ID4gCWdkLT5uZXdfYm9vdHN0YWdlID0gbWFwX3N5c21lbShnZC0+c3RhcnRf
YWRkcl9zcCwgc2l6ZSk7DQo+ID4gCT0+IGFsc28gdW5hbGlnbmVkDQo+ID4NCj4gPiAzLSBUaGVu
IGR1cmluZyByZWxvY2F0aW9uLCBpbiByZWxvY19ib290c3RhZ2UoKQ0KPiA+IAlnZC0+Ym9vdHN0
YWdlID0gZ2QtPm5ld19ib290c3RhZ2U7DQo+ID4NCj4gPg0KPiA+IDQtIGNyYXNoIG9jY3VyIGJl
Y2F1c2UgaW4gbmV4dCBib290c3RhZ2UgZnVuY3Rpb24gYmVhdWNzZSB0aGUgYm9vc3RhZ2UNCj4g
PiBhZGRyZXNzIGRvbid0IHJlc3BlY3QgcG9pbnRlciB0byBzdHJ1Y3QgYWxsaWduZW1lbnQuLi4N
Cj4gPg0KPiA+IAlzdHJ1Y3QgYm9vdHN0YWdlX2RhdGEgKmRhdGEgPSBnZC0+Ym9vdHN0YWdlDQo+
ID4NCj4gPg0KPiA+ID4gQXQgc29tZSBwb2ludCB3ZSBzaG91bGQgYWxzbyBkb2N1bWVudCB0aGF0
IHJlc2VydmF0aW9ucyBtdXN0IGtlZXANCj4gPiA+IHRoaW5ncyBhbGlnbmVkLg0KPiA+ID4NCj4g
PiA+IFBlcmhhcHMgdGhpcyBzaG91bGQgYmUgaGFuZGxlZCBieSBhIHNlcGFyYXRlIGZ1bmN0aW9u
IGNhbGxlZCBmcm9tDQo+ID4gPiBhbGwgdGhlc2UgcGxhY2VzLCB3aGljaCBzdWJ0cmFjdHMgZ2Qt
PnN0YXJ0X2FkZHJfc3AgYW5kIGVuc3VyZXMgMTYtYnl0ZQ0KPiBhbGlnbm1lbnQuDQo+ID4NCj4g
PiBZZXMgdGhhdCBjYW4gYmUgYSBpbXByb3ZlbWVudCwgIGJ1dCBwZXJoYXBzIGlhIGEgc2Vjb25k
IHN0ZXAgLyBzZWNvbmQgc2VyaWUuLi4uDQo+ID4NCj4gPiBEbyB5b3UgdGhpbmsgYWJvdXQgYSBm
dW5jdGlvbiBjYWxsZWQgaW4gYWxsIHJldmVyc2VkXyBmdW5jdGlvbnMgKHdoZW4NCj4gPiBzdGFy
dF9hZGRyX3NwIGlzIG1vZGlmaWVkKS4uLg0KPiA+DQo+ID4gc3RhdGljIGludCByZXNlcnZlZF9h
bGxpZ25fY2hlY2sodm9pZCkgew0KPiA+IAkvKiBtYWtlIHN0YWNrIHBvaW50ZXIgMTYtYnl0ZSBh
bGlnbmVkICovDQo+ID4gCWlmIChnZC0+c3RhcnRfYWRkcl9zcCAmIDB4Zikgew0KPiA+IAkJZ2Qt
PnN0YXJ0X2FkZHJfc3AgLT0gMTY7DQo+ID4gCQlnZC0+c3RhcnRfYWRkcl9zcCAmPSB+MHhmOw0K
PiA+IAkgfQ0KPiA+IH0NCj4gPg0KPiA+IEkgcHJlZmVyIGEgZnVuY3Rpb24gdG8gcmVzZXJ2ZWQg
YSBzaXplIHdpY2ggcmVwbGFjZSBpbiBhbnkgcmVzZXJ2ZV8NCj4gPiBmdW5jdGlvbiAgdGhlIGxp
bmUNCj4gPiA6DQo+ID4gCWdkLT5zdGFydF9hZGRyX3NwIC09IC4uLg0KPiA+DQo+ID4gLyogcmVz
ZXJ2ZSBzaXplIGFuZCBtYWtlIHN0YWNrIHBvaW50ZXIgMTYtYnl0ZSBhbGlnbmVkICovICBzdGF0
aWMgaW50DQo+ID4gcmVzZXJ2ZShzaXplX3Qgc2l6ZSkgew0KPiA+IAlnZC0+c3RhcnRfYWRkcl9z
cCAtPSBzaXplOw0KPiA+IAkvKiBtYWtlIHN0YWNrIHBvaW50ZXIgMTYtYnl0ZSBhbGlnbmVkICov
DQo+ID4gCWdkLT5zdGFydF9hZGRyX3NwID0gQUxJR05fRE9XTihnZC0+c3RhcnRfYWRkcl9zcCwg
MTYpOyB9DQo+ID4NCj4gPiBJIHRoaW5rIEkgd2lsbCBwdXNoIGl0LCB3aGVuIHRoZSBwYXRyaWNl
IHBhdGNoIHdpbGwgYmUgYWNjZXB0ZWQuDQo+IA0KPiBJIGFtIHByZXBhcmluZyB0aGlzIHBhdGNo
Li4uLg0KPiANCj4gRG8geW91IHRoaW5rIGl0IGlzIG9rIHRvIG1lcmdlIHRoZSBQYXRyaWNlIHYz
IHByb3Bvc2FsIGZpcnN0IG9uIG1hc3RlciBicmFuY2ggZm9yDQo+IHYyMDIwLjA0IHJlbGVhc2Ug
KGhlIGp1c3QgYWxpZ24gdGhlIHJlc2VydmVkIG1lbW9yeSBmb3IgYm9vdHN0YWdlKSwgYW5kIGFm
dGVyIEkNCj4gbWFrZSBteSBwYXRjaCAoMTYtYnl0ZSBhbGlnbiBhbGwgcmVzZXJ2ZWQgYXJlYSku
DQo+IA0KPiBvciBpdCBpcyBiZXR0ZXIgdG8gbWFrZSBhIG1vcmUgZ2VuZXJpYyBwYXRjaCB2NCB0
byByZXBsYWNlIHRoZSBQYXRyaWNlIG9uZS4NCg0KSSBwdXNoIGEgIHNlcmllLCB3aXRoIG15IHBy
b3Bvc2FsOg0KWzMvM10gYm9hcmRfZi5jOiBJbnN1cmUgMTYgYWxpZ25tZW50IG9mIHN0YXJ0X2Fk
ZHJfc3AgYW5kIHJlc2VydmVkIG1lbW9yeQ0KDQpodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC91Ym9vdC9saXN0Lz9zZXJpZXM9MTUyMjI2DQoNCkFzIEkgZm91bmQgaXNzdWUgZm9y
IEFSTTMyIChJIG5lZWQgdG8gbW9kaWZ5IGFyY2gvYXJtL2xpYi9jcnQwLlMpDQpJIHRoaW5rIGl0
IGlzIHByZWZlcmFibGUgdGhhdCB0aGUgUGF0cmljZSBQYXRjaCBpcyBtZXJnZWQgaW4gdjIwMjAu
MDQsIGFuZCBteSBzZXJpZSBjYW4gbGl2ZSAgaW5kZXBlbmRlbnRseS4NCkJ1dCBJIGNhbiBhbHNv
IHNxdWFzaCBvZiB0aGUgMiBzZXJpZXMuDQogDQpSZWdhcmRzDQpQYXRyaWNrDQoNCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFp
bGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3Rt
MzIK

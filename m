Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C77DA1325A7
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Jan 2020 13:07:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67546C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Jan 2020 12:07:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F513C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2020 12:07:41 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 007C3ekM007942; Tue, 7 Jan 2020 13:07:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=o38p/9NcgmrVDPMltjrXQaAiuQNbr8XA8aB7UdNjp4s=;
 b=0Uy+yiWIghKUKbP6Tvata1Do78Ff2BY3HDVkRtsCsvO7hCl29fTyLvGMmbYS9H1JsVP2
 ZuPaGracqTDQhqBktZsK4DULmskAvWwFBBfA6ODGrqsizOlzAjOFfHrfV3p4ezE8Y5pu
 gCGiqiI/68vCtoh4hI9A0hGTmnwFWLU7CKfUsOVbcOfz7hoYKn+T2dZhHWSK9bHXTqoL
 tV+LfU6PbUA8G4k/PUQy8f6K6zgxcpF8MRnVXNaurIajQ3F3tUkIKPCoWaGchnrnSCwL
 t9fRFtVpzC/xyU4YxRfP95mVCOubyzpAX/ZYcFvput72vH9wwwcj9c9N6ieTtQ+c+1KD PQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2xakkap2ee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jan 2020 13:07:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DB51310002A;
 Tue,  7 Jan 2020 13:07:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE6ED2AEA74;
 Tue,  7 Jan 2020 13:07:24 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 13:07:24 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 7 Jan 2020 13:07:24 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>, Tom Rini <trini@konsulko.com>
Thread-Topic: [PATCH v3] board_f.c: Insure gd->new_bootstage	alignment
Thread-Index: AdXFUeZcON90i5hYRYmBZ1BXivHD+A==
Date: Tue, 7 Jan 2020 12:07:24 +0000
Message-ID: <ce453f43d50442a48588ba3a1004fd9b@SFHDAG6NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-07_03:2020-01-06,2020-01-07 signatures=0
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

SGkgUGF0cmljZSBhbmQgVG9tDQoNCj4gU2VudDogbWVyY3JlZGkgMTggZMOpY2VtYnJlIDIwMTkg
MTA6MTANCj4gDQo+IEhpIFNpbW9uLA0KPiANCj4gPiBGcm9tOiBTaW1vbiBHbGFzcyA8c2pnQGNo
cm9taXVtLm9yZz4NCj4gPiBTZW50OiBtYXJkaSAxNyBkw6ljZW1icmUgMjAxOSAxNjo0Ng0KPiA+
DQo+ID4gSGkgUGF0cmljZSwNCj4gPg0KPiA+IE9uIFdlZCwgMjcgTm92IDIwMTkgYXQgMDI6MTEs
IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4NCj4gd3JvdGU6DQo+ID4g
Pg0KPiA+ID4gSW4gcmVzZXJ2ZV9ib290c3RhZ2UoKSwgaW4gY2FzZSBzaXplIGlzIG9kZCwgZ2Qt
Pm5ld19ib290c3RhZ2UgaXMNCj4gPiA+IG5vdCBhbGlnbmVkLiBJbiBib290c3RhZ2VfcmVsb2Nh
dGUoKSwgdGhlIHBsYXRmb3JtIGhhbmdzIHdoZW4NCj4gPiA+IGdldHRpbmcgYWNjZXNzIHRvIGRh
dGEtPnJlY29yZFtpXS5uYW1lLg0KPiA+ID4gVG8gYXZvaWQgdGhpcyBpc3N1ZSwgbWFrZSBnZC0+
bmV3X2Jvb3RzdGFnZSAxNiBieXRlIGFsaWduZWQuDQo+ID4gPg0KPiA+ID4gVG8gaW5zdXJlIHRo
YXQgbmV3X2Jvb3RzdGFnZSBpcyAxNiBieXRlIGFsaWduZWQgKGF0IGxlYXN0IG5lZWRlZCBmb3IN
Cj4gPiA+IHg4Nl82NCBhbmQgQVJNdjgpIGFuZCBuZXdfYm9vdHN0YWdlIHN0YXJ0cyBkb3duIHRv
IGdldCBlbm91Z2ggc3BhY2UsDQo+ID4gPiBBTElHTl9ET1dOIG1hY3JvIGlzIHVzZWQuDQo+ID4g
Pg0KPiA+ID4gRml4ZXM6IGFjOWNkNDgwNWM4YiAoImJvb3RzdGFnZTogQ29ycmVjdCByZWxvY2F0
aW9uIGFsZ29yaXRobSIpDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90
YXJkIDxwYXRyaWNlLmNob3RhcmRAc3QuY29tPg0KPiA+ID4gUmV2aWV3ZWQtYnk6IFZpa2FzIE1B
Tk9DSEEgPHZpa2FzLm1hbm9jaGFAc3QuY29tPg0KPiA+ID4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sg
RGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAc3QuY29tPg0KPiA+ID4gVGVzdGVkLWJ5OiBQYXRy
aWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4NCj4gDQo+IEZvciBpbmZvcm1h
dGlvbiwgUGF0cmljZSBpcyBhYnNlbnQgZm9yIHBlcnNvbmFsIHJlYXNvbiB1cCB0byBiZWdpbm5p
bmcgbmV4dCB5ZWFyLg0KPiBEb24ndCB3YWl0IGEgZmFzdCBhbnN3ZXIuDQo+IA0KPiA+IEZvciB0
aGlzIHBhdGNoIEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIHVwZGF0ZSByZXNlcnZlX2Zk
dCgpIHRvDQo+ID4ga2VlcCB0aGluZ3MgYWxpZ25lZCwgYXNzdW1pbmcgdGhhdCBpcyB0aGUgcHJv
YmxlbS4NCj4gDQo+IEkgZG9uJ3Qgc3VyZSB0aGF0IHNvbHZlIHRoZSBpc3N1ZSwNCj4gZm9yIG1l
IHRoZSBwcm9ibGVtIGlzIG9ubHkgZm9yIHRoZSBib290c3RhZ2Ugc3RydWN0IChnZC0+Ym9vdHN0
YWdlKSBBbmQNCj4gcmVzZXJ2ZV9mZHQoKSBhbHJlYWR5IGFsbGlnbmUgc2l6ZSBvbiAzMiBieXRl
cw0KPiANCj4gSWYgSSByZW1lbWJlciB0aGUgUGF0cmljZSBhbmFseXNpczoNCj4gDQo+IDEtIGJv
b3RzdGFnZV9nZXRfc2l6ZSByZXR1cm4gYSBvZGQgdmFsdWUgKG9yIGF0IGxlYXN0IG5vdCAxNiBi
eXRlcyBhbGlnbmVkIEkgZG9uJ3QNCj4gcmVtZW1iZXIpLg0KPiANCj4gMi0gSW4gcmVzZXJ2ZV9i
b290c3RhZ2UoKQ0KPiAJaW50IHNpemUgPSBib290c3RhZ2VfZ2V0X3NpemUoKTsNCj4gCWdkLT5z
dGFydF9hZGRyX3NwIC09IHNpemUNCj4gCT0+IGl0IGlzIGEgdW5hbGlnbmVkIGFkZHJlc3MgZXZl
biBpZiBnZC0+c3RhcnRfYWRkcl9zcCBpcyAzMiBieXRlcyBhbGxpZ25lZA0KPiANCj4gCWdkLT5u
ZXdfYm9vdHN0YWdlID0gbWFwX3N5c21lbShnZC0+c3RhcnRfYWRkcl9zcCwgc2l6ZSk7DQo+IAk9
PiBhbHNvIHVuYWxpZ25lZA0KPiANCj4gMy0gVGhlbiBkdXJpbmcgcmVsb2NhdGlvbiwgaW4gcmVs
b2NfYm9vdHN0YWdlKCkNCj4gCWdkLT5ib290c3RhZ2UgPSBnZC0+bmV3X2Jvb3RzdGFnZTsNCj4g
DQo+IA0KPiA0LSBjcmFzaCBvY2N1ciBiZWNhdXNlIGluIG5leHQgYm9vdHN0YWdlIGZ1bmN0aW9u
IGJlYXVjc2UgdGhlIGJvb3N0YWdlIGFkZHJlc3MNCj4gZG9uJ3QgcmVzcGVjdCBwb2ludGVyIHRv
IHN0cnVjdCBhbGxpZ25lbWVudC4uLg0KPiANCj4gCXN0cnVjdCBib290c3RhZ2VfZGF0YSAqZGF0
YSA9IGdkLT5ib290c3RhZ2UNCj4gDQo+IA0KPiA+IEF0IHNvbWUgcG9pbnQgd2Ugc2hvdWxkIGFs
c28gZG9jdW1lbnQgdGhhdCByZXNlcnZhdGlvbnMgbXVzdCBrZWVwDQo+ID4gdGhpbmdzIGFsaWdu
ZWQuDQo+ID4NCj4gPiBQZXJoYXBzIHRoaXMgc2hvdWxkIGJlIGhhbmRsZWQgYnkgYSBzZXBhcmF0
ZSBmdW5jdGlvbiBjYWxsZWQgZnJvbSBhbGwNCj4gPiB0aGVzZSBwbGFjZXMsIHdoaWNoIHN1YnRy
YWN0cyBnZC0+c3RhcnRfYWRkcl9zcCBhbmQgZW5zdXJlcyAxNi1ieXRlIGFsaWdubWVudC4NCj4g
DQo+IFllcyB0aGF0IGNhbiBiZSBhIGltcHJvdmVtZW50LCAgYnV0IHBlcmhhcHMgaWEgYSBzZWNv
bmQgc3RlcCAvIHNlY29uZCBzZXJpZS4uLi4NCj4gDQo+IERvIHlvdSB0aGluayBhYm91dCBhIGZ1
bmN0aW9uIGNhbGxlZCBpbiBhbGwgcmV2ZXJzZWRfIGZ1bmN0aW9ucyAod2hlbiBzdGFydF9hZGRy
X3NwDQo+IGlzIG1vZGlmaWVkKS4uLg0KPiANCj4gc3RhdGljIGludCByZXNlcnZlZF9hbGxpZ25f
Y2hlY2sodm9pZCkNCj4gew0KPiAJLyogbWFrZSBzdGFjayBwb2ludGVyIDE2LWJ5dGUgYWxpZ25l
ZCAqLw0KPiAJaWYgKGdkLT5zdGFydF9hZGRyX3NwICYgMHhmKSB7DQo+IAkJZ2QtPnN0YXJ0X2Fk
ZHJfc3AgLT0gMTY7DQo+IAkJZ2QtPnN0YXJ0X2FkZHJfc3AgJj0gfjB4ZjsNCj4gCSB9DQo+IH0N
Cj4gDQo+IEkgcHJlZmVyIGEgZnVuY3Rpb24gdG8gcmVzZXJ2ZWQgYSBzaXplIHdpY2ggcmVwbGFj
ZSBpbiBhbnkgcmVzZXJ2ZV8gZnVuY3Rpb24gIHRoZSBsaW5lDQo+IDoNCj4gCWdkLT5zdGFydF9h
ZGRyX3NwIC09IC4uLg0KPiANCj4gLyogcmVzZXJ2ZSBzaXplIGFuZCBtYWtlIHN0YWNrIHBvaW50
ZXIgMTYtYnl0ZSBhbGlnbmVkICovDQo+ICBzdGF0aWMgaW50IHJlc2VydmUoc2l6ZV90IHNpemUp
IHsNCj4gCWdkLT5zdGFydF9hZGRyX3NwIC09IHNpemU7DQo+IAkvKiBtYWtlIHN0YWNrIHBvaW50
ZXIgMTYtYnl0ZSBhbGlnbmVkICovDQo+IAlnZC0+c3RhcnRfYWRkcl9zcCA9IEFMSUdOX0RPV04o
Z2QtPnN0YXJ0X2FkZHJfc3AsIDE2KTsNCj4gfQ0KPiANCj4gSSB0aGluayBJIHdpbGwgcHVzaCBp
dCwgd2hlbiB0aGUgcGF0cmljZSBwYXRjaCB3aWxsIGJlIGFjY2VwdGVkLg0KDQpJIGFtIHByZXBh
cmluZyB0aGlzIHBhdGNoLi4uLiANCg0KRG8geW91IHRoaW5rIGl0IGlzIG9rIHRvIG1lcmdlIHRo
ZSBQYXRyaWNlIHYzIHByb3Bvc2FsIGZpcnN0IG9uIG1hc3RlciBicmFuY2gNCmZvciB2MjAyMC4w
NCByZWxlYXNlIChoZSBqdXN0IGFsaWduIHRoZSByZXNlcnZlZCBtZW1vcnkgZm9yIGJvb3RzdGFn
ZSksDQphbmQgYWZ0ZXIgSSBtYWtlIG15IHBhdGNoICgxNi1ieXRlIGFsaWduIGFsbCByZXNlcnZl
ZCBhcmVhKS4NCg0Kb3IgaXQgaXMgYmV0dGVyIHRvIG1ha2UgYSBtb3JlIGdlbmVyaWMgcGF0Y2gg
djQgdG8gcmVwbGFjZSB0aGUgUGF0cmljZSBvbmUuDQoNClJlZ2FyZHMNClBhdHJpY2sNCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIg
bWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qt
c3RtMzIK

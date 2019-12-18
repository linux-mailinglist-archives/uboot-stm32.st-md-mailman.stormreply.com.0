Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B724124270
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2019 10:10:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 111BDC36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2019 09:10:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2026DC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 09:10:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBI98aZ2008799; Wed, 18 Dec 2019 10:10:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Okj3lgJ5KqZsrswNpaGY+Pns7gR1fTbNSzib1nk4eyo=;
 b=gAtggdxS7javi+cNDgOROOgb6qPGOEk1QS3fQdDqcPVQwwQuLqoREqkpSCpw+USKojbd
 je943dCFdhX4TkjtQC/fvnDNm0N31Ygvyv/EkSImG0s1pWmgm7hodOBl/jBtS2eNQMMP
 k6jl4IyBvsh4ZcpfTXyX23LVngdfAUtUTD8yHUlHbSG0i/zFHvBPZV9kuOXiKHcP9HZf
 JNncppG44UySoyk7yY+JFEKjb0AYOXeYYDckXdeteKs3UBEWSkndgy+LdeoibpkAQJM2
 p4eM/gUewcc93fun2xd6H+0sG6I2VXB0YIqXOM2wfhOmqm3mAK4J8hWgKExvx/KviCky +w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wvnrekfha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 10:10:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 28EFD100038;
 Wed, 18 Dec 2019 10:10:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1667122082C;
 Wed, 18 Dec 2019 10:10:15 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Dec
 2019 10:10:14 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Dec 2019 10:10:14 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Glass <sjg@chromium.org>, Patrice CHOTARD <patrice.chotard@st.com>
Thread-Topic: [PATCH v3] board_f.c: Insure gd->new_bootstage alignment
Thread-Index: AQHVpQKuO35xYU0730Sul27V/xKK76e+h4KAgAErHKA=
Date: Wed, 18 Dec 2019 09:10:14 +0000
Message-ID: <125dd84d74934c97bb7aca1477972ec2@SFHDAG6NODE3.st.com>
References: <20191127091138.29223-1-patrice.chotard@st.com>
 <CAPnjgZ2kK+kSAxSQTF7sRJ3_rBti4+35uSU9hrXqbh=sEpcX+w@mail.gmail.com>
In-Reply-To: <CAPnjgZ2kK+kSAxSQTF7sRJ3_rBti4+35uSU9hrXqbh=sEpcX+w@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_02:2019-12-17,2019-12-18 signatures=0
Cc: Stephen Warren <swarren@nvidia.com>, Joe
 Hershberger <joe.hershberger@ni.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Trevor Woerner <trevor@toganlabs.com>, Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v3] board_f.c: Insure gd->new_bootstage
	alignment
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
bnQ6IG1hcmRpIDE3IGTDqWNlbWJyZSAyMDE5IDE2OjQ2DQo+IA0KPiBIaSBQYXRyaWNlLA0KPiAN
Cj4gT24gV2VkLCAyNyBOb3YgMjAxOSBhdCAwMjoxMSwgUGF0cmljZSBDaG90YXJkIDxwYXRyaWNl
LmNob3RhcmRAc3QuY29tPiB3cm90ZToNCj4gPg0KPiA+IEluIHJlc2VydmVfYm9vdHN0YWdlKCks
IGluIGNhc2Ugc2l6ZSBpcyBvZGQsIGdkLT5uZXdfYm9vdHN0YWdlIGlzIG5vdA0KPiA+IGFsaWdu
ZWQuIEluIGJvb3RzdGFnZV9yZWxvY2F0ZSgpLCB0aGUgcGxhdGZvcm0gaGFuZ3Mgd2hlbiBnZXR0
aW5nDQo+ID4gYWNjZXNzIHRvIGRhdGEtPnJlY29yZFtpXS5uYW1lLg0KPiA+IFRvIGF2b2lkIHRo
aXMgaXNzdWUsIG1ha2UgZ2QtPm5ld19ib290c3RhZ2UgMTYgYnl0ZSBhbGlnbmVkLg0KPiA+DQo+
ID4gVG8gaW5zdXJlIHRoYXQgbmV3X2Jvb3RzdGFnZSBpcyAxNiBieXRlIGFsaWduZWQgKGF0IGxl
YXN0IG5lZWRlZCBmb3INCj4gPiB4ODZfNjQgYW5kIEFSTXY4KSBhbmQgbmV3X2Jvb3RzdGFnZSBz
dGFydHMgZG93biB0byBnZXQgZW5vdWdoIHNwYWNlLA0KPiA+IEFMSUdOX0RPV04gbWFjcm8gaXMg
dXNlZC4NCj4gPg0KPiA+IEZpeGVzOiBhYzljZDQ4MDVjOGIgKCJib290c3RhZ2U6IENvcnJlY3Qg
cmVsb2NhdGlvbiBhbGdvcml0aG0iKQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBD
aG90YXJkIDxwYXRyaWNlLmNob3RhcmRAc3QuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBWaWthcyBN
QU5PQ0hBIDx2aWthcy5tYW5vY2hhQHN0LmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogUGF0cmljayBE
ZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBzdC5jb20+DQo+ID4gVGVzdGVkLWJ5OiBQYXRyaWNr
IERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4NCg0KRm9yIGluZm9ybWF0aW9uLCBQ
YXRyaWNlIGlzIGFic2VudCBmb3IgcGVyc29uYWwgcmVhc29uIHVwIHRvIGJlZ2lubmluZyBuZXh0
IHllYXIuDQpEb24ndCB3YWl0IGEgZmFzdCBhbnN3ZXIuDQoNCj4gRm9yIHRoaXMgcGF0Y2ggSSB0
aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gdXBkYXRlIHJlc2VydmVfZmR0KCkgdG8ga2VlcCB0
aGluZ3MNCj4gYWxpZ25lZCwgYXNzdW1pbmcgdGhhdCBpcyB0aGUgcHJvYmxlbS4NCg0KSSBkb24n
dCBzdXJlIHRoYXQgc29sdmUgdGhlIGlzc3VlLCANCmZvciBtZSB0aGUgcHJvYmxlbSBpcyBvbmx5
IGZvciB0aGUgYm9vdHN0YWdlIHN0cnVjdCAoZ2QtPmJvb3RzdGFnZSkNCkFuZCByZXNlcnZlX2Zk
dCgpIGFscmVhZHkgYWxsaWduZSBzaXplIG9uIDMyIGJ5dGVzDQoNCklmIEkgcmVtZW1iZXIgdGhl
IFBhdHJpY2UgYW5hbHlzaXM6DQoNCjEtIGJvb3RzdGFnZV9nZXRfc2l6ZSByZXR1cm4gYSBvZGQg
dmFsdWUgKG9yIGF0IGxlYXN0IG5vdCAxNiBieXRlcyBhbGlnbmVkIEkgZG9uJ3QgcmVtZW1iZXIp
Lg0KDQoyLSBJbiByZXNlcnZlX2Jvb3RzdGFnZSgpDQoJaW50IHNpemUgPSBib290c3RhZ2VfZ2V0
X3NpemUoKTsNCglnZC0+c3RhcnRfYWRkcl9zcCAtPSBzaXplDQoJPT4gaXQgaXMgYSB1bmFsaWdu
ZWQgYWRkcmVzcyBldmVuIGlmIGdkLT5zdGFydF9hZGRyX3NwIGlzIDMyIGJ5dGVzIGFsbGlnbmVk
DQoNCglnZC0+bmV3X2Jvb3RzdGFnZSA9IG1hcF9zeXNtZW0oZ2QtPnN0YXJ0X2FkZHJfc3AsIHNp
emUpOw0KCT0+IGFsc28gdW5hbGlnbmVkDQoNCjMtIFRoZW4gZHVyaW5nIHJlbG9jYXRpb24sIGlu
IHJlbG9jX2Jvb3RzdGFnZSgpDQoJZ2QtPmJvb3RzdGFnZSA9IGdkLT5uZXdfYm9vdHN0YWdlOw0K
DQoNCjQtIGNyYXNoIG9jY3VyIGJlY2F1c2UgaW4gbmV4dCBib290c3RhZ2UgZnVuY3Rpb24gYmVh
dWNzZSB0aGUgYm9vc3RhZ2UgYWRkcmVzcyBkb24ndCByZXNwZWN0IHBvaW50ZXIgdG8gc3RydWN0
IGFsbGlnbmVtZW50Li4uDQoNCglzdHJ1Y3QgYm9vdHN0YWdlX2RhdGEgKmRhdGEgPSBnZC0+Ym9v
dHN0YWdlDQoNCg0KPiBBdCBzb21lIHBvaW50IHdlIHNob3VsZCBhbHNvIGRvY3VtZW50IHRoYXQg
cmVzZXJ2YXRpb25zIG11c3Qga2VlcCB0aGluZ3MNCj4gYWxpZ25lZC4NCj4gDQo+IFBlcmhhcHMg
dGhpcyBzaG91bGQgYmUgaGFuZGxlZCBieSBhIHNlcGFyYXRlIGZ1bmN0aW9uIGNhbGxlZCBmcm9t
IGFsbCB0aGVzZQ0KPiBwbGFjZXMsIHdoaWNoIHN1YnRyYWN0cyBnZC0+c3RhcnRfYWRkcl9zcCBh
bmQgZW5zdXJlcyAxNi1ieXRlIGFsaWdubWVudC4NCg0KWWVzIHRoYXQgY2FuIGJlIGEgaW1wcm92
ZW1lbnQsICBidXQgcGVyaGFwcyBpYSBhIHNlY29uZCBzdGVwIC8gc2Vjb25kIHNlcmllLi4uLg0K
DQpEbyB5b3UgdGhpbmsgYWJvdXQgYSBmdW5jdGlvbiBjYWxsZWQgaW4gYWxsIHJldmVyc2VkXyBm
dW5jdGlvbnMgKHdoZW4gc3RhcnRfYWRkcl9zcCBpcyBtb2RpZmllZCkuLi4NCg0Kc3RhdGljIGlu
dCByZXNlcnZlZF9hbGxpZ25fY2hlY2sodm9pZCkNCnsNCgkvKiBtYWtlIHN0YWNrIHBvaW50ZXIg
MTYtYnl0ZSBhbGlnbmVkICovDQoJaWYgKGdkLT5zdGFydF9hZGRyX3NwICYgMHhmKSB7DQoJCWdk
LT5zdGFydF9hZGRyX3NwIC09IDE2Ow0KCQlnZC0+c3RhcnRfYWRkcl9zcCAmPSB+MHhmOw0KCSB9
DQp9DQoNCkkgcHJlZmVyIGEgZnVuY3Rpb24gdG8gcmVzZXJ2ZWQgYSBzaXplIHdpY2ggcmVwbGFj
ZSBpbiBhbnkgcmVzZXJ2ZV8gZnVuY3Rpb24gIHRoZSBsaW5lIDogDQoJZ2QtPnN0YXJ0X2FkZHJf
c3AgLT0gLi4uDQoNCi8qIHJlc2VydmUgc2l6ZSBhbmQgbWFrZSBzdGFjayBwb2ludGVyIDE2LWJ5
dGUgYWxpZ25lZCAqLw0Kc3RhdGljIGludCByZXNlcnZlKHNpemVfdCBzaXplKQ0Kew0KCWdkLT5z
dGFydF9hZGRyX3NwIC09IHNpemU7DQoJLyogbWFrZSBzdGFjayBwb2ludGVyIDE2LWJ5dGUgYWxp
Z25lZCAqLw0KCWdkLT5zdGFydF9hZGRyX3NwID0gQUxJR05fRE9XTihnZC0+c3RhcnRfYWRkcl9z
cCwgMTYpOw0KfQ0KDQpJIHRoaW5rIEkgd2lsbCBwdXNoIGl0LCB3aGVuIHRoZSBwYXRyaWNlIHBh
dGNoIHdpbGwgYmUgYWNjZXB0ZWQuDQoNCj4gUmVnYXJkcywNCj4gU2ltb24NCg0KUmVnYXJkcw0K
UGF0cmljaw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vdWJvb3Qtc3RtMzIK

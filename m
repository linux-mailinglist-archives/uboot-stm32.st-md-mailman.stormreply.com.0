Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD628288F57
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Oct 2020 19:01:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AEDDC32EA7
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Oct 2020 17:01:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B995C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Oct 2020 17:01:27 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 099Gmus1019623; Fri, 9 Oct 2020 19:00:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=GnP9rmY4hs7BCTJ78zNpeSCcRzGCZ4htBuKrboa4qTE=;
 b=jyv7NypnIR1oB1BwObaN+r/iJyIxWJL8ywNqUzU28YJxHYMLPhwFzLAaramacUAO1LJz
 JCtKGVJZY2sLbgNGy1BsAJ+z2oFJlEtH7jDHuy/yWEmA7sMzjF5rWMhIEhhxlq30LwAj
 hiXIG1Dpe2b2QpsJFlKE7pWe8XbwEIrlWF0vRpZvQua5cY8iDCl9iQsbAbo62kdsq7MB
 +7ERSvV6aJv+WkQt0zHgy0H8tKPebGVXOVV5EovdWTl1k/3CO46oMf9A5mTOKFJvExFi
 bzFZwBPRbTik7TJ+xPZsBDSW3Uz6j4LTMSuLSn/h2DSR1dPlecvPW0TJoJFign4prA6Y vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3429j8njry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Oct 2020 19:00:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9897F10002A;
 Fri,  9 Oct 2020 19:00:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 66E0B2AF7A6;
 Fri,  9 Oct 2020 19:00:45 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 9 Oct
 2020 19:00:45 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Fri, 9 Oct 2020 19:00:45 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Ard Biesheuvel <ardb@kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Thread-Topic: [Uboot-stm32] [PATCH 0/7] arm: cache: cp15: don't map reserved
 region with no-map property
Thread-Index: AQHWm/7ac4z1MnZQC0SdlnxnUjIJ4amLzyQAgAAP6YCAAAgkgIAAF0GAgANztwA=
Date: Fri, 9 Oct 2020 17:00:44 +0000
Message-ID: <f629253d8c92446ca1d33a25058c1676@SFHDAG2NODE3.st.com>
References: <20201006163602.21687-1-patrick.delaunay@st.com>
 <CAMj1kXET8=ERg7gGqWa-FwLZzAuztBsVMhyTGmYEMAxzb63_sw@mail.gmail.com>
 <190d019a-7e18-b4bc-9276-e14bbe4c2855@pengutronix.de>
 <258ba4fa-8d1e-56be-e0de-2d6c09812c13@pengutronix.de>
 <CAMj1kXFoJx7henE0FbSXzsATH4z4Xg8EfJkc+ki7=i33cz3Vew@mail.gmail.com>
In-Reply-To: <CAMj1kXFoJx7henE0FbSXzsATH4z4Xg8EfJkc+ki7=i33cz3Vew@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-09_09:2020-10-09,
 2020-10-09 signatures=0
Cc: chenshuo <chenshuo@eswin.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "marek.bykowski@gmail.com" <marek.bykowski@gmail.com>,
 Stefan Roese <sr@denx.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Rajesh Ravi <rajesh.ravi@broadcom.com>,
 Thirupathaiah Annapureddy <thiruan@linux.microsoft.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Etienne
 Carriere <etienne.carriere@linaro.org>, U-Boot
 Mailing List <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>, Tero
 Kristo <t-kristo@ti.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Bin Meng <bmeng.cn@gmail.com>, =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH 0/7] arm: cache: cp15: don't map reserved
 region with no-map property
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

SGkgQXJkLA0KDQo+IEZyb206IEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+DQo+IFNl
bnQ6IG1lcmNyZWRpIDcgb2N0b2JyZSAyMDIwIDE1OjE2DQo+IA0KPiBPbiBXZWQsIDcgT2N0IDIw
MjAgYXQgMTM6NTMsIEFobWFkIEZhdG91bSA8YS5mYXRvdW1AcGVuZ3V0cm9uaXguZGU+IHdyb3Rl
Og0KPiA+DQo+ID4gSGVsbG8sDQo+ID4NCj4gPiBPbiAxMC83LzIwIDE6MjMgUE0sIEFobWFkIEZh
dG91bSB3cm90ZToNCj4gPiA+IE15IGZpbmRpbmdzWzFdIGJhY2sgdGhlbiB3ZXJlIHRoYXQgVS1C
b290IGRpZCBzZXQgdGhlIGVYZWN1dGUgTmV2ZXINCj4gPiA+IGJpdCBvbmx5IG9uIE9NQVAsIGJ1
dCBub3QgZm9yIG90aGVyIHBsYXRmb3Jtcy4gIFNvIEkgY291bGQgaW1hZ2luZQ0KPiA+ID4gdGhp
cyBiZWluZyB0aGUgcm9vdCBjYXVzZSBvZiBQYXRyaWNrJ3MgaXNzdWVzIGFzIHdlbGw6DQo+ID4N
Cj4gPiBSZXJlYWRpbmcgbXkgb3duIGxpbmssIG15IG1lbW9yeSBpcyBhIGxpdHRsZSBsZXNzIGZ1
enp5OiBlWGVjdXRlIE5ldmVyDQo+ID4gd2FzIGJlaW5nIHNldCwgYnV0IHdhcyB3aXRob3V0IGVm
ZmVjdCBkdWUgTWFuYWdlciBtb2RlIGJlaW5nIHNldCBpbiB0aGUNCj4gREFDUjoNCj4gPg0KPiA+
ID4gVGhlIEFSTSBBcmNoaXRlY3R1cmUgUmVmZXJlbmNlIE1hbnVhbCBub3Rlc1sxXToNCj4gPiA+
ID4gV2hlbiB1c2luZyB0aGUgU2hvcnQtZGVzY3JpcHRvciB0cmFuc2xhdGlvbiB0YWJsZSBmb3Jt
YXQsIHRoZSBYTg0KPiA+ID4gPiBhdHRyaWJ1dGUgaXMgbm90IGNoZWNrZWQgZm9yIGRvbWFpbnMg
bWFya2VkIGFzIE1hbmFnZXIuDQo+ID4gPiA+IFRoZXJlZm9yZSwgdGhlIHN5c3RlbSBtdXN0IG5v
dCBpbmNsdWRlIHJlYWQtc2Vuc2l0aXZlIG1lbW9yeSBpbg0KPiA+ID4gPiBkb21haW5zIG1hcmtl
ZCBhcyBNYW5hZ2VyLCBiZWNhdXNlIHRoZSBYTiBiaXQgZG9lcyBub3QgcHJldmVudA0KPiA+ID4g
PiBzcGVjdWxhdGl2ZSBmZXRjaGVzIGZyb20gYSBNYW5hZ2VyIGRvbWFpbi4NCj4gPg0KPiA+ID4g
VG8gYXZvaWQgc3BlY3VsYXRpdmUgYWNjZXNzIHRvIHJlYWQtc2Vuc2l0aXZlIG1lbW9yeS1tYXBw
ZWQNCj4gPiA+IHBlcmlwaGVyYWxzIG9uIEFSTXY3LCB3ZSdsbCBuZWVkIFUtQm9vdCB0byB1c2Ug
Y2xpZW50IGRvbWFpbg0KPiA+ID4gcGVybWlzc2lvbnMsIHNvIHRoZSBYTiBiaXQgY2FuIGZ1bmN0
aW9uLg0KPiA+DQo+ID4gPiBUaGlzIGlzc3VlIGhhcyBjb21lIHVwIGJlZm9yZSBhbmQgd2FzIGZp
eGVkIGluIGRlNjNhYzI3OA0KPiA+ID4gKCJBUk06IG1tdTogU2V0IGRvbWFpbiBwZXJtaXNzaW9u
cyB0byBjbGllbnQgYWNjZXNzIikgZm9yIE9NQVAyIG9ubHkuDQo+ID4gPiBJdCdzIGVxdWFsbHkg
YXBwbGljYWJsZSB0byBhbGwgQVJNdjctQSBwbGF0Zm9ybXMgd2hlcmUgY2FjaGVzIGFyZQ0KPiA+
ID4gZW5hYmxlZC4NCj4gPiA+IFsxXTogQjMuNy4yIC0gRXhlY3V0ZS1uZXZlciByZXN0cmljdGlv
bnMgb24gaW5zdHJ1Y3Rpb24gZmV0Y2hpbmcNCj4gPg0KPiA+IEhvcGUgdGhpcyBoZWxwcywNCj4g
PiBBaG1hZA0KPiA+DQo+IA0KPiBJdCBtb3N0IGRlZmluaXRlbHkgZG9lcywgdGhhbmtzIGEgbG90
Lg0KPiANCj4gVS1ib290J3MgbW11X3NldHVwKCkgY3VycmVudGx5IHNldHMgREFDUiB0byBtYW5h
Z2VyIGZvciBhbGwgZG9tYWlucywgc28gdGhpcyBpcw0KPiBicm9rZW4gZm9yIGFsbCBub24tTFBB
RSBjb25maWd1cmF0aW9ucyBydW5uaW5nIG9uIHY3IENQVXMgKGV4Y2VwdCBPTUFQIGFuZA0KPiBw
ZXJoYXBzIG90aGVycyB0aGF0IGZpeGVkIGl0IGluZGl2aWR1YWxseSkuIFRoaXMgYWZmZWN0cyBh
bGwgZGV2aWNlIG1hcHBpbmdzOiBub3QganVzdA0KPiBzZWN1cmUgRFJBTSBmb3IgT1AtVEVFLCBi
dXQgYW55IE1NSU8gcmVnaXN0ZXIgZm9yIGFueSBwZXJpcGhlcmFsIHRoYXQgaXMNCj4gbWFwcGVk
IGludG8gdGhlIENQVSdzIGFkZHJlc3Mgc3BhY2UuDQo+IA0KPiBQYXRyaWNrLCBjb3VsZCB5b3Ug
cGxlYXNlIGNoZWNrIHdoZXRoZXIgdGhpcyBmaXhlcyB0aGUgaXNzdWUgYXMgd2VsbD8NCj4gDQo+
IC0tLSBhL2FyY2gvYXJtL2xpYi9jYWNoZS1jcDE1LmMNCj4gKysrIGIvYXJjaC9hcm0vbGliL2Nh
Y2hlLWNwMTUuYw0KPiBAQCAtMjAyLDkgKzIwMiw5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBtbXVf
c2V0dXAodm9pZCkNCj4gICAgICAgICBhc20gdm9sYXRpbGUoIm1jciBwMTUsIDAsICUwLCBjMiwg
YzAsIDAiDQo+ICAgICAgICAgICAgICAgICAgICAgIDogOiAiciIgKGdkLT5hcmNoLnRsYl9hZGRy
KSA6ICJtZW1vcnkiKTsgICNlbmRpZg0KPiAtICAgICAgIC8qIFNldCB0aGUgYWNjZXNzIGNvbnRy
b2wgdG8gYWxsLXN1cGVydmlzb3IgKi8NCj4gKyAgICAgICAvKiBTZXQgdGhlIGFjY2VzcyBjb250
cm9sIHRvIGNsaWVudCAoMGIwMSkgZm9yIGVhY2ggb2YgdGhlIDE2DQo+ICsgZG9tYWlucyAqLw0K
PiAgICAgICAgIGFzbSB2b2xhdGlsZSgibWNyIHAxNSwgMCwgJTAsIGMzLCBjMCwgMCINCj4gLSAg
ICAgICAgICAgICAgICAgICAgOiA6ICJyIiAofjApKTsNCj4gKyAgICAgICAgICAgICAgICAgICAg
OiA6ICJyIiAoMHg1NTU1NTU1NSkpOw0KPiANCj4gICAgICAgICBhcm1faW5pdF9kb21haW5zKCk7
DQoNClRoZSB0ZXN0IHdpbGwgdGFrZSBzb21lIHRpbWUgdG8gYmUgc3VyZSB0aGF0IHNvbHZlIG15
IHJlbWFpbmluZyBpc3N1ZSBiZWNhdXNlICBpc3N1ZSBpcyBub3QgYWx3YXlzIHJlcHJvZHVjdGli
bGUuDQoNCkF0IGZpc3QgY2hlaywgSSB3YXNuJ3Qgc3VyZSBvZiBEQUNSIGJhaGF2aW9yLCBidXQg
SSBmb3VuZCBpbiBbMV0gdGhlIGxpbmUgOg0KDQoJVGhlIFhOIGF0dHJpYnV0ZSBpcyBub3QgY2hl
Y2tlZCBmb3IgZG9tYWlucyBtYXJrZWQgYXMgTWFuYWdlci4gUmVhZC1zZW5zaXRpdmUgbWVtb3J5
IG11c3QNCglub3QgYmUgaW5jbHVkZWQgaW4gZG9tYWlucyBtYXJrZWQgYXMgTWFuYWdlciwgYmVj
YXVzZSB0aGUgWE4gYml0IGRvZXMgbm90IHByZXZlbnQgcHJlZmV0Y2hlcw0KCWluIHRoZXNlIGNh
c2VzLg0KDQpTbywgSSBuZWVkICB0byB0ZXN0IHlvdXIgcGF0Y2ggKyAgRENBQ0hFX09GRiBpbnN0
ZWFkIG9mIElOVkFMSUQgDQoodG8gbWFwIHdpdGggWE4gdGhlIE9QLVRFRSByZWdpb24pIGluIG15
IHBhdGNoc2V0Lg0KDQpGWUk6IEkgZm91bmQgdGhlIHNhbWUgREFDUiBjb25maWd1cmF0aW9uIGlz
IGRvbmUgaW46DQoJYXJjaC9hcm0vY3B1L2FybXY3L2xzMTAyeGEvY3B1LmM6MTk5DQoNClsxXSBo
dHRwczovL2RldmVsb3Blci5hcm0uY29tL2RvY3VtZW50YXRpb24vZGRpMDQwNi9iL1N5c3RlbS1M
ZXZlbC1BcmNoaXRlY3R1cmUvVmlydHVhbC1NZW1vcnktU3lzdGVtLUFyY2hpdGVjdHVyZS0tVk1T
QS0vTWVtb3J5LWFjY2Vzcy1jb250cm9sL1RoZS1FeGVjdXRlLU5ldmVyLS1YTi0tYXR0cmlidXRl
LWFuZC1pbnN0cnVjdGlvbi1wcmVmZXRjaGluZz9sYW5nPWVuDQoNClBhdHJpY2sNCg0KRm9yIGlu
Zm9ybWF0aW9uOg0KDQpBdCB0aGUgYmVnaW5uaW5nIEkgd2Fzbid0IHN1cmUgdGhhdCB0aGUgY3Vy
cmVudCBEQUNSIGNvbmZpZ3VyYXRpb24gaXMgYW4gaXNzdWUgYmVjYXVzZSBpbiBmb3VuZA0KaW4g
cHNldWRvIGNvZGUgb2YgIERESTA0MDZCX2FybV9hcmNoaXRlY3R1cmVfcmVmZXJlbmNlX21hbnVh
bF9lcnJhdGFfbWFya3VwXzhfMC5wZGYNCg0KQjMuMTMuMyBBZGRyZXNzIHRyYW5zbGF0aW9uDQoJ
aWYgQ2hlY2tEb21haW4odGxicmVjb3JkLmRvbWFpbiwgbXZhLCB0bGJyZWNvcmQuc2VjdGlvbm5v
dHBhZ2UsIGlzd3JpdGUpIHRoZW4NCgkJQ2hlY2tQZXJtaXNzaW9uKHRsYnJlY29yZC5wZXJtcywg
bXZhLCB0bGJyZWNvcmQuc2VjdGlvbm5vdHBhZ2UsIGlzd3JpdGUsIGlzcHJpdik7DQoNCkIzLjEz
LjQgRG9tYWluIGNoZWNraW5nDQoJYm9vbGVhbiBDaGVja0RvbWFpbihiaXRzKDQpIGRvbWFpbiwg
Yml0cygzMikgbXZhLCBib29sZWFuIHNlY3Rpb25ub3RwYWdlLCBib29sZWFuIGlzd3JpdGUpDQoJ
CWJpdHBvcyA9IDIqVUludChkb21haW4pOw0KCQljYXNlIERBQ1I8Yml0cG9zKzE6Yml0cG9zPiBv
Zg0KCQkJd2hlbiDigJgwMOKAmSBEYXRhQWJvcnQobXZhLCBkb21haW4sIHNlY3Rpb25ub3RwYWdl
LCBpc3dyaXRlLCBEQWJvcnRfRG9tYWluKTsNCgkJCXdoZW4g4oCYMDHigJkgcGVybWlzc2lvbmNo
ZWNrID0gVFJVRTsNCgkJCXdoZW4g4oCYMTDigJkgVU5QUkVESUNUQUJMRTsNCgkJCXdoZW4g4oCY
MTHigJkgcGVybWlzc2lvbmNoZWNrID0gRkFMU0U7DQoJCXJldHVybiBwZXJtaXNzaW9uY2hlY2s7
DQoNCkIyLjQuOCBBY2Nlc3MgcGVybWlzc2lvbiBjaGVja2luZw0KCS8vIENoZWNrUGVybWlzc2lv
bigpDQoJLy8gPT09PT09PT09PT09PT09PT0NCglDaGVja1Blcm1pc3Npb24oUGVybWlzc2lvbnMg
cGVybXMsIGJpdHMoMzIpIG12YSwNCgkJYm9vbGVhbiBzZWN0aW9ubm90cGFnZSwgYml0cyg0KSBk
b21haW4sIGJvb2xlYW4gaXN3cml0ZSwgYm9vbGVhbiBpc3ByaXYpDQoNCgkJaWYgU0NUTFIuQUZF
ID09IOKAmDDigJkgdGhlbg0KCQkJcGVybXMuYXA8MD4gPSDigJgx4oCZOw0KCQkJY2FzZSBwZXJt
cy5hcCBvZg0KCQkJCXdoZW4g4oCYMDAw4oCZIGFib3J0ID0gVFJVRTsNCgkJCQl3aGVuIOKAmDAw
MeKAmSBhYm9ydCA9ICFpc3ByaXY7DQoJCQkJd2hlbiDigJgwMTDigJkgYWJvcnQgPSAhaXNwcml2
ICYmIGlzd3JpdGU7DQoJCQkJd2hlbiDigJgwMTHigJkgYWJvcnQgPSBGQUxTRTsNCgkJCQl3aGVu
IOKAmDEwMOKAmSBVTlBSRURJQ1RBQkxFOw0KCQkJCXdoZW4g4oCYMTAx4oCZIGFib3J0ID0gIWlz
cHJpdiB8fCBpc3dyaXRlOw0KCQkJCXdoZW4g4oCYMTEw4oCZIGFib3J0ID0gaXN3cml0ZTsNCgkJ
CQl3aGVuIOKAmDExMeKAmQ0KCQkJaWYgTWVtb3J5U3lzdGVtQXJjaGl0ZWN0dXJlKCkgPT0gTWVt
QXJjaF9WTVNBIHRoZW4NCgkJCQlhYm9ydCA9IGlzd3JpdGUNCgkJCWVsc2UNCgkJCQlVTlBSRURJ
Q1RBQkxFOw0KCQkJaWYgYWJvcnQgdGhlbg0KCQkJCURhdGFBYm9ydChtdmEsIGRvbWFpbiwgc2Vj
dGlvbm5vdHBhZ2UsIGlzd3JpdGUsIERBYm9ydF9QZXJtaXNzaW9uKTsNCgkJCXJldHVybjsNCg0K
PT4gaXQgc2VlbnMgb25seSB0aGUgcmVhZC93cml0ZSBwZXJtaXNzaW9uIGlzIGNoZWNrZWQgaGVy
ZSAocGVybXMuYXApDQo9PiBwZXJtcy54biBpcyBub3QgdXNlZCBoZXJlDQoNCglhY2Nlc3NfY29u
dHJvbCA9IERSQUNSW3JdOw0KCXBlcm1zLmFwID0gYWNjZXNzX2NvbnRyb2w8MTA6OD47DQoJcGVy
bXMueG4gPSBhY2Nlc3NfY29udHJvbDwxMj47DQoNCndpdGggQVBbMjowXSwgYml0cyBbMTA6OF0N
CglBY2Nlc3MgUGVybWlzc2lvbnMgZmllbGQuIEluZGljYXRlcyB0aGUgcmVhZCBhbmQgd3JpdGUg
YWNjZXNzIHBlcm1pc3Npb25zIGZvciB1bnByaXZpbGVnZWQNCglhbmQgcHJpdmlsZWdlZCBhY2Nl
c3NlcyB0byB0aGUgbWVtb3J5IHJlZ2lvbi4NCg0KQnV0IG5vdyBpdCBpcyBjbGVhciB3aXRoIFsx
XQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qt
c3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
dWJvb3Qtc3RtMzIK

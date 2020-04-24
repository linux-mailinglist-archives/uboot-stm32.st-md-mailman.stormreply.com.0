Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CC61B7841
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 16:24:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C2D9C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 14:24:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41038C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 14:24:20 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03OEIpWV030752; Fri, 24 Apr 2020 16:24:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=zplGYSJN9gea/zeyLyaGEqrVBwkNIvi5KGuhPfyCiGQ=;
 b=Y58kWvHvVdOOgIOeARRZD96i0u5H+PINV0v1dU1JnR/X6QsQT3+KnZN2PKLrZLNZ9P2T
 3ia5ll/nGPRyEINWmKsLtES+yvNWXxBUB+LULY2PwDngWrUQIyvCHtWWbV1Qr1t7i1JU
 Tz3QyCynzGsxqUQph7H4lkKk2p9gWYPH5DNYT7bAwpys4xb43si2KJpU5Mh9pXsw/RZX
 K2HLrDj4RlekeUXuYHkR3DNDdBLZYu+Wahkn/Mexvn4OCyhzwecovnYhcl8xjZRryuJH
 NEa8N7z1yJhZVwmWmeJXY1Dq6th5fGQa+EDYSKRUYBHvtdv86b1nUPkWVuz2J6Gt9W6t 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30freh3spt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 16:24:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B956C10002A;
 Fri, 24 Apr 2020 16:24:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A83632B0561;
 Fri, 24 Apr 2020 16:24:11 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Apr
 2020 16:24:11 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 24 Apr 2020 16:24:11 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 03/10] arm: stm32mp: bsec: remove unneeded test
Thread-Index: AQHV4dOG1DscO3p100+aAnq6fAKkeahORPCAgDp/SZA=
Date: Fri, 24 Apr 2020 14:24:11 +0000
Message-ID: <a43aeba553a345a39878278706bd0d48@SFHDAG6NODE3.st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
 <20200212183744.5309-4-patrick.delaunay@st.com>
 <85eac143-b5b1-fabd-dea6-b2a5e5efdd00@st.com>
In-Reply-To: <85eac143-b5b1-fabd-dea6-b2a5e5efdd00@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_06:2020-04-24,
 2020-04-24 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 03/10] arm: stm32mp: bsec: remove unneeded
	test
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

SGkNCg0KPiBGcm9tOiBQYXRyaWNlIENIT1RBUkQgPHBhdHJpY2UuY2hvdGFyZEBzdC5jb20+DQo+
IFNlbnQ6IG1lcmNyZWRpIDE4IG1hcnMgMjAyMCAxMTowNQ0KPiANCj4gDQo+IE9uIDIvMTIvMjAg
NzozNyBQTSwgUGF0cmljayBEZWxhdW5heSB3cm90ZToNCj4gPiBSZW1vdmUgdGhlIHRlc3Qgb2Zm
cyA8IDAgLCBhcyBvZmZzIGlzIHVuc2lnbmVkLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBzb2x2ZXMg
dGhlIHdhcm5pbmdzIHdoZW4gY29tcGlsaW5nIHdpdGggVz0xIG9uIHN0bTMybXAxDQo+ID4gYm9h
cmQ6DQo+ID4NCj4gPiBJbiBmdW5jdGlvbiDigJhzdG0zMm1wX2JzZWNfcmVhZOKAmToNCj4gPiBh
cmNoL2FybS9tYWNoLXN0bTMybXAvYnNlYy5jOjM2ODoxMTogd2FybmluZzoNCj4gPiBjb21wYXJp
c29uIG9mIHVuc2lnbmVkIGV4cHJlc3Npb24gPCAwIGlzIGFsd2F5cyBmYWxzZSBbLVd0eXBlLWxp
bWl0c10NCj4gPiAgIDM2OCB8ICBpZiAob2ZmcyA8IDAgfHwgKG9mZnMgJSA0KSB8fCAoc2l6ZSAl
IDQpKQ0KPiA+ICAgICAgIHwgICAgICAgICAgIF4NCj4gPiBJbiBmdW5jdGlvbiDigJhzdG0zMm1w
X2JzZWNfd3JpdGXigJk6DQo+ID4gYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2JzZWMuYzo0MDU6MTE6
IHdhcm5pbmc6DQo+ID4gY29tcGFyaXNvbiBvZiB1bnNpZ25lZCBleHByZXNzaW9uIDwgMCBpcyBh
bHdheXMgZmFsc2UgWy1XdHlwZS1saW1pdHNdDQo+ID4gICA0MDUgfCAgaWYgKG9mZnMgPCAwIHx8
IChvZmZzICUgNCkgfHwgKHNpemUgJSA0KSkNCj4gPiAgICAgICB8ICAgICAgICAgICBeDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QHN0
LmNvbT4NCj4gPiAtLS0NCj4gPg0KPiA+ICBhcmNoL2FybS9tYWNoLXN0bTMybXAvYnNlYy5jIHwg
NCArKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+ID4NCg0KQXBwbGllZCB0byB1LWJvb3Qtc3RtL21hc3RlciwgdGhhbmtzIQ0KDQpSZWdh
cmRzDQoNClBhdHJpY2sNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==

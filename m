Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE6928D278
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Oct 2020 18:42:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEF6EC3FAD5;
	Tue, 13 Oct 2020 16:42:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC2CFC36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Oct 2020 16:42:15 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09DGX7OG023813; Tue, 13 Oct 2020 18:42:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=nCyd9ZARlAjReTRUWN3HX3jFQOACrhjqPuDrgxO4+MA=;
 b=xH0b4RHRfzNgez+r3xqH37w/yaQgki5GWiQ7YJ/hVqGJcuk3qOosI49PJZZAMIxuv3hl
 QfQ+KNKcQuuD0EchLVbk6f2xFHaC7VAACFcStIm9YUZ1XKEljVjou7dvwA4nv66OYoPC
 oPYFwp+3H2lm0782fk6dlK7QytugkYUNNykQ5sXHCnnk1x1GKTm7stF8VGei8KLRGvqm
 VerCpp2u91dF9C6NwO1u9G/pJC0ArVCrCmpV9xps7C6cWeLX/5MHNeSf5l11h2zKxsNq
 88HIvaobKLHuzPOI8XIUagm7SphkNq26PregGZG+F52iffaW1B3PB3QbRvlCE4F2YCuo kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34358704x8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Oct 2020 18:42:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0F2D310002A;
 Tue, 13 Oct 2020 18:42:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E69D72EFE94;
 Tue, 13 Oct 2020 18:42:05 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 13 Oct
 2020 18:42:05 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Tue, 13 Oct 2020 18:42:05 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Richard Genoud <richard.genoud@posteo.net>, Patrice CHOTARD
 <patrice.chotard@st.com>
Thread-Topic: [PATCH] SPL: stm32mp1: fix spl_mmc_boot_partition not defined
Thread-Index: AQHWoKGV7MGwOzuthEyLzrXfB8K3dKmVcvCw///iDYCAAGZIEA==
Date: Tue, 13 Oct 2020 16:42:05 +0000
Message-ID: <fc2752572a4c411b87a10a923f0aea0c@SFHDAG2NODE3.st.com>
References: <20201012141109.29778-1-richard.genoud@posteo.net>
 <e60dfd9cc88b45a8a2e906741d17e7df@SFHDAG2NODE3.st.com>
 <afe44756-eea8-aa84-fc2a-903461bbf16c@posteo.net>
In-Reply-To: <afe44756-eea8-aa84-fc2a-903461bbf16c@posteo.net>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-13_09:2020-10-13,
 2020-10-13 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH] SPL: stm32mp1: fix spl_mmc_boot_partition
	not defined
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

SGksDQoNCj4gRnJvbTogUmljaGFyZCBHZW5vdWQgPHJpY2hhcmQuZ2Vub3VkQHBvc3Rlby5uZXQ+
DQo+IFNlbnQ6IG1hcmRpIDEzIG9jdG9icmUgMjAyMCAxNDoyNQ0KPiANCj4gSGkgUGF0cmljaywN
Cj4gDQo+IExlIDEzLzEwLzIwMjAgw6AgMTQ6MTgsIFBhdHJpY2sgREVMQVVOQVkgYSDDqWNyaXTC
oDoNCj4gPiBIaSBSaWNoYXJkLA0KPiA+DQo+ID4+IEZyb206IFJpY2hhcmQgR2Vub3VkIDxyaWNo
YXJkLmdlbm91ZEBwb3N0ZW8ubmV0Pg0KPiA+PiBTZW50OiBsdW5kaSAxMiBvY3RvYnJlIDIwMjAg
MTY6MTENCj4gPj4NCj4gPj4gc3BsX21tY19ib290X3BhcnRpdGlvbiBpcyBvbmx5IGRlZmluZWQg
d2hlbg0KPiA+PiBDT05GSUdfU1lTX01NQ1NEX1JBV19NT0RFX1VfQk9PVF9VU0VfUEFSVElUSU9O
IGlzIGRlZmluZWQuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgR2Vub3VkIDxy
aWNoYXJkLmdlbm91ZEBwb3N0ZW8ubmV0Pg0KPiA+PiAtLS0NCj4gPj4gICBhcmNoL2FybS9tYWNo
LXN0bTMybXAvc3BsLmMgfCAyICsrDQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQ0KPiA+Pg0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJp
Y2suZGVsYXVuYXlAc3QuY29tPg0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGlzIG1pc3NpbmcgY2hl
Y2sgaW4gc3BsLg0KPiA+DQo+ID4gTkI6IGFmdGVyIGNoZWNrLCBpdCBpcyBwb3NzaWJsZSB0byBJ
U19FTkFCTEVEIHRvIHByZXZlbnQgI2lmZGVmIGhlcmUNCj4gPg0KPiA+IDx1bmtub3duPjowOiB3
YXJuaW5nOiBVc2UgJ2lmIChJU19FTkFCTEVEKENPTkZJRy4uLikpJyBpbnN0ZWFkIG9mICcjaWYN
Cj4gPiBvciAjaWZkZWYnIHdoZXJlIHBvc3NpYmxlDQo+IA0KPiBJIGRvbid0IHRoaW5rIGl0J3Mg
cG9zc2libGUgdG8gdXNlICJpZiAoSVNfRU5BQkxFRChDT05GSUcuLi4pKSINCj4gc2luY2Ugd2Ug
aGF2ZSB0byByZW1vdmUgdGhlIHdob2xlIGZ1bmN0aW9uLCBub3QganVzdCBzb21lIGNvZGUgaW4g
aXQuDQoNCk5vcm1hbGx5IHRoZSB1bnVzZWQgZnVuY3Rpb24gaXMgcmVtb3ZlIGJ5IGxpbmtlciB3
aXRob3V0IGNvbXBpbGF0aW9uIGZsYWcuLi4NCg0KQnV0IGFmdGVyIGNoZWNrIG9uIG15IHNpZGUg
aXQgaXMgbm90IHBvc3NpYmxlIHRvIHVzZSBJU19FTkFCTEVEKENPTkZJR18gaGVyZS4uLiAgDQpi
ZWNhdXNlIHdoZW4gdGhlIGZsYWdzIGlzIGFic2VudCwgdGhlIDIgdXNlZCBDT05GSUdfIGFyZSBh
bHNvIGFic2VudDoNCi0gQ09ORklHX1NZU19NTUNTRF9SQVdfTU9ERV9VX0JPT1RfUEFSVElUSU9O
DQotIENPTkZJR19TWVNfTU1DU0RfUkFXX01PREVfVV9CT09UX1BBUlRJVElPTl9NTUMyDQoNCkFu
ZCB0aGF0IGNhdXNlIGNvbXBpbGF0aW9uIGlzc3VlDQoNClNvcnJ5IGZvciBmaXJzdCBmZWVkYmFj
aywgSSB3aWxsIHRha2UgdGhlIHBhdGNoIGluIG15IG5leHQgcHVsbCByZXF1ZXN0Lg0KDQogDQo+
IFJlZ2FyZHMsDQo+IFJpY2hhcmQNCg0KUmVnYXJkcw0KUGF0cmljaw0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0
ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK

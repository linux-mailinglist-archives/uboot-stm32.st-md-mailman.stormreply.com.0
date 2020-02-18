Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EA416249D
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 11:32:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11DBCC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 10:32:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A598EC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 10:32:23 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01IARcmQ020530; Tue, 18 Feb 2020 11:32:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=OLZEn2I65b2Ganyu/XXYJj0XQcUnl91RD5poIAgDwBs=;
 b=oNiHv/oo3M0T/h8fGzaPsUUOKXXSDmEown9BTNTkePeStbzSlg+3buzKIBBEqOi4n5F2
 8f3bTowVHRMDJnv7vpjL4RfPLKRWcCnOMRz0YJgL2WcXxqCvfexwu2NjTFizIHFNstlH
 SB2brMBd7lKSuCny+erpaBmMR306ohkw89hUzaH229v66KnaYOjPcyFGUPFM6yxAvGc1
 Abb4sZp/E8fjmy/C8GzBNLfUXVNlSbjNTdlESgu3PobLOEGmTHak4DH2hUlvoC0v5Wxr
 pR5kZIxYgH7ul932AlE0zy9CDrl1FYKbGGvKY12bnWWHD6qSR2oYPWP+5/9TvyFz/hKC +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y67a1sfns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2020 11:32:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5FDB5100034;
 Tue, 18 Feb 2020 11:32:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 522D82A6C41;
 Tue, 18 Feb 2020 11:32:13 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Feb
 2020 11:32:12 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 18 Feb 2020 11:32:12 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [PATCH] ARM: bootm: take into account gd->ram_top
Thread-Index: AQHV4puWH2BFS2eNkU+op+bjuNo0h6gbAI8AgAXGzWA=
Date: Tue, 18 Feb 2020 10:32:12 +0000
Message-ID: <86b458e4bfd546b18730ddacc1465f46@SFHDAG6NODE3.st.com>
References: <20200213182950.10744-1-patrick.delaunay@st.com>
 <CAPnjgZ2aHJ4ReOLHLnJ8LcSgMngC1Z5===WMJob4M6Y_sC5QVw@mail.gmail.com>
In-Reply-To: <CAPnjgZ2aHJ4ReOLHLnJ8LcSgMngC1Z5===WMJob4M6Y_sC5QVw@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-18_02:2020-02-17,
 2020-02-18 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Keerthy <j-keerthy@ti.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: bootm: take into account gd->ram_top
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
bnQ6IHZlbmRyZWRpIDE0IGbDqXZyaWVyIDIwMjAgMjA6MTcNCj4gDQo+IEhpIFBhdHJpY2ssDQo+
IA0KPiBPbiBUaHUsIDEzIEZlYiAyMDIwIGF0IDExOjMwLCBQYXRyaWNrIERlbGF1bmF5IDxwYXRy
aWNrLmRlbGF1bmF5QHN0LmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBQYXRyaWNlIENo
b3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBzdC5jb20+DQo+ID4NCj4gPiBJZiBnZC0+cmFtX3RvcCBo
YXMgYmVlbiB0dW5lZCB1c2luZyBib2FyZF9nZXRfdXNhYmxlX3JhbV90b3AoKSwgaXQNCj4gPiBt
dXN0IGJlIHRha2VuIGludG8gYWNjb3VudCB3aGVuIHJlc2VydmluZyBhcmNoIGxtYi4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0LmNv
bT4NCj4gPiBSZXZpZXdlZC1ieTogUGF0cmljayBERUxBVU5BWSA8cGF0cmljay5kZWxhdW5heUBz
dC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxh
dW5heUBzdC5jb20+DQo+ID4gLS0tDQo+ID4NCj4gPiAgYXJjaC9hcm0vbGliL2Jvb3RtLmMgfCAz
ICsrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+IA0KPiBJcyB0aGlz
IHNvbWV0aGluZyB3ZSBjYW4gdGVzdCBpbiB0ZXN0L2xpYi9sbWIuYyA/DQoNCkkgY2hlY2sgdGhl
c2UgdGVzdHMsIGFuZCBmb3IgbWUgaXQgaXMgbm90IHBvc3NpYmxlLCBhcyBJIGNoYW5nZSB0aGUg
QVJNIHBhcnQgZm9yIGJvb3RtIGxpYiANCihsaW1pdCB0aGUgcmVzZXJ2ZWQgc2l6ZSBieSB1LWJv
b3QgdG8gYXZvaWQgY29uZmxpY3Qgd3hpdGggb3RoZXIgcmVzZXJ2ZWQgbWVtb3J5KSANCmFuZCBu
b3QgdGhlIGxtYiBnZW5lcmljIGNvZGUuLi4NCg0KSSBkb24ndCBzZWUgaG93IHRvIHRlc3QgaXQg
aW4gc2FuZGJveC4NCg0KIA0KPiBSZWdhcmRzLA0KPiBTaW1vbg0KDQpSZWdhcmRzDQpQYXRyaWNr
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1z
dG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91
Ym9vdC1zdG0zMgo=

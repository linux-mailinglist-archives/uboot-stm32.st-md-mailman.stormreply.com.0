Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A70E18AED7
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Mar 2020 09:58:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 544B7C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Mar 2020 08:58:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40AB4C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 08:58:02 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02J8qtec025685; Thu, 19 Mar 2020 09:57:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=zHSbPt4AK4MWYeNgjW0ZiI5ZoqzdXApLKuEbAHEfezw=;
 b=fMG0/Z7soJRB02fSAgallg25Hv0Q8zrDWzEvWBhZeYqOZDpXRBGwgz2z4U/sLN4RT8B0
 EzFHcwczxMiZcPlLEKFEGRXEtHiseUWFY7iNPgOroiokka5/+EFV47A4CPztsuJqI6VQ
 Q15DlGnQT/hIQcj0tO6bdCIFr71v7e2glCwbnBWlpU0RKR+z7ZzRPyReEGyYA2Utr5Hm
 KPXWaRMYssodBWSeTCB9+aAQEQ20L0aIA5ZG7cjfZ8dbEADFl9pCgSe0uAR0E4BJwf+x
 jZW1fgQ0s5GemhuWyXVbySnIDGjqUc2JpL5eJd9hIw5hwede5pZ0l689QLYbtlrGIWIs dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu6xdh2v7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 09:57:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D9146100034;
 Thu, 19 Mar 2020 09:57:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C46AB21FE9F;
 Thu, 19 Mar 2020 09:57:58 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Mar
 2020 09:57:58 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 19 Mar 2020 09:57:58 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Wolfgang Denk <wd@denx.de>
Thread-Topic: [PATCH 07/10] board: stm32mp1: add finished good in board
 identifier OTP
Thread-Index: AQHV4dOJFMqSQuMDi0GTaKvIgTu+3ahOUBcAgAF81JA=
Date: Thu, 19 Mar 2020 08:57:58 +0000
Message-ID: <07159b22a76a445089aa6cd646c0ef1c@SFHDAG6NODE3.st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
 <20200212183744.5309-8-patrick.delaunay@st.com>
 <20200318104452.3B6E824003E@gemini.denx.de>
In-Reply-To: <20200318104452.3B6E824003E@gemini.denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-19_01:2020-03-18,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 07/10] board: stm32mp1: add finished good
 in board identifier OTP
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

SGkgV29sZmdhbmcsDQoNCj4gRnJvbTogV29sZmdhbmcgRGVuayA8d2RAZGVueC5kZT4NCj4gU2Vu
dDogbWVyY3JlZGkgMTggbWFycyAyMDIwIDExOjQ1DQo+IA0KPiBEZWFyIFBhdHJpY2ssDQo+IA0K
PiBJbiBtZXNzYWdlIDwyMDIwMDIxMjE4Mzc0NC41MzA5LTgtcGF0cmljay5kZWxhdW5heUBzdC5j
b20+IHlvdSB3cm90ZToNCj4gPiBVcGRhdGUgdGhlIGNvbW1hbmQgc3Rib2FyZCB0byBzdXBwb3J0
IHRoZSBjb2Rpbmcgb2YgT1RQIDU5IHdpdGgNCj4gPiBmaW5pc2hlZCBnb29kOg0KPiANCj4gQ2Fu
IHlvdSBwbGVhc2UgZXhwbGFpbiB3aGF0ICJmaW5pc2hlZCBnb29kIiBtZWFucz8NCj4gDQo+IEkg
Y2FuJ3QgcGFyc2UgdGhlIHNlbnRlbmNlIGFib3ZlLCBzb3JyeS4NCg0KSXQgaXMgYSBwYXJ0IG9m
IHRoZSBjb2RpZmljYXRpb24gdXNlZCBpbiBwcm9kdWN0aW9uIG9mIFNUIGJvYXJkLCBzb3JyeSBp
ZiBpdCBpcyBub3QgY2xlYXIuDQoNClRoZSBTVCBwcm9kdWN0IGNvZGlmaWNhdGlvbiBoYXZlIHNl
dmVyYWwgZWxlbWVudA0KLSAiQ29tbWVyY2lhbCBQcm9kdWN0IE5hbWUiIChDUE4pIDogdHlwZSBv
ZiBwcm9kdWN0IGJvYXJkIChES1gsIEVWWCkNCi0gIkZpbmlzaGVkIEdvb2QiIG9yICJGaW5pc2gg
R29vZCIgKEZHKSA6IGVmZmVjdGl2ZSBjb250ZW50IG9mIHRoZSBwcm9kdWN0IHdpdGhvdXQgY2hp
cCBTVE0zMk1QMSAoTENELCBXaWZpLCDigKYpIA0KLSBCT006IGNvc3QgdmFyaWFudCBmb3Igc2Ft
ZSBGRyAoZm9yIGV4YW1wbGUsIHNldmVyYWwgcHJvdmlkZXIgb2YgdGhlIHNhbWUgY29tcG9uZW50
KSANCg0KRm9yIGV4YW1wbGUNCmNvbW1lcmNpYWwgcHJvZHVjdCA9IFNUTTMyTVAxNTdDLUVWMQ0K
RmluaXNoZWQgR29vZCA9IEVWQTMyTVAxNTdBMSRBVTENCg0KQm9vdGggaW5mb3JtYXRpb24gYXJl
IHdyaXR0ZW4gb24gYm9hcmQuDQoNCkR1cmluZyBwcm9kdWN0aW9uLCB0aGlzIGluZm9ybWF0aW9u
IGlzIGFsc28gc2F2ZSBpbiBPVFAuDQpBbmQgdGhlIHN0bTMybXAxIHNvZnR3YXJlIGNhbiBjaGFu
Z2UgaXRzIGJlaGF2aW9yIGJhc2VkIG9uIHRoaXMgaW5mb3JtYXRpb24uDQoNClRoZSBGRyBpbmZv
cm1hdGlvbiBpcyBpbnRyb2R1Y2VkIGJlY2F1c2Ugb24gREsyIGJvYXJkIChzYW1lIHByb2R1Y3Qg
LyBzYW1lIENQTikgLCANCndlIGhhdmUgYSByaXNrIHRvIG1hbmFnZSAyIHR5cGVzIG9mIGRpc3Bs
YXkgaW4gZnV0dXJlIHByb2R1Y3Rpb24gYmF0Y2ggDQoobm8gbW9yZSBhdmFpbGFiaWxpdHkgb2Yg
dGhlIGN1cnJlbnQgTENEID0+IG5ldyBGRyBmb3IgdGhlIHNhbWUgcHJvZHVjdCB3aXRoIG5ldyBk
aXNwbGF5KQ0KIA0KPiBCZXN0IHJlZ2FyZHMsDQo+IA0KPiBXb2xmZ2FuZyBEZW5rDQo+IA0KDQpS
ZWdhcmRzDQpQYXRyaWNrDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

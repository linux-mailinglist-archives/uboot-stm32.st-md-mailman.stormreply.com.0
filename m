Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B605192277
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Mar 2020 09:18:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6E97C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Mar 2020 08:18:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C37CC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Mar 2020 08:18:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02P88O1f000566; Wed, 25 Mar 2020 09:18:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=cNZemKQRS8ImhmJnEriPs1WTIBMJqperk4t8/m9oFS4=;
 b=Gfcvq7jbAPoP1PRM3NU+v65ISc5OtIceJ6R/tJjUbYPVxFcSBB0oTPOh9SWK5esnWYs1
 gBw8+UgaCqD5zCcbX73hxndRqec4Mo6/mfHTbm4oIUvSe1G377WpXkDmMetPpTtvLHmh
 mAzUO6UfAsD6MN1Fl9cgRP4A1T6c7a8qIUYST3OMs22yNI+OGLXqUjd3jHquqJf/lV48
 3s2t5kbRu40cV2X29CP5eb5bPr8sGF0h/9mQyGMaJxt2ml4llSoOEkd7110LVKKC/fdT
 q3bKHV/L+vKrMsyzYTCd3gBIRfngI8sWUWWTmAfgyWzglkUalHVgbb0tlF9r0js1Ln7a wQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw8xe4cyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Mar 2020 09:18:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E19B310003D;
 Wed, 25 Mar 2020 09:17:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D6D5721C0BF;
 Wed, 25 Mar 2020 09:17:58 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Mar
 2020 09:17:58 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 25 Mar 2020 09:17:58 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v3] board: stm32mp1: add finished good in board
 identifier OTP
Thread-Index: AQHWAeEsy+PfD1cyEEO5sWEKtoTHA6hY97ng
Date: Wed, 25 Mar 2020 08:17:58 +0000
Message-ID: <2e0e2f498a964dec89eb126917476e98@SFHDAG6NODE3.st.com>
References: <20200324133605.8786-1-patrick.delaunay@st.com>
In-Reply-To: <20200324133605.8786-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-25_01:2020-03-23,
 2020-03-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v3] board: stm32mp1: add finished good in
 board identifier OTP
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

SGksDQoNCj4gRnJvbTogUGF0cmljayBERUxBVU5BWSA8cGF0cmljay5kZWxhdW5heUBzdC5jb20+
DQo+IFNlbnQ6IG1hcmRpIDI0IG1hcnMgMjAyMCAxNDozNg0KPiANCj4gVXBkYXRlIHRoZSBjb21t
YW5kIHN0Ym9hcmQgdG8gc3VwcG9ydCB0aGUgdXBkYXRlZCBjb2Rpbmcgb2YgT1RQIDU5IHdpdGgN
Cj4gZmluaXNoZWQgZ29vZC4NCj4gDQo+IFRoZSBTVCBwcm9kdWN0IGNvZGlmaWNhdGlvbiBoYXZl
IHNldmVyYWwgZWxlbWVudA0KPiAtICJDb21tZXJjaWFsIFByb2R1Y3QgTmFtZSIgKENQTik6IHR5
cGUgb2YgcHJvZHVjdCBib2FyZCAoREtYLCBFVlgpDQo+ICAgYXNzb2NpYXRlZCB0byB0aGUgYm9h
cmQgSUQgIk1CeHh4eCINCj4gLSAiRmluaXNoZWQgR29vZCIgb3IgIkZpbmlzaCBHb29kIiAoRkcp
Og0KPiAgIGVmZmVjdGl2ZSBjb250ZW50IG9mIHRoZSBwcm9kdWN0IHdpdGhvdXQgY2hpcCBTVE0z
Mk1QMSAoTENELCBXaWZpLCDigKYpDQo+IC0gQk9NOiBjb3N0IHZhcmlhbnQgZm9yIHNhbWUgRkcN
Cj4gICAoZm9yIGV4YW1wbGUsIHNldmVyYWwgcHJvdmlkZXIgb2YgdGhlIHNhbWUgY29tcG9uZW50
KQ0KPiANCj4gRm9yIGV4YW1wbGUNCj4gLSBjb21tZXJjaWFsIHByb2R1Y3QgPSBTVE0zMk1QMTU3
Qy1FVjENCj4gLSBGaW5pc2hlZCBHb29kID0gRVZBMzJNUDE1N0ExJEFVMQ0KPiANCj4gQm9vdGgg
aW5mb3JtYXRpb24gYXJlIHdyaXR0ZW4gb24gYm9hcmQgYW5kIHRoZXNlIGluZm9ybWF0aW9uIGlz
IGFsc28gc2F2ZWQgaW4NCj4gT1RQNTk6DQo+IA0KPiBiaXQgWzMxOjE2XSAoaGV4KSA9PiBCb2Fy
ZCBpZCwgTUJ4eHh4DQo+IGJpdCBbMTU6MTJdIChkZWMpID0+IFZhcmlhbnQgQ1BOICgxLi4uLjE1
KSBiaXQgWzExOjhdICAoZGVjKSA9PiBSZXZpc2lvbiBib2FyZCAoaW5kZXgNCj4gd2l0aCBBID0g
MSwgWiA9IDI2KQ0KPiBiaXQgWzc6NF0gICAoZGVjKSA9PiBWYXJpYW50IEZHIDogZmluaXNoZWQg
Z29vZCAoTkVXKQ0KPiBiaXQgWzM6MF0gICAoZGVjKSA9PiBCT00gKDAxLCAuLi4uIDI1NSkNCj4g
DQo+IFRoZSB1cGRhdGVkIGNvbW1hbmQgaXM6DQo+ICAgc3Rib2FyZCBbLXldIDxCb2FyZD4gPFZh
ckNQTj4gPFJldmlzaW9uPiA8VmFyRkc+IDxCT00+DQo+IA0KPiBBbmQgdGhlIGRpc3BsYXllZCBT
VE1pY3JvZWxlY3Ryb25pY3MgYm9hcmQgaWRlbnRpZmljYXRpb24gaXM6DQo+ICAgQm9hcmQ6IE1C
PEJvYXJkPiBWYXI8VmFyQ1BOPi48VmFyRkc+IFJldi48UmV2aXNpb24+LTxCT00+DQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4N
Cj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4N
Cj4gLS0tDQo+IA0KPiBDaGFuZ2VzIGluIHYzOg0KPiAtIGZpeCBjb21tZW50IGFmdGVyIFBhdHJp
Y2UgQ2hvdGFyZCByZXZpZXcNCj4gDQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gdXBkYXRlIGNvbW1p
dCBtZXNzYWdlDQo+IC0gYWRkIGNvbW1lbnRzIGluIGNtZF9zdGJvYXJkLmMNCj4gDQoNCkFwcGxp
ZWQgdG8gdS1ib290LXN0bS9uZXh0LCB0aGFua3MhDQoNClJlZ2FyZHMNCg0KUGF0cmljaw0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIg
bWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qt
c3RtMzIK

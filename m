Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5E215D5CF
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 11:31:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCC0CC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 10:31:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F17DC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 10:31:56 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01EAMLRJ027162; Fri, 14 Feb 2020 11:31:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=lGeWtO2wg90ePAyfTAIbbMzGG2XUhb8/qhKWNKTjKGM=;
 b=z8Adr87yl+FQOCBjjTXcAZSTCcWhc2dVI0/DpoNLD336jnbHiqSVJPHiRUqtBW6DQZxL
 bo9/vSAs4pVL+w9BqLtvV/syLh4ubx8xzuRGrtYa61cKvlD8MQvVZyl4G/s/bDoK0jpt
 X5JxyOkIfJacK5RIPV+4UNkF2sbevxVcsBMeoU+gU3WEDBWSAS11bgxt8q0zZtcwqldO
 /vlIwJC/ipZozA1+uZQ7G69rGFXMdsj7t638afUAOWtkj12uG1bBuIYBhTNsB0ihEHGx
 9VI2AMODdWbvQ//vUObVOhZapaja3u4xIsSnhBh5iw3kMAriE5k6K8XejF1bi0ffOFkn Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uve2tsf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2020 11:31:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 19CEB10002A;
 Fri, 14 Feb 2020 11:31:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 112022AC885;
 Fri, 14 Feb 2020 11:31:53 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Feb
 2020 11:31:52 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 14 Feb 2020 11:31:52 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 4/4] clk: stm32mp1: solve type issue in
 stm32mp1_lse_enable and stm32mp1_clktree
Thread-Index: AQHV1b+EQsMfeBnqpUSHuLJgWQam2agamFGA
Date: Fri, 14 Feb 2020 10:31:52 +0000
Message-ID: <819bffe6530f4a3f8131f96c9982fd05@SFHDAG6NODE3.st.com>
References: <20200128094415.5768-1-patrick.delaunay@st.com>
 <20200128094415.5768-5-patrick.delaunay@st.com>
In-Reply-To: <20200128094415.5768-5-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_02:2020-02-12,
 2020-02-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 4/4] clk: stm32mp1: solve type issue in
 stm32mp1_lse_enable and stm32mp1_clktree
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
DQo+IFNlbnQ6IG1hcmRpIDI4IGphbnZpZXIgMjAyMCAxMDo0NA0KPiANCj4gU29sdmUgdHlwZSBp
c3N1ZSBpbiBzdG0zMm1wMV9sc2VfZW5hYmxlIGFuZCBzdG0zMm1wMV9jbGt0cmVlLg0KPiANCj4g
VGhpcyBwYXRjaCBzb2x2ZXMgdGhlIHdhcm5pbmdzIHdoZW4gY29tcGlsaW5nIHdpdGggVz0xIG9u
IHN0bTMybXAxIGJvYXJkOg0KPiANCj4gY2xrX3N0bTMybXAxLmM6IEluIGZ1bmN0aW9uIOKAmHN0
bTMybXAxX2xzZV9lbmFibGXigJk6DQo+IGNsa19zdG0zMm1wMS5jOjEyMzg6MTU6IHdhcm5pbmc6
IGNvbXBhcmlzb24gb2YgaW50ZWdlciBleHByZXNzaW9ucw0KPiAgIG9mIGRpZmZlcmVudCBzaWdu
ZWRuZXNzOiDigJh1MzLigJkge2FrYSDigJh1bnNpZ25lZCBpbnTigJl9IGFuZCDigJhpbnTigJkN
Cj4gICBbLVdzaWduLWNvbXBhcmVdDQo+IGNsa19zdG0zMm1wMS5jOjEyMzk6MTM6IHdhcm5pbmc6
IGNvbXBhcmlzb24gb2YgaW50ZWdlciBleHByZXNzaW9ucw0KPiAgIG9mIGRpZmZlcmVudCBzaWdu
ZWRuZXNzOiDigJh1MzLigJkge2FrYSDigJh1bnNpZ25lZCBpbnTigJl9IGFuZCDigJhpbnTigJkN
Cj4gICBbLVdzaWduLWNvbXBhcmVdDQo+IA0KPiBjbGtfc3RtMzJtcDEuYzogSW4gZnVuY3Rpb24g
4oCYc3RtMzJtcDFfY2xrdHJlZeKAmToNCj4gY2xrX3N0bTMybXAxLmM6MTgxNDoxNzogd2Fybmlu
ZzogY29tcGFyaXNvbiBvZiBpbnRlZ2VyIGV4cHJlc3Npb25zDQo+ICAgb2YgZGlmZmVyZW50IHNp
Z25lZG5lc3M6IOKAmGludOKAmSBhbmQg4oCYdW5zaWduZWQgaW504oCZDQo+ICAgWy1Xc2lnbi1j
b21wYXJlXQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5k
ZWxhdW5heUBzdC5jb20+DQo+IC0tLQ0KDQpBcHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9tYXN0ZXIs
IHRoYW5rcyENCg0KUmVnYXJkcw0KUGF0cmljaw0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK

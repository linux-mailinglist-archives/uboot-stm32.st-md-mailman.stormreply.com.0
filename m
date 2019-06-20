Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6DF4C7A6
	for <lists+uboot-stm32@lfdr.de>; Thu, 20 Jun 2019 08:48:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3F24C06FAC
	for <lists+uboot-stm32@lfdr.de>; Thu, 20 Jun 2019 06:48:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3DAEC06FAB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2019 06:48:19 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5K6kIxB010038; Thu, 20 Jun 2019 08:48:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=aFvVQRqp0Yj0wQhD7dRFSLaCiZLBcWCamMyeaKgPIQ0=;
 b=0fWTWd1yZE+NDAV41CnafpJkWQ7lJq7l8pN0CfiWiqhvG67P2Ta3Cxb9lPAKVIS0miiP
 XQ0A1c0IXYh6ClpkToe0OC7Cy/tCenwQYaLBvcFXKdkx2a95DB8TOs2ixNuNVgcnWLin
 BI0Awlq62zQVoQS8Pucig29C4oN/ThKO0SRV21WRXX4K8kRGA+bO0OXQS810cycXVQ7d
 Wj/rcsQzVuooRREYWhLWhSFhFe0sD283MB/ABDkA30m/HwvYH+b8exGcz73GFiVgBdHJ
 /dBOGwRNlUtYeV8pVijvytjc86kQ4bUIcJ3cfaoYGefFENZuUGnhpQSIkvQlhQoaIz80 cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7wxshqwh-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 20 Jun 2019 08:48:18 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E724F34;
 Thu, 20 Jun 2019 06:48:16 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C16FA1581;
 Thu, 20 Jun 2019 06:48:16 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Jun
 2019 08:48:16 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 20 Jun 2019 08:48:16 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Tom Rini <trini@konsulko.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: =?utf-8?B?W1UtQm9vdF1bUFVMTF0gdS1ib290LXN0bTMyIGZvciB2MjAxOS4wN+KAiyAo?=
 =?utf-8?Q?round_6)?=
Thread-Index: AQHVJzQj7X6KQhX1E0m7CntSk3MAFQ==
Date: Thu, 20 Jun 2019 06:48:16 +0000
Message-ID: <ace52b94-5155-cfdc-f6ba-7d012bc12d7e@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <F299ADB2552612488CEDF75A49CFD315@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-20_05:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] =?utf-8?q?=5BU-Boot=5D=5BPULL=5D_u-boot-stm32_for_v?=
 =?utf-8?b?MjAxOS4wN+KAiyAocm91bmQgNik=?=
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

SGkgVG9tDQoNCg0KVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA3N2Y2ZTJkZDA1
NTFkOGE4MjViYWIzOTFhMWJkNmI4Mzg4NzRiY2Q0Og0KDQrCoCBNZXJnZSB0YWcgJ2VmaS0yMDE5
LTA3LXJjNS0yJyBvZiBnaXQ6Ly9naXQuZGVueC5kZS91LWJvb3QtZWZpICgyMDE5LTA2LTE1IDEz
OjAzOjAwIC0wNDAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoN
Cg0KwqAgaHR0cHM6Ly9naXRsYWIuZGVueC5kZS91LWJvb3QvY3VzdG9kaWFucy91LWJvb3Qtc3Rt
IHRhZ3MvdS1ib290LXN0bTMyLTIwMTkwNjE5DQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1
cCB0byA3YzY1NDY4MzQ2NGRjNGNkODlmOWE4MTk4ZTI2MzM2MjYzMzkwYjU3Og0KDQrCoCB1c2I6
IGR3YzI6IGFsbG93IHBlcmlwaGVyYWwgbW9kZSBmb3IgT1RHIGNvbmZpZ3VyYXRpb24gKDIwMTkt
MDYtMTkgMTY6NTY6MTEgKzAyMDApDQoNCg0KVHJhdmlzIENJIHN0YXR1czogaHR0cHM6Ly90cmF2
aXMtY2kub3JnL3BjaG90YXJkL3UtYm9vdC9idWlsZHMvNTQ3NzgwNTM3P3V0bV9tZWRpdW09bm90
aWZpY2F0aW9uJnV0bV9zb3VyY2U9ZW1haWwNCg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpfIFVwZGF0ZSBTVE0zMk1Q
IGVudHJ5IGluIE1BSU5UQUlORVJTDQpfIEhhbmRsZSBjb3JyZWN0bHkgYmluZGluZyBmb3IgZy10
eC1maWZvLXNpemUgZm9yIFVTQiBEV0MyIGRyaXZlcg0KXyBGaXggdHJ1c3RlZCBTVE0zMk1QMSBk
ZWZjb25maWcgd2l0aCBjb3JyZWN0IGV0aGVybmV0IGRyaXZlcg0KDQotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpQYXRyaWNl
IENob3RhcmQgKDIpOg0KwqDCoMKgwqDCoCBjb25maWdzOiBzdG0zMm1wMTU6IFNlbGVjdCBjb3Jy
ZWN0IEV0aGVybmV0IGRyaXZlciBmb3IgdHJ1c3RlZCBtb2RlDQrCoMKgwqDCoMKgIE1BSU5UQUlO
RVJTOiBSZW1vdmUgQ2hyaXN0b3BoZSBLZXJlbGxvIGZyb20gU1RNMzJNUCBlbnRyeQ0KDQpQYXRy
aWNrIERlbGF1bmF5ICgzKToNCsKgwqDCoMKgwqAgdXNiOiBkd2MyOiBjb3JyZWN0bHkgaGFuZGxl
IGJpbmRpbmcgZm9yIGctdHgtZmlmby1zaXplDQrCoMKgwqDCoMKgIEFSTTogZHRzOiBzdG0zMm1w
MTogcmVtb3ZlIG92ZXJyaWRlIGZvciBnLXR4LWZpZm8tc2l6ZQ0KwqDCoMKgwqDCoCB1c2I6IGR3
YzI6IGFsbG93IHBlcmlwaGVyYWwgbW9kZSBmb3IgT1RHIGNvbmZpZ3VyYXRpb24NCg0KwqBNQUlO
VEFJTkVSU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgIDEgLQ0KwqBhcmNoL2FybS9kdHMvc3RtMzJtcDE1N2MtZXYxLXUtYm9vdC5k
dHNpIHzCoCA0IC0tLS0NCsKgY29uZmlncy9zdG0zMm1wMTVfdHJ1c3RlZF9kZWZjb25maWfCoMKg
wqDCoMKgIHzCoCAyICstDQrCoGRyaXZlcnMvdXNiL2dhZGdldC9kd2MyX3VkY19vdGcuY8KgwqDC
oMKgwqDCoMKgIHwgMTcgKysrKysrKysrKysrKysrLS0NCsKgNCBmaWxlcyBjaGFuZ2VkLCAxNiBp
bnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK

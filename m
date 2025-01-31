Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6E3A23A6C
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2025 09:08:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94202C78002;
	Fri, 31 Jan 2025 08:08:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 226D9C71292
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 08:08:39 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V80u0P022725;
 Fri, 31 Jan 2025 09:08:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 UeuAcUWsoR0sGUl8MEvncYQgp+hLbg4YlG/fUSs/l8I=; b=t5Ymlj5c3o1Paol0
 Lb15IqapOG2Q2qo9p7Zb9E1HmjtZgTW66XtlywMJO57us3yYlKPron4nhvYcN9PL
 W8YoHHc5bBQr5TZ62E+FB+JJ5hQUCjxjGjOYKcvV7SJhn/hc8Nl6Jx8vPYJOEdYN
 jXdfD7lqvxllgSkhzjp5VB7BbneLiz57cOAp+fJKkIBRYjxlD8R3qddwKLEEJcgJ
 8TKM3JbvA3W2LP5EyP7QOi/FlMNzXV5lzD3dNn5fKxl4ouPgmA1nhUw6S2NMbNfE
 WSZa1efDLuhQtwN29qz1kPGd3E1SEaSAZvE7eN/sITr1rD+XpvN5pPeCYfulu5e1
 sH7TyQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44gf7ghtyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 09:08:37 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AACF94004C;
 Fri, 31 Jan 2025 09:07:53 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BCC4A2AA51B;
 Fri, 31 Jan 2025 09:04:49 +0100 (CET)
Received: from [10.252.27.7] (10.252.27.7) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 31 Jan
 2025 09:04:49 +0100
Message-ID: <0efcb80b-2f5e-44c6-97d3-d629cacf9454@foss.st.com>
Date: Fri, 31 Jan 2025 09:04:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20241129123325.426138-1-patrice.chotard@foss.st.com>
 <773255e7-0df2-463d-b388-6dbb6bf5f61f@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <773255e7-0df2-463d-b388-6dbb6bf5f61f@foss.st.com>
X-Originating-IP: [10.252.27.7]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_03,2025-01-30_01,2024-11-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32mp13: Add support of
 ck_usbo_48m in pre-reloc stage
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

CgpPbiAxLzgvMjUgMTk6NTEsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4gSGksCj4gCj4gT24g
MTEvMjkvMjQgMTM6MzMsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gRnJvbTogUGF0cmljayBE
ZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4KPj4gVGhlIGNsb2NrIGNr
X3VzYm9fNDhtIGlzIGEgY2xvY2sgc291cmNlIGZvciBSQ0MsIHNvIHRoZSBja191c2JvXzQ4bQo+
PiBjbG9jayBwcm92aWRlZCBieSB1c2JwaHljIG5lZWQgdG8gYmUgcHJvYmVkIHdoZW4gUkNDIGNs
b2NrIGRyaXZlciBpcwo+PiByZXF1aXJlZCwgaW4gcHJlLXJlbG9jIHN0YWdlLgo+Pgo+PiBUaGlz
IHBhdGNoIGFsbG93IHRvIHJlbW92ZSB0aGUgZm9sbG93aW5nIHdhcm5pbmc6Cj4+Cj4+IGNsa19y
ZWdpc3RlcjogZmFpbGVkIHRvIGdldCBja191c2JvXzQ4bSBkZXZpY2UgKHBhcmVudCBvZiB1c2Jv
X2spCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVu
YXlAZm9zcy5zdC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmlj
ZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gwqAgYXJjaC9hcm0vZHRzL3N0bTMy
bXAxMy11LWJvb3QuZHRzaSB8IDUgKysrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL3N0bTMybXAxMy11LWJvb3Qu
ZHRzaSBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTMtdS1ib290LmR0c2kKPj4gaW5kZXggYWE1Y2Zj
NmU0MWQuLmFmN2VkYzdlMmIyIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9kdHMvc3RtMzJtcDEz
LXUtYm9vdC5kdHNpCj4+ICsrKyBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTMtdS1ib290LmR0c2kK
Pj4gQEAgLTExMSwzICsxMTEsOCBAQAo+PiDCoCAmc3lzY2ZnIHsKPj4gwqDCoMKgwqDCoCBib290
cGgtYWxsOwo+PiDCoCB9Owo+PiArCj4+ICsmdXNicGh5YyB7Cj4+ICvCoMKgwqAgLyogc3RtMzIt
dXNicGh5Yy1jbGsgPSBja191c2JvXzQ4bSBpcyBhIHNvdXJjZSBjbG9jayBvZiBSQ0MgQ0NGICov
Cj4+ICvCoMKgwqAgYm9vdHBoLWFsbDsKPj4gK307Cj4gCj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFBh
dHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtz
Cj4gUGF0cmljawo+IApBcHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9tYXN0ZXIKClRoYW5rcwpQYXRy
aWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290
LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L3Vib290LXN0bTMyCg==

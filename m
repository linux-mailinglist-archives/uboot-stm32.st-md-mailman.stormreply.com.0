Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3725DA23A7D
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2025 09:12:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEFA8C78002;
	Fri, 31 Jan 2025 08:12:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF9C8C78006
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 08:12:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V80x0F012218;
 Fri, 31 Jan 2025 09:12:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 GbtZJtF87sth6hNjqBnp2VKlL8FyNtCr1H5nANwsYbM=; b=t2TMver1c9XBwVgD
 gaNjQAIE7gS1ZTWYqanfENBFJJv1mbQt2j9/tyYQvsigTG3AuEp0JMz47XM32vDN
 hIhPTr87MUDpSNj8D1BYggIH+tccJbHPSKUciepIuPH0/6aqx/JTCoPIy+XTJoD+
 FlqIQ837T7zIaLooNts02Tm5EhqoDInQ95M17jgJbRYyftsqmM4XB/04uicRM+Dj
 YQo6tAVFNoIqoRvHw6zqBOfJgQG8VX1DbdW40/r+jTahe55kgbwZcimmx+g+3Bjd
 3DgTBk+UjY1auE9POsjlaAbrs8xfb9dXKzMK7kumdNcXaayfXuGvgCqaAN/xNn+1
 qQ5IZQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44gf7d9sqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 09:12:26 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7B7DD4006D;
 Fri, 31 Jan 2025 09:11:42 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 374422BB0BA;
 Fri, 31 Jan 2025 09:07:53 +0100 (CET)
Received: from [10.252.27.7] (10.252.27.7) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 31 Jan
 2025 09:07:52 +0100
Message-ID: <ebc338ea-5097-41a3-8f2a-49e0ef0bf108@foss.st.com>
Date: Fri, 31 Jan 2025 09:07:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20250109102148.1733810-1-patrice.chotard@foss.st.com>
 <20250109102148.1733810-3-patrice.chotard@foss.st.com>
 <2214355c-e1b3-4bab-af47-f06030e7a540@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <2214355c-e1b3-4bab-af47-f06030e7a540@foss.st.com>
X-Originating-IP: [10.252.27.7]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_03,2025-01-30_01,2024-11-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] ARM: dts: stm32: Update ck_flexgen_08
	frequency.
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

CgpPbiAxLzMwLzI1IDExOjUyLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDEvOS8yNSAxMToyMSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBTcHVyaW91cyBjaGFyYWN0
ZXJzIGFyZSBkaXNwbGF5ZWQgb24gVS1Cb290IGNvbnNvbGUuCj4+IFVzYXJ0MiBjbG9jayBpcyBj
a19mbGV4Z2VuXzA4IGFuZCBpdHMgZnJlcXVlbmN5IGlzIHNldAo+PiB0byBhbiBpbmNvcnJlY3Qg
dmFsdWUuCj4+Cj4+IFVwZGF0ZSBja19mbGV4Z2VuXzA4IGZyZXF1ZW5jeSBmcm9tIDEwME1IeiB0
byA2NE1Iei4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNo
b3RhcmRAZm9zcy5zdC5jb20+Cj4+Cj4+IC0tLQo+Pgo+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJt
cDI1MS5kdHNpIHwgMiArLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9zdG0zMm1wMjUxLmR0
c2kgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDI1MS5kdHNpCj4+IGluZGV4IDQ0ZWI2NjRmYjUxLi5l
MmQxYzg4YTU3ZiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vZHRzL3N0bTMybXAyNTEuZHRzaQo+
PiArKysgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDI1MS5kdHNpCj4+IEBAIC0zOCw3ICszOCw3IEBA
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBja19mbGV4Z2VuXzA4OiBjay1mbGV4Z2VuLTA4IHsKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgI2Nsb2NrLWNlbGxzID0gPDA+Owo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsKPj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY2xvY2stZnJlcXVlbmN5ID0gPDEwMDAwMDAwMD47Cj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrLWZyZXF1ZW5jeSA9IDw2NDAwMDAwMD47Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCB9Owo+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgY2tfZmxleGdlbl81MTog
Y2stZmxleGdlbi01MSB7Cj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBh
dHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4gUGF0cmljawo+IAo+IApB
cHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9tYXN0ZXIKClRoYW5rcwpQYXRyaWNlCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcg
bGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==

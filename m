Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44061A23A7E
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2025 09:12:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A44EC78002;
	Fri, 31 Jan 2025 08:12:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDFD5C71292
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 08:12:53 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V80w1f004436;
 Fri, 31 Jan 2025 09:12:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 MKF/Y7Hw35SBgQ6SHtzvHjDxhPtgBlbLDyRRvBOEjnk=; b=qnr3VflJUCnGv9GU
 ikJcWWRKL7jD3orKEN7de5AzNlBfmqAydizJ/34Cvd7UQTyLegbpzND9BNiK6D7C
 UbJArJZm0TtTdIuv0m1BFPdpuX/esbi5+9Ut4z2dOLNO7CquLNOdduCbApW4z9m7
 GGbdOn7M29VOzyNJC4fPlp4DZNiQMQkXIfyAQeKCHTvsn5zpWHNh+HCL+LxioN1V
 MKZUBHBLJvtxcmuB9p0lmDDDrYyh4c3xCz9Vpf5jr6o45+lTFGgTsoU/QWjGx75z
 U0PtS0nuzziVKkHFOm4R3YXmQFXDM/c0ZxO53izAbG6P9p0tmXtxNV2d4SoD6rTJ
 guDkJg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44gf7dsugd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 09:12:51 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5E38940044;
 Fri, 31 Jan 2025 09:11:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 549002BB0B4;
 Fri, 31 Jan 2025 09:07:42 +0100 (CET)
Received: from [10.252.27.7] (10.252.27.7) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 31 Jan
 2025 09:07:41 +0100
Message-ID: <1fee5237-6a84-409b-9c7d-df6406904000@foss.st.com>
Date: Fri, 31 Jan 2025 09:07:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20250109102148.1733810-1-patrice.chotard@foss.st.com>
 <20250109102148.1733810-2-patrice.chotard@foss.st.com>
 <d160b160-af0f-4803-802b-567174921679@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <d160b160-af0f-4803-802b-567174921679@foss.st.com>
X-Originating-IP: [10.252.27.7]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_03,2025-01-30_01,2024-11-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sughosh Ganu <sughosh.ganu@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 1/2] stm32mp: Fix
	board_get_usable_ram_top()
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

CgpPbiAxLzMwLzI1IDExOjUxLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDEvOS8yNSAxMToyMSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBtbXVfc2V0X3JlZ2lvbl9k
Y2FjaGVfYmVoYXZpb3VyKCkgcGFyYW1ldGVycyBtdXN0IGJlIGFsaWduZWQKPj4gd2hpY2ggaXMg
bm90IGFsd2F5cyB0aGUgY2FzZS4KPj4gRm9yIGV4YW1wbGUgZm9yIFNUTTMyTVAyLCB3ZSBzdGF5
ZWQgc3R1Y2sgaW5zaWRlCj4+IG1tdV9zZXRfcmVnaW9uX2RjYWNoZV9iZWhhdmlvdXIoKSBpbiBh
biBpbmZpbml0ZSBsb29wIGJlY2F1c2UKPj4gc2V0X29uZV9yZWdpb24oKSBhbHdheXMgcmV0dXJu
IDAgZHVlIHRvIHN0YXJ0IHBhcmFtZXRlciB3aGljaCBpcwo+PiBub3QgYWxpZ25lZC4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5j
b20+Cj4+IC0tLQo+Pgo+PiDCoCBhcmNoL2FybS9tYWNoLXN0bTMybXAvZHJhbV9pbml0LmMgfCAy
ICstCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2RyYW1faW5pdC5jIGIvYXJj
aC9hcm0vbWFjaC1zdG0zMm1wL2RyYW1faW5pdC5jCj4+IGluZGV4IGIwNjEwNTc2OGIzLi4zNGI5
NThkN2FmZCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2RyYW1faW5pdC5j
Cj4+ICsrKyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9kcmFtX2luaXQuYwo+PiBAQCAtODEsNyAr
ODEsNyBAQCBwaHlzX2FkZHJfdCBib2FyZF9nZXRfdXNhYmxlX3JhbV90b3AocGh5c19zaXplX3Qg
dG90YWxfc2l6ZSkKPj4gwqDCoMKgwqDCoCAvKiBhZGQgOE0gZm9yIFUtQm9vdCByZXNlcnZlZCBt
ZW1vcnk6IGRpc3BsYXksIGZkdCwgZ2QsLi4uICovCj4+IMKgwqDCoMKgwqAgc2l6ZSA9IEFMSUdO
KFNaXzhNICsgQ09ORklHX1NZU19NQUxMT0NfTEVOICsgdG90YWxfc2l6ZSwgTU1VX1NFQ1RJT05f
U0laRSk7Cj4+IMKgIC3CoMKgwqAgcmVnID0gZ2QtPnJhbV90b3AgLSBzaXplOwo+PiArwqDCoMKg
IHJlZyA9IEFMSUdOKGdkLT5yYW1fdG9wIC0gc2l6ZSwgTU1VX1NFQ1RJT05fU0laRSk7Cj4+IMKg
IMKgwqDCoMKgwqAgLyogUmVzZXJ2ZWQgbWVtb3J5IGZvciBPUC1URUUgYXQgRU5EIG9mIEREUiBm
b3IgU1RNMzJNUDEgU29DICovCj4+IMKgwqDCoMKgwqAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1NU
TTMyTVAxM1gpIHx8IElTX0VOQUJMRUQoQ09ORklHX1NUTTMyTVAxNVgpKSB7Cj4gCj4gCj4gCj4g
UmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5j
b20+Cj4gCj4gVGhhbmtzCj4gUGF0cmljawo+IAo+IApBcHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9t
YXN0ZXIKClRoYW5rcwpQYXRyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD83B8AAE56
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:21:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93992C6DD9A;
	Fri, 19 Apr 2024 12:21:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B890C6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:21:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J9VfDQ030184; Fri, 19 Apr 2024 14:21:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=+N6KuyqWFO3NLo2aN4iAkT0lCbgmmOGZqRDwy/+cI/w=; b=M3
 DrZ8Yxjd8cDsb41zEBhZHGC+XZIaQMBlwYt9NeYI8vrrAiLTmQyAzVsREHx4DBxi
 J6jJLPSlrKxK7YdSWRzSTOvTSZ/sfCicKCuY3xohFjM6b1XatPjzcDPwTdogPqpl
 MQ6NpUs4iz9UlcMZOA/aU+QsmPOjn12eW9KWOI7hEqhUNE8s0GN4t7F4Xc8iNqff
 wZs33tCxOYk0AecO8hpIzgVcSacPEs7XfFn/wqvXiP1WjGv3AQfVBBg7SyRp7StD
 F8qm2/8RW3GwOAkJEr89fRROgMxRWAmqPWLvHh1EkwGh9BZrQaGrF4AB9XvT/ctA
 +WtEUmMwEgGUo/WwEKiQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xgecyrc5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:21:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8F0F840045;
 Fri, 19 Apr 2024 14:21:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CFACE21A23B;
 Fri, 19 Apr 2024 14:21:25 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:21:25 +0200
Message-ID: <c1bcf4ca-31f0-4d44-b51f-0e4f1b98a318@foss.st.com>
Date: Fri, 19 Apr 2024 14:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-12-patrice.chotard@foss.st.com>
 <6bf28011-bf01-429f-a941-31c835bce16c@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <6bf28011-bf01-429f-a941-31c835bce16c@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v1 11/25] ARM: dts: stm32: Don't probe red
 led at boot for stm32mp157a-dk1-scmi-u-boot
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

CgpPbiA0LzE3LzI0IDExOjA3LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDQvOS8yNCAxNzowMiwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiByZWQgbGVkIGFuZCBidXR0
b24gZGVkaWNhdGVkIHRvIGZhc3Rib290IHNoYXJlIHRoZSBzYW1lIGdwaW8gR1BJT0ExMy4KPj4g
TGVkIGRyaXZlciBpcyBwcm9iZWQgZWFybHkgc28gdGhlIGNvcnJlc3BvbmRpbmcgZ3BpbyBpcyB0
YWtlbiBhbmQKPj4gY29uZmlndXJlZCBpbiBvdXRwdXQgd2hpY2ggZm9yYmlkIGZhc3Rib290IGFu
ZCBzdG0zMnByb2cgYnV0dG9uIHVzYWdlLgo+Pgo+PiBUbyBhdm9pZCB0aGlzLCByZW1vdmUgdGhl
ICJkZWZhdWx0LXN0YXRlIiBwcm9wZXJ0eSBmcm9tIHJlZCBsZWQgbm9kZS4KPj4KPj4gVGhpcyB3
aWxsIGF2b2lkIHRvIHRyaWdnZXIgdGhlIGxlZCBkcml2ZXIgcHJvYmUoKSB0byBjb25maWd1cmUg
dGhlIGxlZAo+PiBkZWZhdWx0IHN0YXRlIGR1cmluZyBzdGFydHVwLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0t
Cj4+Cj4+IMKgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTU3YS1kazEtc2NtaS11LWJvb3QuZHRzaSB8
IDEgLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdhLWRrMS1zY21pLXUtYm9vdC5kdHNpIGIvYXJjaC9h
cm0vZHRzL3N0bTMybXAxNTdhLWRrMS1zY21pLXUtYm9vdC5kdHNpCj4+IGluZGV4IDVkNDliMDlj
MzVkLi44NzYwZDZjN2Q5MyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdh
LWRrMS1zY21pLXUtYm9vdC5kdHNpCj4+ICsrKyBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3YS1k
azEtc2NtaS11LWJvb3QuZHRzaQo+PiBAQCAtMzksNyArMzksNiBAQAo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgcmVkIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGFiZWwgPSAiZXJyb3Ii
Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBncGlvcyA9IDwmZ3Bpb2EgMTMgR1BJT19B
Q1RJVkVfTE9XPjsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVmYXVsdC1zdGF0ZSA9ICJv
ZmYiOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0dXMgPSAib2theSI7Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCB9Owo+PiDCoMKgwqDCoMKgIH07Cj4gCj4gCj4gCj4gUmV2aWV3ZWQt
Ynk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4g
VGhhbmtzCj4gUGF0cmljawo+IApBcHBsaWVkIG9uIHUtYm9vdC1zdG0zMi9tYXN0ZXIgCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1h
aWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0
bTMyCg==

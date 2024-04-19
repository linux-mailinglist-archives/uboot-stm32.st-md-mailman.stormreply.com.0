Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C858AAE63
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:27:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09A92C6DD9A;
	Fri, 19 Apr 2024 12:27:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D964AC6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:27:30 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J7tg8W027245; Fri, 19 Apr 2024 14:27:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=s7DRaI6XT/zsgmEXQ7M6r5NYuBl/t14Sc3ibZuIPOR0=; b=Rz
 MyWpCmC7Nay+aSarx3wc0wjYhQQEzM8/0vNVWR+a0Ay59B+Gg3TgvRuAALDY9QCu
 rKI/kxiebSP3R9bFHcE8B2GUjLEQCuvdsXOvxM8QuPt5J9jrSljpjVDa+w1XlNOP
 owr70l94HiWN2IQu6WiG7FS4v5Esp/IbSxS9VtSJCJzXMB5iTv+9PJh9UMr0TX61
 7bChtRDr+3N1k/8l0hs3EJ3yYg4l0uuTQu4Iat4qvKfuenEoNMQqj1LBzOcdES9I
 yjyCX2vdyqJBwVnsbtn0cvNTAr/XWkfdiD3JM9N72UIBsJgvlJ1v0Jd86uKwTf+C
 vE90zmUDHQ8nafZbJFBQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xg3m12anj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:27:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5F26C4002D;
 Fri, 19 Apr 2024 14:27:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8186A21A907;
 Fri, 19 Apr 2024 14:27:06 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:27:06 +0200
Message-ID: <dca987a3-9df3-4873-8eda-c151956dddac@foss.st.com>
Date: Fri, 19 Apr 2024 14:27:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-16-patrice.chotard@foss.st.com>
 <c7094883-b9ac-4df2-8335-6907e560f1db@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <c7094883-b9ac-4df2-8335-6907e560f1db@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v1 15/25] ARM: dts: stm32: Don't probe red
 led at boot for stm32mp157a-dk1-u-boot
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

CgpPbiA0LzE3LzI0IDExOjA5LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDQvOS8yNCAxNzowMiwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiByZWQgbGVkIGFuZCBidXR0
b24gZGVkaWNhdGVkIHRvIGZhc3Rib290IHNoYXJlIHRoZSBzYW1lIGdwaW8gR1BJT0ExMy4KPj4g
TGVkIGRyaXZlciBpcyBwcm9iZWQgZWFybHkgc28gdGhlIGNvcnJlc3BvbmRpbmcgZ3BpbyBpcyB0
YWtlbiBhbmQKPj4gY29uZmlndXJlZCBpbiBvdXRwdXQgd2hpY2ggZm9yYmlkIGZhc3Rib290IGFu
ZCBzdG0zMnByb2cgYnV0dG9uIHVzYWdlLgo+Pgo+PiBUbyBhdm9pZCB0aGlzLCByZW1vdmUgdGhl
ICJkZWZhdWx0LXN0YXRlIiBwcm9wZXJ0eSBmcm9tIHJlZCBsZWQgbm9kZS4KPj4KPj4gVGhpcyB3
aWxsIGF2b2lkIHRvIHRyaWdnZXIgdGhlIGxlZCBkcml2ZXIgcHJvYmUoKSB0byBjb25maWd1cmUg
dGhlIGxlZAo+PiBkZWZhdWx0IHN0YXRlIGR1cmluZyBzdGFydHVwLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0t
Cj4+Cj4+IMKgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTU3YS1kazEtdS1ib290LmR0c2kgfCAxIC0K
Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL2R0cy9zdG0zMm1wMTU3YS1kazEtdS1ib290LmR0c2kgYi9hcmNoL2FybS9kdHMvc3Rt
MzJtcDE1N2EtZGsxLXUtYm9vdC5kdHNpCj4+IGluZGV4IDZiZjYxMzZjNWZkLi5lZTliNTFkNDJi
NyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdhLWRrMS11LWJvb3QuZHRz
aQo+PiArKysgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2EtZGsxLXUtYm9vdC5kdHNpCj4+IEBA
IC02Nyw3ICs2Nyw2IEBACj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZWQgewo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBsYWJlbCA9ICJlcnJvciI7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGdwaW9zID0gPCZncGlvYSAxMyBHUElPX0FDVElWRV9MT1c+Owo+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkZWZhdWx0LXN0YXRlID0gIm9mZiI7Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+IMKg
wqDCoMKgwqAgfTsKPiAKPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0
cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCgpBcHBs
aWVkIG9uIHUtYm9vdC1zdG0zMi9tYXN0ZXIgCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==

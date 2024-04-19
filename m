Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D95C28AAE58
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:21:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0E2CC6DD9A;
	Fri, 19 Apr 2024 12:21:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB7DFC6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:21:55 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43JAnTBP006062; Fri, 19 Apr 2024 14:21:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=+l3Bg64fEOVYBYQiH/zOf9nif6yALnP4RYRkHIzlKgQ=; b=eW
 XbT64AqQP8fotR0LBn8r2pj2E5PPifoHVLPh2A7oo1I/CGtC+a6OJYJyw5+PJF/B
 HnXikd02HkDU2NyrjrxFCtZ6utKryNsNsPlR5Cg3whIOgqCKRdbLQ9tVeekSSO18
 fc5Fl5rasXiPJkGGWX/oq2s1O8winem4CxzFg+lGZp8OTSW60+JRLCc0alDwJj0G
 DYzcN5JJyWG6CiIB9+r6IEKR6P+udv32fUKajCUvMLFXUzqhVBK5o3U8vB1A1/7R
 dU65g2KZCwKqsyBHKXDGC6yCrIYH1F8ana+lwg05/elm4631JjDIGK07fug7kkiv
 mRTgWUQQ8kRh32U2G6Yw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xg3m129yn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:21:54 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A0C4E40044;
 Fri, 19 Apr 2024 14:21:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BC6E521A8F9;
 Fri, 19 Apr 2024 14:21:37 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:21:37 +0200
Message-ID: <e23ea82e-1ff1-41eb-adea-5ffdf7b4e2de@foss.st.com>
Date: Fri, 19 Apr 2024 14:21:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-14-patrice.chotard@foss.st.com>
 <07727744-f8c7-4e88-8fa9-3d8f7dc4b54b@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <07727744-f8c7-4e88-8fa9-3d8f7dc4b54b@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v1 13/25] ARM: dts: stm32: Add led-blue
 for stm32mp157a-dk1-scmi-u-boot
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
IDQvOS8yNCAxNzowMiwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBBcyBpbmRpY2F0ZWQgaW4g
a2VybmVsIGxlZCBkdC1iaW5kaW5ncywgbGFiZWwgaXMgYSBkZXByZWNhdGVkCj4+IHByb3BlcnR5
LCBzbyByZW1vdmUgaXQgYW5kIHVzZSBibHVlIGxlZCBub2RlJ3MgbmFtZSBpbnN0ZWFkCj4+IGZv
ciB1LWJvb3QsYm9vdC1sZWQgcHJvcGVydHkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2Ug
Q2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gwqAgYXJj
aC9hcm0vZHRzL3N0bTMybXAxNTdhLWRrMS1zY21pLXUtYm9vdC5kdHNpIHwgNiArKysrKy0KPj4g
wqAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdhLWRrMS1zY21pLXUtYm9vdC5kdHNp
IGIvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdhLWRrMS1zY21pLXUtYm9vdC5kdHNpCj4+IGluZGV4
IGU2MTgxNGZkNjZlLi5hNTE1OGZlYzdlZiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vZHRzL3N0
bTMybXAxNTdhLWRrMS1zY21pLXUtYm9vdC5kdHNpCj4+ICsrKyBiL2FyY2gvYXJtL2R0cy9zdG0z
Mm1wMTU3YS1kazEtc2NtaS11LWJvb3QuZHRzaQo+PiBAQCAtMTMsNyArMTMsNyBAQAo+PiDCoMKg
wqDCoMKgIH07Cj4+IMKgIMKgwqDCoMKgwqAgY29uZmlnIHsKPj4gLcKgwqDCoMKgwqDCoMKgIHUt
Ym9vdCxib290LWxlZCA9ICJoZWFydGJlYXQiOwo+PiArwqDCoMKgwqDCoMKgwqAgdS1ib290LGJv
b3QtbGVkID0gImxlZC1ibHVlIjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHUtYm9vdCxlcnJvci1s
ZWQgPSAibGVkLXJlZCI7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB1LWJvb3QsbW1jLWVudi1wYXJ0
aXRpb24gPSAidS1ib290LWVudiI7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzdCxhZGNfdXNiX3Bk
ID0gPCZhZGMxIDE4PiwgPCZhZGMxIDE5PjsKPj4gQEAgLTM2LDYgKzM2LDEwIEBACj4+IMKgwqDC
oMKgwqAgfTsKPj4gwqAgwqDCoMKgwqDCoCBsZWQgewo+PiArwqDCoMKgwqDCoMKgwqAgbGVkLWJs
dWUgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvZGVsZXRlLXByb3BlcnR5L2xhYmVsOwo+
PiArwqDCoMKgwqDCoMKgwqAgfTsKPj4gKwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgbGVkLXJlZCB7
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdwaW9zID0gPCZncGlvYSAxMyBHUElPX0FD
VElWRV9MT1c+Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPiAKPiAKPiAKPiBSZXZpZXdlZC1i
eTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAKPiBU
aGFua3MKPiBQYXRyaWNrCj4gCgpBcHBsaWVkIG9uIHUtYm9vdC1zdG0zMi9tYXN0ZXIgCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1h
aWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0
bTMyCg==

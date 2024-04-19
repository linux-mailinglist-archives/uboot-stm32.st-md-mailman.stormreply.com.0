Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB928AAE4B
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:17:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37428C6DD9A;
	Fri, 19 Apr 2024 12:17:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DCDAC6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:17:20 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43JABb7m030132; Fri, 19 Apr 2024 14:17:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=vKnrIJ8SfYptriWBhyrUW8Sr2mrxIzkSXR2ebEiisAo=; b=5/
 VtfK1IYfRAiCKYuR3Qfh4HuIUPss8oLE9gGqq+GHUsKshwM5+fY76wF72GBBgW56
 GLP83JHXuLrPza2YkVkwMCBoFgE/lnhchfGwgtIVcELFpAzHpo3AC174Tz1mjuCY
 LyaPbglyywAMOnJ6zpRN7H9dx88V8kQwnV/Q3Vo0Mc4k+XgFR/A7E4y1f9fuzk9g
 ABGA4Iwq8H8A3jn0ZGW8HqnA7YRyhpxqcc+SOnqYVWFerW+GNEuBiHMMk7cp05eK
 dhrGjExCTKSDTHJla2fITPxVnPjcdZE6eTCyLPYMkodqN0S/Hzpuyv2aPDvzEfAJ
 FvjtLzpZf8at0AE/BIbQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xff64utke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:17:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6A66440046;
 Fri, 19 Apr 2024 14:17:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 153BC21A200;
 Fri, 19 Apr 2024 14:17:01 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:17:00 +0200
Message-ID: <8761b18a-e030-46f2-bb2e-2d12e8d45941@foss.st.com>
Date: Fri, 19 Apr 2024 14:17:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-8-patrice.chotard@foss.st.com>
 <ffb64338-341d-409d-8f27-e615cc9a6f9d@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <ffb64338-341d-409d-8f27-e615cc9a6f9d@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 07/25] ARM: dts: stm32: Add gpio-keys
 for stm32mp135f-dk-u-boot
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

CgpPbiA0LzE3LzI0IDExOjA2LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpCj4gCj4gT24g
NC85LzI0IDE3OjAxLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IEFkZCAyIGdwaW8ta2V5cyA6
Cj4+IMKgwqAgXyBidXR0b24tdXNlci0xIGZvciBzdG0zMnByb2cgbW9kZSBhY3RpdmF0aW9uLgo+
PiDCoMKgIF8gdXBkYXRlIGJ1dHRvbi11c2VyJ3MgbGFiZWwgKGRlZmluZWQgaW4ga2VybmVsIERU
KSB0byBtYXRjaCBsYWJlbAo+PiDCoMKgwqDCoCByZXF1ZXN0ZWQgaW4gYm9hcmRfa2V5X2NoZWNr
KCkgZm9yIGZhc3Rib290IG1vZGUgYWN0aXZhdGlvbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0
cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiDC
oCBhcmNoL2FybS9kdHMvc3RtMzJtcDEzNWYtZGstdS1ib290LmR0c2kgfCAxMyArKysrKysrKysr
KysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCj4+Cj4gCj4gCj4gUmV2
aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+
Cj4gCj4gVGhhbmtzCj4gUGF0cmljawo+IAoKQXBwbGllZCBvbiB1LWJvb3Qtc3RtMzIvbWFzdGVy
IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1z
dG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91
Ym9vdC1zdG0zMgo=

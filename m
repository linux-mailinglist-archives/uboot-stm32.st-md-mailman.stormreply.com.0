Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6192E8AAE6B
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:28:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E837C6DD9A;
	Fri, 19 Apr 2024 12:28:11 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E06CC6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:28:10 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J9YsRP005478; Fri, 19 Apr 2024 14:28:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=Aj0F74/Y17wJjWukuLQNrmUPqAvpCUAxEstFkFR6xG0=; b=n2
 FWX3DpTIKfRxtIs7yD342ewyKzwPF7pweDuDyPKa8PgmHQdFvdWqElttNipU1oQj
 9rXW21vY1pVAEJQtu6ygHd1CbM+E0MZ793rcUf72HzLD2GAmmHmKxUViliDPZhrc
 TmYLOWQoV+7w+6LJkDTxRxi3brkP1kxrrCUqaxNl8Z4kKLjMQcwFOkKkNCdCwMmP
 +/Yk8BC8T4c8kjw4P6hy9+C5FSQ/3SqIt7YBXJHANH2iiIPC6vejglAy/0YMGsdw
 AcMDe1cZxdVAmoCRf4w+R87A3iJEwdo7baQ6HA/lzsInV0c5WtRO+9jGn3IR6U+J
 SYzeGveANuPQDxgZsmuw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xg50j9ff6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:28:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BAFA34002D;
 Fri, 19 Apr 2024 14:28:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1915D21A913;
 Fri, 19 Apr 2024 14:27:46 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:27:45 +0200
Message-ID: <01a9050b-9b7a-480f-bc8a-7464452aac0f@foss.st.com>
Date: Fri, 19 Apr 2024 14:27:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-21-patrice.chotard@foss.st.com>
 <3df955ec-2396-4719-9ae3-6d1dbc7d07ff@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <3df955ec-2396-4719-9ae3-6d1dbc7d07ff@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v1 20/25] ARM: dts: stm32: Update red led
 node for stm32mp157c-ed1-u-boot
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

CgpPbiA0LzE3LzI0IDExOjExLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDQvOS8yNCAxNzowMiwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBBcyBpbmRpY2F0ZWQgaW4g
a2VybmVsIGxlZCBkdC1iaW5kaW5ncywgbGFiZWwgaXMgYSBkZXByZWNhdGVkCj4+IHByb3BlcnR5
LCBzbyByZW1vdmUgaXQgYW5kIHVzZSBsZWQgbm9kZSdzIG5hbWUgaW5zdGVhZCBmb3IKPj4gdS1i
b290LGVycm9yLWxlZCBwcm9wZXJ0eS4KPj4gUmVuYW1lIHJlZCBsZWQgbm9kZSdzIG5hbWUgdG8g
bGVkLXJlZC4KPj4gUmVtb3ZlIHN0YXR1cyBwcm9wZXJ0eSB3aGljaCBpcyB1c2VsZXNzLgo+PiBB
ZGQgY29tcGF0aWJsZSA9ICJncGlvLWxlZHMiIHdoaWNoIGlzIG5vdCBwcmVzZW50IGluIGtlcm5l
bCBEVC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3Rh
cmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJtcDE1N2Mt
ZWQxLXUtYm9vdC5kdHNpIHwgOCArKysrLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+IAo+IAo+IFJldmlld2VkLWJ5OiBQYXRyaWNr
IERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IAo+IFRoYW5rcwo+IFBh
dHJpY2sKPiAKCkFwcGxpZWQgb24gdS1ib290LXN0bTMyL21hc3RlciAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0
ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK

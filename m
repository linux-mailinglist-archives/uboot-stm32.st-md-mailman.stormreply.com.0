Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF8F832A0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jan 2024 14:05:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AC3FC6DD73;
	Fri, 19 Jan 2024 13:05:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 403B6C6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 13:05:41 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40J9aDss019271; Fri, 19 Jan 2024 14:05:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=d+1LoRAkD9aNZbvDx/g1cvQshQOu5YUrWBTARuyePcU=; b=iU
 33KYJk6+Ct/SsIkgU+SDEm9CC1P2bydZjaR9OeS2QfCOGsqLo4cpP04KQh12zKXL
 dLoKtPWiW0Wb2FTNndSaukuXqd2cepQCtHw/KynDtMcXo5tqkI04ePV1lIFKpZMc
 h7+VmAkGlwvj1XHjLziqMlpo20SdmCUBeDSFhU2grSxJ9D3IWRjjTSAocvh7Mkxq
 jhKbWMjv0x8XRcpWgyzCi2+oyOatiHOmW0AC8BKDBZFV+2eiY3uVkaLX5k74aCRo
 f1AA0ml5dskOUhoYkgDQkNOGH5dGaWMWXDF+yq4bN0votYu3HHioCjEkuKqr/m5N
 V6KirF1ZAgtx/qpPP0nA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkmfyx9m0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jan 2024 14:05:38 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B6355100081;
 Fri, 19 Jan 2024 14:05:37 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A8FCB23C6A3;
 Fri, 19 Jan 2024 14:05:37 +0100 (CET)
Received: from [10.252.4.250] (10.252.4.250) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Jan
 2024 14:05:37 +0100
Message-ID: <97fd2848-1bd9-4345-82ab-c1da2cbd6694@foss.st.com>
Date: Fri, 19 Jan 2024 14:05:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240104123750.232991-1-patrice.chotard@foss.st.com>
 <042cbd96-55f4-40c4-957a-58d5d1efdd6b@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <042cbd96-55f4-40c4-957a-58d5d1efdd6b@foss.st.com>
X-Originating-IP: [10.252.4.250]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_07,2024-01-19_02,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Fix reset for usart1 in
 scmi configuration
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

CgpPbiAxLzQvMjQgMTg6MzMsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4gSGksCj4gCj4gT24g
MS80LzI0IDEzOjM3LCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IEluIFNDTUkgY29uZmlndXJh
dGlvbiwgdXNhcnQxIGlzIHNlY3VyZSwgc28gYWxsIGl0cyByZXNvdXJjZXMgYXJlIHNlY3VyZWQK
Pj4gKGNsb2NrIGFuZCByZXNldCkgYW5kIGNhbid0IGJlIHNldC91bnNldCBieSBub24tc2VjdXJl
IHdvcmxkIGJ1dCBieSBPUC1URUUuCj4+Cj4+IEZpeGVzOiA2Y2NjYzhkMzk2YmYgKCJBUk06IGR0
czogc3RtMzI6IGFkZCBTQ01JIHZlcnNpb24gb2YgU1RNMzIgYm9hcmRzIChESzEvREsyL0VEMS9F
VjEpIikKPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3Rh
cmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJtcDE1LXNj
bWktdS1ib290LmR0c2kgfCAyICstCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL3N0bTMybXAx
NS1zY21pLXUtYm9vdC5kdHNpIGIvYXJjaC9hcm0vZHRzL3N0bTMybXAxNS1zY21pLXUtYm9vdC5k
dHNpCj4+IGluZGV4IDdjOGZlYzZjYmZiLi43OTQ5NGVjYWQ5MCAxMDA2NDQKPj4gLS0tIGEvYXJj
aC9hcm0vZHRzL3N0bTMybXAxNS1zY21pLXUtYm9vdC5kdHNpCj4+ICsrKyBiL2FyY2gvYXJtL2R0
cy9zdG0zMm1wMTUtc2NtaS11LWJvb3QuZHRzaQo+PiBAQCAtMTM1LDcgKzEzNSw3IEBACj4+IMKg
IH07Cj4+IMKgIMKgICZ1c2FydDEgewo+PiAtwqDCoMKgIHJlc2V0cyA9IDwmcmNjIFVTQVJUMV9S
PjsKPj4gK8KgwqDCoCByZXNldHMgPSA8JnNjbWlfcmVzZXQgUlNUX1NDTUlfVVNBUlQxPjsKPj4g
wqAgfTsKPj4gwqAgwqAgJnVzYXJ0MiB7Cj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVs
YXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4gUGF0cmlj
awo+IAo+IAoKCkFwcGxpZWQgdG8gdS1ib290LXN0bTMyL21hc3RlcgoKVGhhbmtzClBhdHJpY2UK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3Rt
MzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJv
b3Qtc3RtMzIK

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C85AF8AAE54
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:21:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85E0EC6DD9A;
	Fri, 19 Apr 2024 12:21:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1743EC6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:21:29 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J9drNM009597; Fri, 19 Apr 2024 14:21:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=7rRLmmoVjGOPwe3WPkoBNLPyV7tlgjv1VXdCgIvAYMU=; b=Vf
 2uwd1VBw2EKKuT7oCDYurRr67wbS2JGfSF1ixE7oAAwkWf0DUl/4kZp5bK/9rESb
 dSTHDi5DM9koSYv1tGQIGro8Pp5vmm/5SOIFpesL8N7UkLlo8VHBiVIKo6OrVpod
 a0aq1xUfMnqX99Md62cVNJSN7f+DZUXwZuxBueSj/heQgOaKdSKLBCnKkXBqyvPz
 dGo2mQHagMPCP5bbZ1mV9S6E/u11YjIZ9JVxJHwG1dx2DqjYvpN4PcqrELuBhddP
 hMZAfPY4qnqb/kA7KDXnnvVBOmqgS3/E++pklk8F+UcD54c+E8BbLxDOkjqRI5oX
 rr9NE/EFJlSSw4v7CFhg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xff64uu3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:21:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3B9ED40048;
 Fri, 19 Apr 2024 14:21:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 28ACA2194D6;
 Fri, 19 Apr 2024 14:21:06 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:21:05 +0200
Message-ID: <990046fb-4724-4ce7-880f-bd34d432e2e7@foss.st.com>
Date: Fri, 19 Apr 2024 14:21:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-10-patrice.chotard@foss.st.com>
 <5c633f22-6a9e-41ca-932c-ba3704188f06@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <5c633f22-6a9e-41ca-932c-ba3704188f06@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 09/25] ARM: dts: stm32: Clean led-red
 node for stm32mp135f-dk-u-boot
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
IDQvOS8yNCAxNzowMSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBSZW1vdmUgImNvbG9yIiBw
cm9wZXJ0eSBmcm9tIGxlZC1yZWQgbm9kZSB3aGljaCBpcyBub3Qgc3VwcG9ydGVkCj4+IGJ5IFUt
Qm9vdC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3Rh
cmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJtcDEzNWYt
ZGstdS1ib290LmR0c2kgfCAxIC0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTM1Zi1kay11LWJvb3QuZHRz
aSBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTM1Zi1kay11LWJvb3QuZHRzaQo+PiBpbmRleCA4ZjQy
NzM1NjA5YS4uZjAwNGU5ODQwYTIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL2R0cy9zdG0zMm1w
MTM1Zi1kay11LWJvb3QuZHRzaQo+PiArKysgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDEzNWYtZGst
dS1ib290LmR0c2kKPj4gQEAgLTM1LDcgKzM1LDYgQEAKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH07
Cj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBsZWQtcmVkIHsKPj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgY29sb3IgPSA8TEVEX0NPTE9SX0lEX1JFRD47Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGdwaW9zID0gPCZncGlvYSAxMyBHUElPX0FDVElWRV9MT1c+Owo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgfTsKPj4gwqDCoMKgwqDCoCB9Owo+IAo+IAo+IAo+IFJldmlld2VkLWJ5OiBQYXRy
aWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IAo+IFRoYW5rcwo+
IFBhdHJpY2sKPiAKCkFwcGxpZWQgb24gdS1ib290LXN0bTMyL21hc3RlciAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBs
aXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK

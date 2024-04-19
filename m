Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 735308AAE4C
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:17:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3EEEAC6DD9A;
	Fri, 19 Apr 2024 12:17:32 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 408D7C6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:17:31 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J9q0i2005493; Fri, 19 Apr 2024 14:17:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=9wHAYzVQPr4t9DWBAMqAEX8p5SSn24EGRWGBEs8r3aU=; b=Nj
 dV/IWtLJwQkMdHNWCSH5uovpt1+tcdqg+IV0ji5s1Mu/xF6w0QqY8kYFPdreN1vf
 2CDUASaF/jKDjMLdpqAvaba51qa3Sq5t6A7zC2nUNT/f9AI74pHn1/LEg1Q0QlJM
 GCf9rNVvI0O7cc0r+NNuu1e0wlngeEIrcleXHG8x/7IcLOyM2ZvWfw3ftcLF0URb
 mPv25P6ziMG2YOSvZNLsUbrePUZ1n9ODXc93ZddYu4acLYBdZ08LtPoPLCa457vI
 2CJXWKEU95Klj4zAg/6j0OgLJEXcGyIbdUp+pPHRRg5UdSF+c3K7Id7jYcsPQPEB
 raG7An7zFSEVab4N7XKw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xg50j9e7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:17:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5CB0340046;
 Fri, 19 Apr 2024 14:17:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3940F21A20E;
 Fri, 19 Apr 2024 14:16:53 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:16:52 +0200
Message-ID: <695ed5d1-eee0-4ea8-bba6-67a391195803@foss.st.com>
Date: Fri, 19 Apr 2024 14:16:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-7-patrice.chotard@foss.st.com>
 <84fc1ed3-82b4-4911-b191-87fa6ef7fbcf@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <84fc1ed3-82b4-4911-b191-87fa6ef7fbcf@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [Uboot-stm32] [PATCH v1 06/25] board: st: stmp32mp1: Use BUTTON
 UCLASS in board_key_check()
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

CgpPbiA0LzE3LzI0IDExOjA1LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDQvOS8yNCAxNzowMSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBJbnN0ZWFkIG9mIHVzaW5n
IGdwaW8gZGlyZWN0bHkgdG8gZGV0ZWN0IGtleSBwcmVzc2VkIG9uIGJ1dHRvbgo+PiBkZWRpY2F0
ZWQgZm9yIGZhc3Rib290IGFuZCBzdG0zMm1wcm9nLCBtYWtlIHVzYWdlIG9mIEJVVFRPTiBVQ0xB
U1MuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJk
QGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gwqAgYm9hcmQvc3Qvc3RtMzJtcDEvc3RtMzJtcDEu
YyB8IDY4ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCj4+Cj4gCj4gCj4gUmV2
aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+
Cj4gCj4gVGhhbmtzCj4gUGF0cmljawo+IAoKQXBwbGllZCBvbiB1LWJvb3Qtc3RtMzIvbWFzdGVy
IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1z
dG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91
Ym9vdC1zdG0zMgo=

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D383AA94B0
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 May 2025 15:38:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 147A8C78F63;
	Mon,  5 May 2025 13:38:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 144A9C78F62
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 May 2025 13:38:13 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545B2iVM029905;
 Mon, 5 May 2025 15:38:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 7m//M2srdJ6uvxinmwdUBz1VHlLMuOiYxQeU20/DFSY=; b=c7ZA4OIrclgH5CNg
 g2fRAD22pvZB88zhoQ+HC5jH4UYLCr0Sgm7/A4rmlprle9gtb7otQdBMJyibZlM4
 rGroMd2KEixBsLJX3ud1SVaxWuJv3V/g5lQhO3d7E6c1jycI50AV+B9W/N5NWEcw
 zh6vHRsgzq6Ov6yDqWgnKjsPj5C1vKgzqBlIL9JKqDki1T9mWKc56flwsDBLsnii
 3YDJTTtw/v0ro6Gt0PWtxMskS0S75DarWLCZ++kbrw/XmYR/YySdhQxEnJb6Hk5G
 qelA25V6/TkIob1cjCI2VQHlB2P5zh4bSNTCA2ZqIEjqrdpzCVhjx3E7isKMVfmH
 gsfpIg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46dbkq6w0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 May 2025 15:38:09 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D11B340049;
 Mon,  5 May 2025 15:37:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 89D3CB3EE49;
 Mon,  5 May 2025 15:35:33 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 May
 2025 15:35:32 +0200
Message-ID: <21830c81-1570-4096-b07c-b5b9ee9cae6a@foss.st.com>
Date: Mon, 5 May 2025 15:35:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20250401135132.395518-1-patrice.chotard@foss.st.com>
 <20250401135132.395518-6-patrice.chotard@foss.st.com>
 <b2736555-6b4f-4c28-a525-9d5e3c1a4020@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <b2736555-6b4f-4c28-a525-9d5e3c1a4020@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH 5/6] configs: stm32746-eval_spl: Fix
	console cmdline
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

CgpPbiA0LzIyLzI1IDA5OjUxLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDQvMS8yNSAxNTo1MSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBUaGUgTGludXggY21kbGlu
ZSBlbmNvZGVkIGluIHRoZSBkZWZjb25maWcgaXMgd3JvbmcsIHRoZQo+PiBTVE0zMiBVU0FSVCBk
cml2ZXIgcmVnaXN0ZXJzIGFzIHR0eVNUTTAgbm90IHR0eVMwLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+
Cj4+IMKgIGNvbmZpZ3Mvc3RtMzI3NDZnLWV2YWxfc3BsX2RlZmNvbmZpZyB8IDIgKy0KPj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS9jb25maWdzL3N0bTMyNzQ2Zy1ldmFsX3NwbF9kZWZjb25maWcgYi9jb25maWdzL3N0
bTMyNzQ2Zy1ldmFsX3NwbF9kZWZjb25maWcKPj4gaW5kZXggOGEwYjFlMjFmYjUuLjQ3MDZhNzJj
YjljIDEwMDY0NAo+PiAtLS0gYS9jb25maWdzL3N0bTMyNzQ2Zy1ldmFsX3NwbF9kZWZjb25maWcK
Pj4gKysrIGIvY29uZmlncy9zdG0zMjc0NmctZXZhbF9zcGxfZGVmY29uZmlnCj4+IEBAIC0yNyw3
ICsyNyw3IEBAIENPTkZJR19BVVRPQk9PVF9LRVlFRD15Cj4+IMKgIENPTkZJR19BVVRPQk9PVF9Q
Uk9NUFQ9IkhpdCBTUEFDRSBpbiAlZCBzZWNvbmRzIHRvIHN0b3AgYXV0b2Jvb3QuXG4iCj4+IMKg
IENPTkZJR19BVVRPQk9PVF9TVE9QX1NUUj0iICIKPj4gwqAgQ09ORklHX1VTRV9CT09UQVJHUz15
Cj4+IC1DT05GSUdfQk9PVEFSR1M9ImNvbnNvbGU9dHR5UzAsMTE1MjAwIGVhcmx5cHJpbnRrIGNv
bnNvbGVibGFuaz0wIGlnbm9yZV9sb2dsZXZlbCIKPj4gK0NPTkZJR19CT09UQVJHUz0iY29uc29s
ZT10dHlTVE0wLDExNTIwMCBlYXJseXByaW50ayBjb25zb2xlYmxhbms9MCBpZ25vcmVfbG9nbGV2
ZWwiCj4+IMKgIENPTkZJR19ERUZBVUxUX0ZEVF9GSUxFPSJzdG0zMjc0NmctZXZhbCIKPj4gwqAg
Q09ORklHX1NZU19QQlNJWkU9MTA1MAo+PiDCoCAjIENPTkZJR19ESVNQTEFZX0NQVUlORk8gaXMg
bm90IHNldAo+IAo+IAo+IAo+IFJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNr
LmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IAo+IFRoYW5rcwo+IFBhdHJpY2sKPiAKQXBwbGllZCB0
byB1LWJvb3Qtc3RtMzIvbWFzdGVyCgpUaGFua3MKUGF0cmljZQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJv
b3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

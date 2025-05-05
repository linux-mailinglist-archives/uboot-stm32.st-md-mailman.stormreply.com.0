Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59975AA94B1
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 May 2025 15:38:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D0EAC78F63;
	Mon,  5 May 2025 13:38:16 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC40BC78F67
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 May 2025 13:38:14 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54598I9j027265;
 Mon, 5 May 2025 15:38:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Fg0+vlYONJR05ceiyZ6qRLG2Z70aR26ls/9uaHPu8q0=; b=oITBWOnThV/r7bQy
 VT9zuJI97qvJ7bJ7Abw/wG3RJSeoGKlLOI8mjW93N8QHMOT6LLRrxx01tjqzRkTA
 XACHUThxFXxaXTpWRglcSFMaKue1tuRO5YclwULn54Q2XLorlQDE/u8TL/ipFyeT
 VFHWq2LYjFf5lOkbiHz+3CLS2mR9ZMBLa6AHKyls79bFC8n9qCbdfLJmIaGi/9Xw
 vVc2Ly6HAr+EppP4f2RmjJw/nvANRv4LmmaVdWv/ka1QBPo646Oo5dFqphg/3apC
 uQVuTlz1qFnA05qlEkFTr3M47kMNa11xF1hpe1Q1yQ00l/rG+pp/8zUrnAgWnLrB
 lns/vA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46dx3m4kqu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 May 2025 15:38:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CBFD840073;
 Mon,  5 May 2025 15:37:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 10C88B3DD47;
 Mon,  5 May 2025 15:35:12 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 May
 2025 15:35:10 +0200
Message-ID: <5896b5be-f745-407f-b115-ebb25c2122f6@foss.st.com>
Date: Mon, 5 May 2025 15:35:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20250401135132.395518-1-patrice.chotard@foss.st.com>
 <20250401135132.395518-5-patrice.chotard@foss.st.com>
 <48b97d99-6e7d-4761-9aa4-e0df4b5fb364@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <48b97d99-6e7d-4761-9aa4-e0df4b5fb364@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Kamil Lulko <kamil.lulko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 4/6] configs: stm32f729-discovery: Fix
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
Cj4+IMKgIGNvbmZpZ3Mvc3RtMzJmNDI5LWRpc2NvdmVyeV9kZWZjb25maWcgfCAyICstCj4+IMKg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvY29uZmlncy9zdG0zMmY0MjktZGlzY292ZXJ5X2RlZmNvbmZpZyBiL2NvbmZpZ3Mv
c3RtMzJmNDI5LWRpc2NvdmVyeV9kZWZjb25maWcKPj4gaW5kZXggNTk0MTZjYjdlNDMuLjM2ZTU3
ZWRiYjRkIDEwMDY0NAo+PiAtLS0gYS9jb25maWdzL3N0bTMyZjQyOS1kaXNjb3ZlcnlfZGVmY29u
ZmlnCj4+ICsrKyBiL2NvbmZpZ3Mvc3RtMzJmNDI5LWRpc2NvdmVyeV9kZWZjb25maWcKPj4gQEAg
LTE1LDcgKzE1LDcgQEAgQ09ORklHX0VOVl9BRERSPTB4ODA0MDAwMAo+PiDCoCBDT05GSUdfRU5W
X1ZBUlNfVUJPT1RfQ09ORklHPXkKPj4gwqAgQ09ORklHX0JPT1RERUxBWT0zCj4+IMKgIENPTkZJ
R19VU0VfQk9PVEFSR1M9eQo+PiAtQ09ORklHX0JPT1RBUkdTPSJjb25zb2xlPXR0eVMwLDExNTIw
MCBlYXJseXByaW50ayBjb25zb2xlYmxhbms9MCBpZ25vcmVfbG9nbGV2ZWwiCj4+ICtDT05GSUdf
Qk9PVEFSR1M9ImNvbnNvbGU9dHR5U1RNMCwxMTUyMDAgZWFybHlwcmludGsgY29uc29sZWJsYW5r
PTAgaWdub3JlX2xvZ2xldmVsIgo+PiDCoCBDT05GSUdfU1lTX1BCU0laRT0xMDUwCj4+IMKgICMg
Q09ORklHX0RJU1BMQVlfQ1BVSU5GTyBpcyBub3Qgc2V0Cj4+IMKgICMgQ09ORklHX0RJU1BMQVlf
Qk9BUkRJTkZPIGlzIG5vdCBzZXQKPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5h
eSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4g
CkFwcGxpZWQgdG8gdS1ib290LXN0bTMyL21hc3RlcgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGlu
ZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 368F5AA94AD
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 May 2025 15:38:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECA29C78F67;
	Mon,  5 May 2025 13:38:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 095EAC78F62
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 May 2025 13:38:06 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545A4tco018585;
 Mon, 5 May 2025 15:38:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 r4MEWAg6PEy4dd/zeMsWbZjHC9jGfFsEbM+SNWnbugM=; b=kJRibzOlCu0UtwCM
 RAvMRjByc44YWKAksYI3rt6+EBktAezC0yAXjkljSDvQ3KnDqC9hByBcPJRytPNX
 /S810YP/Bg5ocwseK0pXeR5l3kgO+xyTRsKQImQuu827wSbYJVvelBbNTOnhVt6Y
 HHDmccoT7ZX7O6IF+rUM/+KLJ31TS2G72cVUe/VHKGyKc7NyMAPGye44pbI1Yml6
 odb9KeNQJR3cNgRaOg1uMgJRwEZq/iYwtwzEwRlaX9PTM6QF6Lyx7vEJiY0wg3Ac
 anvmyTwanhgY2RpkhnBrQSrIuqwmdCjhQDNAOwSvPIUcf1CtbF20xrtlCq4n5fxA
 G2a3+Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46dbenpx3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 May 2025 15:38:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 876004006D;
 Mon,  5 May 2025 15:37:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 023D1B3EE57;
 Mon,  5 May 2025 15:35:42 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 May
 2025 15:35:41 +0200
Message-ID: <9a209487-5c30-4af8-891b-34f39f36f11d@foss.st.com>
Date: Mon, 5 May 2025 15:35:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20250401135132.395518-1-patrice.chotard@foss.st.com>
 <20250401135132.395518-7-patrice.chotard@foss.st.com>
 <8c3c3bf6-2662-4e7e-b43f-984411358fa9@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <8c3c3bf6-2662-4e7e-b43f-984411358fa9@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH 6/6] configs: stm32746-eval: Fix console
	cmdline
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

CgpPbiA0LzIyLzI1IDA5OjUyLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDQvMS8yNSAxNTo1MSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBUaGUgTGludXggY21kbGlu
ZSBlbmNvZGVkIGluIHRoZSBkZWZjb25maWcgaXMgd3JvbmcsIHRoZQo+PiBTVE0zMiBVU0FSVCBk
cml2ZXIgcmVnaXN0ZXJzIGFzIHR0eVNUTTAgbm90IHR0eVMwLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4KPj4gLS0t
Cj4+Cj4+IMKgIGNvbmZpZ3Mvc3RtMzI3NDZnLWV2YWxfZGVmY29uZmlnIHwgMiArLQo+PiDCoCAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAt
LWdpdCBhL2NvbmZpZ3Mvc3RtMzI3NDZnLWV2YWxfZGVmY29uZmlnIGIvY29uZmlncy9zdG0zMjc0
NmctZXZhbF9kZWZjb25maWcKPj4gaW5kZXggYzk1Y2I2MGIwZmIuLjVmZmUxYzE2NjFhIDEwMDY0
NAo+PiAtLS0gYS9jb25maWdzL3N0bTMyNzQ2Zy1ldmFsX2RlZmNvbmZpZwo+PiArKysgYi9jb25m
aWdzL3N0bTMyNzQ2Zy1ldmFsX2RlZmNvbmZpZwo+PiBAQCAtMTgsNyArMTgsNyBAQCBDT05GSUdf
QVVUT0JPT1RfS0VZRUQ9eQo+PiDCoCBDT05GSUdfQVVUT0JPT1RfUFJPTVBUPSJIaXQgU1BBQ0Ug
aW4gJWQgc2Vjb25kcyB0byBzdG9wIGF1dG9ib290LlxuIgo+PiDCoCBDT05GSUdfQVVUT0JPT1Rf
U1RPUF9TVFI9IiAiCj4+IMKgIENPTkZJR19VU0VfQk9PVEFSR1M9eQo+PiAtQ09ORklHX0JPT1RB
UkdTPSJjb25zb2xlPXR0eVMwLDExNTIwMCBlYXJseXByaW50ayBjb25zb2xlYmxhbms9MCBpZ25v
cmVfbG9nbGV2ZWwiCj4+ICtDT05GSUdfQk9PVEFSR1M9ImNvbnNvbGU9dHR5U1RNMCwxMTUyMDAg
ZWFybHlwcmludGsgY29uc29sZWJsYW5rPTAgaWdub3JlX2xvZ2xldmVsIgo+PiDCoCBDT05GSUdf
U1lTX1BCU0laRT0xMDUwCj4+IMKgIENPTkZJR19ERUZBVUxUX0ZEVF9GSUxFPSJzdG0zMjc0Nmct
ZXZhbCIKPj4gwqAgIyBDT05GSUdfRElTUExBWV9DUFVJTkZPIGlzIG5vdCBzZXQKPiAKPiAKPiBS
ZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNv
bT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCkFwcGxpZWQgdG8gdS1ib290LXN0bTMyL21hc3Rl
cgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK

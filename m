Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F08258AAE8B
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:34:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA793C6DD9A;
	Fri, 19 Apr 2024 12:34:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14F19C6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:34:05 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43JADtlN012295; Fri, 19 Apr 2024 14:34:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=11PuNuZdLG9PbE6r/I80d2PjLQ5J/AXHStoWSe/ZWRQ=; b=tF
 j3t/wFdenuszYcEe0ztq1oJWr8p92dB6skG/LrLGesQ6P4/lkRCvbzQJwehZfP+w
 J36L75bO8NFZoSVqNMc7YXhGVZ1LJRfxLxAgzt1qyFmkONFvto9BfU6HeqfpYkxU
 q5+tJsIGjhA4jcBeonaX9guUupmJx6Kid667WxnrHAmTyqsvWxSSTpNZSbfo23Wd
 yJufiC/fbWg78kf3RVMsoCYt98rI8knJn812PfAZWiOKDmaC3pL37X17Hf9+nTcW
 bN/lLDwXQIiebVIyG+C3yqbkjrKsSFKnXCm2LNF0cV9vniI9QZx5GNz6aMEIotr9
 im3SiMzHTjy2yV4o+Ncg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xffffvtef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:34:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 686A84002D;
 Fri, 19 Apr 2024 14:33:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B28A821ADC0;
 Fri, 19 Apr 2024 14:33:30 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:33:30 +0200
Message-ID: <07d22ece-9e8b-4b41-ab06-bb6d4cf71be7@foss.st.com>
Date: Fri, 19 Apr 2024 14:33:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240308135009.2621719-1-patrice.chotard@foss.st.com>
 <20240308135009.2621719-2-patrice.chotard@foss.st.com>
 <1e1b820c-f5fd-4fad-8692-53c92ec2e332@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <1e1b820c-f5fd-4fad-8692-53c92ec2e332@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] ARM: dts: stm32: Fix partition node
 name for stm32mp15xx-dhcor-u-boot
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

CgpPbiA0LzE3LzI0IDExOjAwLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpCj4gCj4gT24g
My84LzI0IDE0OjUwLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IEZpeCBmbGFzaEAwIHBhcnRp
dGlvbiBub2RlIG5hbWUgd2l0aCBjb3JyZWN0IG9mZnNldC4KPj4KPj4gRml4ZXM6IDkwZjk5MmU2
YTU4YyAoImFybTogZHRzOiBzdG0zMjogQWRkIHBhcnRpdGlvbnMgaW4gZmxhc2gwIGFuZCBuYW5k
IG5vZGUgZm9yCj4+IHN0bTMybXAxNXh4LWRoY29tL2RoY29yIikKPj4KPj4gU2lnbmVkLW9mZi1i
eTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+
Pgo+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJtcDE1eHgtZGhjb3ItdS1ib290LmR0c2kgfCA2ICsr
Ky0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL3N0bTMybXAxNXh4LWRoY29yLXUtYm9v
dC5kdHNpIGIvYXJjaC9hcm0vZHRzL3N0bTMybXAxNXh4LWRoY29yLXUtYm9vdC5kdHNpCj4+IGlu
ZGV4IDU1MmIzNWRiM2M3Li5iYTg0ZGI2NzllMSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vZHRz
L3N0bTMybXAxNXh4LWRoY29yLXUtYm9vdC5kdHNpCj4+ICsrKyBiL2FyY2gvYXJtL2R0cy9zdG0z
Mm1wMTV4eC1kaGNvci11LWJvb3QuZHRzaQo+PiBAQCAtNDIsMTUgKzQyLDE1IEBACj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxhYmVsID0gImZzYmwyIjsKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmVnID0gPDB4MDAwNDAwMDAgMHgwMDA0MDAwMD47Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCB9Owo+PiAtwqDCoMKgwqDCoMKgwqAgcGFydGl0aW9uQDUwMDAwMCB7Cj4+ICvCoMKg
wqDCoMKgwqDCoCBwYXJ0aXRpb25AODAwMDAgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBsYWJlbCA9ICJ1Ym9vdCI7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDww
eDAwMDgwMDAwIDB4MDAxNjAwMDA+Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4gLcKgwqDC
oMKgwqDCoMKgIHBhcnRpdGlvbkA5MDAwMDAgewo+PiArwqDCoMKgwqDCoMKgwqAgcGFydGl0aW9u
QDFlMDAwMCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxhYmVsID0gImVudjEiOwo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgwMDFFMDAwMCAweDAwMDEwMDAw
PjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+IC3CoMKgwqDCoMKgwqDCoCBwYXJ0aXRpb25A
OTgwMDAwIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHBhcnRpdGlvbkAxZjAwMDAgewo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBsYWJlbCA9ICJlbnYyIjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmVnID0gPDB4MDAxRjAwMDAgMHgwMDAxMDAwMD47Cj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCB9Owo+IAo+IAo+IAo+IFJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNr
LmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IAo+IFRoYW5rcwo+IFBhdHJpY2sKPiAKCkFwcGxpZWQg
b24gdS1ib290LXN0bTMyL21hc3RlciAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK

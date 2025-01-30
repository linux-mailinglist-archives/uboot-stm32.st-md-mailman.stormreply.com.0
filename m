Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F1EA23177
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2025 17:05:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17656C78F67;
	Thu, 30 Jan 2025 16:05:25 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D23EC6C83A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2025 16:05:18 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UEUtwI022423;
 Thu, 30 Jan 2025 17:05:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 g48sfWxh2Firgpq8bu1Oh9W+cOrR5D3jKHB6A9tquDg=; b=nr5DU1wOW+hh2FoV
 f24c+LEq+SoTWQpTsMZr3UcsiLemDN2x6Wf4WFS144lzdQarnio41ySWuxAkAz3K
 P7DarVb3JZncsZIzCuoqELdKvOe67FbY8sjtPgW0X7y/OZLX+5O8BQu8l4UpzUTy
 pt07uSHh0aJaN1lADlIHtZrBvauAd4Q5EAu1FupKamjKxttN31QgLQfakRG/1xE1
 4YqBQSw93YiEmTl63BYRYnfaPDQdYS9CUUcF65VEz35HoHOlc2vzCf+qMPxVYnYh
 trBRZ+Zhlgo7TdeKp9C6Xw3z7J87cnTAoE5HwP27N+6CtxmseWf5jESf/g21n22e
 aO4Dww==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44g6v6hygy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jan 2025 17:05:15 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 72B0E4004A;
 Thu, 30 Jan 2025 17:04:21 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 96F303CBA10;
 Thu, 30 Jan 2025 16:59:24 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 30 Jan
 2025 16:59:24 +0100
Message-ID: <2a619cae-ac94-4b53-a6c9-e1fad0fe2747@foss.st.com>
Date: Thu, 30 Jan 2025 16:59:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20250123144718.1139824-1-patrice.chotard@foss.st.com>
 <20250123144718.1139824-6-patrice.chotard@foss.st.com>
 <26ecfad5-b3fa-43a6-bc6d-cb83b5197dc8@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <26ecfad5-b3fa-43a6-bc6d-cb83b5197dc8@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_07,2025-01-30_01,2024-11-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v4 5/9] configs: stih410-b2260: Enable
 USB_DWC3_GENERIC and USB_DWC3_STI flags
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

CgpPbiAxLzMwLzI1IDE0OjI1LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDEvMjMvMjUgMTU6NDcsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gRW5hYmxlIFVTQl9EV0Mz
X0dFTkVSSUMgYW5kIFVTQl9EV0MzX1NUSSBmbGFncy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0
cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IENjOiBNYXJlayBW
YXN1dCA8bWFyZXhAZGVueC5kZT4KPj4gLS0tCj4+Cj4+IChubyBjaGFuZ2VzIHNpbmNlIHYxKQo+
Pgo+PiDCoCBjb25maWdzL3N0aWg0MTAtYjIyNjBfZGVmY29uZmlnIHwgMiArKwo+PiDCoCAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9jb25maWdzL3N0
aWg0MTAtYjIyNjBfZGVmY29uZmlnIGIvY29uZmlncy9zdGloNDEwLWIyMjYwX2RlZmNvbmZpZwo+
PiBpbmRleCBlMzEyY2E0OTJkMi4uNGZjYmY3NTU0OGIgMTAwNjQ0Cj4+IC0tLSBhL2NvbmZpZ3Mv
c3RpaDQxMC1iMjI2MF9kZWZjb25maWcKPj4gKysrIGIvY29uZmlncy9zdGloNDEwLWIyMjYwX2Rl
ZmNvbmZpZwo+PiBAQCAtNjEsNiArNjEsOCBAQCBDT05GSUdfVVNCX0VIQ0lfR0VORVJJQz15Cj4+
IMKgIENPTkZJR19VU0JfT0hDSV9IQ0Q9eQo+PiDCoCBDT05GSUdfVVNCX09IQ0lfR0VORVJJQz15
Cj4+IMKgIENPTkZJR19VU0JfRFdDMz15Cj4+ICtDT05GSUdfVVNCX0RXQzNfR0VORVJJQz15Cj4+
ICtDT05GSUdfVVNCX0RXQzNfU1RJPXkKPj4gwqAgQ09ORklHX1VTQl9IT1NUX0VUSEVSPXkKPj4g
wqAgQ09ORklHX1VTQl9FVEhFUl9BU0lYPXkKPj4gwqAgQ09ORklHX1VTQl9FVEhFUl9NQ1M3ODMw
PXkKPiAKPiAKPiB3aXRoIENPTkZJR19VU0JfWEhDSV9TVEkgPSB5IChkZWZhdWx0IGluIEtjb25m
aWcpCj4geW91IGhhdmUgMiBkcnZpZXIgZm9yIHRoZSBzYW1lIGNvbXBhdGlibGUgbm93wqAgPSAi
c3Qsc3RpaDQwNy1kd2MzIgo+IAo+IGNhbiBiZSBzb2x2ZSB3aXRoIGFkZGluZyB0ZW1wb3Jhcmls
eSAodXAgdG8gbmV4dCBwYXRjaCkKPiAKPiAjIENPTkZJR19VU0JfWEhDSV9TVEkgaXMgbm90IHNl
dAoKSSB3aWxsIGZpcnN0IHJlbW92ZSB0aGUgIm9sZCIgZHdjMy1zdGktZ2x1ZS5jIGRyaXZlcgph
bmQgdGhlbiBpbnRyb2R1Y2UgdGhlICJuZXciIGR3YzMtZ2VuZXJpYy1zdGkuYyB0byBhdm9pZCB0
aGlzIGtpbmQgb2Ygc2l0dWF0aW9uLgoKU28gIltQQVRDSCA2LzldIHVzYjogZHdjMzogUmVtb3Zl
IGR3YzMgZ2x1ZSBkcml2ZXIgc3VwcG9ydCBmb3IgU1RpIiBiZWNvbWVzIFtwYXRjaCAzLzldIC4u
LgoKVGhhbmtzClBhdHJpY2UKCj4gCj4gCj4gUGF0cmljawo+IAo+IApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QK
VWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

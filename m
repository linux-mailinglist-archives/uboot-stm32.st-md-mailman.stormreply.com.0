Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2011AA9497
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 May 2025 15:34:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AFC2C78F63;
	Mon,  5 May 2025 13:34:20 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2E00C78F62
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 May 2025 13:34:18 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545CXuc4010482;
 Mon, 5 May 2025 15:34:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 llLJT0Lujvn7Ld9hDHvA0zvv0nzdqqe3I1lgxC1x8ro=; b=E/3tbS4+g6VupN/C
 R4bBg8DdltwVrMy62BFOG8bWf6Hisg6/IX17fco5Cp3NY0iJFf9B1B8wSA7g+5rA
 51jPULr1sJ8HUsb5nJAxHOiC4vXENSaQwg/EyhmFqnzHX2GsNihegq5CuLxvmuk7
 Pq93cl0K7bWd1fgvaws8UA9M3SJPQyY0kMS9l6kWJ+GE1TB0eDPKQq8vcsYKzEhO
 mHqjJ8A1QtfK5Fl/iTE+EIfS8u+jIUw0tW7oxKSL2dlfYC2hQsNozEqK/xV9b4DX
 3H68prV8RSPpoMbKpuydVu1EOoFB9bXQIcv3ziapwjp+SCL43HbGkFjF6V+jgq4x
 /FmTqA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46dx3m4k4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 May 2025 15:34:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id ADCB540077;
 Mon,  5 May 2025 15:32:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 24BD7B1B533;
 Mon,  5 May 2025 15:29:51 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 May
 2025 15:29:50 +0200
Message-ID: <5820a305-8f14-4c6f-8771-743cba89d45b@foss.st.com>
Date: Mon, 5 May 2025 15:29:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20250411092721.331518-1-patrice.chotard@foss.st.com>
 <3757b4a7-735a-4e19-a460-b3cfe73dff5c@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <3757b4a7-735a-4e19-a460-b3cfe73dff5c@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
Cc: Erik Schumacher <erik.schumacher@iris-sensing.com>,
 Marek Vasut <marex@denx.de>, Greg Malysa <malysagreg@gmail.com>,
 Heesub Shin <heesub@gmail.com>, Philip Oberfichtner <pro@denx.de>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] net: dwc_eth_qos: add support of stm32mp2
	platform
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

CgpPbiA0LzIyLzI1IDA5OjQ3LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDQvMTEvMjUgMTE6MjcsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gRnJvbTogQ2hyaXN0b3Bo
ZSBSb3VsbGllciA8Y2hyaXN0b3BoZS5yb3VsbGllckBmb3NzLnN0LmNvbT4KPj4KPj4gQWRkIGNv
bXBhdGlibGUgInN0LHN0bTMybXAyNS1kd21hYyIgdG8gbWFuYWdlIFNUTTMyTVAyIGJvYXJkcwo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIFJvdWxsaWVyIDxjaHJpc3RvcGhlLnJvdWxs
aWVyQGZvc3Muc3QuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJp
Y2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGRyaXZlcnMvbmV0L2R3Y19l
dGhfcW9zLmPCoMKgwqDCoMKgwqAgfMKgIDQgKysrKwo+PiDCoCBkcml2ZXJzL25ldC9kd2NfZXRo
X3Fvcy5owqDCoMKgwqDCoMKgIHzCoCAxICsKPj4gwqAgZHJpdmVycy9uZXQvZHdjX2V0aF9xb3Nf
c3RtMzIuYyB8IDExICsrKysrKysrKysrCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0
aW9ucygrKQo+Pgo+IAo+IFJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRl
bGF1bmF5QGZvc3Muc3QuY29tPgo+IAo+IFRoYW5rcwo+IFBhdHJpY2sKPiAKPiAKQXBwbGllZCB0
byB1LWJvb3Qtc3RtMzIvbWFzdGVyCgpUaGFua3MKUGF0cmljZQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJv
b3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE0FAA94AE
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 May 2025 15:38:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03162C78F63;
	Mon,  5 May 2025 13:38:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC73EC78F62
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 May 2025 13:38:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5458EOP1010781;
 Mon, 5 May 2025 15:38:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 kw4tB95CpEzNQNRSnN/zta6kr6rJmB5DW3r1D6JDdD4=; b=v993jptHWp8tiet9
 z630RpL+RANfLxbM7GcXnYj0bmqxUjzQuaArrM7T72Mk59drsJkL+9/akYcHf64f
 kUlWc87r698SpXJm02Wra/U6CB1aRV+04qJeWgPyt2W6Gz11lozO/mz073rtkWHq
 5qsoLECpaf2UeVYkiy3JwWUF1BKAWoMZ8m646gK5eX4F1iFD+THfDIYHqDSuERxm
 wFkTEQ/AHRDnV5dgAyoBPV0Klv+1N+RwEB16Q5LnBGIHlzpQiiq6AegKuqvP+6HB
 XR0fFXuIQ6HBf6RrbwdASnG6MOmnVvH1j7QWSE/9mfsj0SUAgmou9TFY5lkHkklb
 BF6avw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46dbf36j7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 May 2025 15:38:06 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DF2B940045;
 Mon,  5 May 2025 15:37:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E4428B313C5;
 Mon,  5 May 2025 15:34:59 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 May
 2025 15:34:58 +0200
Message-ID: <bf0e3a6f-29d9-42bb-82c7-aa51e26e96eb@foss.st.com>
Date: Mon, 5 May 2025 15:34:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20250401135132.395518-1-patrice.chotard@foss.st.com>
 <20250401135132.395518-4-patrice.chotard@foss.st.com>
 <b92d998d-dc41-4d1f-b796-782f74aa81ed@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <b92d998d-dc41-4d1f-b796-782f74aa81ed@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH 3/6] configs: stm32f769-disco: Fix console
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

CgpPbiA0LzIyLzI1IDA5OjUxLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDQvMS8yNSAxNTo1MSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBUaGUgTGludXggY21kbGlu
ZSBlbmNvZGVkIGluIHRoZSBkZWZjb25maWcgaXMgd3JvbmcsIHRoZQo+PiBTVE0zMiBVU0FSVCBk
cml2ZXIgcmVnaXN0ZXJzIGFzIHR0eVNUTTAgbm90IHR0eVMwLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+
Cj4+IMKgIGNvbmZpZ3Mvc3RtMzJmNzQ2LWRpc2NvX2RlZmNvbmZpZyB8IDIgKy0KPj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9jb25maWdzL3N0bTMyZjc0Ni1kaXNjb19kZWZjb25maWcgYi9jb25maWdzL3N0bTMyZjc0
Ni1kaXNjb19kZWZjb25maWcKPj4gaW5kZXggMmQxOGQ3NzdhMDAuLjI0YmY2ZTZhMDg2IDEwMDY0
NAo+PiAtLS0gYS9jb25maWdzL3N0bTMyZjc0Ni1kaXNjb19kZWZjb25maWcKPj4gKysrIGIvY29u
Zmlncy9zdG0zMmY3NDYtZGlzY29fZGVmY29uZmlnCj4+IEBAIC0xOCw3ICsxOCw3IEBAIENPTkZJ
R19BVVRPQk9PVF9LRVlFRD15Cj4+IMKgIENPTkZJR19BVVRPQk9PVF9QUk9NUFQ9IkhpdCBTUEFD
RSBpbiAlZCBzZWNvbmRzIHRvIHN0b3AgYXV0b2Jvb3QuXG4iCj4+IMKgIENPTkZJR19BVVRPQk9P
VF9TVE9QX1NUUj0iICIKPj4gwqAgQ09ORklHX1VTRV9CT09UQVJHUz15Cj4+IC1DT05GSUdfQk9P
VEFSR1M9ImNvbnNvbGU9dHR5UzAsMTE1MjAwIGVhcmx5cHJpbnRrIGNvbnNvbGVibGFuaz0wIGln
bm9yZV9sb2dsZXZlbCIKPj4gK0NPTkZJR19CT09UQVJHUz0iY29uc29sZT10dHlTVE0wLDExNTIw
MCBlYXJseXByaW50ayBjb25zb2xlYmxhbms9MCBpZ25vcmVfbG9nbGV2ZWwiCj4+IMKgIENPTkZJ
R19ERUZBVUxUX0ZEVF9GSUxFPSJzdG0zMmY3NDYtZGlzY28iCj4+IMKgIENPTkZJR19TWVNfUEJT
SVpFPTEwNTAKPj4gwqAgIyBDT05GSUdfRElTUExBWV9DUFVJTkZPIGlzIG5vdCBzZXQKPiAKPiAK
PiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0
LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCkFwcGxpZWQgdG8gdS1ib290LXN0bTMyL21h
c3RlcgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK

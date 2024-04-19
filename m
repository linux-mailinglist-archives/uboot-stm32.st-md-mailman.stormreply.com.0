Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CADC48AAE55
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:21:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CF19C6DD9A;
	Fri, 19 Apr 2024 12:21:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A913AC6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:21:38 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43JBefrw003792; Fri, 19 Apr 2024 14:21:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=07D7bYAMyxMBvS0hZBJYAfh+VDmKwgx3J45Lny48vkw=; b=ws
 rs9X2kXB7ZNivZ+2+++5GfBKzM5EwbI4/jSd+PxY7XdYgDbGUtcX+WH1qQHJujwQ
 Crm+369YGUtEyPX5rvDRppClIc36R1rwFC0Q0Ja1a2T/rVP2S2S7XXFuSOByEBjg
 DmuUv37TBbS/SZcyegUfYT1ipHVw8zzU0dhkpvzXwWnEUfdOnQCivBek79IsA91+
 w476Tb6XM6zvO7nwKyKesD0pryzQoZDFBG8cNCImpBW1f+xy3s27XCBJ4Z1JfJmP
 g5k47fgkolXPpvfJfdbl/jI7VVkk7Txb45oMZRd1tXWZc2J8VC9E3Nbs1UaTPAA8
 bqhPU3HANwvVIFkuPcvQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xffffvrwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:21:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A9C0640045;
 Fri, 19 Apr 2024 14:21:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F092E21A21A;
 Fri, 19 Apr 2024 14:21:19 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:21:19 +0200
Message-ID: <36106eee-b907-4277-8af8-0130dc09cbbb@foss.st.com>
Date: Fri, 19 Apr 2024 14:21:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-11-patrice.chotard@foss.st.com>
 <e0936c25-7d4b-4149-8709-6ae083c9448f@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <e0936c25-7d4b-4149-8709-6ae083c9448f@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v1 10/25] ARM: dts: stm32: Add gpio-keys
 for stm32mp157a-dk1-scmi-u-boot
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
IDQvOS8yNCAxNzowMiwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBJbnN0ZWFkIG9mIHVzaW5n
ICJzdCxmYXN0Ym9vdC1ncGlvcyIgYW5kICJzdCxzdG0zMnByb2ctZ3Bpb3MiLCBkZWNsYXJlCj4+
IDIgZ3Bpby1rZXlzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJp
Y2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGFyY2gvYXJtL2R0cy9zdG0z
Mm1wMTU3YS1kazEtc2NtaS11LWJvb3QuZHRzaSB8IDE5ICsrKysrKysrKysrKysrKysrLS0KPj4g
wqAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2EtZGsxLXNjbWktdS1ib290LmR0
c2kgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2EtZGsxLXNjbWktdS1ib290LmR0c2kKPj4gaW5k
ZXggMjA3MjhmMjdlZTEuLjVkNDliMDljMzVkIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9kdHMv
c3RtMzJtcDE1N2EtZGsxLXNjbWktdS1ib290LmR0c2kKPj4gKysrIGIvYXJjaC9hcm0vZHRzL3N0
bTMybXAxNTdhLWRrMS1zY21pLXUtYm9vdC5kdHNpCj4+IEBAIC0zLDYgKzMsNyBAQAo+PiDCoMKg
ICogQ29weXJpZ2h0IDogU1RNaWNyb2VsZWN0cm9uaWNzIDIwMjIKPj4gwqDCoCAqLwo+PiDCoCAr
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL2lucHV0L2xpbnV4LWV2ZW50LWNvZGVzLmg+Cj4+IMKgICNp
bmNsdWRlICJzdG0zMm1wMTUtc2NtaS11LWJvb3QuZHRzaSIKPj4gwqAgwqAgLyB7Cj4+IEBAIC0x
Niw4ICsxNywyMiBAQAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdS1ib290LGVycm9yLWxlZCA9ICJl
cnJvciI7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB1LWJvb3QsbW1jLWVudi1wYXJ0aXRpb24gPSAi
dS1ib290LWVudiI7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzdCxhZGNfdXNiX3BkID0gPCZhZGMx
IDE4PiwgPCZhZGMxIDE5PjsKPj4gLcKgwqDCoMKgwqDCoMKgIHN0LGZhc3Rib290LWdwaW9zID0g
PCZncGlvYSAxMyAoR1BJT19BQ1RJVkVfTE9XIHwgR1BJT19QVUxMX1VQKT47Cj4+IC3CoMKgwqDC
oMKgwqDCoCBzdCxzdG0zMnByb2ctZ3Bpb3MgPSA8JmdwaW9hIDE0IChHUElPX0FDVElWRV9MT1cg
fCBHUElPX1BVTExfVVApPjsKPj4gK8KgwqDCoCB9Owo+PiArCj4+ICvCoMKgwqAgZ3Bpby1rZXlz
IHsKPj4gK8KgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiZ3Bpby1rZXlzIjsKPj4gKwo+PiAr
wqDCoMKgwqDCoMKgwqAgYnV0dG9uLXVzZXItMSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGxhYmVsID0gIlVzZXItMSI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxpbnV4LGNvZGUg
PSA8QlROXzE+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBncGlvcyA9IDwmZ3Bpb2EgMTQg
KEdQSU9fQUNUSVZFX0xPVyB8IEdQSU9fUFVMTF9VUCk+Owo+PiArwqDCoMKgwqDCoMKgwqAgfTsK
Pj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgYnV0dG9uLXVzZXItMiB7Cj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGxhYmVsID0gIlVzZXItMiI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxp
bnV4LGNvZGUgPSA8QlROXzI+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBncGlvcyA9IDwm
Z3Bpb2EgMTMgKEdQSU9fQUNUSVZFX0xPVyB8IEdQSU9fUFVMTF9VUCk+Owo+PiArwqDCoMKgwqDC
oMKgwqAgfTsKPj4gwqDCoMKgwqDCoCB9Owo+PiDCoCDCoMKgwqDCoMKgIGxlZCB7Cj4gCj4gCj4g
Cj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5z
dC5jb20+Cj4gCj4gVGhhbmtzCj4gUGF0cmljawo+IApBcHBsaWVkIG9uIHUtYm9vdC1zdG0zMi9t
YXN0ZXIgCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==

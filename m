Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 500E8A95E01
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Apr 2025 08:18:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4E35C7803C;
	Tue, 22 Apr 2025 06:18:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 987D8C7801A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 06:18:38 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LNB84F027204;
 Tue, 22 Apr 2025 08:18:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 TLHNVGSQLI1nM96RtAYnOF5O1cqaTuD8ClKJrNAs0Ps=; b=cdd9zjcPSuhq6TtX
 wIDbmKwFP6+KO0bfY/KpPus5pUk/VujyQjTZrJ2D7lwUHSmiScQKt7IZ9RWULGKJ
 NWa1atZfnuWk3RGAFy34pX4HfjltuVWksYstcmKkvE/lbbRCM49j9SEak2lyjaRt
 A/nFNerl0Yb3njp4B7N87mNBsI3cawzs/ar9UlDPY2IOg3YEwG++fFE6JjMcY/Cw
 r7OrzxfUpgc2eGWxIy2138eykw+P+9gRlXJkw/Dvrj/j4JYGLA47+r/Iim5Stsuv
 PdxFey1BEI1j1EKY1ffBCFCBa5rjT++et6WzqBWMFra5egp0CTZXvwb0rDqy4lMQ
 g/tVaw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46418m8ud9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Apr 2025 08:18:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 11A784002D;
 Tue, 22 Apr 2025 08:17:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6D8AC8D0E0E;
 Tue, 22 Apr 2025 08:17:19 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 08:17:19 +0200
Message-ID: <e6b23032-85d3-4c53-a267-b1d17b479fc4@foss.st.com>
Date: Tue, 22 Apr 2025 08:17:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20250411160326.4113545-1-patrice.chotard@foss.st.com>
 <50fc39f9-8b4d-4620-a5df-3a4fa7253415@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <50fc39f9-8b4d-4620-a5df-3a4fa7253415@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_03,2025-04-21_02,2024-11-22_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: Add nvram driver
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

CgpPbiA0LzE4LzI1IDE4OjQ0LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDQvMTEvMjUgMTg6MDMsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gRnJvbTogU2ltZW9uIE1h
cmlqb24gPHNpbWVvbi5tYXJpam9uQGZvc3Muc3QuY29tPgo+Pgo+PiBUQU1QIGJhY2t1cCByZWdp
c3RlcnMgd2lsbCBiZSBleHBvc2VkIGFzIG52bWVtIGNlbGxzLgo+Pgo+PiBFYWNoIHJlZ2lzdGVy
cyAoWzAuLjEyN10gZm9yIFNUTTMyTVAyLCBbMC4uMzFdIGZvciBTVE0zMk1QMSkgY291bGQgYmUK
Pj4gZXhwb3NlZCBhcyBudm1lbSBjZWxscyB1bmRlciB0aGUgbnZyYW0gbm9kZSBpbiBkZXZpY2Ug
dHJlZQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTaW1lb24gTWFyaWpvbiA8c2ltZW9uLm1hcmlqb25A
Zm9zcy5zdC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5j
aG90YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gwqAgYXJjaC9hcm0vbWFjaC1zdG0zMm1w
L0tjb25maWfCoCB8wqDCoCA5ICsKPj4gwqAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL01ha2VmaWxl
IHzCoMKgIDIgKwo+PiDCoCBhcmNoL2FybS9tYWNoLXN0bTMybXAvbnZyYW0uY8KgIHwgNjY0ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDY3
NSBpbnNlcnRpb25zKCspCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9tYWNoLXN0
bTMybXAvbnZyYW0uYwo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL0tj
b25maWcgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvS2NvbmZpZwo+PiBpbmRleCAwMDJkYTJlM2Qz
Yi4uZDczMjM2NTk4MTEgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9LY29u
ZmlnCj4+ICsrKyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9LY29uZmlnCj4+IEBAIC0xNDQsNiAr
MTQ0LDE1IEBAIGNvbmZpZyBTVE0zMl9FQ0RTQV9WRVJJRlkKPj4gwqDCoMKgwqDCoMKgwqAgUk9N
IEFQSSBwcm92aWRlZCBvbiBTVE0zMk1QLgo+PiDCoMKgwqDCoMKgwqDCoCBUaGUgUk9NIEFQSSBp
cyBvbmx5IGF2YWlsYWJsZSBkdXJpbmcgU1BMIGZvciBub3cuCj4+IMKgICtjb25maWcgU1RNMzJN
UF9UQU1QX05WTUVNCj4+ICvCoMKgwqAgYm9vbCAiU1RNMzIgVEFNUCBiYWNrdXAgcmVnaXN0ZXJz
IHZpYSBOVk1FTSBBUEkiCj4+ICvCoMKgwqAgc2VsZWN0IE5WTUVNCj4+ICvCoMKgwqAgZGVmYXVs
dCB5Cj4+ICvCoMKgwqAgaGVscAo+PiArwqDCoMKgwqDCoCBTYXkgeSB0byBlbmFibGUgdGhlIHVj
bGFzcyBkcml2ZXIgZm9yIFRBTVAgQmFja3VwIHJlZ2lzdGVycyB1c2luZyB0aGUKPj4gK8KgwqDC
oMKgwqAgTlZNRU0gQVBJLiBJdCBhbGxvd3MgdG8gYWNjZXNzIHRvIGJvb3QgbW9kZSBvciBvdGhl
cnMgc2hhcmVkIGluZm9ybWF0aW9uCj4+ICvCoMKgwqDCoMKgIGJldHdlZW4gc29mdHdhcmUgY29t
cG9uZW50cy9leGVjdXRpb24gbGV2ZWxzLgo+PiArCj4+IMKgIGNvbmZpZyBDTURfU1RNMzJLRVkK
Pj4gwqDCoMKgwqDCoCBib29sICJjb21tYW5kIHN0bTMya2V5IHRvIGZ1c2UgcHVibGljIGtleSBo
YXNoIgo+PiDCoMKgwqDCoMKgIGRlcGVuZHMgb24gQ01ETElORQo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vbWFjaC1zdG0zMm1wL01ha2VmaWxlIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL01ha2Vm
aWxlCj4+IGluZGV4IDEwM2UzNDEwYWQ5Li5iYzBmZTllMjIyNSAxMDA2NDQKPj4gLS0tIGEvYXJj
aC9hcm0vbWFjaC1zdG0zMm1wL01ha2VmaWxlCj4+ICsrKyBiL2FyY2gvYXJtL21hY2gtc3RtMzJt
cC9NYWtlZmlsZQo+PiBAQCAtMTMsNiArMTMsOCBAQCBvYmotJChDT05GSUdfU1RNMzJNUDEzWCkg
Kz0gc3RtMzJtcDEvCj4+IMKgIG9iai0kKENPTkZJR19TVE0zMk1QMjVYKSArPSBzdG0zMm1wMi8K
Pj4gwqAgwqAgb2JqLSQoQ09ORklHX01GRF9TVE0zMl9USU1FUlMpICs9IHRpbWVycy5vCj4+ICtv
YmotJChDT05GSUdfU1RNMzJNUF9UQU1QX05WTUVNKSArPSBudnJhbS5vCj4gCj4gCj4gSSBkb24n
dCBzZWXCoCByZWFzb24gdG8gaGF2ZSByZWR1Y2UgZmlsZSBuYW1lIGhlciA/Cj4gCj4gZmlsZW5h
bWUgaW5kaWNhdGUgb25seSB0aGUgdHlwZSBudnJhbSBmb3IgbnZtZW0gdXNlZCBmb3IgVEFNUCBi
YWNrdXAgcmVnaXN0ZXIuCj4gCj4gCj4gSSBwcmVmZXIgZmluZSBuYW1lIHdpdGggaW5kaWNhdGlv
biBvZiB0aGUgZGV2aWNlIHVzZWQsIGhlcmUgVEFNUCAsCj4gCj4gYW5kIGFsaWduZWQgd2l0aCBk
cml2ZXIgbmFtZSAic3RtMzJfdGFtcF9udnJhbSIKPiAKPiBzbyByZW5hbWUgbnZyYW0uYyA9PiB0
YW1wX252cmFtLmMKPiAKPiBhbmQKPiAKPiArb2JqLSQoQ09ORklHX1NUTTMyTVBfVEFNUF9OVk1F
TSkgKz0gdGFtcF9udnJhbS5vCgpIaSBQYXRyaWNrCgpSaWdodCwgaSB3aWxsIHJlbmFtZSBpdCBh
cyB5b3Ugc3VnZ2VzdGVkLgoKVGhhbmtzClBhdHJpY2UKCgoKPiAKPiAKPiB0aGFua3MKPiAKPiAK
PiBXaXRoIHRoaXMgbWlub3IgcmVtYXJrCj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVs
YXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4gUGF0cmlj
awo+IAo+IAo+IAo+IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

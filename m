Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CA1A597F1
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Mar 2025 15:42:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F25C4C78F99;
	Mon, 10 Mar 2025 14:42:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88E53C78F96
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 14:42:35 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52AD4os8016951;
 Mon, 10 Mar 2025 15:42:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 YTqmS3LoW36NPkItw+7UrpMA8I/hwedU/pMt7tXXC9o=; b=LV953b3jsMUdG6W8
 Tt1KSdJvK8ZkFeGJ1xtR8vz/7HrNSS17xlvBhgTpgVUcCoeAR7TPyJxeQZXDCRXE
 ckoXYTx4HDqK2GEgjWhk69ENHmyhGNV8eIkMkUQ8zgf5UDxou/RbL6AmOgjipmof
 UcgcHDPv48Yaodb7jMF1N24BnL/ZM6/EOCIDPG7GQDPV1o0I5NVuNrdwWFuF0pmG
 Fdy9fPqAgWMEkvxvbm7vg/Rw58G0XtU8LgwtABb/0d313qB+wqGbTjLSVhEmS2KR
 OqA2AiSPEc5OY2t/7zJD/eqkz9E4RqA03Mzcmr34iTdRg7Zr7SOXH0z8/2B/VIOd
 54+43g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4590b8x5je-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Mar 2025 15:42:31 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A049C40048;
 Mon, 10 Mar 2025 15:41:17 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1AFAE4EC3C5;
 Mon, 10 Mar 2025 15:39:49 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 15:39:48 +0100
Message-ID: <18f7e01f-32a4-4985-9035-98e097247882@foss.st.com>
Date: Mon, 10 Mar 2025 15:39:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cheick TRAORE <cheick.traore@foss.st.com>, <u-boot@lists.denx.de>
References: <20250306105620.624760-1-cheick.traore@foss.st.com>
 <20250306115558.1.I060a56226e03cddfd4a6d6b98bc86c91435710cc@changeid>
 <6ef98461-7ffb-4257-bc5f-bc0c543a773c@foss.st.com>
 <2ad51ae3-53d7-42f6-bb3a-800ba6c6b672@foss.st.com>
 <329df3e4-1493-4966-a7e2-ebd628503e8c@foss.st.com>
 <a168bd2a-6d44-4b36-98fe-3ceb31810edf@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <a168bd2a-6d44-4b36-98fe-3ceb31810edf@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_06,2025-03-07_03,2024-11-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/5] dm: pwm: Check if duty_ns is lower
 than period_ns
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

CgpPbiAzLzEwLzI1IDE1OjEyLCBDaGVpY2sgVFJBT1JFIHdyb3RlOgo+IAo+IE9uIDMvMTAvMjUg
MTM6MzUsIFBhdHJpY2UgQ0hPVEFSRCB3cm90ZToKPj4KPj4gT24gMy8xMC8yNSAxMTowMCwgUGF0
cmljZSBDSE9UQVJEIHdyb3RlOgo+Pj4KPj4+IE9uIDMvNi8yNSAxNToxMywgUGF0cmljZSBDSE9U
QVJEIHdyb3RlOgo+Pj4+Cj4+Pj4gT24gMy82LzI1IDExOjU2LCBDaGVpY2sgVHJhb3JlIHdyb3Rl
Ogo+Pj4+PiBJdCB3YXMgcG9zc2libGUgdG8gcHJvdmlkZSBhIGR1dHlfbnMgZ3JlYXRlciB0aGFu
IHBlcmlvZF9ucyB0bwo+Pj4+PiAicHdtIGNvbmZpZyIgY29tbWFuZC4gVGhlIGZyYW1ld29yayBt
dXN0IGNoZWNrIHRoZSB2YWx1ZXMgYmVmb3JlCj4+Pj4+IHByb3ZpZGluZyB0aGVtIHRvIGRyaXZl
cnMuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IENoZWljayBUcmFvcmU8Y2hlaWNrLnRyYW9y
ZUBmb3NzLnN0LmNvbT4KPj4+Pj4gLS0tCj4+Pj4+Cj4+Pj4+IMKgIGRyaXZlcnMvcHdtL3B3bS11
Y2xhc3MuYyB8IDMgKysrCj4+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykK
Pj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS11Y2xhc3MuYyBiL2RyaXZl
cnMvcHdtL3B3bS11Y2xhc3MuYwo+Pj4+PiBpbmRleCA2NTQzZGIxZDYyMy4uYjQ0OTFmN2RjZDQg
MTAwNjQ0Cj4+Pj4+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS11Y2xhc3MuYwo+Pj4+PiArKysgYi9k
cml2ZXJzL3B3bS9wd20tdWNsYXNzLmMKPj4+Pj4gQEAgLTI3LDYgKzI3LDkgQEAgaW50IHB3bV9z
ZXRfY29uZmlnKHN0cnVjdCB1ZGV2aWNlICpkZXYsIHVpbnQgY2hhbm5lbCwgdWludCBwZXJpb2Rf
bnMsCj4+Pj4+IMKgwqDCoMKgwqAgaWYgKCFvcHMtPnNldF9jb25maWcpCj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gLUVOT1NZUzsKPj4+Pj4gwqAgK8KgwqDCoCBpZiAoZHV0eV9ucyA+
IHBlcmlvZF9ucykKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pj4+PiAr
Cj4+Pj4+IMKgwqDCoMKgwqAgcmV0dXJuIG9wcy0+c2V0X2NvbmZpZyhkZXYsIGNoYW5uZWwsIHBl
cmlvZF9ucywgZHV0eV9ucyk7Cj4+Pj4+IMKgIH0KPj4+Pj4gwqAgCj4+Pj4gUmV2aWV3ZWQtYnk6
IFBhdHJpY2UgQ2hvdGFyZDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+Pj4KPj4+PiBU
aGFua3MKPj4+PiBQYXRyaWNlCj4+PiBBcHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9uZXh0Cj4+Pgo+
Pj4gVGhhbmtzCj4+PiBQYXRyaWNlCj4+Cj4+IEhpIENoZWljawo+Pgo+PiBVbmZvcnR1bmF0ZWx5
LCB0aGlzIHBhdGNoIGlzIGNhdXNpbmcgVS1Cb290IENJIHRlc3QgZmFpbGVkOgo+PiBzZWVodHRw
czovL3NvdXJjZS5kZW54LmRlL3UtYm9vdC9jdXN0b2RpYW5zL3UtYm9vdC1zdG0vLS9qb2JzLzEw
NTQ0MjYKPj4KPj4gTW9yZSBwcmVjaXNlbHkgdXRfZG1fZG1fdGVzdF9jcm9zX2VjX3B3bSwgc2Vl
IHRlc3QvZG0vY3Jvc19lY19wd20uYwo+Pgo+PiBFaXRoZXIgdXBkYXRlIHRlc3QvZG0vY3Jvc19l
Y19wd20uYyBvciBhbm90aGVyIHNvbHV0aW9uIGlzIHNpbXBseSB0bwo+PiBjbGFtcCBkdXR5X25z
IHRvIHBlcmlvZF9ucyBhcyBmb2xsb3dpbmcgPwo+Pgo+PiDCoCArwqDCoMKgIGlmIChkdXR5X25z
ID4gcGVyaW9kX25zKQo+PiDCoCArwqDCoMKgwqDCoMKgwqAgZHV0eV9ucyA9IHBlcmlvZF9uczsK
Pj4gwqAgKwo+Pgo+PiBQYXRyaWNlCj4+Cj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+Pj4gVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0Cj4+PiBV
Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4+PiBodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo+IAo+
IEhpIFBhdHJpY2UsCj4gCj4gSXQgc2VlbXMgbGlrZSB0aGlzIHBhdGNoIHNob3VsZCBmaW5hbGx5
IGJlIHJldmVydGVkLgo+IAo+IFdoZW4gdGhlIGR1dHkgY3ljbGUgZXhjZWVkcyB0aGUgcGVyaW9k
LCBzb21lIGRyaXZlcnMgYWxyZWFkeSBjbGFtcCB0aGUgdmFsdWUgb2YgdGhlIGR1dHkgY3ljbGUg
dG8gdGhlIG1heGltdW0gdmFsdWUgb3IgZG8gbm90IGFwcGx5IHRoZSBkdXR5IGN5Y2xlLgo+IAo+
IFNvLCBJIHdpbGwgY2hlY2sgdGhlIGR1dHkgY3ljbGUgaW58ZHJpdmVycy9wd20vcHdtLXN0bTMy
LmN8YW5kIHJldHVybnwtRUlOVkFMfHdoZW4gaXQgZXhjZWVkcyB0aGUgcGVyaW9kLgo+IAo+IFRo
YW5rcywKPiAKPiBDaGVpY2sKCm9rLCBpIHdpbGwgcmVtb3ZlIHlvdXIgUFdNIHNlcmllcyBmcm9t
IHRoZSBTVE0zMl9VLWJvb3RfY3VzdG9kaWFuL25leHQgYnJhbmNoLgoKVGhhbmtzClBhdHJpY2UK
Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290
LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L3Vib290LXN0bTMyCg==

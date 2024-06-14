Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE338908B14
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jun 2024 13:54:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59126C6B460;
	Fri, 14 Jun 2024 11:54:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED6C6C5E2CD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 11:54:15 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45EBOkuh015671;
 Fri, 14 Jun 2024 13:54:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 8uozvjORJLppsfrnCH1Kki0wqb6RN8oq+zrAv/hg1Gc=; b=ZYOk24BnGZGOHIqL
 3dkMOXjGcDP5MMDDZj42sEiZSsdhs10KMxFcSpcVIRuIRzZSRfo6vsdPZiIlgCAE
 J9htLsDt4fPXV8Xs/gDZzr5hZhkd5GLFDqgebYZ6FxTrE2f9uktyCm0k01Mo0llQ
 MAAvxVcvTREll3HXr3YtVEdG0ZEerVKHvG6baj2Sd/P8Va/tW7rYWKcoXuUoURK/
 6FPwtczfMz2AWco20uiW6iytmEGg6N6Z2gZsiK6zoXVmAj3HAtAYUjPZiqfnitZu
 ur6hkL6Kllcox5s2SEXtSfHaSYnq4dIwjCX9usCxc/UfRM+FDhtR/p2VVZSiX9Hx
 xuhBQA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypub3mk6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jun 2024 13:54:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 26DA14002D;
 Fri, 14 Jun 2024 13:54:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 590292132D6;
 Fri, 14 Jun 2024 13:53:50 +0200 (CEST)
Received: from [10.252.18.60] (10.252.18.60) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 14 Jun
 2024 13:53:49 +0200
Message-ID: <ea1fe5dc-58cb-45f5-8254-b4253aed9986@foss.st.com>
Date: Fri, 14 Jun 2024 13:53:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240422150645.1613198-1-patrice.chotard@foss.st.com>
 <2db8ee3c-6734-415f-b06c-e4a9a41ec291@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <2db8ee3c-6734-415f-b06c-e4a9a41ec291@foss.st.com>
X-Originating-IP: [10.252.18.60]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_09,2024-06-14_03,2024-05-17_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v2] stm32mp: Reserve OPTEE area in EFI
	memory map
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

CgpPbiA2LzE0LzI0IDEwOjQzLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDQvMjIvMjQgMTc6MDYsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gU2luY2UgY29tbWl0IDdi
NzhkNjQzOGEyYjMgKCJlZmlfbG9hZGVyOiBSZXNlcnZlIHVuYWNjZXNzaWJsZSBtZW1vcnkiKQo+
PiBtZW1vcnkgcmVnaW9uIGFib3ZlIHJhbV90b3AgaXMgdGFnZ2VkIGluIEVGSSBtZW1vcnkgbWFw
IGFzCj4+IEVGSV9CT09UX1NFUlZJQ0VTX0RBVEEuCj4+IEluIGNhc2Ugb2YgU1RNMzJNUDEvU1RN
MzJNUDEzIHBsYXRmb3JtcywgYWJvdmUgcmFtX3RvcCwgdGhlcmUgaXMgb25lCj4+IHJlc2VydmVk
LW1lbW9yeSByZWdpb24gdGFnZ2VkICJuby1tYXAiIGRlZGljYXRlZCB0byBPUC1URUUgOgo+PiDC
oCBfIGFkZHI9ZGUwMDAwMDAgc2l6ZT0yMDAwMDAwIGZvciBzdG0zMm1wMTU3eC1ka3ggYW5kIHN0
bTMybXAxMzVmLWRrCj4+IMKgIF8gYWRkcj1mZTAwMDAwMCBzaXplPTIwMDAwMDAgZm9yIHN0bTMy
bXAxNTdjLWV2MQo+Pgo+PiBCZWZvcmUgYm9vdGluZyBrZXJuZWwsIEVGSSBtZW1vcnkgbWFwIGlz
IGZpcnN0IGJ1aWx0LCB0aGUgT1BURUUgcmVnaW9uIGlzCj4+IHRhZ2dlZCBhcyBFRklfQk9PVF9T
RVJWSUNFU19EQVRBIGFuZCB3aGVuIHJlc2VydmluZyBMTUIsIHRoZSB0YWcgTE1CX05PTkUKPj4g
aXMgdXNlZC4KPj4KPj4gVGhlbiBhZnRlciwgdGhlIExNQiBhcmUgY29tcGxldGVkIGJ5IGJvb3Rf
ZmR0X2FkZF9tZW1fcnN2X3JlZ2lvbnMoKQo+PiB3aGljaCB0cnkgdG8gYWRkIGFnYWluIHRoZSBz
YW1lIE9QVEVFIHJlZ2lvbiAoYWRkcj1kZTAwMDAwMCBzaXplPTIwMDAwMDAKPj4gaW4gY2FzZSBv
ZiBzdG0zMm1wMTU3eC1ka3ggLyBzdG0zMm1wMTM1Zi1kayBvciBhZGRyPWZlMDAwMDAwIHNpemU9
MjAwMDAwMAo+PiBpbiBjYXNlIGZvciBzdG0ybXAxNTdjLWV2MSkKPj4gYnV0IG5vdyB3aXRoIExN
Ql9OT01BUCB0YWcgd2hpY2ggcHJvZHVjZXMgdGhlIGZvbGxvd2luZyBlcnJvciBtZXNzYWdlIDoK
Pj4KPj4gwqAgXyBmb3Igc3RtMzJtcDE1N3gtZGt4IC8gc3RtMzJtcDEzNWYtZGsgOgo+PiDCoMKg
ICJFUlJPUjogcmVzZXJ2aW5nIGZkdCBtZW1vcnkgcmVnaW9uIGZhaWxlZCAoYWRkcj1kZTAwMDAw
MCBzaXplPTIwMDAwMDAgZmxhZ3M9NCkiCj4+Cj4+IMKgIF8gZm9yIHN0bTMybXAxNTdjLWV2MSA6
Cj4+IMKgwqAgIkVSUk9SOiByZXNlcnZpbmcgZmR0IG1lbW9yeSByZWdpb24gZmFpbGVkIChhZGRy
PWZlMDAwMDAwIHNpemU9MjAwMDAwMCBmbGFncz00KSIKPj4KPj4gVG8gYXZvaWQgdGhpcywgT1BU
RUUgYXJlYSBzaG91bGRuJ3QgYmUgdXNlZCBieSBFRkksIHNvIHdlIG5lZWQgdG8gbWFyawo+PiBp
dCBhcyByZXNlcnZlZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRy
aWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+Cj4+IC0tLQo+Pgo+PiBDaGFuZ2VzIGluIHYyOgo+
PiDCoCBfIHVwZGF0ZSBjb21taXQgbWVzc2FnZSBieSBhZGRpbmcgaW5mb3JtYXRpb24gYWJvdXQg
bWVtb3J5IGFyZWEKPj4gwqDCoMKgIGRlZGljYXRlZCBmb3IgT1BURUUgZm9yIHZhcmlvdXMgU1RN
MzJNUDEvU1RNMzJNUDEzIGJvYXJkcy4KPj4KPj4gwqAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2Ry
YW1faW5pdC5jIHwgMTIgKysrKysrKysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNl
cnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLXN0bTMybXAvZHJhbV9p
bml0LmMgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvZHJhbV9pbml0LmMKPj4gaW5kZXggZmIxMjA4
ZmM1ZDUuLmY2N2Y1NGYyYWUwIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9tYWNoLXN0bTMybXAv
ZHJhbV9pbml0LmMKPj4gKysrIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2RyYW1faW5pdC5jCj4+
IEBAIC03LDYgKzcsNyBAQAo+PiDCoCDCoCAjaW5jbHVkZSA8Y29tbW9uLmg+Cj4+IMKgICNpbmNs
dWRlIDxkbS5oPgo+PiArI2luY2x1ZGUgPGVmaV9sb2FkZXIuaD4KPj4gwqAgI2luY2x1ZGUgPGlt
YWdlLmg+Cj4+IMKgICNpbmNsdWRlIDxpbml0Lmg+Cj4+IMKgICNpbmNsdWRlIDxsbWIuaD4KPj4g
QEAgLTc1LDMgKzc2LDE0IEBAIHBoeXNfYWRkcl90IGJvYXJkX2dldF91c2FibGVfcmFtX3RvcChw
aHlzX3NpemVfdCB0b3RhbF9zaXplKQo+PiDCoCDCoMKgwqDCoMKgIHJldHVybiByZWcgKyBzaXpl
Owo+PiDCoCB9Cj4+ICsKPj4gK3ZvaWQgZWZpX2FkZF9rbm93bl9tZW1vcnkodm9pZCkKPj4gK3sK
Pj4gK8KgwqDCoCBpZiAoSVNfRU5BQkxFRChDT05GSUdfRUZJX0xPQURFUikpCj4+ICvCoMKgwqDC
oMKgwqDCoCAvKgo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIE1lbW9yeSBvdmVyIHJhbV90b3AgaXMg
cmVzZXJ2ZWQgdG8gT1BURUUuCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogRGVjbGFyZSB0byBFRkkg
b25seSBtZW1vcnkgYXJlYSBiZWxvdyByYW1fdG9wCj4+ICvCoMKgwqDCoMKgwqDCoMKgICovCj4+
ICvCoMKgwqDCoMKgwqDCoCBlZmlfYWRkX21lbW9yeV9tYXAoZ2QtPnJhbV9iYXNlLCBnZC0+cmFt
X3RvcCAtIGdkLT5yYW1fYmFzZSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBFRklfQ09OVkVOVElPTkFMX01FTU9SWSk7Cj4+ICt9Cj4gCj4gSXQgc2VlbiBsaWtlIGEg
dGVtcG9yYXJ5IHdvcmthcm91bmQgYWZ0ZXIgY29tbWl0IDdiNzhkNjQzOGEyYjMKPiAoImVmaV9s
b2FkZXI6IFJlc2VydmUgdW5hY2Nlc3NpYmxlIG1lbW9yeSIpIHRvIGF2b2lkIHdhcm5pbmdzLgo+
IAo+IEFuZCBpdCBpcyB3b3JraW5nIGJlY2F1c2UgaW4gdGhlIGRlZmF1bHQgbWVtb3J5IG1hcHBp
bmcKPiBPUC1URUUgYmFzZSBhZGRyZXNzID09IFJBTV9UT1AgYW5kIHRoZSByZXN0IG9mIG1lbW9y
eSBpcwo+IHVzZWQgYnkgT1AtVEVFIHRhZ2dlZCAibm8gbWFwIiAocHJvdGVjdGVkIGJ5IGZpcmV3
YWxsKQo+IAo+IAo+IFJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1
bmF5QGZvc3Muc3QuY29tPgo+IAo+IEZZSTogd29ya2Fyb3VuZCBiZWNhdXNlwqAgdGhlIG1lbW9y
eSBhYm92ZSByYW1fdG9wIGlzCj4gwqDCoMKgwqAgImFscmVhZHkgb2NjdXBpZWQgYnkgZmlybXdh
cmUiID0KPiDCoMKgwqDCoCBhbmQgaXQgaXMgT1AtVEVFIGZvciBTVE0zMk1QMiBwbGF0Zm9ybS4K
PiAKPiDCoMKgwqAgRm9yIG1lIHRoZSBMTUIgdHlwZSB1c2VkIGJ5IEVGSSBpbiBub3QgY29ycmVj
dCBmb3IgT1AtVEVFIHVzYWdlIHJlZ2lvbgo+IMKgwqDCoCB3aXRoICJuby1tYXAiIHRhZyBpbiBk
ZXZpY2UgdHJlZT3CoCBzZWUgYm9vdF9mZHRfYWRkX21lbV9yc3ZfcmVnaW9ucygpCj4gwqDCoMKg
IGZvciBsaW51eCBEVCBwYXJzaW5nCj4gCj4gwqDCoMKgIGFuZCB3ZSBoYXZlIG5vIHdheSB0byBp
bmRpY2F0ZWQgdGhpcyBMTUIgdGFnPSBMTUJfTk9NQVAgd2l0aCBFRkkgc3RhY2sKPiDCoMKgwqAg
KHdpdGggZW51bSBlZmlfbWVtb3J5X3R5cGUgPykKPiAKPiAKPiDCoMKgwqAgRUZJX0JPT1RfU0VS
VklDRVNfREFUQSA9PiBkb2Vzbid0IG1lYW5zIE5PTUFQIGZsYWcgZm9yIExNQi4uLi4KPiDCoMKg
wqAgc28gc29tZXRoaW5nIGlzIG1pc3NpbmcgaW4gRUZJIHNpZGUgbGlrZSBFRklfQk9PVF9OT01B
UMKgIHRvIGJlIHVzZWQgaW4gYm9hcmQKPiDCoMKgwqAgaW1wbGVtZW50YXRpb24gb2YgZWZpX2Fk
ZF9rbm93bl9tZW1vcnkoKSA/Cj4gCj4gCj4gVGhhbmtzCj4gUGF0cmljawo+IAo+IAo+IAo+IAo+
IAoKCkFwcGxpZWQgdG8gdS1ib290LXN0bTMyL25leHQKClRoYW5rcwpQYXRyaWNlCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxp
bmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMy
Cg==

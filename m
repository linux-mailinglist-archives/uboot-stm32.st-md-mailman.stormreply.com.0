Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF138AA97A
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 09:45:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D59D8C6DD66;
	Fri, 19 Apr 2024 07:45:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1073AC69066
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 07:45:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J2A8oC007704; Fri, 19 Apr 2024 09:45:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=x383rEWWO3Qdx70/sb9IUgQ9iMTRbh6dWUugMFCn9pg=; b=5y
 e4uvSY9DHYbmatXGGl1vvV/cdSbU1dQmZOzYbUrGirQ+hCuwjO6ZPxd1N1jLmXnH
 FG7Y/EYOPzScouGW3pSdUxOyRO/IXL/Bj89Dw7s4lRHSNqEBBD2wySYI5LfonwWs
 xVIm6ARV8URUV6C1u780tFUtSYzmkV1jcLz8EZqZ2Qcm0KZPFjkxr2Pv9CX6j9KJ
 0Bxd00KOEslvrvuSc6n10NsTg+8r3hoqzIhcAQRD8PU4lzTBzwtnDQmcasXQeZpu
 FrHllZEymKBFegsL96biW7f5z3xP+m5F+5gUwVxQoWyv6eMZHh5BcTe94blF9Ayg
 L0swEbCW2z3nw5+gizhA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xff64tf52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 09:45:19 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C3A954002D;
 Fri, 19 Apr 2024 09:45:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 82DA1210F8C;
 Fri, 19 Apr 2024 09:44:51 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 09:44:51 +0200
Message-ID: <c35863dd-65dc-4f85-ac62-d99c9c6addb1@foss.st.com>
Date: Fri, 19 Apr 2024 09:44:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, Patrick DELAUNAY
 <patrick.delaunay@foss.st.com>
References: <20240308101230.2595220-1-patrice.chotard@foss.st.com>
 <3512e31e-37db-4e03-b133-1914e29fa7ad@foss.st.com>
 <24c03e51-90f8-4918-8097-2a6ccd6ebf4e@gmx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <24c03e51-90f8-4918-8097-2a6ccd6ebf4e@gmx.de>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_05,2024-04-17_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: Reserve OPTEE area in EFI memory
	map
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

CgpPbiA0LzE3LzI0IDA5OjQ1LCBIZWlucmljaCBTY2h1Y2hhcmR0IHdyb3RlOgo+IE9uIDE3LjA0
LjI0IDA5OjI1LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gMy84LzI0
IDExOjEyLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+PiBTaW5jZSBjb21taXQgN2I3OGQ2NDM4
YTJiMyAoImVmaV9sb2FkZXI6IFJlc2VydmUgdW5hY2Nlc3NpYmxlIG1lbW9yeSIpCj4+PiBtZW1v
cnkgcmVnaW9uIGFib3ZlIHJhbV90b3AgaXMgdGFnZ2VkIGluIEVGSSBtZW1vcnkgbWFwIGFzCj4+
PiBFRklfQk9PVF9TRVJWSUNFU19EQVRBLgo+Pj4gSW4gY2FzZSBvZiBTVE0zMk1QMSBwbGF0Zm9y
bSwgYWJvdmUgcmFtX3RvcCwgdGhlcmUgaXMgb25lIHJlc2VydmVkLW1lbW9yeQo+Pj4gcmVnaW9u
IHRhZ2dlZCAibm8tbWFwIiBkZWRpY2F0ZWQgdG8gT1AtVEVFIChhZGRyPWRlMDAwMDAwIHNpemU9
MjAwMDAwMCkuCj4+Pgo+Pj4gQmVmb3JlIGJvb3Rpbmcga2VybmVsLCBFRkkgbWVtb3J5IG1hcCBp
cyBmaXJzdCBidWlsdCwgdGhlIE9QVEVFIHJlZ2lvbiBpcwo+Pj4gdGFnZ2VkIGFzIEVGSV9CT09U
X1NFUlZJQ0VTX0RBVEEgYW5kIHdoZW4gcmVzZXJ2aW5nIExNQiwgdGhlIHRhZyBMTUJfTk9ORQo+
Pj4gaXMgdXNlZC4KPj4+Cj4+PiBUaGVuIGFmdGVyLCB0aGUgTE1CIGFyZSBjb21wbGV0ZWQgYnkg
Ym9vdF9mZHRfYWRkX21lbV9yc3ZfcmVnaW9ucygpCj4+PiB3aGljaCB0cnkgdG8gYWRkIGFnYWlu
IHRoZSBzYW1lIE9QVEVFIHJlZ2lvbiAoYWRkcj1kZTAwMDAwMCBzaXplPTIwMDAwMDApCj4+PiBi
dXQgbm93IHdpdGggTE1CX05PTUFQIHRhZyB3aGljaCBwcm9kdWNlcyB0aGUgZm9sbG93aW5nIGVy
cm9yIG1lc3NhZ2UgOgo+Pj4KPj4+ICJFUlJPUjogcmVzZXJ2aW5nIGZkdCBtZW1vcnkgcmVnaW9u
IGZhaWxlZCAoYWRkcj1kZTAwMDAwMCBzaXplPTIwMDAwMDAKPj4+IGZsYWdzPTQpIgo+Pj4KPj4+
IFRvIGF2b2lkIHRoaXMsIE9QVEVFIGFyZWEgc2hvdWxkbid0IGJlIHVzZWQgYnkgRUZJLCBzbyB3
ZSBuZWVkIHRvIG1hcmsKPj4+IGl0IGFzIHJlc2VydmVkLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6
IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+Pj4gLS0tCj4+
Pgo+Pj4gwqAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2RyYW1faW5pdC5jIHwgMTIgKysrKysrKysr
KysrCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYg
LS1naXQgYS9hcmNoL2FybS9tYWNoLXN0bTMybXAvZHJhbV9pbml0LmMKPj4+IGIvYXJjaC9hcm0v
bWFjaC1zdG0zMm1wL2RyYW1faW5pdC5jCj4+PiBpbmRleCBmYjEyMDhmYzVkNS4uZjY3ZjU0ZjJh
ZTAgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL2FybS9tYWNoLXN0bTMybXAvZHJhbV9pbml0LmMKPj4+
ICsrKyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9kcmFtX2luaXQuYwo+Pj4gQEAgLTcsNiArNyw3
IEBACj4+PiDCoCAjaW5jbHVkZSA8Y29tbW9uLmg+Cj4+PiDCoCAjaW5jbHVkZSA8ZG0uaD4KPj4+
ICsjaW5jbHVkZSA8ZWZpX2xvYWRlci5oPgo+Pj4gwqAgI2luY2x1ZGUgPGltYWdlLmg+Cj4+PiDC
oCAjaW5jbHVkZSA8aW5pdC5oPgo+Pj4gwqAgI2luY2x1ZGUgPGxtYi5oPgo+Pj4gQEAgLTc1LDMg
Kzc2LDE0IEBAIHBoeXNfYWRkcl90IGJvYXJkX2dldF91c2FibGVfcmFtX3RvcChwaHlzX3NpemVf
dAo+Pj4gdG90YWxfc2l6ZSkKPj4+IMKgwqDCoMKgwqAgcmV0dXJuIHJlZyArIHNpemU7Cj4+PiDC
oCB9Cj4+PiArCj4+PiArdm9pZCBlZmlfYWRkX2tub3duX21lbW9yeSh2b2lkKQo+Pj4gK3sKPj4+
ICvCoMKgwqAgaWYgKElTX0VOQUJMRUQoQ09ORklHX0VGSV9MT0FERVIpKQo+Pj4gK8KgwqDCoMKg
wqDCoMKgIC8qCj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIE1lbW9yeSBvdmVyIHJhbV90b3AgaXMg
cmVzZXJ2ZWQgdG8gT1BURUUuCj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIERlY2xhcmUgdG8gRUZJ
IG9ubHkgbWVtb3J5IGFyZWEgYmVsb3cgcmFtX3RvcAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8K
Pj4+ICvCoMKgwqDCoMKgwqDCoCBlZmlfYWRkX21lbW9yeV9tYXAoZ2QtPnJhbV9iYXNlLCBnZC0+
cmFtX3RvcCAtIGdkLT5yYW1fYmFzZSwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgRUZJX0NPTlZFTlRJT05BTF9NRU1PUlkpOwo+IAo+IFdpdGggdGhpcyBjaGFuZ2Ug
dGhlIEVGSSBtZW1vcnkgbWFwIHBhc3NlZCB0byB0aGUgb3BlcmF0aW5nIHN5c3RlbSB3aWxsCj4g
bm90IGNvbnRhaW4gYW55IG1lbW9yeSBhYm92ZSBnZC0+cmFtX3RvcC4gSXMgdGhpcyByZWFsbHkg
eW91ciBpbnRlbnQ/Cj4gRG9uJ3QgeW91IGhhdmUgYW55IG1lbW9yeSBhYm92ZSAweGUwMDAwMDAw
PwoKSGkgSGVpbnJpY2gKCk9uIHN0bTMybXAxNTd4LWRrIGFuZCBzdG0zMm1wMTM1eC1kayBib2Fy
ZHMsIHRoZXJlIGlzIG5vIG1lbW9yeSBhYm92ZSAweGUwMDAwMDAwLgpCdXQsIG9uIHN0bTMybXAx
NTd4LWVkMSBvciBzdG0zMm1wMTU3eC1ldjEsIHlvdSBhcmUgcmlnaHQsIHdlIGdvdCBtZW1vcnkg
YWJvdmUgMHhlMDAwMDAwMC4KCkkgd2lsbCByZXdvcmsgdGhpcyBwYXRjaCB0byB0YWtlIGludG8g
YWNjb3VudCBtZW1vcnkgdGhhdCBjb3VsZCBiZSBwcmVzZW50IGFib3ZlIE9QVEVFIGFyZWEuCgpU
aGFua3MgZm9yIHBvaW50aW5nIHRoaXMKUGF0cmljZQoKPiAKPiBCZXN0IHJlZ2FyZHMKPiAKPiBI
ZWlucmljaAo+IAo+Pj4gK30KPj4KPj4KPj4KPj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVu
YXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+Cj4+IFRoYW5rcwo+PiBQYXRyaWNr
Cj4+Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==

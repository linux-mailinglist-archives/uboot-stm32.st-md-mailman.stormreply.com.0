Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7F18ACEF1
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Apr 2024 16:05:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E62CC7128B;
	Mon, 22 Apr 2024 14:05:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8339DC7128A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 14:05:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43MCqrJ7017691;
 Mon, 22 Apr 2024 16:04:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:from:to:cc:references
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=42kzQ5wSvzlCpebnRRBxceh98d5cLCzKEzGRMSDxxNU=; b=HX
 /kbzX96eTWKNKcxXHBmV4ANjqDcdDQ9qiTz4JI85KXlupE/M60Pt4rCTtazIsp13
 Tsyt5RQefteoMlZvSkzDJLG4j7aa7uKslF1fhySgUqQtLlhyfKwOpL+LwJEF1dn3
 W6xk8j5/xF1ALGZIsFKZ+p4dlcnZdRcJGX6d4vMHTlgUyawTlz3EmhNFVUvDuzPD
 bW9ykrzlqU8InY5fOVWIqB0T82h459TenkKMYEQ8hD/j05AnUSLJ6rzeMsrAh6XH
 6YPw2My1mOu115jfnZxL1fI6GCGwET90zboLxFfzyFMhIk8VzmsHLeyEJjTxBmcw
 VKfZk6j2JhEwunrjGMqQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm4edq8np-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Apr 2024 16:04:54 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 52D054004C;
 Mon, 22 Apr 2024 16:04:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3D60521D3CA;
 Mon, 22 Apr 2024 16:04:29 +0200 (CEST)
Received: from [10.48.86.98] (10.48.86.98) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 22 Apr
 2024 16:04:28 +0200
Message-ID: <5fa3539a-8bb3-41dd-b5cd-c22d11d20f5d@foss.st.com>
Date: Mon, 22 Apr 2024 16:04:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, Patrick DELAUNAY
 <patrick.delaunay@foss.st.com>
References: <20240308101230.2595220-1-patrice.chotard@foss.st.com>
 <3512e31e-37db-4e03-b133-1914e29fa7ad@foss.st.com>
 <24c03e51-90f8-4918-8097-2a6ccd6ebf4e@gmx.de>
 <c35863dd-65dc-4f85-ac62-d99c9c6addb1@foss.st.com>
In-Reply-To: <c35863dd-65dc-4f85-ac62-d99c9c6addb1@foss.st.com>
X-Originating-IP: [10.48.86.98]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_09,2024-04-22_01,2023-05-22_02
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

CgpPbiA0LzE5LzI0IDA5OjQ0LCBQYXRyaWNlIENIT1RBUkQgd3JvdGU6Cj4gCj4gCj4gT24gNC8x
Ny8yNCAwOTo0NSwgSGVpbnJpY2ggU2NodWNoYXJkdCB3cm90ZToKPj4gT24gMTcuMDQuMjQgMDk6
MjUsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4+PiBIaSwKPj4+Cj4+PiBPbiAzLzgvMjQgMTE6
MTIsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4+PiBTaW5jZSBjb21taXQgN2I3OGQ2NDM4YTJi
MyAoImVmaV9sb2FkZXI6IFJlc2VydmUgdW5hY2Nlc3NpYmxlIG1lbW9yeSIpCj4+Pj4gbWVtb3J5
IHJlZ2lvbiBhYm92ZSByYW1fdG9wIGlzIHRhZ2dlZCBpbiBFRkkgbWVtb3J5IG1hcCBhcwo+Pj4+
IEVGSV9CT09UX1NFUlZJQ0VTX0RBVEEuCj4+Pj4gSW4gY2FzZSBvZiBTVE0zMk1QMSBwbGF0Zm9y
bSwgYWJvdmUgcmFtX3RvcCwgdGhlcmUgaXMgb25lIHJlc2VydmVkLW1lbW9yeQo+Pj4+IHJlZ2lv
biB0YWdnZWQgIm5vLW1hcCIgZGVkaWNhdGVkIHRvIE9QLVRFRSAoYWRkcj1kZTAwMDAwMCBzaXpl
PTIwMDAwMDApLgo+Pj4+Cj4+Pj4gQmVmb3JlIGJvb3Rpbmcga2VybmVsLCBFRkkgbWVtb3J5IG1h
cCBpcyBmaXJzdCBidWlsdCwgdGhlIE9QVEVFIHJlZ2lvbiBpcwo+Pj4+IHRhZ2dlZCBhcyBFRklf
Qk9PVF9TRVJWSUNFU19EQVRBIGFuZCB3aGVuIHJlc2VydmluZyBMTUIsIHRoZSB0YWcgTE1CX05P
TkUKPj4+PiBpcyB1c2VkLgo+Pj4+Cj4+Pj4gVGhlbiBhZnRlciwgdGhlIExNQiBhcmUgY29tcGxl
dGVkIGJ5IGJvb3RfZmR0X2FkZF9tZW1fcnN2X3JlZ2lvbnMoKQo+Pj4+IHdoaWNoIHRyeSB0byBh
ZGQgYWdhaW4gdGhlIHNhbWUgT1BURUUgcmVnaW9uIChhZGRyPWRlMDAwMDAwIHNpemU9MjAwMDAw
MCkKPj4+PiBidXQgbm93IHdpdGggTE1CX05PTUFQIHRhZyB3aGljaCBwcm9kdWNlcyB0aGUgZm9s
bG93aW5nIGVycm9yIG1lc3NhZ2UgOgo+Pj4+Cj4+Pj4gIkVSUk9SOiByZXNlcnZpbmcgZmR0IG1l
bW9yeSByZWdpb24gZmFpbGVkIChhZGRyPWRlMDAwMDAwIHNpemU9MjAwMDAwMAo+Pj4+IGZsYWdz
PTQpIgo+Pj4+Cj4+Pj4gVG8gYXZvaWQgdGhpcywgT1BURUUgYXJlYSBzaG91bGRuJ3QgYmUgdXNl
ZCBieSBFRkksIHNvIHdlIG5lZWQgdG8gbWFyawo+Pj4+IGl0IGFzIHJlc2VydmVkLgo+Pj4+Cj4+
Pj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5z
dC5jb20+Cj4+Pj4gLS0tCj4+Pj4KPj4+PiDCoCBhcmNoL2FybS9tYWNoLXN0bTMybXAvZHJhbV9p
bml0LmMgfCAxMiArKysrKysrKysrKysKPj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9kcmFt
X2luaXQuYwo+Pj4+IGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2RyYW1faW5pdC5jCj4+Pj4gaW5k
ZXggZmIxMjA4ZmM1ZDUuLmY2N2Y1NGYyYWUwIDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gvYXJtL21h
Y2gtc3RtMzJtcC9kcmFtX2luaXQuYwo+Pj4+ICsrKyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9k
cmFtX2luaXQuYwo+Pj4+IEBAIC03LDYgKzcsNyBAQAo+Pj4+IMKgICNpbmNsdWRlIDxjb21tb24u
aD4KPj4+PiDCoCAjaW5jbHVkZSA8ZG0uaD4KPj4+PiArI2luY2x1ZGUgPGVmaV9sb2FkZXIuaD4K
Pj4+PiDCoCAjaW5jbHVkZSA8aW1hZ2UuaD4KPj4+PiDCoCAjaW5jbHVkZSA8aW5pdC5oPgo+Pj4+
IMKgICNpbmNsdWRlIDxsbWIuaD4KPj4+PiBAQCAtNzUsMyArNzYsMTQgQEAgcGh5c19hZGRyX3Qg
Ym9hcmRfZ2V0X3VzYWJsZV9yYW1fdG9wKHBoeXNfc2l6ZV90Cj4+Pj4gdG90YWxfc2l6ZSkKPj4+
PiDCoMKgwqDCoMKgIHJldHVybiByZWcgKyBzaXplOwo+Pj4+IMKgIH0KPj4+PiArCj4+Pj4gK3Zv
aWQgZWZpX2FkZF9rbm93bl9tZW1vcnkodm9pZCkKPj4+PiArewo+Pj4+ICvCoMKgwqAgaWYgKElT
X0VOQUJMRUQoQ09ORklHX0VGSV9MT0FERVIpKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCAvKgo+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgICogTWVtb3J5IG92ZXIgcmFtX3RvcCBpcyByZXNlcnZlZCB0byBP
UFRFRS4KPj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIERlY2xhcmUgdG8gRUZJIG9ubHkgbWVtb3J5
IGFyZWEgYmVsb3cgcmFtX3RvcAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICovCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIGVmaV9hZGRfbWVtb3J5X21hcChnZC0+cmFtX2Jhc2UsIGdkLT5yYW1fdG9wIC0g
Z2QtPnJhbV9iYXNlLAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
RUZJX0NPTlZFTlRJT05BTF9NRU1PUlkpOwo+Pgo+PiBXaXRoIHRoaXMgY2hhbmdlIHRoZSBFRkkg
bWVtb3J5IG1hcCBwYXNzZWQgdG8gdGhlIG9wZXJhdGluZyBzeXN0ZW0gd2lsbAo+PiBub3QgY29u
dGFpbiBhbnkgbWVtb3J5IGFib3ZlIGdkLT5yYW1fdG9wLiBJcyB0aGlzIHJlYWxseSB5b3VyIGlu
dGVudD8KPj4gRG9uJ3QgeW91IGhhdmUgYW55IG1lbW9yeSBhYm92ZSAweGUwMDAwMDAwPwo+IAo+
IEhpIEhlaW5yaWNoCj4gCj4gT24gc3RtMzJtcDE1N3gtZGsgYW5kIHN0bTMybXAxMzV4LWRrIGJv
YXJkcywgdGhlcmUgaXMgbm8gbWVtb3J5IGFib3ZlIDB4ZTAwMDAwMDAuCj4gQnV0LCBvbiBzdG0z
Mm1wMTU3eC1lZDEgb3Igc3RtMzJtcDE1N3gtZXYxLCB5b3UgYXJlIHJpZ2h0LCB3ZSBnb3QgbWVt
b3J5IGFib3ZlIDB4ZTAwMDAwMDAuCj4gCj4gSSB3aWxsIHJld29yayB0aGlzIHBhdGNoIHRvIHRh
a2UgaW50byBhY2NvdW50IG1lbW9yeSB0aGF0IGNvdWxkIGJlIHByZXNlbnQgYWJvdmUgT1BURUUg
YXJlYS4KCkFmdGVyIGRvdWJsZSBjaGVja2luZywgdGhpcyBwYXRjaCBpcyBjb3JyZWN0IGJ1dCBp
IG5lZWQgdG8gdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZS4KCkluIGZhY3QgZm9yIHN0bTMybXAx
NTd4LWRrIGFuZCBzdG0zMm1wMTM1eC1kayBib2FyZHMsIHRoZXJlIGlzIDUxMk1CIG9mIG1lbW9y
eSAoMHhjMDAwMDAwMCAweDIwMDAwMDAwKSwKT1BURUUgaXMgbG9jYXRlZCBhdCB0aGUgZW5kIG9m
IG1lbW9yeSA6IDB4ZGUwMDAwMDAgMHgwMjAwMDAwMAoKQnV0IGZvciBzdG0zMm1wMTU3Yy1ldjEs
IHRoZXJlIGlzIDFHQiBvZiBtZW1vcnkgKDB4QzAwMDAwMDAgMHg0MDAwMDAwMCksIGFuZCBpZGVu
dGljYWxseSwKT1BURUUgaXMgbG9jYXRlZCBhdCB0aGUgZW5kIG9mIG1lbW9yeSA6IDB4ZmUwMDAw
MDAgMHgyMDAwMDAwCgpTbyBpbiBib3RoIGNhc2VzLCBhYm92ZSBPUFRFRSByZXNlcnZlZC1tZW1v
cnkgYXJlYSwgdGhlcmUgaXMgbm8gbW9yZSBmcmVlIG1lbW9yeS4KClRoYW5rcwpQYXRyaWNlCgo+
IAo+IFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcwo+IFBhdHJpY2UKPiAKPj4KPj4gQmVzdCByZWdh
cmRzCj4+Cj4+IEhlaW5yaWNoCj4+Cj4+Pj4gK30KPj4+Cj4+Pgo+Pj4KPj4+IFJldmlld2VkLWJ5
OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+Pj4KPj4+
IFRoYW5rcwo+Pj4gUGF0cmljawo+Pj4KPj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IFVib290LXN0bTMyIG1haWxpbmcgbGlzdAo+IFVib290LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPiBodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxp
c3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

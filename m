Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C758A4927
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Apr 2024 09:36:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B852AC6B444;
	Mon, 15 Apr 2024 07:36:30 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50C19C69067
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 07:36:29 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43F7aKCO088947;
 Mon, 15 Apr 2024 02:36:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1713166580;
 bh=L79ZIncU4aU60aAF1oBaHM8MzEfb/BW8SVPJ1geFlsU=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=h16P8ER1lJWb73pw/I6g6/X8SuTkTFCv754kbDRhDf1t9uXIvIMpnCEpm6Qm4zbhb
 WaYWgS2Dkyo17yWUnWIRfjtGZjnlkcP8tvIYRqGEJ7iazMPPuc+iYaQl/12rToGIVg
 K0+kYKe5nAzd3XHhm1t+sAoy0Di69ae6INFBz7SQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43F7aKo7011031
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 15 Apr 2024 02:36:20 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 15
 Apr 2024 02:36:19 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 15 Apr 2024 02:36:19 -0500
Received: from [172.24.31.60] (lt5cd2489kgj.dhcp.ti.com [172.24.31.60])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43F7aGfr049938;
 Mon, 15 Apr 2024 02:36:17 -0500
Message-ID: <a6928c71-d9f6-4445-b106-9826b71feab8@ti.com>
Date: Mon, 15 Apr 2024 13:06:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>, tom
 Rini <trini@konsulko.com>
References: <20240412155307.735631-1-patrice.chotard@foss.st.com>
 <20240412155307.735631-2-patrice.chotard@foss.st.com>
 <fc509f7b-78ba-425b-8a33-7768a4f58bd0@foss.st.com>
 <8c825b9d-7bb6-47e4-915d-a852df60bbc5@ti.com>
 <c0271e2b-517b-414c-95c3-232f280dd833@foss.st.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <c0271e2b-517b-414c-95c3-232f280dd833@foss.st.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Kumar Gala <galak@kernel.crashing.org>
Subject: Re: [Uboot-stm32] [PATCH v2 2/2] lmb: Fix adjacent region merge in
 lmb_add_region_flags()
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGVsbG8gUGF0cmljZQoKT24gNC8xNS8yMDI0IDEyOjMzIFBNLCBQYXRyaWNlIENIT1RBUkQgd3Jv
dGU6Cj4KPiBPbiA0LzE0LzI0IDEzOjEwLCBLdW1hciwgVWRpdCB3cm90ZToKPj4gSGVsbG8gUGF0
cmljZSwKPj4KPj4gT24gNC8xMy8yMDI0IDE6NTQgUE0sIFBhdHJpY2UgQ0hPVEFSRCB3cm90ZToK
Pj4+IE9uIDQvMTIvMjQgMTc6NTMsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4+PiBJbiBjYXNl
IGEgbmV3IHJlZ2lvbiBpcyBhZGphY2VudCB0byBhIHByZXZpb3VzIHJlZ2lvbiB3aXRoCj4+Pj4g
c2ltaWxhciBmbGFnLCB0aGlzIHJlZ2lvbiBpcyBtZXJnZWQgd2l0aCBpdHMgcHJlZGVjZXNzb3Is
IGJ1dCBubwo+Pj4+IGNoZWNrIGFyZSBkb25lIGlmIHRoaXMgbmV3IGFkZGVkIHJlZ2lvbiBpcyBv
dmVybGFwcGluZyBhbm90aGVyIHJlZ2lvbgo+Pj4+IHByZXNlbnQgaW4gbG1iIChzZWUgcmVzZXJ2
ZWRbM10gd2hpY2ggb3ZlcmxhcHMgcmVzZXJ2ZWRbNF0pLgo+Pj4+Cj4+Pj4gWy4uXQo+Pj4+IHBo
eXNfYWRkcl90IGxtYl9hbGxvYyhzdHJ1Y3QgbG1iICpsbWIsIHBoeXNfc2l6ZV90IHNpemUsIHVs
b25nIGFsaWduKQo+Pj4+ICDCoCB7Cj4+Pj4gIMKgwqDCoMKgwqAgcmV0dXJuIGxtYl9hbGxvY19i
YXNlKGxtYiwgc2l6ZSwgYWxpZ24sIExNQl9BTExPQ19BTllXSEVSRSk7Cj4+PiBJIHRoaW5rIHRo
aXMgc2VyaWVzICh2MikgaXMgbm90IGNvcnJlY3QgZXZlbiBpZiBub3cgdGhlIENJIHRlc3RzIGFy
ZSBPSy4KPj4+IEFmdGVyIHJlLXJlYWRpbmcgY2FyZWZ1bGx5IHRoZSBsaWJfdGVzdF9sbWJfb3Zl
cmxhcHBpbmdfcmVzZXJ2ZSgpIHRlc3QKPj4+IGl0IGFwcGVhcnMgdG8gbWUgdGhlcmUgaXMgYSBj
b250cmFkaWN0aW9uLgo+Pj4KPj4+IEl0J3MgaW5kaWNhdGluZyB0aGF0ICJjaGVjayB0aGF0IGNh
bGxpbmcgbG1iX3Jlc2VydmUgd2l0aCBvdmVybGFwcGluZyByZWdpb25zIGZhaWxzIgo+Pj4KPj4+
IGJ1dCB0aGUgdmVyeSBsYXN0IHRlc3Qgb2YgbGliX3Rlc3RfbG1iX292ZXJsYXBwaW5nX3Jlc2Vy
dmUoKSBoYXMgdGhpcyBjb21tZW50IDoKPj4+IC8qIGFsbG9jYXRlIDNyZCByZWdpb24sIGNvYWxl
c2NlIHdpdGggZmlyc3QgYW5kIG92ZXJsYXAgd2l0aCBzZWNvbmQgKi8KPj4+IGFuZCB0aGlzIHRl
c3QgYWxsb3dzIHRoaXMgb3ZlcmxhcCBjYXNlLgo+Pj4KPj4+IEl0J3Mgbm90IGNsZWFyIGlmIExN
QiByZWdpb24gY2FuIG92ZXJsYXAgZWFjaCBvdGhlciBvciBub3QgPwo+Pgo+PiBJIHdvdWxkIHNh
eSBwYXJ0aWFsIG92ZXJsYXAgYW5kIGNvYWxlc2Npbmcgd2l0aCBiZWZvcmUgb25lCj4+Cj4+IE1h
eSBiZSBCZWxvdyBjYW4gaGVscAo+Pgo+PiAvKiBhbGxvY2F0ZSAybmQgcmVnaW9uICwgVGhpcyBz
aG91bGQgY29hbGVzY2VkIGFsbCByZWdpb24gaW50byBvbmUKPj4KPj4geW91IHdpbGwgZ2V0IG9u
ZSByZWdpb24gYXMKPj4KPj4gQWRkcmVzcyAtLS0gU2l6ZQo+Pgo+PiAweDQwMDEwMDAwIC0tLSAw
eDMwMDAwCj4+Cj4+IE5leHQgYWZ0ZXIgdGhpcyDCoC8qIGFsbG9jYXRlIDJuZCByZWdpb24sIHdo
aWNoIHNob3VsZCBiZSBhZGRlZCBhcyBmaXJzdCByZWdpb24gKi8KPj4KPj4gd2Ugd2lsbCBoYXZl
IHR3byByZWdpb24gbGlrZQo+Pgo+PiBBZGRyZXNzIC0tLSBTaXplCj4+Cj4+ICgweDQwMDAwMDAw
IC0tIDB4ODAwMCkKPj4KPj4gKDB4NDAwMTAwMDAgLS0tIDB4MzAwMDApCj4+Cj4+IE5vdyB0aGly
ZCByZXF1ZXN0IGNvbWVzIGluCj4+Cj4+IC8qIGFsbG9jYXRlIDNyZCByZWdpb24sIGNvYWxlc2Nl
IHdpdGggZmlyc3QgYW5kIG92ZXJsYXAgd2l0aCBzZWNvbmQgKi8KPj4KPj4gd2hpY2ggaXMgYWRk
cmVzcyBvZiDCoDB4NDAwMDgwMDAgYW5kIHNpemUgb2YgwqAweDEwMDAwLCBOb3cgdGhpcyByZWdp
b24gdG8gYmUgYWRkZWQKPj4KPj4gaXMgY29hbGVzY2luZyB3aXRoIGZpcnN0ICgweDQwMDAwMDAw
IC0tIDB4ODAwMCkgYW5kIHBhcnQgb2YgdGhpcyBvdmVybGFwIHdpdGggKDB4NDAwMTAwMDAgLS0t
IDB4MzAwMDApLgo+Pgo+PiBTbywgd2hhdCB0aGlzIHBhdGNoIGRvZXMgLCBtZXJnZSBhbGwgdGhl
c2UgaW50byBvbmUgcmVnaW9uCj4+Cj4+IGFzICgweDQwMDAwMDAwIC0tIDB4NDAwMDApCj4gSGkg
VWRpdAo+Cj4gT2ssIGJ1dCB3aHkgdGhlIHNlY29uZCB0ZXN0IGRvbmUgaW4gdGVzdC9saWIvbG1i
LmMgdGVzdCBzaG91bGQgYmUgY29uc2lkZXJlZCBhcyBmYWlsZWQgPwo+Cj4KPiAJcmV0ID0gbG1i
X3Jlc2VydmUoJmxtYiwgMHg0MDAxMDAwMCwgMHgxMDAwMCk7Cj4gCXV0X2Fzc2VydGVxKHJldCwg
MCk7Cj4gCUFTU0VSVF9MTUIoJmxtYiwgcmFtLCByYW1fc2l6ZSwgMSwgMHg0MDAxMDAwMCwgMHgx
MDAwMCwKPiAJCSAgIDAsIDAsIDAsIDApOwo+IAkvKiBhbGxvY2F0ZSBvdmVybGFwcGluZyByZWdp
b24gc2hvdWxkIGZhaWwgKi8KPiAJcmV0ID0gbG1iX3Jlc2VydmUoJmxtYiwgMHg0MDAxMTAwMCwg
MHgxMDAwMCk7Cj4gCXV0X2Fzc2VydGVxKHJldCwgLTEpOwo+Cj4KPiBUaGUgMiBhcmVhIDB4NDAw
MTAwMDAgLS0gMHgxMDAwMCAgIGFuZCAweDQwMDExMDAwIC0tIDB4MTAwMDAgYXJlYSBvdmVybGFw
cyBlYWNoIG90aGVyIGFuZAo+IHNob3VsZCBiZSBtZXJnZWQgaW4gb25lIDB4NDAwMTAwMDAgLS0g
MTEwMDAgPwo+Cj4gV2hhdCBpcyB0aGUgY3JpdGVyaWEgdG8gbWVyZ2Ugb3Igbm90IDIgb3Zlcmxh
cHBpbmcgYXJlYXMgPwo+Cj4gRm9yIG1lIG92ZXJsYXBwaW5nIHNob3VsZG4ndCBiZSBhdXRob3Jp
emVkLgoKVGhlcmUgYXJlIHR3byBhcmVhcwoKMSkgT3ZlcmxhcHBpbmcgOiBXaGljaCBhcmUgbm90
IGF1dGhvcml6ZWQKCjIpIE92ZXJsYXBwaW5nIGFuZCBjb2FsZXNjaW5nICwgV2hpY2ggaXMgYXV0
aG9yaXplZCB0byBtZXJnZQoKCkkgYW0gb2sgaWYgeW91IHNheSAnY29hbGVzY2luZyBhbmQgb3Zl
cmxhcHBpbmcnIHNob3VsZCBiZSB0cmVhdGVkIGFzIApvdmVybGFwcGluZyAuCgphcyBsb25nIGFz
IG5ldyByZWdpb24gaXMgbm90IGdldHRpbmcgY3JlYXRlZCwgZm9yIGFib3ZlLgoKV2hhdCB3ZSBz
ZWUgb24gb3VyIEo3ODRTNCBFVk0KCndpdGhvdXQgcGF0Y2ggYmRpbmZvIHNheXMgLCByZXNlcnZl
ZFsxXSBhbmQgcmVzZXJ2ZWRbMl0gYXJlIG92ZXJsYXBwaW5nIAphbmQgc2hvdWxkIG5vdCBiZSBj
cmVhdGVkLgoKcmVzZXJ2ZWQuY250ID0gMHg0IHJlc2VydmVkWzBdIFsweDllODAwMDAwLTB4YWJm
ZmZmZmZdLCAweDBkODAwMDAwIGJ5dGVzIApmbGFnczogNCByZXNlcnZlZFsxXSBbMHhmY2U5MjAw
MC0weGZmZmZmZmZmXSwgMHgwMzE2ZTAwMCBieXRlcyBmbGFnczogMCAKcmVzZXJ2ZWRbMl0gWzB4
ZmRlOTFlYzAtMHhmZmZmZmZmZV0sIDB4MDIxNmUxM2YgYnl0ZXMgZmxhZ3M6IDAgCnJlc2VydmVk
WzNdIFsweDg4MDAwMDAwMC0weGZmZmZmZWZmZl0sIDB4NzdmZmZmMDAwIGJ5dGVzIGZsYWdzOiAw
Cgo+Cj4gUGF0cmljZQo+Cj4+PiBVZGl0LCB5b3VyIHBhdGNoIGVkYjU4MjRiZTE3ZiAoImxtYjog
cmVtb3ZlIG92ZXJsYXBwaW5nIHJlZ2lvbiB3aXRoIG5leHQgcmFuZ2UiKQo+Pj4gaXMgYXV0aG9y
aXppbmcgTE1CIG92ZXJsYXBwaW5nIHJpZ2h0ID8KPj4gQXMgc2FpZCBiZWZvcmUgdGhpcyBpcyBj
aGVja2luZyBvdmVybGFwIGFuZCBjb2FsZXNjaW5nIGFuZCBhY3RpbmcgYWNjb3JkaW5nbHkuCj4+
Cj4+PiBQYXRyaWNlCj4+Pgo+Pj4KPj4+Cj4+Pgo+Pj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK

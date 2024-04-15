Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C4B8A489A
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Apr 2024 09:03:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BED6BC6B444;
	Mon, 15 Apr 2024 07:03:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D869EC69066
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 07:03:38 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43EMt2b8003792; Mon, 15 Apr 2024 09:03:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=PXbEkI8sFnTwYuU4hulrESpnbAzc5xkde4bSPZef6dQ=; b=nl
 GFBi7O4EBTnYfsjkBmEt6TR2L13xy96suxvr64lEtPYpjrvywW/igmdZ6sns4vmO
 7KqiaclEJCIJE0BxU/ghMfXZ3khwhYaGJ3focCbyVvMkGpozordL9o3o01v2K836
 G+Dcj4+NZ7ew2ISHpE46C68Q6tEES+cLUJHxptdVXackAuIzqlAwuZ+Bll3A/Qb0
 dOBGH1ISHNsKcz8R+7rFAQHd5V0OrG6Sr0aYEF2eplMOKGpEE118gJD9BMO9ABg6
 NhsM21bobT2Rk/eWWN2ClN1nFhNJAaSqkCb+0E5REgEWJyA0OXDTXHD0detwLKuP
 JKoLakQorknXlJvI0Mcw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xffff6632-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Apr 2024 09:03:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A87144002D;
 Mon, 15 Apr 2024 09:03:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5D26320E037;
 Mon, 15 Apr 2024 09:03:02 +0200 (CEST)
Received: from [10.48.86.98] (10.48.86.98) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Apr
 2024 09:03:01 +0200
Message-ID: <c0271e2b-517b-414c-95c3-232f280dd833@foss.st.com>
Date: Mon, 15 Apr 2024 09:03:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Kumar, Udit" <u-kumar1@ti.com>, <u-boot@lists.denx.de>, tom Rini
 <trini@konsulko.com>
References: <20240412155307.735631-1-patrice.chotard@foss.st.com>
 <20240412155307.735631-2-patrice.chotard@foss.st.com>
 <fc509f7b-78ba-425b-8a33-7768a4f58bd0@foss.st.com>
 <8c825b9d-7bb6-47e4-915d-a852df60bbc5@ti.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <8c825b9d-7bb6-47e4-915d-a852df60bbc5@ti.com>
X-Originating-IP: [10.48.86.98]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_06,2024-04-09_01,2023-05-22_02
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiA0LzE0LzI0IDEzOjEwLCBLdW1hciwgVWRpdCB3cm90ZToKPiBIZWxsbyBQYXRyaWNlLAo+
IAo+IE9uIDQvMTMvMjAyNCAxOjU0IFBNLCBQYXRyaWNlIENIT1RBUkQgd3JvdGU6Cj4+Cj4+IE9u
IDQvMTIvMjQgMTc6NTMsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4+IEluIGNhc2UgYSBuZXcg
cmVnaW9uIGlzIGFkamFjZW50IHRvIGEgcHJldmlvdXMgcmVnaW9uIHdpdGgKPj4+IHNpbWlsYXIg
ZmxhZywgdGhpcyByZWdpb24gaXMgbWVyZ2VkIHdpdGggaXRzIHByZWRlY2Vzc29yLCBidXQgbm8K
Pj4+IGNoZWNrIGFyZSBkb25lIGlmIHRoaXMgbmV3IGFkZGVkIHJlZ2lvbiBpcyBvdmVybGFwcGlu
ZyBhbm90aGVyIHJlZ2lvbgo+Pj4gcHJlc2VudCBpbiBsbWIgKHNlZSByZXNlcnZlZFszXSB3aGlj
aCBvdmVybGFwcyByZXNlcnZlZFs0XSkuCj4+Pgo+Pj4gWy4uXQo+Pj4gcGh5c19hZGRyX3QgbG1i
X2FsbG9jKHN0cnVjdCBsbWIgKmxtYiwgcGh5c19zaXplX3Qgc2l6ZSwgdWxvbmcgYWxpZ24pCj4+
PiDCoCB7Cj4+PiDCoMKgwqDCoMKgIHJldHVybiBsbWJfYWxsb2NfYmFzZShsbWIsIHNpemUsIGFs
aWduLCBMTUJfQUxMT0NfQU5ZV0hFUkUpOwo+Pgo+PiBJIHRoaW5rIHRoaXMgc2VyaWVzICh2Mikg
aXMgbm90IGNvcnJlY3QgZXZlbiBpZiBub3cgdGhlIENJIHRlc3RzIGFyZSBPSy4KPj4gQWZ0ZXIg
cmUtcmVhZGluZyBjYXJlZnVsbHkgdGhlIGxpYl90ZXN0X2xtYl9vdmVybGFwcGluZ19yZXNlcnZl
KCkgdGVzdAo+PiBpdCBhcHBlYXJzIHRvIG1lIHRoZXJlIGlzIGEgY29udHJhZGljdGlvbi4KPj4K
Pj4gSXQncyBpbmRpY2F0aW5nIHRoYXQgImNoZWNrIHRoYXQgY2FsbGluZyBsbWJfcmVzZXJ2ZSB3
aXRoIG92ZXJsYXBwaW5nIHJlZ2lvbnMgZmFpbHMiCj4+Cj4+IGJ1dCB0aGUgdmVyeSBsYXN0IHRl
c3Qgb2YgbGliX3Rlc3RfbG1iX292ZXJsYXBwaW5nX3Jlc2VydmUoKSBoYXMgdGhpcyBjb21tZW50
IDoKPj4gLyogYWxsb2NhdGUgM3JkIHJlZ2lvbiwgY29hbGVzY2Ugd2l0aCBmaXJzdCBhbmQgb3Zl
cmxhcCB3aXRoIHNlY29uZCAqLwo+PiBhbmQgdGhpcyB0ZXN0IGFsbG93cyB0aGlzIG92ZXJsYXAg
Y2FzZS4KPj4KPj4gSXQncyBub3QgY2xlYXIgaWYgTE1CIHJlZ2lvbiBjYW4gb3ZlcmxhcCBlYWNo
IG90aGVyIG9yIG5vdCA/Cj4gCj4gCj4gSSB3b3VsZCBzYXkgcGFydGlhbCBvdmVybGFwIGFuZCBj
b2FsZXNjaW5nIHdpdGggYmVmb3JlIG9uZQo+IAo+IE1heSBiZSBCZWxvdyBjYW4gaGVscAo+IAo+
IC8qIGFsbG9jYXRlIDJuZCByZWdpb24gLCBUaGlzIHNob3VsZCBjb2FsZXNjZWQgYWxsIHJlZ2lv
biBpbnRvIG9uZQo+IAo+IHlvdSB3aWxsIGdldCBvbmUgcmVnaW9uIGFzCj4gCj4gQWRkcmVzcyAt
LS0gU2l6ZQo+IAo+IDB4NDAwMTAwMDAgLS0tIDB4MzAwMDAKPiAKPiBOZXh0IGFmdGVyIHRoaXMg
wqAvKiBhbGxvY2F0ZSAybmQgcmVnaW9uLCB3aGljaCBzaG91bGQgYmUgYWRkZWQgYXMgZmlyc3Qg
cmVnaW9uICovCj4gCj4gd2Ugd2lsbCBoYXZlIHR3byByZWdpb24gbGlrZQo+IAo+IEFkZHJlc3Mg
LS0tIFNpemUKPiAKPiAoMHg0MDAwMDAwMCAtLSAweDgwMDApCj4gCj4gKDB4NDAwMTAwMDAgLS0t
IDB4MzAwMDApCj4gCj4gTm93IHRoaXJkIHJlcXVlc3QgY29tZXMgaW4KPiAKPiAvKiBhbGxvY2F0
ZSAzcmQgcmVnaW9uLCBjb2FsZXNjZSB3aXRoIGZpcnN0IGFuZCBvdmVybGFwIHdpdGggc2Vjb25k
ICovCj4gCj4gd2hpY2ggaXMgYWRkcmVzcyBvZiDCoDB4NDAwMDgwMDAgYW5kIHNpemUgb2YgwqAw
eDEwMDAwLCBOb3cgdGhpcyByZWdpb24gdG8gYmUgYWRkZWQKPiAKPiBpcyBjb2FsZXNjaW5nIHdp
dGggZmlyc3QgKDB4NDAwMDAwMDAgLS0gMHg4MDAwKSBhbmQgcGFydCBvZiB0aGlzIG92ZXJsYXAg
d2l0aCAoMHg0MDAxMDAwMCAtLS0gMHgzMDAwMCkuCj4gCj4gU28sIHdoYXQgdGhpcyBwYXRjaCBk
b2VzICwgbWVyZ2UgYWxsIHRoZXNlIGludG8gb25lIHJlZ2lvbgo+IAo+IGFzICgweDQwMDAwMDAw
IC0tIDB4NDAwMDApCgpIaSBVZGl0CgpPaywgYnV0IHdoeSB0aGUgc2Vjb25kIHRlc3QgZG9uZSBp
biB0ZXN0L2xpYi9sbWIuYyB0ZXN0IHNob3VsZCBiZSBjb25zaWRlcmVkIGFzIGZhaWxlZCA/CgoK
CXJldCA9IGxtYl9yZXNlcnZlKCZsbWIsIDB4NDAwMTAwMDAsIDB4MTAwMDApOwoJdXRfYXNzZXJ0
ZXEocmV0LCAwKTsKCUFTU0VSVF9MTUIoJmxtYiwgcmFtLCByYW1fc2l6ZSwgMSwgMHg0MDAxMDAw
MCwgMHgxMDAwMCwKCQkgICAwLCAwLCAwLCAwKTsKCS8qIGFsbG9jYXRlIG92ZXJsYXBwaW5nIHJl
Z2lvbiBzaG91bGQgZmFpbCAqLwoJcmV0ID0gbG1iX3Jlc2VydmUoJmxtYiwgMHg0MDAxMTAwMCwg
MHgxMDAwMCk7Cgl1dF9hc3NlcnRlcShyZXQsIC0xKTsKCgpUaGUgMiBhcmVhIDB4NDAwMTAwMDAg
LS0gMHgxMDAwMCAgIGFuZCAweDQwMDExMDAwIC0tIDB4MTAwMDAgYXJlYSBvdmVybGFwcyBlYWNo
IG90aGVyIGFuZCAKc2hvdWxkIGJlIG1lcmdlZCBpbiBvbmUgMHg0MDAxMDAwMCAtLSAxMTAwMCA/
CgpXaGF0IGlzIHRoZSBjcml0ZXJpYSB0byBtZXJnZSBvciBub3QgMiBvdmVybGFwcGluZyBhcmVh
cyA/CgpGb3IgbWUgb3ZlcmxhcHBpbmcgc2hvdWxkbid0IGJlIGF1dGhvcml6ZWQuCgpQYXRyaWNl
Cgo+IAo+PiBVZGl0LCB5b3VyIHBhdGNoIGVkYjU4MjRiZTE3ZiAoImxtYjogcmVtb3ZlIG92ZXJs
YXBwaW5nIHJlZ2lvbiB3aXRoIG5leHQgcmFuZ2UiKQo+PiBpcyBhdXRob3JpemluZyBMTUIgb3Zl
cmxhcHBpbmcgcmlnaHQgPwo+IAo+IEFzIHNhaWQgYmVmb3JlIHRoaXMgaXMgY2hlY2tpbmcgb3Zl
cmxhcCBhbmQgY29hbGVzY2luZyBhbmQgYWN0aW5nIGFjY29yZGluZ2x5Lgo+IAo+PiBQYXRyaWNl
Cj4+Cj4+Cj4+Cj4+Cj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==

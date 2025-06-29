Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E81AED020
	for <lists+uboot-stm32@lfdr.de>; Sun, 29 Jun 2025 21:27:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 648CBC36B35;
	Sun, 29 Jun 2025 19:27:35 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48730C36B31
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Jun 2025 19:27:33 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bVfSg1Hw4z9sWt;
 Sun, 29 Jun 2025 21:27:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1751225251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E+mcxLedep0lJAf4LIwlvshN9Mr5F/ha/jWQadRVJ1Q=;
 b=FdkHQkOkx2Pkf0AOvrkyaMC3Z1RDtmTXl8GFN6Mv26HStPlFA5ZTQuPUf4M0Fy/u78MkSl
 z3V+V3VIkoq7kaWcq5AySb4LyUwkevep3NfHgx8NwmtsCJLSRzrJEr741Mh8+/RoE686AC
 mxv8atOUD5Gqe8OlVieiDHi4eKkRcpdQbvkizOlE/GVMn2WWK++4RPY0jjisheqsiULrBU
 mXJKuGrGFHNbl/gZkE4DzX1tu4GAWk4FeAUdA2fbtvV7DuLyjicR1Wn+CN2uxdXBxDlY9b
 In/jWgdE3BmfpjjAS89vpHkNFegxvAbrRmrnHSreYugZXNHEVC3lj14OwXW0Bg==
Message-ID: <87a80ca3-6310-438c-8aad-cea5f51ca531@mailbox.org>
Date: Sun, 29 Jun 2025 21:27:28 +0200
MIME-Version: 1.0
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20250512172149.150214-1-marek.vasut@mailbox.org>
 <20250512172149.150214-5-marek.vasut@mailbox.org>
 <69b334fa-cd92-45dd-aa91-2e0dbc78bd92@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <69b334fa-cd92-45dd-aa91-2e0dbc78bd92@foss.st.com>
X-MBO-RS-META: qhunbr3taa5kxycq88i8emrkgbcu6ga1
X-MBO-RS-ID: 5314f275fe22133d34a
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, u-boot@dh-electronics.com,
 Cheick Traore <cheick.traore@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com, Simon Glass <sjg@chromium.org>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>
Subject: Re: [Uboot-stm32] [PATCH 04/10] ARM: stm32: Add STM32MP13xx PMIC
 initialization for DDR3 DRAM type
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

T24gNi8zLzI1IDQ6MDAgUE0sIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6CgpIaSwKCj4+IGRpZmYg
LS1naXQgYS9ib2FyZC9zdC9jb21tb24vc3RwbWljMS5jIGIvYm9hcmQvc3QvY29tbW9uL3N0cG1p
YzEuYwo+PiBpbmRleCA0NWMyYmI1YmNlYS4uYjQ2Zjg5ZGFjYjkgMTAwNjQ0Cj4+IC0tLSBhL2Jv
YXJkL3N0L2NvbW1vbi9zdHBtaWMxLmMKPj4gKysrIGIvYm9hcmQvc3QvY29tbW9uL3N0cG1pYzEu
Ywo+PiBAQCAtMTQsOCArMTQsMTkgQEAKPj4gwqAgI2luY2x1ZGUgPHBvd2VyL3BtaWMuaD4KPj4g
wqAgI2luY2x1ZGUgPHBvd2VyL3N0cG1pYzEuaD4KPj4gK3N0YXRpYyBib29sIGlzX3N0bTMybXAx
M3h4KHZvaWQpCj4+ICt7Cj4+ICvCoMKgwqAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19TVE0zMk1Q
MTNYKSkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsKPj4gKwo+PiArwqDCoMKgIHJl
dHVybiBvZl9tYWNoaW5lX2lzX2NvbXBhdGlibGUoInN0LHN0bTMybXAxMzEiKSB8fAo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqAgb2ZfbWFjaGluZV9pc19jb21wYXRpYmxlKCJzdCxzdG0zMm1wMTMz
IikgfHwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIG9mX21hY2hpbmVfaXNfY29tcGF0aWJsZSgi
c3Qsc3RtMzJtcDEzNSIpOwo+IAo+IAo+IHJldHVybiB0cnVlO8KgID8KPiAKPiAKPiBubyBuZWVk
IHRvIGNoZWNrIGNvbXBhdGlibGUgaWYgVS1Cb290IGlzIGNvbXBpbGVkIGZvciBTVE0zMk1QMTN4
Li4KClRoZSBjb21wYXRpYmxlIGNoZWNrIGlzIHBsYWNlZCBpbiBoZXJlIGRlbGliZXJhdGVseSwg
aW4gY2FzZSBVLUJvb3QgZ2V0cyAKY29tcGlsZWQgd2l0aCBzdXBwb3J0IGZvciBib3RoIE1QMTUg
YW5kIE1QMTMgLgoKPj4gK30KPj4gKwo+PiDCoCBpbnQgYm9hcmRfZGRyX3Bvd2VyX2luaXQoZW51
bSBkZHJfdHlwZSBkZHJfdHlwZSkKPj4gwqAgewo+PiArwqDCoMKgIGJvb2wgaXNfbXAxMyA9IGlz
X3N0bTMybXAxM3h4KCk7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IHVkZXZpY2UgKmRldjsKPj4gwqDC
oMKgwqDCoCBib29sIGJ1Y2szX2F0XzE4MDAwMDB2ID0gZmFsc2U7Cj4+IMKgwqDCoMKgwqAgaW50
IHJldDsKPj4gQEAgLTMwLDE4ICs0MSwyMSBAQCBpbnQgYm9hcmRfZGRyX3Bvd2VyX2luaXQoZW51
bSBkZHJfdHlwZSBkZHJfdHlwZSkKPj4gwqDCoMKgwqDCoCBzd2l0Y2ggKGRkcl90eXBlKSB7Cj4+
IMKgwqDCoMKgwqAgY2FzZSBTVE0zMk1QX0REUjM6Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBW
VFQgPSBTZXQgTERPMyB0byBzeW5jIG1vZGUgKi8KPj4gLcKgwqDCoMKgwqDCoMKgIHJldCA9IHBt
aWNfcmVnX3JlYWQoZGV2LCBTVFBNSUMxX0xET1hfTUFJTl9DUihTVFBNSUMxX0xETzMpKTsKPj4g
LcKgwqDCoMKgwqDCoMKgIGlmIChyZXQgPCAwKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gcmV0Owo+PiAtCj4+IC3CoMKgwqDCoMKgwqDCoCByZXQgJj0gflNUUE1JQzFfTERPM19N
T0RFOwo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0ICY9IH5TVFBNSUMxX0xETzEyMzU2X1ZPVVRfTUFT
SzsKPj4gLcKgwqDCoMKgwqDCoMKgIHJldCB8PSBTVFBNSUMxX0xET19WT1VUKFNUUE1JQzFfTERP
M19ERFJfU0VMKTsKPj4gLQo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0ID0gcG1pY19yZWdfd3JpdGUo
ZGV2LCBTVFBNSUMxX0xET1hfTUFJTl9DUihTVFBNSUMxX0xETzMpLAo+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQpOwo+PiAtwqDCoMKgwqDCoMKgwqAgaWYg
KHJldCA8IDApCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+ICvCoMKg
wqDCoMKgwqDCoCBpZiAoIWlzX21wMTMpIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyog
RW5hYmxlIFZUVCBvbmx5IG9uIFNUTTMyTVAxNXh4ICovCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldCA9IHBtaWNfcmVnX3JlYWQoZGV2LCAKPj4gU1RQTUlDMV9MRE9YX01BSU5fQ1IoU1RQ
TUlDMV9MRE8zKSk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQgPCAwKQo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+ICsKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0ICY9IH5TVFBNSUMxX0xETzNfTU9ERTsKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0ICY9IH5TVFBNSUMxX0xETzEyMzU2X1ZPVVRfTUFTSzsKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0IHw9IFNUUE1JQzFfTERPX1ZPVVQoU1RQTUlDMV9MRE8z
X0REUl9TRUwpOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IHBtaWNfcmVn
X3dyaXRlKGRldiwgCj4+IFNUUE1JQzFfTERPWF9NQUlOX0NSKFNUUE1JQzFfTERPMyksCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0KTsKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCA8IDApCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIC8qIFZERF9ERFIgPSBTZXQgQlVDSzIgdG8gMS4zNVYgKi8KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIHJldCA9IHBtaWNfY2xyc2V0Yml0cyhkZXYsCj4+IEBAIC02OSwxMSArODMs
MTQgQEAgaW50IGJvYXJkX2Rkcl9wb3dlcl9pbml0KGVudW0gZGRyX3R5cGUgZGRyX3R5cGUpCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBtZGVsYXkoU1RQTUlDMV9ERUZBVUxUX1NUQVJUX1VQX0RFTEFZ
X01TKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIC8qIEVuYWJsZSBWVFQgPSBMRE8zICovCj4+IC3C
oMKgwqDCoMKgwqDCoCByZXQgPSBwbWljX2NscnNldGJpdHMoZGV2LAo+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNUUE1JQzFfTERPWF9NQUlOX0NSKFNUUE1J
QzFfTERPMyksCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
U1RQTUlDMV9MRE9fRU5BLCBTVFBNSUMxX0xET19FTkEpOwo+PiAtwqDCoMKgwqDCoMKgwqAgaWYg
KHJldCA8IDApCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+ICvCoMKg
wqDCoMKgwqDCoCBpZiAoIWlzX21wMTMpIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyog
RW5hYmxlIFZUVCBvbmx5IG9uIFNUTTMyTVAxNXh4ICovCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldCA9IHBtaWNfY2xyc2V0Yml0cyhkZXYsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTVFBNSUMxX0xET1hfTUFJTl9DUihTVFBNSUMx
X0xETzMpLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgU1RQTUlDMV9MRE9fRU5BLCBTVFBNSUMxX0xET19FTkEpOwo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAocmV0IDwgMCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gcmV0Owo+PiArwqDCoMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
bWRlbGF5KFNUUE1JQzFfREVGQVVMVF9TVEFSVF9VUF9ERUxBWV9NUyk7Cj4gCj4gCj4gU3VwcG9y
dCBvZiBWVFQgaXMgbm90IGxpbmtlZCB0byBTb0MgYnV0IHRvIGJvYXJkIGRlc2lnbi4uLgo+IAo+
IEkgdGhpbmsgYWxsIHRoaXMgcGFydCBzaG91bGQgYmUgcmV3b3JrZWQgLyBiYXNlZCBvbiBURi1B
IGJpbmRpbmcKClNvcnJ5LCBuby4gVEZBIGlzIG5vdCBhbiBhdXRob3JpdGF0aXZlIHNvdXJjZSBm
b3IgRFQgYmluZGluZ3MsIHNvIEkgCmRvbid0IHdhbnQgdG8gYWRkIHN1Y2ggYmluZGluZ3MgaW50
byBVLUJvb3QgYW5kIHN1cHBvcnQgdGhlbSBmb3IgYWxsIApldGVybml0eS4gR2V0IHRob3NlIGJp
bmRpbmdzIHVwc3RyZWFtIGFuZCB0aGVuIHRoaXMgY2FuIGJlIHJld29ya2VkLgoKSW4gdGhlIG1l
YW50aW1lLCBob3cgZG8geW91IHByb3Bvc2UgVlRUIGNhbiBiZSBlbmFibGVkL2Rpc2FibGVkIHBl
ciBib2FyZCA/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL3Vib290LXN0bTMyCg==

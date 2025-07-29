Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 115B1B14707
	for <lists+uboot-stm32@lfdr.de>; Tue, 29 Jul 2025 06:05:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDB44C36B3E;
	Tue, 29 Jul 2025 04:05:39 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B19A9C36B0F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jul 2025 04:05:38 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4brhb40x0bz9v21;
 Tue, 29 Jul 2025 06:05:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1753761936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aj1dOQ4ua2z23v1Y8NcJmxy1NMWZrb1IT3QjrOBQbGA=;
 b=RuqtZuxMoqm/nODPwDu96kj1aX68DaDqjkS+gueWbUo03ig29qP5tn0Fkd9/el3PGnz42T
 Q9UK4iXBfDiKZeCDgSjMijqTmABCpL9R5v6HnOg7a+O0qNxMzJ97gXc8MuQEaK0WddRfzo
 cKRaJby0xAUax0Ki7+qzii761asGXsuMwXKlIUF5KkUKdEeIIC8/GSr2B4ZlbzyZspQ+pN
 zYNeesgXmmFvhWANWyU10tEHj2P1R6JXy0k5GCwep8SsNj9OvyaFCaZJ9ufmsWSXcBntK+
 b//rziDbY4ERqpMet/Zd05DFI+0Xof5JlfSw5yjhKBFpFgYhwjFVp/rqvipcyw==
Message-ID: <7211233b-a1dd-489a-82fb-73e2d5dbb0cf@mailbox.org>
Date: Tue, 29 Jul 2025 06:05:33 +0200
MIME-Version: 1.0
From: Marek Vasut <marek.vasut@mailbox.org>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20250512172149.150214-1-marek.vasut@mailbox.org>
 <20250512172149.150214-2-marek.vasut@mailbox.org>
 <ce033305-387b-4732-a711-5a4a9f4237e3@foss.st.com>
 <43ba9ad2-e2df-44e3-9bc0-1b7e343ff1b3@mailbox.org>
Content-Language: en-US
In-Reply-To: <43ba9ad2-e2df-44e3-9bc0-1b7e343ff1b3@mailbox.org>
X-MBO-RS-ID: b4c558be054278b064c
X-MBO-RS-META: 5nzdeqsaage6k9xaih847ff4mobbhd3q
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, u-boot@dh-electronics.com,
 Cheick Traore <cheick.traore@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com, Simon Glass <sjg@chromium.org>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>
Subject: Re: [Uboot-stm32] [PATCH 01/10] ARM: stm32: Add STM32MP13xx SPL
	Kconfig options
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

T24gNi8yOS8yNSA5OjA4IFBNLCBNYXJlayBWYXN1dCB3cm90ZToKCkhpLAoKPj4+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybS9tYWNoLXN0bTMybXAvS2NvbmZpZy4xM3ggYi9hcmNoL2FybS9tYWNoLSAK
Pj4+IHN0bTMybXAvS2NvbmZpZy4xM3gKPj4+IGluZGV4IGJjOGIzZjhjZjc3Li5jZWNmOWUzYjhj
NyAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9LY29uZmlnLjEzeAo+Pj4g
KysrIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL0tjb25maWcuMTN4Cj4+PiBAQCAtMjAsNyArMjAs
OCBAQCBjb25maWcgVEFSR0VUX1NUX1NUTTMyTVAxM1gKPj4+IMKgIGVuZGNob2ljZQo+Pj4gwqAg
Y29uZmlnIFRFWFRfQkFTRQo+Pj4gLcKgwqDCoCBkZWZhdWx0IDB4QzAwMDAwMDAKPj4+ICvCoMKg
wqAgZGVmYXVsdCAweEMwMDAwMDAwIGlmIFRGQUJPT1QKPj4+ICvCoMKgwqAgZGVmYXVsdCAweEMw
MTAwMDAwIGlmICFURkFCT09UCj4+PiDCoCBjb25maWcgUFJFX0NPTl9CVUZfQUREUgo+Pj4gwqDC
oMKgwqDCoCBkZWZhdWx0IDB4QzA4MDAwMDAKPj4KPj4KPj4gSSBkb24ndCB1bmRlcnN0b29kwqAg
d2h5IHlvdSBtb2RpZnkgVEVYVF9CQVNFIGhlcmUuCj4gTG9hZGluZyBvZiBkYXRhIHRvIHRoZSB2
ZXJ5IGJlZ2lubmluZyBvZiBEUkFNIG1heSBmYWlsIGluIGNhc2UgdGhlIGRhdGEgCj4gYXJlIHdy
YXBwZWQgaW4gdmFyaW91cyBjb250YWluZXIgaW1hZ2UgdHlwZXMsIGJlY2F1c2UgdGhlIGltYWdl
IGxvYWRlciAKPiBpbiBTUEwgbWF5IHVzZSB0aGUgYXJlYSBiZWZvcmUgdGhlIGRhdGEgbG9hZCBh
ZGRyZXNzIHRvIGxvYWQgZm9yIGV4YW1wbGUgCj4gaW1hZ2UgaGVhZGVyKHMpIGluIHRoZXJlLiBU
aGlzIGlzIG9uZSBleGFtcGxlIG9mIHN1Y2ggaGVhZGVyIGxvYWRpbmcsIAo+IHdoaWNoIGlzIHRy
aWdnZXJlZCBvbiBTVE0zMk1QMTN4eCBpbiBTUEw6Cj4gCj4gaHR0cHM6Ly9zb3VyY2UuZGVueC5k
ZS91LWJvb3QvdS1ib290Ly0vYmxvYi9tYXN0ZXIvaW5jbHVkZS9zcGxfbG9hZC5oI0wxOAo+IAo+
ICIKPiAgwqAxOMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGxlZ2FjeV9pbWdfaGRyICpoZWFkZXIg
PQo+ICDCoDE5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3BsX2dldF9sb2FkX2J1
ZmZlcigtc2l6ZW9mKCpoZWFkZXIpLCAKPiBzaXplb2YoKmhlYWRlcikpOwo+ICDCoDIwwqDCoMKg
wqDCoMKgwqDCoCB1bG9uZyBiYXNlX29mZnNldCwgaW1hZ2Vfb2Zmc2V0LCBvdmVyaGVhZDsKPiAg
wqAyMcKgwqDCoMKgwqDCoMKgwqAgaW50IHJlYWQsIHJldDsKPiAgwqAyMgo+ICDCoDIzwqDCoMKg
wqDCoMKgwqDCoCBsb2dfZGVidWcoIlxubG9hZGluZyBoZHIgZnJvbSAlbHggdG8gJXBcbiIsICh1
bG9uZylvZmZzZXQsIAo+IGhlYWRlcik7Cj4gIMKgMjTCoMKgwqDCoMKgwqDCoMKgIHJlYWQgPSBp
bmZvLT5yZWFkKGluZm8sIG9mZnNldCwgQUxJR04oc2l6ZW9mKCpoZWFkZXIpLAo+ICDCoDI1IHNw
bF9nZXRfYmxfbGVuKGluZm8pKSwgaGVhZGVyKTsKPiAiCj4gCj4gVGhlIGhlYWRlciBpcyBsb2Fk
ZWQgYXQgQ09ORklHX1RFWFRfQkFTRSAtIHNpemVvZigqaGVhZGVyKS4gSWYgCj4gQ09ORklHX1RF
WFRfQkFTRSBpcyBzdGFydCBvZiBEUkFNIHdpdGggbm8gdXNhYmxlIG1lbW9yeSByaWdodCBiZWxv
dyBpdCAKPiBBTkQgc2l6ZW9mKCpoZWFkZXIpIGlzIG5vbi16ZXJvLCB0aGVuIHRoaXMgbG9hZGlu
ZyB3aWxsIGZhaWwuCj4gCj4gVGhhdCdzIHdoeSB0aGUgVEVYVF9CQVNFIGlzIHNoaWZ0ZWQgYSBi
aXQgaGlnaGVyIGluIHRoaXMgcGF0Y2guCgpBbnkgbmV3cyBvbiB0aGlzIHNlcmllcyA/IEl0IHdv
dWxkIGJlIGdvb2QgdG8gbW92ZSB0aGlzIGFsb25nLgoKLS0gCkJlc3QgcmVnYXJkcywKTWFyZWsg
VmFzdXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==

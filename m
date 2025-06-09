Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B78AD2358
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Jun 2025 18:07:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5C02C32E92;
	Mon,  9 Jun 2025 16:07:51 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5AB7C349C5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jun 2025 16:07:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 66B9E5C49BF;
 Mon,  9 Jun 2025 16:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA8DC4CEEB;
 Mon,  9 Jun 2025 16:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749485268;
 bh=VE4KYsfrrUSqUuDGGN5S6RtpApe/nEvN7R2vqN/eZ8U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=adBcC2rYf331GDWr0c2Oe0QTkVYBjK5p1uM3PyJIC1wyLBS8QBV391X195fO0lXxV
 Ohp5MgZTqxe5oFIZXReI5wbWuUQf78SoQwn+JkpSKRuoZIDWPalHpveFuOuSHRWOsk
 ZJLpp0MOw+pfemT3J/nRmofUqp2zx20DGwzAS1qMkTFwwYbe/U41of7bFlXcFRLrDu
 AVooXTrSKhuaJlktHMU9u3byzemkqzg4dU5XrVVqiL6nQGV/FRNm+mc5k7jSH9wU50
 xtjArsl9ltOZwykVHdtfOJLvOgyMPmJVTU/gY8evUsM+MdQWPG1D+6WIdrE2Vnxs1W
 znnEYhlFJDT9A==
Date: Mon, 9 Jun 2025 17:07:40 +0100
From: Sumit Garg <sumit.garg@kernel.org>
To: Tom Rini <trini@konsulko.com>
Message-ID: <aEcGzCbZXajCthrh@sumit-X1>
References: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
 <dc8bb4a3-c465-4ae0-a61d-bb2f74a42b64@foss.st.com>
 <aEbgxo0WUDPd-S8Z@sumit-X1>
 <CABGWkvox-1a1VSGjX8toQ=WsVTma0JcL8su=MGWaAwq4UZFkrQ@mail.gmail.com>
 <aEcAe80kh66cf0_c@sumit-X1> <20250609155019.GR1382132@bill-the-cat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250609155019.GR1382132@bill-the-cat>
Cc: Jerome Forissier <jerome.forissier@linaro.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 linux-amarula@amarulasolutions.com,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sean Anderson <seanga2@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>, u-boot@lists.denx.de,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Dillon Min <dillon.minfei@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 0/9] Support stm32h747-discovery board
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

T24gTW9uLCBKdW4gMDksIDIwMjUgYXQgMDk6NTA6MTlBTSAtMDYwMCwgVG9tIFJpbmkgd3JvdGU6
Cj4gT24gTW9uLCBKdW4gMDksIDIwMjUgYXQgMDQ6NDA6NDNQTSArMDEwMCwgU3VtaXQgR2FyZyB3
cm90ZToKPiA+IE9uIE1vbiwgSnVuIDA5LCAyMDI1IGF0IDAzOjQ2OjI3UE0gKzAyMDAsIERhcmlv
IEJpbmFjY2hpIHdyb3RlOgo+ID4gPiBIaSBTdW1pdCwKPiA+ID4gCj4gPiA+IE9uIE1vbiwgSnVu
IDksIDIwMjUgYXQgMzoyNeKAr1BNIFN1bWl0IEdhcmcgPHN1bWl0LmdhcmdAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBIaSBQYXRyaWNlLAo+ID4gPiA+Cj4gPiA+ID4gT24gTW9u
LCBKdW4gMDksIDIwMjUgYXQgMDM6MTU6MTRQTSArMDIwMCwgUGF0cmljZSBDSE9UQVJEIHdyb3Rl
Ogo+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiA2LzcvMjUgMTE6MzcsIERhcmlvIEJp
bmFjY2hpIHdyb3RlOgo+ID4gPiA+ID4gPiBUaGUgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3Igc3Rt
MzJoNzQ3LWRpc2NvdmVyeSBib2FyZC4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gRGV0YWlsZWQg
aW5mb3JtYXRpb24gY2FuIGJlIGZvdW5kIGF0Ogo+ID4gPiA+ID4gPiBodHRwczovL3d3dy5zdC5j
b20vZW4vZXZhbHVhdGlvbi10b29scy9zdG0zMmg3NDdpLWRpc2NvLmh0bWwKPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gRGFyaW8gQmluYWNjaGkgKDkpOgo+ID4gPiA+ID4gPiAg
IEFSTTogZHRzOiBzdG0zMmg3LXBpbmN0cmw6IGFkZCBfYSBzdWZmaXggdG8gdVtzXWFydF9waW5z
IHBoYW5kbGVzCj4gPiA+ID4gPiA+ICAgZHQtYmluZGluZ3M6IGFybTogc3RtMzI6IGFkZCBjb21w
YXRpYmxlIGZvciBzdG0zMmg3NDdpLWRpc2NvIGJvYXJkCj4gPiA+ID4gPiA+ICAgZHQtYmluZGlu
Z3M6IGNsb2NrOiBzdG0zMmg3OiByZW5hbWUgVVNBUlR7Nyw4fV9DSyB0byBVQVJUezcsOH1fQ0sK
PiA+ID4gPiA+ID4gICBBUk06IGR0czogc3RtMzI6IGFkZCB1YXJ0OCBub2RlIGZvciBzdG0zMmg3
NDMgTUNVCj4gPiA+ID4gPiA+ICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgcGluIG1hcCBmb3IgVUFS
VDggY29udHJvbGxlciBvbiBzdG0zMmg3NDMKPiA+ID4gPiA+ID4gICBBUk06IGR0czogc3RtMzI6
IGFkZCBhbiBleHRyYSBwaW4gbWFwIGZvciBVU0FSVDEgb24gc3RtMzJoNzQzCj4gPiA+ID4gPiA+
ICAgQVJNOiBkdHM6IHN0bTMyOiBzdXBwb3J0IFNUTTMyaDc0N2ktZGlzY28gYm9hcmQKPiA+ID4g
PiA+ID4gICBBUk06IGR0czogc3RtMzI6IGFkZCBzdG0zMmg3NDdpLWRpc2NvLXUtYm9vdCBEVFMg
ZmlsZQo+ID4gPiA+ID4gPiAgIGJvYXJkOiBzdG0zMjogYWRkIHN0bTMyaDc0Ny1kaXNjb3Zlcnkg
Ym9hcmQgc3VwcG9ydAo+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBIaSBEYXJpbwo+ID4g
PiA+ID4KPiA+ID4gPiA+IEZvciB0aGUgd2hvbGUgc2VyaWVzCj4gPiA+ID4gPiBBcHBsaWVkIHRv
IHUtYm9vdC1zdG0zMi9uZXh0Cj4gPiA+ID4KPiA+ID4gPiBQbGVhc2UgZ2l2ZSBzb21lIHRpbWUg
Zm9yIG90aGVyIG1haW50YWluZXJzIHRvIHJldmlldyB0aGlzIHBhdGNoLXNldC4KPiA+ID4gPiBU
aGUgZHRzL3Vwc3RyZWFtIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgYXJlbid0IGNsZWFuIGNoZXJy
eSBwaWNrIGZyb20KPiA+ID4gPiB1cHN0cmVhbS4KPiA+ID4gCj4gPiA+IEFsbCB0aGUgY29tbWl0
cyBhcmUgYWxyZWFkeSBpbiB0aGUgbWFpbmxpbmUgTGludXgga2VybmVsLCBzcGVjaWZpY2FsbHkK
PiA+ID4gaW4gdjYuMTYtcmMxLgo+ID4gPiBJZiB5b3UncmUgcmVmZXJyaW5nIHRvIHRoZSBmYWN0
IHRoYXQgdGhlIHBhdGNoZXMgY2FuJ3QgYmUgYXBwbGllZAo+ID4gPiBjbGVhbmx5LCBJIGJlbGll
dmUgaXQncwo+ID4gPiBiZWNhdXNlIHRoZSB0YXJnZXQgcGF0aCBpbiB0aGUgTGludXgga2VybmVs
IGRvZXNuJ3QgbWF0Y2ggdGhlIG9uZSBpbiBVLUJvb3QuCj4gPiA+IEluIGZhY3QsIHRoZSBEVFMg
ZmlsZXMgYXJlIGxvY2F0ZWQgaW4gdHdvIGRpZmZlcmVudCByZWxhdGl2ZSBwYXRocy4KPiA+IAo+
ID4gVGhhdCdzIGV4YWN0bHkgd2h5IHdlIGhhdmUgKHJlZmVyIGhlcmUgWzFdKToKPiA+IAo+ID4g
Li90b29scy91cGRhdGUtc3VidHJlZS5zaCBwaWNrIGR0cyA8Y29tbWl0LWlkLXRvLWJlLXBpY2tl
ZD4KPiA+IAo+ID4gWW91IHNob3VsZCBoYXZlIHdhaXRlZCB2Ni4xNi1yYzEgdGFnIHRvIGJlIHN5
bmNlZCBpbnRvCj4gPiBkZXZpY2V0cmVlLXJlYmFzaW5nIFsyXSBmb3IgdGhlIGNoZXJyeS1waWNr
cyB0byB3b3JrLiBUaGlzIHdheSBvZgo+ID4gbWFudWFsbHkgcGF0Y2hpbmcgZHRzL3Vwc3RyZWFt
IGlzIG5vdCBhbGxvd2VkIHNpbmNlIGl0IGlzIGdvaW5nIHRvIGJyZWFrCj4gPiBEVCBzeW5jcyBp
biBvbmUgd2F5IG9yIGFub3RoZXIuCj4gPiAKPiA+IFNvIEkgd291bGQgc3VnZ2VzdCB5b3UgdG8g
d2FpdCBmb3IgdjYuMTYtcmMxIHRvIGxhbmQgaW4gRFQgcmViYXNpbmcgdHJlZQo+ID4gYW5kIHRo
ZW4gc2VuZCB2MiB3aXRoIHByb3BlciBjaGVycnkgcGlja2VkIHBhdGNoZXMuCj4gPiAKPiA+IFsx
XSBodHRwczovL2RvY3MudS1ib290Lm9yZy9lbi9sYXRlc3QvZGV2ZWxvcC9kZXZpY2V0cmVlL2Nv
bnRyb2wuaHRtbCNyZXN5bmNpbmctd2l0aC1kZXZpY2V0cmVlLXJlYmFzaW5nCj4gPiBbMl0gaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZGV2aWNldHJlZS9k
ZXZpY2V0cmVlLXJlYmFzaW5nLmdpdAo+IAo+IFRvIGJlIGhvbmVzdCwgSSBkb24ndCB0aGluayB0
aGlzIGlzIGEgYmlnIGRlYWwuIEdpdCB3aWxsIGJlIG1lcmdpbmcKPiBiYXNlZCBvbiBjb250ZW50
IGFuZCBub3Qgc3BlY2lmaWMgaGFzaGVzLiBBbmQgaW4gdGhlIGNhc2Ugb2YgY29uZmxpY3RzIEkK
PiBqdXN0IGNvcHkgdGhlIGZpbGUgZnJvbSB0aGUgdGFnIHRvIG91ciB0cmVlLgoKVGhlIGVzc2Vu
dGlhbCBwcm9ibGVtIGhlcmUgdG8gbWUgaXMgd2UgYXJlIGdvaW5nIHRvIGFsbG93IG1hbnVhbApw
YXRjaGluZyBvZiBkdHMvdXBzdHJlYW0gdHJlZSBnaXZlbiB0aGlzIGV4YW1wbGU/IEhvdyBkbyB3
ZSBrZWVwIHRyYWNrCmlmIGFsbCB0aGF0IG1hbnVhbCBwYXRjaGluZyBsYW5kZWQgaW4gTGludXgg
RFQgbWFpbmxpbmU/IFRoZSBjaGVycnkKcGlja3MgZW5zdXJlZCB0aGF0IHdlIGFsd2F5cyBrZWVw
IGluIHN5bmMgd2l0aCBtYWlubGluZS4KCkxldHMgdGFrZSBhbiBleGFtcGxlIHdoYXQgaWYgR2l0
IGF1dG9tYXRpY2FsbHkgcmVzb2x2ZWQgYSBtZXJnZSBjb25mbGljdApmb3IgeW91IHdpdGggZHVw
bGljYXRlZCBjb250ZW50IG9yIGlmIG1hbnVhbGx5IHBhdGNoaW5nIGEgRFRTIGZpbGUKZGl2ZXJn
ZWQgZnJvbSB1cHN0cmVhbSBhbmQgZ2V0IHVubm90aWNlZCBkdXJpbmcgRFQgc3luY3M/CgpJTUhP
LCB3ZSBzaG91bGQgdHJ5IHRvIGF2b2lkIG1hbnVhbCBwYXRjaGluZyBvZiBEVCBzdWJ0cmVlIG90
aGVyd2lzZSBpdAppcyBoYXJkIHRvIHNldCBhIHBvbGljeSBhcyB0byB3aGF0IGxldmVsIG9mIG1h
bnVhbCBwYXRjaGluZyBpcyBhbGxvd2VkCm9yIG5vdC4KCi1TdW1pdApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QK
VWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

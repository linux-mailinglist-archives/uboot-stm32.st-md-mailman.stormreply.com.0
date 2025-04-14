Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 674A8A95F59
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Apr 2025 09:27:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BC6EC7A821;
	Tue, 22 Apr 2025 07:27:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 131B9C6DD9A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Apr 2025 12:24:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 462885C061B;
 Mon, 14 Apr 2025 12:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A989DC4CEE2;
 Mon, 14 Apr 2025 12:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744633475;
 bh=07wKONGeuvHFTWQGhbG5pg8wLof/epw3i2SEfVMEpuw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qquy5arUkq+f7Ph8DaW2kipmEa5ga3KwpEaR4NO73+fFOfAKs5oqE994Ki4sST9qi
 PUpZx5jxHq9EqMpi1lWRxO4u/LFQCFWqTNG0Fg6DtpZxk+t8u5C3brxp4CBR1fn0XE
 yGaAD/fZGMdmH5yGyvCyL52GMDZ6853IzMz/NHOm53OsVYZ3f/2H3+mC27Gahohg1x
 UlutumRROYr0CbxISuFAG1JZaYq6FwR3fX3aVOR0uI2VPWk9cKR5GeXYm8Te4gErha
 hi9DN41olSm0c5oc20SJGg0zAFE6IRRoVRsTJz2qU1Ky3MeMb3smTLhGiJQ4EZPGUq
 hgHaRE5CBxvKA==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>,
 u-boot@lists.denx.de
In-Reply-To: <20250407170529.893307-3-vincent.stehle@arm.com>
References: <20250407170529.893307-1-vincent.stehle@arm.com>
 <20250407170529.893307-3-vincent.stehle@arm.com>
Date: Mon, 14 Apr 2025 14:24:32 +0200
Message-ID: <87plhfc4n3.fsf@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 22 Apr 2025 07:27:57 +0000
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Michal Simek <michal.simek@amd.com>
Subject: Re: [Uboot-stm32] [PATCH 2/5] board: st: common: fix dfu alt buffer
	clearing
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

SGkgVmluY2VudCwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gbHVuLiwgYXZyaWwgMDcs
IDIwMjUgYXQgMTk6MDUsIFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4g
d3JvdGU6Cgo+IFRoZSBzZXRfZGZ1X2FsdF9pbmZvKCkgZnVuY3Rpb24gY2FsbHMgdGhlIEFMTE9D
X0NBQ0hFX0FMSUdOX0JVRkZFUigpCj4gbWFjcm8gdG8gZGVjbGFyZSBhIGBidWYnIHZhcmlhYmxl
IHBvaW50ZXIgaW50byBhbiBhcnJheSBhbGxvY2F0ZWQgb24gdGhlCj4gc3RhY2suIEl0IHRoZW4g
Y2FsbHMgdGhlIG1lbXNldCgpIGZ1bmN0aW9uIHRvIGNsZWFyIHRoZSB1c2VhYmxlIHBvcnRpb24K
PiBvZiB0aGUgYXJyYXkgdXNpbmcgdGhlIGlkaW9tYXRpYyBleHByZXNzaW9uIGBzaXplb2YoYnVm
KScuCj4KPiBXaGlsZSB0aGlzIHdvdWxkIGluZGVlZCB3b3JrIGZpbmUgZm9yIGFuIGFycmF5LCBp
biB0aGUgcHJlc2VudCBjYXNlIHdlCj4gZW5kIHVwIGNsZWFyaW5nIG9ubHkgdGhlIHNpemUgb2Yg
YSBwb2ludGVyLgo+IEZpeCB0aGlzIGJ5IHNwZWNpZnlpbmcgdGhlIGV4cGxpY2l0IHNpemUgYERG
VV9BTFRfQlVGX0xFTicgaW5zdGVhZC4KPgo+IEZpeGVzOiBlYzI5MzNlNTQzZGYgKCJib2FyZDog
c3RtMzJtcDE6IG1vdmUgc2V0X2RmdV9hbHRfaW5mbyBpbiBzdCBjb21tb24gZGlyZWN0b3J5IikK
PiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+
Cj4gQ2M6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4g
Q2M6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+IENjOiBU
b20gUmluaSA8dHJpbmlAa29uc3Vsa28uY29tPgo+IENjOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVu
eC5kZT4KClJldmlld2VkLWJ5OiBNYXR0aWpzIEtvcnBlcnNob2VrIDxta29ycGVyc2hvZWtAa2Vy
bmVsLm9yZz4KCj4gLS0tCj4gIGJvYXJkL3N0L2NvbW1vbi9zdG0zMm1wX2RmdS5jIHwgMiArLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYg
LS1naXQgYS9ib2FyZC9zdC9jb21tb24vc3RtMzJtcF9kZnUuYyBiL2JvYXJkL3N0L2NvbW1vbi9z
dG0zMm1wX2RmdS5jCj4gaW5kZXggMWRiOGU0NTQ4MGUuLjhjMWY4MGI2NzhhIDEwMDY0NAo+IC0t
LSBhL2JvYXJkL3N0L2NvbW1vbi9zdG0zMm1wX2RmdS5jCj4gKysrIGIvYm9hcmQvc3QvY29tbW9u
L3N0bTMybXBfZGZ1LmMKPiBAQCAtMTA1LDcgKzEwNSw3IEBAIHZvaWQgc2V0X2RmdV9hbHRfaW5m
byhjaGFyICppbnRlcmZhY2UsIGNoYXIgKmRldnN0cikKPiAgCWlmIChlbnZfZ2V0KCJkZnVfYWx0
X2luZm8iKSkKPiAgCQlyZXR1cm47Cj4gIAo+IC0JbWVtc2V0KGJ1ZiwgMCwgc2l6ZW9mKGJ1Zikp
Owo+ICsJbWVtc2V0KGJ1ZiwgMCwgREZVX0FMVF9CVUZfTEVOKTsKPiAgCj4gIAlzbnByaW50Zihi
dWYsIERGVV9BTFRfQlVGX0xFTiwKPiAgCQkgInJhbSAwPSVzIiwgQ09ORklHX0RGVV9BTFRfUkFN
MCk7Cj4gLS0gCj4gMi40Ny4yCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==

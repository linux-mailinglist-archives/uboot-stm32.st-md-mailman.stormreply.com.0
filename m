Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B67EA95F5A
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Apr 2025 09:27:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 329CFC7A823;
	Tue, 22 Apr 2025 07:27:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 143C8C6DD9A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Apr 2025 12:35:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 927DB444AC;
 Mon, 14 Apr 2025 12:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1338C4CEE2;
 Mon, 14 Apr 2025 12:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744634139;
 bh=keJQ3kzxWKlMeIm6nGtONhO+ARGHaZyxFduy8ZwNoIg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=WE3iT7u1GzMzzazQmDgt1NUecoq2TliMCoAVsleaozHgJsMF+1vzl466QJLDPapbw
 VTF2MTESqpb64N+fnA2sVXbdbXiwrDpaRjiZ/WEhfOiguJ/UiUvUui2xYMIgst1xvf
 pDNe0BtdZxiQ6bpTcDNR4OySneJASf4fcbkyjfS79eEf/2DrzVo/I7+Ifp8We6HbQi
 mDfQkpq97JKuwHYKT3zApW3oAQQ2U9ZfoBYXFkmKnYA1/2Ku7fZ9vQ/bWRremC4K08
 o8bSjp7JPcfo2KHEJXHANWvjt+qOwPgjbJlEFNOKXRL7i1EHybCl/XB6kqr8aX8v1h
 XHqSbdbjVnZrQ==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>, Vincent =?utf-8?Q?Stehl?=
 =?utf-8?Q?=C3=A9?= <vincent.stehle@arm.com>, u-boot@lists.denx.de
In-Reply-To: <87plhfc4n3.fsf@kernel.org>
References: <20250407170529.893307-1-vincent.stehle@arm.com>
 <20250407170529.893307-3-vincent.stehle@arm.com>
 <87plhfc4n3.fsf@kernel.org>
Date: Mon, 14 Apr 2025 14:35:36 +0200
Message-ID: <87mscidip3.fsf@kernel.org>
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

Ck9uIGx1bi4sIGF2cmlsIDE0LCAyMDI1IGF0IDE0OjI0LCBNYXR0aWpzIEtvcnBlcnNob2VrIDxt
a29ycGVyc2hvZWtAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IEhpIFZpbmNlbnQsCj4KPiBUaGFuayB5
b3UgZm9yIHRoZSBwYXRjaC4KPgo+IE9uIGx1bi4sIGF2cmlsIDA3LCAyMDI1IGF0IDE5OjA1LCBW
aW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+IHdyb3RlOgo+Cj4+IFRoZSBz
ZXRfZGZ1X2FsdF9pbmZvKCkgZnVuY3Rpb24gY2FsbHMgdGhlIEFMTE9DX0NBQ0hFX0FMSUdOX0JV
RkZFUigpCj4+IG1hY3JvIHRvIGRlY2xhcmUgYSBgYnVmJyB2YXJpYWJsZSBwb2ludGVyIGludG8g
YW4gYXJyYXkgYWxsb2NhdGVkIG9uIHRoZQo+PiBzdGFjay4gSXQgdGhlbiBjYWxscyB0aGUgbWVt
c2V0KCkgZnVuY3Rpb24gdG8gY2xlYXIgdGhlIHVzZWFibGUgcG9ydGlvbgo+PiBvZiB0aGUgYXJy
YXkgdXNpbmcgdGhlIGlkaW9tYXRpYyBleHByZXNzaW9uIGBzaXplb2YoYnVmKScuCj4+Cj4+IFdo
aWxlIHRoaXMgd291bGQgaW5kZWVkIHdvcmsgZmluZSBmb3IgYW4gYXJyYXksIGluIHRoZSBwcmVz
ZW50IGNhc2Ugd2UKPj4gZW5kIHVwIGNsZWFyaW5nIG9ubHkgdGhlIHNpemUgb2YgYSBwb2ludGVy
Lgo+PiBGaXggdGhpcyBieSBzcGVjaWZ5aW5nIHRoZSBleHBsaWNpdCBzaXplIGBERlVfQUxUX0JV
Rl9MRU4nIGluc3RlYWQuCj4+Cj4+IEZpeGVzOiBlYzI5MzNlNTQzZGYgKCJib2FyZDogc3RtMzJt
cDE6IG1vdmUgc2V0X2RmdV9hbHRfaW5mbyBpbiBzdCBjb21tb24gZGlyZWN0b3J5IikKPj4gU2ln
bmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgo+PiBD
YzogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4gQ2M6
IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiBDYzogVG9t
IFJpbmkgPHRyaW5pQGtvbnN1bGtvLmNvbT4KPj4gQ2M6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54
LmRlPgo+Cj4gUmV2aWV3ZWQtYnk6IE1hdHRpanMgS29ycGVyc2hvZWsgPG1rb3JwZXJzaG9la0Br
ZXJuZWwub3JnPgoKUGF0cmljZSwgUGF0cmljaywKClRoaXMgd2FzIGFzc2lnbmVkIHRvIG1lIG9u
IHBhdGNod29yay4gQXMgWzMtNV0gaGF2ZSBiZWVuIGFwcGxpZWQgYWxyZWFkeQpieSBNaWNoYWws
IGNvdWxkIHlvdSBwbGVhc2UgcGljayB0aGlzIHVwPwoKSSd2ZSBhc3NpZ25lZCBpdCB0byBQYXRy
aWNlIG9uIHBhdGNod29yay4KCj4KPj4gLS0tCj4+ICBib2FyZC9zdC9jb21tb24vc3RtMzJtcF9k
ZnUuYyB8IDIgKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYm9hcmQvc3QvY29tbW9uL3N0bTMybXBfZGZ1LmMgYi9i
b2FyZC9zdC9jb21tb24vc3RtMzJtcF9kZnUuYwo+PiBpbmRleCAxZGI4ZTQ1NDgwZS4uOGMxZjgw
YjY3OGEgMTAwNjQ0Cj4+IC0tLSBhL2JvYXJkL3N0L2NvbW1vbi9zdG0zMm1wX2RmdS5jCj4+ICsr
KyBiL2JvYXJkL3N0L2NvbW1vbi9zdG0zMm1wX2RmdS5jCj4+IEBAIC0xMDUsNyArMTA1LDcgQEAg
dm9pZCBzZXRfZGZ1X2FsdF9pbmZvKGNoYXIgKmludGVyZmFjZSwgY2hhciAqZGV2c3RyKQo+PiAg
CWlmIChlbnZfZ2V0KCJkZnVfYWx0X2luZm8iKSkKPj4gIAkJcmV0dXJuOwo+PiAgCj4+IC0JbWVt
c2V0KGJ1ZiwgMCwgc2l6ZW9mKGJ1ZikpOwo+PiArCW1lbXNldChidWYsIDAsIERGVV9BTFRfQlVG
X0xFTik7Cj4+ICAKPj4gIAlzbnByaW50ZihidWYsIERGVV9BTFRfQlVGX0xFTiwKPj4gIAkJICJy
YW0gMD0lcyIsIENPTkZJR19ERlVfQUxUX1JBTTApOwo+PiAtLSAKPj4gMi40Ny4yCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxp
bmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMy
Cg==

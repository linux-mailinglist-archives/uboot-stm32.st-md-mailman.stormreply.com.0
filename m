Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2657A41505A
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Sep 2021 21:08:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D432C5A4CD;
	Wed, 22 Sep 2021 19:08:48 +0000 (UTC)
Received: from mail.nic.cz (lists.nic.cz [217.31.204.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E9BAC5A4CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 19:08:47 +0000 (UTC)
Received: from thinkpad (unknown [172.20.6.87])
 by mail.nic.cz (Postfix) with ESMTPSA id 60F6E146375;
 Wed, 22 Sep 2021 21:08:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
 t=1632337726; bh=fDif3x+cdPgPf+EQ/PcTP8hxBPmrkknaJGoLEIxg9uw=;
 h=Date:From:To;
 b=K5lSsgCc32JtIVWxQdsQFXbXWj815Glbp9v6KADtrPGEMGDiMa3SCAZcZGCvIJLkS
 bY4hokKwdl6gF0Bwc60XWigP0YocvqpohghPSyTLIx9E3pcma+dXlcrbRl+tgVxaI3
 PnLwIC2eYNfqRHt5KSOBA/i7qO6ndk2xZMUDFOWg=
Date: Wed, 22 Sep 2021 21:08:45 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <marek.behun@nic.cz>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20210922210845.25e65944@thinkpad>
In-Reply-To: <20210922184230.GN8579@bill-the-cat>
References: <20210922162909.1857566-1-patrick.delaunay@foss.st.com>
 <20210922192925.723abcba@thinkpad>
 <a38d6126-2d09-34d4-0b08-0d1da94ed415@denx.de>
 <20210922184230.GN8579@bill-the-cat>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
 USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
 autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>,
 Pali =?UTF-8?B?Um9o?= =?UTF-8?B?w6Fy?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v4 0/2] mtd: spi: nor: force mtd name to
	"nor%d"
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

T24gV2VkLCAyMiBTZXAgMjAyMSAxNDo0MjozMCAtMDQwMApUb20gUmluaSA8dHJpbmlAa29uc3Vs
a28uY29tPiB3cm90ZToKCj4gT24gV2VkLCBTZXAgMjIsIDIwMjEgYXQgMDg6MjQ6MThQTSArMDIw
MCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gPiBPbiA5LzIyLzIxIDc6MjkgUE0sIE1hcmVrIEJlaMO6
biB3cm90ZTogIAo+ID4gPiAoQWRkaW5nIGFsc28gVG9tLikKPiA+ID4gCj4gPiA+IEhpIFBhdHJp
Y2ssIE1hcmVrLAo+ID4gPiAKPiA+ID4gSSBmaW5kIHRoaXMgZWl0aGVyIG5vdCBjb21wbGV0ZSBv
ciBub3QgbmVlZGVkOgo+ID4gPiAKPiA+ID4gLSBlaXRoZXIgeW91IG5lZWQgbXRkIG5hbWVzIHRv
IGJlIG9mIHRoaXMgZm9ybWF0IHNvIHRoYXQgb2xkIE1URFBBUlRTCj4gPiA+ICAgIGNvbmZpZyBk
ZWZpbml0aW9ucyBkbyBub3QgbmVlZCB0byBiZSBjaGFuZ2VkLCBpLmUuIHNvbWV0aGluZyBsaWtl
Cj4gPiA+ICAgICAgQ09ORklHX01URFBBUlRTX0RFRkFVTFQ9Im5vcjA6MU0odS1ib290KSwweDEw
MDBAMHhmZmYwMDAoZW52KSIKPiA+ID4gICAgZG9lcyBub3Qgd29yayBjdXJyZW50bHksIGFuZCB5
b3Ugd2FudCB0byBtYWtlIGl0IHdvcmsuCj4gPiA+IAo+ID4gPiAgICBJIGZpbmQgeW91ciBzb2x1
dGlvbiBoZXJlIGluY29tcGxldGUgYmVjYXVzZSBNVERQQVJUUyBjYW4gYWxzbyBiZQo+ID4gPiAg
ICB1c2VkIHRvIGJlIHBhc3NlZCB0byBMaW51eCBhcyBtdGRwYXJ0cyBwYXJhbWV0ZXIsIGJ1dCB0
aGVyZSBpcyBubwo+ID4gPiAgICBndWFyYW50ZWUgdGhhdCB0aGUgIm5vck4iIG51bWJlcmluZyB5
b3UgYXJlIGNyZWF0aW5nIGluIFUtQm9vdCB3aWxsCj4gPiA+ICAgIGJlIHRoZSBzYW1lIGFzIHRo
ZSBvbmUgaW4ga2VybmVsLgo+ID4gPiAKPiA+ID4gLSBvciBpdCBpcyBub3QgbmVlZGVkLCBiZWNh
dXNlIHlvdSBjYW4gcmVtb3ZlIE1URFBBUlRTIGRlZmluaXRpb24gZnJvbQo+ID4gPiAgICB0aGUg
Ym9hcmQgY29uZmlnIGVudGlyZWx5IGFuZCBtb3ZlIHRoZSBpbmZvcm1hdGlvbiBpbnRvIGRldmlj
ZSB0cmVlLgo+ID4gPiAgICBJbiBmYWN0IHRoaXMgd2FzIHRoZSBtYWluIGlkZWEgYmVoaW5kIG1h
a2luZyB0aGUgc2VyaWVzCj4gPiA+ICAgICAgU3VwcG9ydCBTUEkgTk9ScyBhbmQgT0YgcGFydGl0
aW9ucyBpbiBgbXRkIGxpc3RgCj4gPiA+ICAgIFRoZSBTUEktTk9SIE1URHMgYWZ0ZXIgdGhpcyBz
ZXJpZXMgY2FuIGhhdmUgY29uZmxpY3RpbmcgbmFtZXMsCj4gPiA+ICAgIGJlY2F1c2UgeW91IGNh
biBzdGlsbCBjaG9vc2UgYmV0d2VlbiB0aGVtIHZpYSBPRiBwYXRoIHdpdGggdGhlIGBtdGRgCj4g
PiA+ICAgIGNvbW1hbmQuCj4gPiA+IAo+ID4gPiAgICBUb20gYW5kIEkgd2VyZSBvZiB0aGUgb3Bp
bmlvbiB0aGF0IE1URFBBUlRTIHNob3VsZCBiZSBkZXByZWNhdGVkIGFuZAo+ID4gPiAgICByZW1v
dmVkIGluIGZhdm9yIG9mIE9GLiBNYXJlayBWYXN1dCBzYXlzIHRoYXQgdGhpcyBpcyBub3QgcG9z
c2libGUKPiA+ID4gICAgZm9yIGV2ZXJ5IGJvYXJkLCBhbmQgc28gbmVlZHMgdG8gc3RheS4KPiA+
ID4gCj4gPiA+IEJUVywgSSBmaW5kIGl0IGEgbGl0dGxlIHdlaXJkIGZvciBNYXJlayB0byBkZWZl
bmQgb2xkIEFQSSB3aGljaCBzaG91bGQKPiA+ID4gYmUgY29udmVydGVkIHRvIERULCB3aGVuIGlu
IGRpc2N1c3Npb24gYWJvdXQgRE0gVVNCIC8gTm9raWEgTjkwMAo+ID4gPiBVU0IgVFRZIGNvbnNv
bGUgWzFdIGhlIHdhcyBkZWZlbmRpbmcgdGhlIG9waW5pb24gdGhhdCB3ZSBzaG91bGQgYmUKPiA+
ID4gaGVhZGluZyB0byBEVCBpbiBVLUJvb3QuCj4gPiA+IAo+ID4gPiBbMV0KPiA+ID4gaHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L3Vib290L3BhdGNoLzIwMjEwNjE4MTQ1NzI0
LjI1NTgtMS1wYWxpQGtlcm5lbC5vcmcvICAKPiA+IAo+ID4gVGhhdCBVU0IgZGlzY3Vzc2lvbiBp
cyBjb21wbGV0ZWx5IHVucmVsYXRlZCB0byB0aGUgcHJvYmxlbSBoZXJlLCB0aGUgVVNCCj4gPiBk
aXNjdXNzaW9uIGlzIGFib3V0IGludGVybmFsIChpLmUuIG5vdCB1c2VyIGZhY2luZykgY29udmVy
c2lvbiB0byBETS9EVC4gVGhlCj4gPiB1c2VyLWZhY2luZyBBQkkgZG9lcyBub3QgY2hhbmdlIHRo
ZXJlLiBBbHNvLCB0aGF0IGRpc2N1c3Npb24gd2FzIGFib3V0Cj4gPiBwYXRjaGluZyBVU0Igc3Rh
Y2sgdG8gcGVybWl0IG5ldyBub24tRE0vRFQgb3BlcmF0aW9uLCBub3QgZml4aW5nIGV4aXN0aW5n
Cj4gPiBvbmUuCj4gPiAKPiA+IFRoaXMgcHJvYmxlbSBoZXJlIGlzIHVzZXIgZmFjaW5nIEFCSSwg
dGhlIG10ZHBhcnRzL210ZGlkcy4gVGhhdCB1c2VyIGZhY2luZwo+ID4gQUJJIGdvdCBicm9rZW4u
IEJvYXJkcyB3aGljaCBkbyBkZXBlbmQgb24gaXQsIGV2ZW4gdGhvc2UgY3VycmVudGx5IGluIHRy
ZWUsCj4gPiBhcmUgYnJva2VuLiBOb3QgYWxsIGJvYXJkcyBjYW4gdXBkYXRlIHRoZWlyIGVudmly
b25tZW50LCBzbyBzb21lIGJhY2t3YXJkCj4gPiBjb21wYXRpYmlsaXR5IG9mIHRoZSB1c2VyIGZh
Y2luZyBBQkkgc2hvdWxkIGJlIGluIHBsYWNlLCBldmVuIHRob3VnaCBpdAo+ID4gbWlnaHQgbm90
IGJlIHRvIHRoZSBkZWdyZWUgTGludXgga2VybmVsIGRvZXMgc28uIFNvIGZhciwgaXQgc2VlbXMg
bW9zdCBvZgo+ID4gdGhlIFUtQm9vdCBjb21tYW5kIGxpbmUgaW50ZXJmYWNlIGhhcyBtYW5hZ2Vk
IHRvIHJldGFpbiBiYWNrd2FyZAo+ID4gY29tcGF0aWJpbGl0eSwgSSBkb24ndCBzZWUgd2h5IHRo
aXMgaGVyZSBzaG91bGQgYmUgaGFuZGxlZCBhbnkgZGlmZmVyZW50bHkuCj4gPiAKPiA+IE5vdGUg
dGhhdCB0aGVyZSBhcmUgbm90IGp1c3QgYSBmZXcgYm9hcmRzIHRoYXQgYXJlIGJyb2tlbiwgYnV0
IGh1bmRyZWRzLiBJCj4gPiBiZWxpZXZlIHRoYXQgaXRzZWxmIGp1c3RpZmllcyBhIGZpeCwgaW5z
dGVhZCBvZiBqdXN0IHRocm93aW5nIGFsbCB0aG9zZQo+ID4gaHVuZHJlZHMgb2YgYm9hcmRzIG92
ZXJib2FyZC4KPiA+IAo+ID4gdS1ib290JCBnaXQgZ3JlcCAtbCBDT05GSUdfTVRESURTIGNvbmZp
Z3MgfCB3YyAtbAo+ID4gMjAzCj4gPiAKPiA+IEhvcGVmdWxseSB0aGF0IGNsYXJpZmllcyB0aGUg
ZGlmZmVyZW5jZS4gIAo+IAo+IEl0IGRvZXNuJ3QgcXVpdGUsIHNvcnJ5LiAgSWYgeW91IGhhdmUg
Im10ZHBhcnRzPS4uLiBtdGRpZHM9Li4uIiBpbiB5b3VyCj4gY21kbGluZSB0aGF0IHlvdSBwYXNz
IHRvIExpbnV4LCBVLUJvb3QgZG9lc24ndCBjYXJlLiAgVGhhdCdzIG9uZSBvZiB0aGUKPiBtYWlu
IHVzZXJzIG9mIENPTkZJR19NVERJRFMvTVREUEFSVFMgdG9kYXksIHdoaWNoIGNvdWxkIGluIHNv
bWUgZ29vZAo+IG51bWJlciBvZiBjYXNlcyBiZSByZW1vdmVkICh0YWtlIGFtMzM1eF9ldm1fZGVm
Y29uZmlnIGZvciBleGFtcGxlLCB0aGUKPiB0YWJsZSBoYXMgYmVlbiBkZWZpbmVkIGluIHRoZSB1
cHN0cmVhbSBEVCBmb3IgZm9yZXZlcikuICBUYWtpbmcgYSBsb29rCj4gYXQ6Cj4gY29tbWl0IDkz
OGRiNmZlNWRhMzU4MWVkMmMxN2Q2NGM3ZTAxNmE3YThkZjUyMzcKPiBBdXRob3I6IE1pcXVlbCBS
YXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gRGF0ZTogICBTYXQgU2VwIDI5IDEy
OjU4OjMwIDIwMTggKzAyMDAKPiAKPiAgICAgY21kOiBtdGRwYXJ0czogZGVzY3JpYmUgYXMgbGVn
YWN5Cj4gICAgIAo+ICAgICBUaGUgJ210ZHBhcnRzJyBjb21tYW5kIGlzIG5vdCBuZWVkZWQgYW55
bW9yZS4gV2hpbGUgdGhlIGVudmlyb25tZW50Cj4gICAgIHZhcmlhYmxlIGlzIHN0aWxsIHZhbGlk
IChhbmQgdXNlZnVsLCBhbG9uZyB3aXRoIHRoZSAnbXRkaWRzJyBvbmUpLCB0aGUKPiAgICAgY29t
bWFuZCBoYXMgYmVlbiByZXBsYWNlZCBieSAnbXRkJyB3aGljaCBpcyBtdWNoIG1vcmUgY2xvc2Ug
dG8gdGhlIE1URAo+ICAgICBzdGFjayBhbmQgZG8gbm90IGFkZCBpdHMgb3duIHNwZWNpZmljIGds
dWUuCj4gICAgIAo+ICAgICBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPgo+ICAgICBSZXZpZXdlZC1ieTogU3RlZmFuIFJvZXNlIDxzckBkZW54
LmRlPgo+ICAgICBSZXZpZXdlZC1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25A
Ym9vdGxpbi5jb20+Cj4gCj4gSXMgd2hlbiAibXRkcGFydHMiIGluIFUtQm9vdCB3YXMgbm90ZWQg
YXMgbGVnYWN5LiAgU28gd2hhdCBleGFjdGx5IGFyZQo+IHdlIGZpeGluZyB3aXRoIHRoaXMgc2Vy
aWVzPyAgTm90aGluZyBjaGFuZ2VkIGFib3V0IGhhcmQtY29kZWQgdmFsdWVzCj4gYmVpbmcgcGFz
c2VkIGFsb25nLiAgV2hhdCBtYXkgaGF2ZSBicm9rZW4gd2FzIHNvbWUgcHJvZ21hdGljIHdheSB0
byBzZXQKPiB0aG9zZSwgYnV0IEkgdGhpbmsgdGhhdCdzIGJvdGggZnJhZ2lsZSBhbmQgZGVwcmVj
YXRlZCBpbiBmYXZvciBvZiB0aGUKPiB0YWJsZSBiZWluZyBpbiB0aGUgRFQuCj4gCgpXZSBtYXkg
YmUgZml4aW5nIHVzZXIgc2NyaXB0cyBoYXJkY29kZWQgd2l0aCBzb21ldGhpbmcgbGlrZQogIG10
ZCByZWFkIG5vcjAKClRoZSBxdWVzdGlvbiBpcyBob3cgbWFueSB1c2VycyB1c2Ugc29tZXRoaW5n
IGxpa2UgdGhpcywgYW5kIGhvdyBtYW55Cmp1c3QgbmVlZCB0aGUgbm9yTiBuYW1lcyBmb3IgbXRk
cGFydHMuCgpNYXJlawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

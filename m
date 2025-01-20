Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D938A16945
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Jan 2025 10:23:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A6D5C78002;
	Mon, 20 Jan 2025 09:23:05 +0000 (UTC)
Received: from mout-u-204.mailbox.org (mout-u-204.mailbox.org [80.241.59.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9A42CFAC50
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jan 2025 09:22:58 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-u-204.mailbox.org (Postfix) with ESMTPS id 4Yc4cw1D3kz9tMB;
 Mon, 20 Jan 2025 10:22:56 +0100 (CET)
Message-ID: <c4ba2392-a910-4008-8c0d-b6e56a256ebd@denx.de>
Date: Mon, 20 Jan 2025 10:22:54 +0100
MIME-Version: 1.0
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20250114132814.1250117-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Stefan Roese <sr@denx.de>
In-Reply-To: <20250114132814.1250117-1-patrice.chotard@foss.st.com>
X-Rspamd-Queue-Id: 4Yc4cw1D3kz9tMB
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Rasmus Villemoes <ravi@prevas.dk>, Simon Glass <sjg@chromium.org>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/2] cyclic: Fix rollover every 72 min
 on 32 bits platforms
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

T24gMTQuMDEuMjUgMTQ6MjgsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPiBPbiAzMiBiaXRzIHBs
YXRmb3JtcywgdGltZXJfZ2V0X3VzKCkgcmV0dXJucyBhbiB1bnNpZ25lZCBsb25nIHdoaWNoCj4g
aXMgYSAzMiBiaXRzLiB0aW1lcl9nZXRfdXMoKSB3cmFwcyBhcm91bmQgZXZlcnkgNzIgbWludXRl
cwo+ICgyIF4gMzIgLyAxMDAwMDAwID1+IDQyOTUgc2VjID1+IDcyIG1pbikuCj4gCj4gU28gdGhl
IHRlc3QgImlmIHRpbWVfYWZ0ZXJfZXE2NChub3csIGN5Y2xpYy0+bmV4dF9jYWxsKSIgaXMgbm8g
bW9yZQo+IHRydWUgd2hlbiBjeWNsaWMtPm5leHRfY2FsbCBiZWNvbWVzIGFib3ZlIDMyIGJpdHMg
bWF4IHZhbHVlICg0Mjk0OTY3Mjk1KS4KPiAKPiBBdCB0aGlzIHBvaW50IGFmdGVyIDcyIG1pbiwg
bm8gbW9yZSBjeWNsaWMgZnVuY3Rpb24gYXJlCj4gZXhlY3V0ZWQgaW5jbHVkZWQgd2F0Y2hkb2cg
b25lLgo+IAo+IEluc3RlYWQgb2YgdXNpbmcgdGltZXJfZ2V0X3VzKCksIHVzZSBnZXRfdGltZXJf
dXMoKSB3aGljaCByZXR1cm5zIGEKPiB1aW50NjRfdCwgdGhpcyBhbGxvd3MgYSByb2xsb3ZlciBl
dmVyeSA1ODQ5NDIgeWVhcnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxw
YXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gCj4gLS0tCj4gCj4gQ2hhbmdlcyBpbiB2MjoK
PiAgICAgICAgXyBSZXBsYWNlIHJlbWFpbmluZyB0aW1lcl9nZXRfdXMoKSBieSBnZXRfdGltZXJf
dXMoMCkKClJldmlld2VkLWJ5OiBTdGVmYW4gUm9lc2UgPHNyQGRlbnguZGU+CgpUaGFua3MsClN0
ZWZhbgoKPiAKPiAgIGNvbW1vbi9jeWNsaWMuYyB8IDYgKysrLS0tCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9jb21t
b24vY3ljbGljLmMgYi9jb21tb24vY3ljbGljLmMKPiBpbmRleCAxOTY3OTdmZDYxZS4uZmFkMDcx
YTM5YzYgMTAwNjQ0Cj4gLS0tIGEvY29tbW9uL2N5Y2xpYy5jCj4gKysrIGIvY29tbW9uL2N5Y2xp
Yy5jCj4gQEAgLTM2LDcgKzM2LDcgQEAgdm9pZCBjeWNsaWNfcmVnaXN0ZXIoc3RydWN0IGN5Y2xp
Y19pbmZvICpjeWNsaWMsIGN5Y2xpY19mdW5jX3QgZnVuYywKPiAgIAljeWNsaWMtPmZ1bmMgPSBm
dW5jOwo+ICAgCWN5Y2xpYy0+bmFtZSA9IG5hbWU7Cj4gICAJY3ljbGljLT5kZWxheV91cyA9IGRl
bGF5X3VzOwo+IC0JY3ljbGljLT5zdGFydF90aW1lX3VzID0gdGltZXJfZ2V0X3VzKCk7Cj4gKwlj
eWNsaWMtPnN0YXJ0X3RpbWVfdXMgPSBnZXRfdGltZXJfdXMoMCk7Cj4gICAJaGxpc3RfYWRkX2hl
YWQoJmN5Y2xpYy0+bGlzdCwgY3ljbGljX2dldF9saXN0KCkpOwo+ICAgfQo+ICAgCj4gQEAgLTYx
LDEzICs2MSwxMyBAQCBzdGF0aWMgdm9pZCBjeWNsaWNfcnVuKHZvaWQpCj4gICAJCSAqIENoZWNr
IGlmIHRoaXMgY3ljbGljIGZ1bmN0aW9uIG5lZWRzIHRvIGdldCBjYWxsZWQsIGUuZy4KPiAgIAkJ
ICogZG8gbm90IGNhbGwgdGhlIGN5Y2xpYyBmdW5jIHRvbyBvZnRlbgo+ICAgCQkgKi8KPiAtCQlu
b3cgPSB0aW1lcl9nZXRfdXMoKTsKPiArCQlub3cgPSBnZXRfdGltZXJfdXMoMCk7Cj4gICAJCWlm
ICh0aW1lX2FmdGVyX2VxNjQobm93LCBjeWNsaWMtPm5leHRfY2FsbCkpIHsKPiAgIAkJCS8qIENh
bGwgY3ljbGljIGZ1bmN0aW9uIGFuZCBhY2NvdW50IGl0J3MgY3B1LXRpbWUgKi8KPiAgIAkJCWN5
Y2xpYy0+bmV4dF9jYWxsID0gbm93ICsgY3ljbGljLT5kZWxheV91czsKPiAgIAkJCWN5Y2xpYy0+
ZnVuYyhjeWNsaWMpOwo+ICAgCQkJY3ljbGljLT5ydW5fY250Kys7Cj4gLQkJCWNwdV90aW1lID0g
dGltZXJfZ2V0X3VzKCkgLSBub3c7Cj4gKwkJCWNwdV90aW1lID0gZ2V0X3RpbWVyX3VzKDApIC0g
bm93Owo+ICAgCQkJY3ljbGljLT5jcHVfdGltZV91cyArPSBjcHVfdGltZTsKPiAgIAo+ICAgCQkJ
LyogQ2hlY2sgaWYgY3B1LXRpbWUgZXhjZWVkcyBtYXggYWxsb3dlZCB0aW1lICovCgpWaWVsZSBH
csO8w59lLApTdGVmYW4gUm9lc2UKCi0tIApERU5YIFNvZnR3YXJlIEVuZ2luZWVyaW5nIEdtYkgs
ICAgICAgTWFuYWdpbmcgRGlyZWN0b3I6IEVyaWthIFVudGVyCkhSQiAxNjUyMzUgTXVuaWNoLCBP
ZmZpY2U6IEtpcmNoZW5zdHIuNSwgRC04MjE5NCBHcm9lYmVuemVsbCwgR2VybWFueQpQaG9uZTog
KCs0OSktODE0Mi02Njk4OS01MSBGYXg6ICgrNDkpLTgxNDItNjY5ODktODAgRW1haWw6IHNyQGRl
bnguZGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==

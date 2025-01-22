Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DB2A194DC
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Jan 2025 16:17:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29A50C78F7C;
	Wed, 22 Jan 2025 15:17:08 +0000 (UTC)
Received: from mout-u-107.mailbox.org (mout-u-107.mailbox.org [80.241.59.207])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59ED7C78F7C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2025 15:17:02 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4YdSNW5d7Xz9sch;
 Wed, 22 Jan 2025 16:16:59 +0100 (CET)
Message-ID: <f161fd16-0251-4266-b007-3e7b9ed6431f@denx.de>
Date: Wed, 22 Jan 2025 16:16:58 +0100
MIME-Version: 1.0
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20250114132814.1250117-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Stefan Roese <sr@denx.de>
In-Reply-To: <20250114132814.1250117-1-patrice.chotard@foss.st.com>
X-Rspamd-Queue-Id: 4YdSNW5d7Xz9sch
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
dXMoMCkKCkFwcGxpZWQgdG8gdS1ib290LXdhdGNoZG9nL21hc3RlcgoKVGhhbmtzLApTdGVmYW4K
Cj4gCj4gICBjb21tb24vY3ljbGljLmMgfCA2ICsrKy0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvY29tbW9uL2N5
Y2xpYy5jIGIvY29tbW9uL2N5Y2xpYy5jCj4gaW5kZXggMTk2Nzk3ZmQ2MWUuLmZhZDA3MWEzOWM2
IDEwMDY0NAo+IC0tLSBhL2NvbW1vbi9jeWNsaWMuYwo+ICsrKyBiL2NvbW1vbi9jeWNsaWMuYwo+
IEBAIC0zNiw3ICszNiw3IEBAIHZvaWQgY3ljbGljX3JlZ2lzdGVyKHN0cnVjdCBjeWNsaWNfaW5m
byAqY3ljbGljLCBjeWNsaWNfZnVuY190IGZ1bmMsCj4gICAJY3ljbGljLT5mdW5jID0gZnVuYzsK
PiAgIAljeWNsaWMtPm5hbWUgPSBuYW1lOwo+ICAgCWN5Y2xpYy0+ZGVsYXlfdXMgPSBkZWxheV91
czsKPiAtCWN5Y2xpYy0+c3RhcnRfdGltZV91cyA9IHRpbWVyX2dldF91cygpOwo+ICsJY3ljbGlj
LT5zdGFydF90aW1lX3VzID0gZ2V0X3RpbWVyX3VzKDApOwo+ICAgCWhsaXN0X2FkZF9oZWFkKCZj
eWNsaWMtPmxpc3QsIGN5Y2xpY19nZXRfbGlzdCgpKTsKPiAgIH0KPiAgIAo+IEBAIC02MSwxMyAr
NjEsMTMgQEAgc3RhdGljIHZvaWQgY3ljbGljX3J1bih2b2lkKQo+ICAgCQkgKiBDaGVjayBpZiB0
aGlzIGN5Y2xpYyBmdW5jdGlvbiBuZWVkcyB0byBnZXQgY2FsbGVkLCBlLmcuCj4gICAJCSAqIGRv
IG5vdCBjYWxsIHRoZSBjeWNsaWMgZnVuYyB0b28gb2Z0ZW4KPiAgIAkJICovCj4gLQkJbm93ID0g
dGltZXJfZ2V0X3VzKCk7Cj4gKwkJbm93ID0gZ2V0X3RpbWVyX3VzKDApOwo+ICAgCQlpZiAodGlt
ZV9hZnRlcl9lcTY0KG5vdywgY3ljbGljLT5uZXh0X2NhbGwpKSB7Cj4gICAJCQkvKiBDYWxsIGN5
Y2xpYyBmdW5jdGlvbiBhbmQgYWNjb3VudCBpdCdzIGNwdS10aW1lICovCj4gICAJCQljeWNsaWMt
Pm5leHRfY2FsbCA9IG5vdyArIGN5Y2xpYy0+ZGVsYXlfdXM7Cj4gICAJCQljeWNsaWMtPmZ1bmMo
Y3ljbGljKTsKPiAgIAkJCWN5Y2xpYy0+cnVuX2NudCsrOwo+IC0JCQljcHVfdGltZSA9IHRpbWVy
X2dldF91cygpIC0gbm93Owo+ICsJCQljcHVfdGltZSA9IGdldF90aW1lcl91cygwKSAtIG5vdzsK
PiAgIAkJCWN5Y2xpYy0+Y3B1X3RpbWVfdXMgKz0gY3B1X3RpbWU7Cj4gICAKPiAgIAkJCS8qIENo
ZWNrIGlmIGNwdS10aW1lIGV4Y2VlZHMgbWF4IGFsbG93ZWQgdGltZSAqLwoKVmllbGUgR3LDvMOf
ZSwKU3RlZmFuIFJvZXNlCgotLSAKREVOWCBTb2Z0d2FyZSBFbmdpbmVlcmluZyBHbWJILCAgICAg
IE1hbmFnaW5nIERpcmVjdG9yOiBFcmlrYSBVbnRlcgpIUkIgMTY1MjM1IE11bmljaCwgT2ZmaWNl
OiBLaXJjaGVuc3RyLjUsIEQtODIxOTQgR3JvZWJlbnplbGwsIEdlcm1hbnkKUGhvbmU6ICgrNDkp
LTgxNDItNjY5ODktNTEgRmF4OiAoKzQ5KS04MTQyLTY2OTg5LTgwIEVtYWlsOiBzckBkZW54LmRl
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1z
dG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91
Ym9vdC1zdG0zMgo=

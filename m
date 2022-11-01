Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD546150C8
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Nov 2022 18:35:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DB2AC64104;
	Tue,  1 Nov 2022 17:35:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1832EC55596
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Nov 2022 17:35:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D928A616D8;
 Tue,  1 Nov 2022 17:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 168C4C433D7;
 Tue,  1 Nov 2022 17:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667324108;
 bh=hNWxGwwOHBq0YwG45u6KwBXv8XUQtHZN7S9uoDuuHak=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gsJsMktAVrS2bk7CrZ8IBx/ErXm/SzCiwZ6Psu81nxZDQ3A/ATU4dsEOBHz6o+4Ra
 IGx6H0zx2o2U0JbeH3teDVERZfW5n31NsgshtMQWszkXkclZ1mwIiu5dvs5sXxEd6W
 qC34wWMPx3xiCufqaMT59KWw4HmECkzP66p2snIo4D2LgkNwi7R3kGpiLYI+NcwpYX
 vh6wYAg6yo7ePaM8aKgV7P7ZJyT/7fzgxJTXdze/qq3YpzQj26DNm0AvfhqINGSylI
 Edt+hxY/xdgoYydDln2lkhAZTwJRrdPpFtInvt9okaf8cZvfCUEof5oPUiYR4Q6weV
 gF84BdmwekTVA==
Received: by pali.im (Postfix)
 id 947E97F8; Tue,  1 Nov 2022 18:35:04 +0100 (CET)
Date: Tue, 1 Nov 2022 18:35:04 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Max Krummenacher <max.oss.09@gmail.com>
Message-ID: <20221101173504.25gdj4by7wqclvsv@pali>
References: <20221028161850.565610-1-max.oss.09@gmail.com>
 <20221028161850.565610-2-max.oss.09@gmail.com>
 <20221028164047.ljcy67r2itkkrkeb@pali>
 <CAEHkU3U_xmv6dHvtgSc8Eh0_x6zmdjRj3kVwaRaK2RYjqxST0A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEHkU3U_xmv6dHvtgSc8Eh0_x6zmdjRj3kVwaRaK2RYjqxST0A@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 Tom Rini <trini@konsulko.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, u-boot@lists.denx.de,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Adam Ford <aford173@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/1] Makefile: rework
	u-boot-initial-env target
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

T24gTW9uZGF5IDMxIE9jdG9iZXIgMjAyMiAxMTo1MTo0NSBNYXggS3J1bW1lbmFjaGVyIHdyb3Rl
Ogo+IE9uIEZyaSwgT2N0IDI4LCAyMDIyIGF0IDY6NDAgUE0gUGFsaSBSb2jDoXIgPHBhbGlAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gPiBPbiBGcmlkYXkgMjggT2N0b2JlciAyMDIyIDE4OjE4OjQ5IE1h
eCBLcnVtbWVuYWNoZXIgd3JvdGU6Cj4gPiA+ICBxdWlldF9jbWRfZ2VuZW52ID0gR0VORU5WICAk
QAo+ID4gPiAtY21kX2dlbmVudiA9ICQoT0JKQ09QWSkgLS1kdW1wLXNlY3Rpb24gLnJvZGF0YS5k
ZWZhdWx0X2Vudmlyb25tZW50PSRAIGVudi9jb21tb24ubzsgXAo+ID4gPiAtICAgICBzZWQgLS1p
bi1wbGFjZSAtZSAncy9ceDAwL1x4MEEvZycgJEA7IHNlZCAtLWluLXBsYWNlIC1lICcvXlxzKiQk
L2QnICRAOyBcCj4gPiA+IC0gICAgIHNvcnQgLS1maWVsZC1zZXBhcmF0b3I9PSAtazEsMSAtLXN0
YWJsZSAkQCAtbyAkQAo+ID4gPiArY21kX2dlbmVudiA9IFwKPiA+ID4gKyAgICAgc2NyaXB0cy9w
cmludGluaXRpYWxlbnYgfCBcCj4gPiA+ICsgICAgIHNlZCAtZSAncy9ceDAwL1x4MEEvZycgLWUg
Jy9eXHMqJCQvZCcgfCBcCj4gPgo+ID4gSSB0aGluayB0aGF0IHlvdSBkbyBub3QgbmVlZCB0aGlz
IHNlZCBhbnltb3JlIGFzIHlvdSBwcmludCBuZXdsaW5lIGluCj4gPiBob3N0IHRvb2wuCj4gCj4g
TWlzc2VkIHRoYXQgb25lLCB3aWxsIGNoYW5nZSBpbiBhIFYzLgo+IAo+ID4KPiA+ID4gKyAgICAg
c29ydCAtLWZpZWxkLXNlcGFyYXRvcj09IC1rMSwxIC0tc3RhYmxlIC1vICRACj4gPiA+Cj4gPiA+
ICB1LWJvb3QtaW5pdGlhbC1lbnY6IHUtYm9vdC5iaW4KPiA+Cj4gPiBJdCBpcyBuZWVkZWQgdG8g
dXBkYXRlIGRlcGVuZGVuY2llcyBmb3IgdS1ib290LWluaXRpYWwtZW52IHRhcmdldC4gTm93Cj4g
PiBpdCBkb2VzIG5vdCBkZXBlbmQgb24gdS1ib290LmJpbiBidXQgcmF0aGVyIG9uIHByaW50aW5p
dGlhbGVudiB0b29sLgo+IAo+IEknbSB1bnN1cmUgaWYgdGhhdCBpcyB0aGUgYmVzdCB3YXkgZm9y
d2FyZC4gVGhlIGluaXRpYWwgc29sdXRpb24gd291bGQKPiBhbHNvIG5vdCBuZWVkIHRvIGRlcGVu
ZCBvbiB1LWJvb3QuYmluIGJ1dCByYXRoZXIgb24gZW52L2NvbW1vbi5vLgoKWWVhLCBpdCB3YXMg
d3JvbmcgdG9vLgoKPiBJIGd1ZXNzIHRoYXQgdGhlIGludGVudGlvbiB3YXMgdGhhdCB0aGUgVS1C
b290IGJpbmFyeSBhbmQgdGhlCj4gdS1ib290LWluaXRpYWwtZW52IGZpbGUgc2hvdWxkIG5vdCBi
ZSBvdXQgb2Ygc3luYy4KClRoaXMgaXMgbm90IHBvc3NpYmxlIHRvIGFjaGlldmUgd2l0aCBNYWtl
ZmlsZSBidWlsZCBzeXN0ZW0gYW5kIGlzCnByb2JhYmx5IGFsc28gYWdhaW5zdCB0aGUgbG9naWMg
b2YgbWFrZSB0byBhY2hpZXZlIHRoZSBiZXN0IHBhcmFsbGVsaXNtCmR1cmluZyBidWlsZCBvZiB0
aGUgcHJvamVjdC4KCkluIF9teV8gb3BpbmlvbiwgTWFrZWZpbGUgdGFyZ2V0cyBzaG91bGQgaGF2
ZSBjb3JyZWN0IGRlcGVuZGVuY2llcywgb24Kd2hpY2ggdGhleSBkZXBlbmQuIFRoaXMgd2lsbCBw
cmV2ZW50IGNpcmN1bGFyIGRlcGVuZGVuY2VzIGFuZCBhbHNvCmZhc3RlciBidWlsZGluZyBhcyBt
YWtlIHRvb2wgY2FuIHJ1biBpbiBwYXJhbGxlbCBhcyBtdWNoIGpvYnMgYXMKcG9zc2libGUgLS0g
YW5kIGRvIG5vdCBoYXZlIHRvIHdhaXQgdW50aWwgbWFpbiB1LWJvb3QuYmluIGlzIGJ1aWx0IGFu
ZAp0aGVuIGNhbGwgb3RoZXIgam9icy4KClRvbSwgb3IgZG8geW91IHRoaW5rIHNvbWV0aGluZyBk
aWZmZXJlbnQ/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL3Vib290LXN0bTMyCg==

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E0D61529F
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Nov 2022 20:55:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD753C64104;
	Tue,  1 Nov 2022 19:55:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40700C64101
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Nov 2022 19:55:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 01E2F61709;
 Tue,  1 Nov 2022 19:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D154C433D6;
 Tue,  1 Nov 2022 19:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667332512;
 bh=+XGYVaGixtMdkHXnTW8gtUcwrqUsxYejrY73LsJo5Rs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VVqzdINmeNvjRLXgan9+8UNCLMZ72CkRDT1Y0z1RY9E8I0LnrMolmyWKcpB+MXE7Q
 gpERFDZhEhvkrZcf7ZKCK/4hh79/58JZGKyv3g0NaLUt9lGRm9Yruf5TwkhD5bQwHQ
 0MkU7whegep7RwiKxvzTq6dmpC0Ys6O79GlamS8sIT22oJGN99KDqvnccpu4A7gq1n
 bElpJ+Itm/xoN0YmPe22ZhmugpR1aCY2+dUal1b96jc1w3og+zkC8boG1XGHSsBXZT
 YzH+W86haXpRhdk1ZyZ3aylw6thLLk5DewrYcUny7FoHqOGPJFo3WqdDB38R+ecrwT
 bOEwgDYsVDRJg==
Received: by pali.im (Postfix)
 id 637BA7F8; Tue,  1 Nov 2022 20:55:09 +0100 (CET)
Date: Tue, 1 Nov 2022 20:55:09 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20221101195509.bmpsxmhii2wya4f3@pali>
References: <20221028161850.565610-1-max.oss.09@gmail.com>
 <20221028161850.565610-2-max.oss.09@gmail.com>
 <20221028164047.ljcy67r2itkkrkeb@pali>
 <CAEHkU3U_xmv6dHvtgSc8Eh0_x6zmdjRj3kVwaRaK2RYjqxST0A@mail.gmail.com>
 <20221101173504.25gdj4by7wqclvsv@pali>
 <20221101194834.GK2116612@bill-the-cat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221101194834.GK2116612@bill-the-cat>
User-Agent: NeoMutt/20180716
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Max Krummenacher <max.oss.09@gmail.com>,
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

T24gVHVlc2RheSAwMSBOb3ZlbWJlciAyMDIyIDE1OjQ4OjM0IFRvbSBSaW5pIHdyb3RlOgo+IE9u
IFR1ZSwgTm92IDAxLCAyMDIyIGF0IDA2OjM1OjA0UE0gKzAxMDAsIFBhbGkgUm9ow6FyIHdyb3Rl
Ogo+ID4gT24gTW9uZGF5IDMxIE9jdG9iZXIgMjAyMiAxMTo1MTo0NSBNYXggS3J1bW1lbmFjaGVy
IHdyb3RlOgo+ID4gPiBPbiBGcmksIE9jdCAyOCwgMjAyMiBhdCA2OjQwIFBNIFBhbGkgUm9ow6Fy
IDxwYWxpQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+IE9uIEZyaWRheSAyOCBPY3RvYmVyIDIw
MjIgMTg6MTg6NDkgTWF4IEtydW1tZW5hY2hlciB3cm90ZToKPiA+ID4gPiA+ICBxdWlldF9jbWRf
Z2VuZW52ID0gR0VORU5WICAkQAo+ID4gPiA+ID4gLWNtZF9nZW5lbnYgPSAkKE9CSkNPUFkpIC0t
ZHVtcC1zZWN0aW9uIC5yb2RhdGEuZGVmYXVsdF9lbnZpcm9ubWVudD0kQCBlbnYvY29tbW9uLm87
IFwKPiA+ID4gPiA+IC0gICAgIHNlZCAtLWluLXBsYWNlIC1lICdzL1x4MDAvXHgwQS9nJyAkQDsg
c2VkIC0taW4tcGxhY2UgLWUgJy9eXHMqJCQvZCcgJEA7IFwKPiA+ID4gPiA+IC0gICAgIHNvcnQg
LS1maWVsZC1zZXBhcmF0b3I9PSAtazEsMSAtLXN0YWJsZSAkQCAtbyAkQAo+ID4gPiA+ID4gK2Nt
ZF9nZW5lbnYgPSBcCj4gPiA+ID4gPiArICAgICBzY3JpcHRzL3ByaW50aW5pdGlhbGVudiB8IFwK
PiA+ID4gPiA+ICsgICAgIHNlZCAtZSAncy9ceDAwL1x4MEEvZycgLWUgJy9eXHMqJCQvZCcgfCBc
Cj4gPiA+ID4KPiA+ID4gPiBJIHRoaW5rIHRoYXQgeW91IGRvIG5vdCBuZWVkIHRoaXMgc2VkIGFu
eW1vcmUgYXMgeW91IHByaW50IG5ld2xpbmUgaW4KPiA+ID4gPiBob3N0IHRvb2wuCj4gPiA+IAo+
ID4gPiBNaXNzZWQgdGhhdCBvbmUsIHdpbGwgY2hhbmdlIGluIGEgVjMuCj4gPiA+IAo+ID4gPiA+
Cj4gPiA+ID4gPiArICAgICBzb3J0IC0tZmllbGQtc2VwYXJhdG9yPT0gLWsxLDEgLS1zdGFibGUg
LW8gJEAKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgdS1ib290LWluaXRpYWwtZW52OiB1LWJvb3QuYmlu
Cj4gPiA+ID4KPiA+ID4gPiBJdCBpcyBuZWVkZWQgdG8gdXBkYXRlIGRlcGVuZGVuY2llcyBmb3Ig
dS1ib290LWluaXRpYWwtZW52IHRhcmdldC4gTm93Cj4gPiA+ID4gaXQgZG9lcyBub3QgZGVwZW5k
IG9uIHUtYm9vdC5iaW4gYnV0IHJhdGhlciBvbiBwcmludGluaXRpYWxlbnYgdG9vbC4KPiA+ID4g
Cj4gPiA+IEknbSB1bnN1cmUgaWYgdGhhdCBpcyB0aGUgYmVzdCB3YXkgZm9yd2FyZC4gVGhlIGlu
aXRpYWwgc29sdXRpb24gd291bGQKPiA+ID4gYWxzbyBub3QgbmVlZCB0byBkZXBlbmQgb24gdS1i
b290LmJpbiBidXQgcmF0aGVyIG9uIGVudi9jb21tb24uby4KPiA+IAo+ID4gWWVhLCBpdCB3YXMg
d3JvbmcgdG9vLgo+ID4gCj4gPiA+IEkgZ3Vlc3MgdGhhdCB0aGUgaW50ZW50aW9uIHdhcyB0aGF0
IHRoZSBVLUJvb3QgYmluYXJ5IGFuZCB0aGUKPiA+ID4gdS1ib290LWluaXRpYWwtZW52IGZpbGUg
c2hvdWxkIG5vdCBiZSBvdXQgb2Ygc3luYy4KPiA+IAo+ID4gVGhpcyBpcyBub3QgcG9zc2libGUg
dG8gYWNoaWV2ZSB3aXRoIE1ha2VmaWxlIGJ1aWxkIHN5c3RlbSBhbmQgaXMKPiA+IHByb2JhYmx5
IGFsc28gYWdhaW5zdCB0aGUgbG9naWMgb2YgbWFrZSB0byBhY2hpZXZlIHRoZSBiZXN0IHBhcmFs
bGVsaXNtCj4gPiBkdXJpbmcgYnVpbGQgb2YgdGhlIHByb2plY3QuCj4gPiAKPiA+IEluIF9teV8g
b3BpbmlvbiwgTWFrZWZpbGUgdGFyZ2V0cyBzaG91bGQgaGF2ZSBjb3JyZWN0IGRlcGVuZGVuY2ll
cywgb24KPiA+IHdoaWNoIHRoZXkgZGVwZW5kLiBUaGlzIHdpbGwgcHJldmVudCBjaXJjdWxhciBk
ZXBlbmRlbmNlcyBhbmQgYWxzbwo+ID4gZmFzdGVyIGJ1aWxkaW5nIGFzIG1ha2UgdG9vbCBjYW4g
cnVuIGluIHBhcmFsbGVsIGFzIG11Y2ggam9icyBhcwo+ID4gcG9zc2libGUgLS0gYW5kIGRvIG5v
dCBoYXZlIHRvIHdhaXQgdW50aWwgbWFpbiB1LWJvb3QuYmluIGlzIGJ1aWx0IGFuZAo+ID4gdGhl
biBjYWxsIG90aGVyIGpvYnMuCj4gPiAKPiA+IFRvbSwgb3IgZG8geW91IHRoaW5rIHNvbWV0aGlu
ZyBkaWZmZXJlbnQ/Cj4gCj4gV2VsbCwgdGhpcyB0b29sIGhhcyB0aGUgc2FtZSBlbnZpcm9ubWVu
dCByZXF1aXJlbWVudHMgYXMgdG9vbHMvZW52IGRvZXMsCj4gc28gd2Ugc2hvdWxkIGJlIGFibGUg
dG8gdXNlIHRoZSBzYW1lIGRlcGVuZGVuY3kgaW5mbz8KClllcywgYnVpbGQgdG9vbCBpcyBfYWJs
ZV8gdG8gdXNlIGl0LiAoSSB0aGluayB3ZSBhbGwgYWdyZWUgb24gdGhpcwphYmlsaXR5IG9mIG1h
a2UpCgpCdXQgdGhlIHF1ZXN0aW9uIGlzIGlmIGl0IF9zaG91bGRfIGJlIHVzZWQuIEJlY2F1c2Ug
TWF4IHdyb3RlIHNvbWUKYXJndW1lbnRzIHdoeSBub3QgdG8gdXNlIHRoaXMgZW52IGRlcGVuZGVu
Y3kgaW5mby4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vdWJvb3Qtc3RtMzIK

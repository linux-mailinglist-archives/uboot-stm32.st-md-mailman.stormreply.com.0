Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B09846031F7
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Oct 2022 20:06:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F0CDC64104;
	Tue, 18 Oct 2022 18:06:34 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E5F0C64101
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 18:06:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 86E99B81BFB;
 Tue, 18 Oct 2022 18:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58655C433C1;
 Tue, 18 Oct 2022 18:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666116390;
 bh=T5qF+u6WVZ0hZG5dV+tHusDmxl3t+P0UW/fHGlkMT1k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F4nXPBn1ZCmJmUw4SgGAKMA3tS38DXWnVWknLXGv3FUrfd/rNGD23yH9G7nt1SRIm
 SIt3LNOKlZBO45hJyG6IL+hpshKSL5OFWgruG4o1eN5ch0/iZRlu74WK5Iu8Ll20uU
 sJ62TPgdVRYAmKWieez3aSWKO4qhM8iJUF5g6hvVBrc2Ij3YwdWbybloeLndAFZyQN
 R6ZWhSq04XB84D9gKjFY2vipURlADvrtF5tWuEa1IWPFGU42Zq8GEFxHqHKD78PEG0
 ls1waN7NwxtUQeGr8OyCzkbwTaGI4p7rZdEIG2j1YySt6J7fGuG7YEs653Y1RgyOz1
 H/jWXCpjbhL6w==
Received: by pali.im (Postfix)
 id D8FFC76B; Tue, 18 Oct 2022 20:06:27 +0200 (CEST)
Date: Tue, 18 Oct 2022 20:06:27 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20221018180627.eezooyqb2yyhyodu@pali>
References: <20221018174827.1393211-1-max.oss.09@gmail.com>
 <20221018180331.sgsufsip2p2544ip@pali>
 <20221018180446.GP2020586@bill-the-cat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221018180446.GP2020586@bill-the-cat>
User-Agent: NeoMutt/20180716
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 Max Krummenacher <max.oss.09@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, u-boot@lists.denx.de,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Adam Ford <aford173@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] Makefile: fix u-boot-initial-env target
	if lto is enabled
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

T24gVHVlc2RheSAxOCBPY3RvYmVyIDIwMjIgMTQ6MDQ6NDYgVG9tIFJpbmkgd3JvdGU6Cj4gT24g
VHVlLCBPY3QgMTgsIDIwMjIgYXQgMDg6MDM6MzFQTSArMDIwMCwgUGFsaSBSb2jDoXIgd3JvdGU6
Cj4gPiBPbiBUdWVzZGF5IDE4IE9jdG9iZXIgMjAyMiAxOTo0ODoyNyBNYXggS3J1bW1lbmFjaGVy
IHdyb3RlOgo+ID4gPiBGcm9tOiBNYXggS3J1bW1lbmFjaGVyIDxtYXgua3J1bW1lbmFjaGVyQHRv
cmFkZXguY29tPgo+ID4gPiAKPiA+ID4gV2l0aCBMVE8gZW5hYmxlZCB0aGUgVS1Cb290IGluaXRp
YWwgZW52aXJvbm1lbnQgaXMgbm8gbG9uZ2VyIHN0b3JlZAo+ID4gPiBpbiBhbiBlYXN5IGFjY2Vz
c2libGUgc2VjdGlvbiBpbiBlbnYvY29tbW9uLm8uIEkuZS4gdGhlIHNlY3Rpb24gbmFtZQo+ID4g
PiBjaGFuZ2VzIGZyb20gYnVpbGQgdG8gYnVpbGQsIGl0cyBjb250ZW50IG1heWJlIGNvbXByZXNz
ZWQgYW5kIGl0IGlzCj4gPiA+IGFubm90YXRlZCB3aXRoIGFkZGl0aW9uYWwgZGF0YS4KPiA+ID4g
Cj4gPiA+IEZvciBHQ0MgYWRkaW5nIHRoZSBvcHRpb24gJy1mZmF0LWx0by1vYmplY3RzJyB3aGVu
IGNvbXBpbGluZyBjb21tb24ubwo+ID4gPiBhZGRzIGFkZGl0aW9uYWxseSB0aGUgdHJhZGl0aW9u
YWwgc2VjdGlvbnMgaW4gdGhlIG9iamVjdCBmaWxlIGFuZAo+ID4gPiAnbWFrZSB1LWJvb3QtaW5p
dGlhbC1lbnYnIHdvdWxkIHdvcmsgYWxzbyBmb3IgdGhlIExUTyBlbmFibGVkIGNhc2UuCj4gPiA+
IEhvd2V2ZXIgY2xhbmcgZG9lc24ndCBoYXZlIHRoYXQgb3B0aW9uLgo+ID4gPiAKPiA+ID4gRml4
IHRoaXMgYnkgcmVjb21waWxpbmcgY29tbW9uLm8gaW50byBhIG9iamVjdCBmaWxlIG9ubHkgdXNl
ZCBmb3IKPiA+ID4gdGhlIGNyZWF0aW9uIG9mIHUtYm9vdC1pbml0aWFsLWVudiBpZiBMVE8gaXMg
ZW5hYmxlZC4KPiA+ID4gCj4gPiA+IFNlZSBhbHNvOgo+ID4gPiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvOTI3YjEyMmUtMWY2Mi1lNzkwLWY1Y2EtMzBiYWU0MzMyYzc3QGZvc3Muc3QuY29t
Lwo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogTWF4IEtydW1tZW5hY2hlciA8bWF4LmtydW1t
ZW5hY2hlckB0b3JhZGV4LmNvbT4KPiA+ID4gCj4gPiA+IC0tLQo+ID4gPiAKPiA+ID4gIE1ha2Vm
aWxlIHwgOCArKysrKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+
ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKPiA+ID4gaW5kZXgg
Mzg2NmNjNjJmOWEuLmNkNDVjNzIwZDIzIDEwMDY0NAo+ID4gPiAtLS0gYS9NYWtlZmlsZQo+ID4g
PiArKysgYi9NYWtlZmlsZQo+ID4gPiBAQCAtMjQ1MSw5ICsyNDUxLDE3IEBAIGVuZGlmCj4gPiA+
ICAJJChRKSQoTUFLRSkgLWYgJChzcmN0cmVlKS9zY3JpcHRzL01ha2VmaWxlLm1vZHBvc3QKPiA+
ID4gIAo+ID4gPiAgcXVpZXRfY21kX2dlbmVudiA9IEdFTkVOViAgJEAKPiA+ID4gK2lmZXEgKCQo
TFRPX0VOQUJMRSkseSkKPiA+ID4gK2NtZF9nZW5lbnYgPSAkKENDKSAkKGZpbHRlci1vdXQgJChM
VE9fQ0ZMQUdTKSwkKGNfZmxhZ3MpKSAtYyAtbyBlbnYvaW5pdGlhbF9lbnYubyBlbnYvY29tbW9u
LmM7IFwKPiA+ID4gKwkkKE9CSkNPUFkpIC0tZHVtcC1zZWN0aW9uIC5yb2RhdGEuZGVmYXVsdF9l
bnZpcm9ubWVudD0kQCBlbnYvaW5pdGlhbF9lbnYubzsgXAo+ID4gPiArCXNlZCAtLWluLXBsYWNl
IC1lICdzL1x4MDAvXHgwQS9nJyAkQDsgc2VkIC0taW4tcGxhY2UgLWUgJy9eXHMqJCQvZCcgJEA7
IFwKPiA+ID4gKwlzb3J0IC0tZmllbGQtc2VwYXJhdG9yPT0gLWsxLDEgLS1zdGFibGUgJEAgLW8g
JEA7IFwKPiA+ID4gKwlybSAtZiBlbnYvaW5pdGlhbF9lbnYubyBlbnYvaW5pdGlhbF9lbnYuc3UK
PiA+ID4gK2Vsc2UKPiA+ID4gIGNtZF9nZW5lbnYgPSAkKE9CSkNPUFkpIC0tZHVtcC1zZWN0aW9u
IC5yb2RhdGEuZGVmYXVsdF9lbnZpcm9ubWVudD0kQCBlbnYvY29tbW9uLm87IFwKPiA+IAo+ID4g
VGhpcyBjb2RlIGlzIHN0aWxsIGJyb2tlbiBiZWNhdXNlIGluIHNvbWUgY2FzZXMgc2VjdGlvbiBu
YW1lIGlzIG5vdCBSTy4KPiAKPiBXYWl0LCB3aGVuIGRvZXMgdGhhdCBoYXBwZW4/Cj4gCj4gLS0g
Cj4gVG9tCgpFLmcuIGZvciBtdmVidV9lc3ByZXNzb2Jpbi04OGYzNzIwX2RlZmNvbmZpZwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBt
YWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1z
dG0zMgo=

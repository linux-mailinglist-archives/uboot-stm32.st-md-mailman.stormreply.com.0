Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 858E8603230
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Oct 2022 20:19:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43762C64104;
	Tue, 18 Oct 2022 18:19:29 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8981CC64101
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 18:19:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0268AB81D8C;
 Tue, 18 Oct 2022 18:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7D9C433C1;
 Tue, 18 Oct 2022 18:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666117166;
 bh=FdXkkbyeQIBWuoDAralLijrZFMw7pjR3uE4hBuf+qps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WK3XUnrTSSKKuSWsl4nGYA9KXpCTpDIVRHfJyD0KtuP50yZjYh79LDKlv2xrwbkUq
 CNnC6bzkBgnAuXRbbNkPfCORxPkZapgCUc3ZoIKp6KdwM8hdDQKL/doDyORJsqhFCK
 0Nb1dcNOwykwBiFrj/SKt03xWX6/9Ea4D3PaOJmJ3RYq3earRHXnG8iKSlkvj/fnfV
 /qLe2xpHYwvfYmkZIY09SdbrGkc8Xw8QnB86qKPTQpgdEUvkX5CbSd57ohDOCPyefu
 nNSm/bVBKLWRO0NW61EfKcVJB05Nip1aySxkgMTYPbKEOei8OpaljJK8hkn+1RssOL
 c2C3RksOfO7ZA==
Received: by pali.im (Postfix)
 id 8F62B76B; Tue, 18 Oct 2022 20:19:23 +0200 (CEST)
Date: Tue, 18 Oct 2022 20:19:23 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20221018181923.4vuaskvw3bkfil7b@pali>
References: <20221018174827.1393211-1-max.oss.09@gmail.com>
 <20221018180331.sgsufsip2p2544ip@pali>
 <20221018180446.GP2020586@bill-the-cat>
 <20221018180627.eezooyqb2yyhyodu@pali>
 <20221018181723.GQ2020586@bill-the-cat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221018181723.GQ2020586@bill-the-cat>
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

T24gVHVlc2RheSAxOCBPY3RvYmVyIDIwMjIgMTQ6MTc6MjMgVG9tIFJpbmkgd3JvdGU6Cj4gT24g
VHVlLCBPY3QgMTgsIDIwMjIgYXQgMDg6MDY6MjdQTSArMDIwMCwgUGFsaSBSb2jDoXIgd3JvdGU6
Cj4gPiBPbiBUdWVzZGF5IDE4IE9jdG9iZXIgMjAyMiAxNDowNDo0NiBUb20gUmluaSB3cm90ZToK
PiA+ID4gT24gVHVlLCBPY3QgMTgsIDIwMjIgYXQgMDg6MDM6MzFQTSArMDIwMCwgUGFsaSBSb2jD
oXIgd3JvdGU6Cj4gPiA+ID4gT24gVHVlc2RheSAxOCBPY3RvYmVyIDIwMjIgMTk6NDg6MjcgTWF4
IEtydW1tZW5hY2hlciB3cm90ZToKPiA+ID4gPiA+IEZyb206IE1heCBLcnVtbWVuYWNoZXIgPG1h
eC5rcnVtbWVuYWNoZXJAdG9yYWRleC5jb20+Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IFdpdGggTFRP
IGVuYWJsZWQgdGhlIFUtQm9vdCBpbml0aWFsIGVudmlyb25tZW50IGlzIG5vIGxvbmdlciBzdG9y
ZWQKPiA+ID4gPiA+IGluIGFuIGVhc3kgYWNjZXNzaWJsZSBzZWN0aW9uIGluIGVudi9jb21tb24u
by4gSS5lLiB0aGUgc2VjdGlvbiBuYW1lCj4gPiA+ID4gPiBjaGFuZ2VzIGZyb20gYnVpbGQgdG8g
YnVpbGQsIGl0cyBjb250ZW50IG1heWJlIGNvbXByZXNzZWQgYW5kIGl0IGlzCj4gPiA+ID4gPiBh
bm5vdGF0ZWQgd2l0aCBhZGRpdGlvbmFsIGRhdGEuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEZvciBH
Q0MgYWRkaW5nIHRoZSBvcHRpb24gJy1mZmF0LWx0by1vYmplY3RzJyB3aGVuIGNvbXBpbGluZyBj
b21tb24ubwo+ID4gPiA+ID4gYWRkcyBhZGRpdGlvbmFsbHkgdGhlIHRyYWRpdGlvbmFsIHNlY3Rp
b25zIGluIHRoZSBvYmplY3QgZmlsZSBhbmQKPiA+ID4gPiA+ICdtYWtlIHUtYm9vdC1pbml0aWFs
LWVudicgd291bGQgd29yayBhbHNvIGZvciB0aGUgTFRPIGVuYWJsZWQgY2FzZS4KPiA+ID4gPiA+
IEhvd2V2ZXIgY2xhbmcgZG9lc24ndCBoYXZlIHRoYXQgb3B0aW9uLgo+ID4gPiA+ID4gCj4gPiA+
ID4gPiBGaXggdGhpcyBieSByZWNvbXBpbGluZyBjb21tb24ubyBpbnRvIGEgb2JqZWN0IGZpbGUg
b25seSB1c2VkIGZvcgo+ID4gPiA+ID4gdGhlIGNyZWF0aW9uIG9mIHUtYm9vdC1pbml0aWFsLWVu
diBpZiBMVE8gaXMgZW5hYmxlZC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gU2VlIGFsc286Cj4gPiA+
ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvOTI3YjEyMmUtMWY2Mi1lNzkwLWY1Y2Et
MzBiYWU0MzMyYzc3QGZvc3Muc3QuY29tLwo+ID4gPiA+ID4gCj4gPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBNYXggS3J1bW1lbmFjaGVyIDxtYXgua3J1bW1lbmFjaGVyQHRvcmFkZXguY29tPgo+ID4g
PiA+ID4gCj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+IAo+ID4gPiA+ID4gIE1ha2VmaWxlIHwgOCAr
KysrKysrKwo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiA+ID4g
PiA+IAo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKPiA+ID4gPiA+
IGluZGV4IDM4NjZjYzYyZjlhLi5jZDQ1YzcyMGQyMyAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL01h
a2VmaWxlCj4gPiA+ID4gPiArKysgYi9NYWtlZmlsZQo+ID4gPiA+ID4gQEAgLTI0NTEsOSArMjQ1
MSwxNyBAQCBlbmRpZgo+ID4gPiA+ID4gIAkkKFEpJChNQUtFKSAtZiAkKHNyY3RyZWUpL3Njcmlw
dHMvTWFrZWZpbGUubW9kcG9zdAo+ID4gPiA+ID4gIAo+ID4gPiA+ID4gIHF1aWV0X2NtZF9nZW5l
bnYgPSBHRU5FTlYgICRACj4gPiA+ID4gPiAraWZlcSAoJChMVE9fRU5BQkxFKSx5KQo+ID4gPiA+
ID4gK2NtZF9nZW5lbnYgPSAkKENDKSAkKGZpbHRlci1vdXQgJChMVE9fQ0ZMQUdTKSwkKGNfZmxh
Z3MpKSAtYyAtbyBlbnYvaW5pdGlhbF9lbnYubyBlbnYvY29tbW9uLmM7IFwKPiA+ID4gPiA+ICsJ
JChPQkpDT1BZKSAtLWR1bXAtc2VjdGlvbiAucm9kYXRhLmRlZmF1bHRfZW52aXJvbm1lbnQ9JEAg
ZW52L2luaXRpYWxfZW52Lm87IFwKPiA+ID4gPiA+ICsJc2VkIC0taW4tcGxhY2UgLWUgJ3MvXHgw
MC9ceDBBL2cnICRAOyBzZWQgLS1pbi1wbGFjZSAtZSAnL15ccyokJC9kJyAkQDsgXAo+ID4gPiA+
ID4gKwlzb3J0IC0tZmllbGQtc2VwYXJhdG9yPT0gLWsxLDEgLS1zdGFibGUgJEAgLW8gJEA7IFwK
PiA+ID4gPiA+ICsJcm0gLWYgZW52L2luaXRpYWxfZW52Lm8gZW52L2luaXRpYWxfZW52LnN1Cj4g
PiA+ID4gPiArZWxzZQo+ID4gPiA+ID4gIGNtZF9nZW5lbnYgPSAkKE9CSkNPUFkpIC0tZHVtcC1z
ZWN0aW9uIC5yb2RhdGEuZGVmYXVsdF9lbnZpcm9ubWVudD0kQCBlbnYvY29tbW9uLm87IFwKPiA+
ID4gPiAKPiA+ID4gPiBUaGlzIGNvZGUgaXMgc3RpbGwgYnJva2VuIGJlY2F1c2UgaW4gc29tZSBj
YXNlcyBzZWN0aW9uIG5hbWUgaXMgbm90IFJPLgo+ID4gPiAKPiA+ID4gV2FpdCwgd2hlbiBkb2Vz
IHRoYXQgaGFwcGVuPwo+ID4gCj4gPiBFLmcuIGZvciBtdmVidV9lc3ByZXNzb2Jpbi04OGYzNzIw
X2RlZmNvbmZpZwo+IAo+IEVybSwgdWdoLiBJIHNlZSA0NGJlODM1ZDI1YmEgKCJhcm06IG12ZWJ1
OiBFc3ByZXNzb2JpbjogU2V0IGRlZmF1bHQKPiB2YWx1ZSBmb3IgJGV0aE5hZGRyIGVudiB2YXJp
YWJsZSIpIGFuZCBjNGRmMGY2ZjMxNWMgKCJhcm06IG12ZWJ1Ogo+IEVzcHJlc3NvYmluOiBTZXQg
ZGVmYXVsdCB2YWx1ZSBmb3IgJGZkdGZpbGUgZW52IHZhcmlhYmxlIikgSSBndWVzcyB3ZQo+IGNv
dWxkbid0IHNvbHZlIHRoaXMgYW55IG90aGVyIHdheT8gVGhlIHBsYXRmb3JtcyBhcmVuJ3QgdW5p
cXVlIGluCj4gbmVlZGluZyAvIHdhbnRpbmcgdG8gc2V0IE1BQyBvciBmZHRmaWxlIHZhcmlhYmxl
cy4KPiAKPiAtLSAKPiBUb20KClllcywgd2UgY2FuIHNvbHZlIGl0LiBNYXJlayB3YXMgd29ya2lu
ZyBvbiBzb2x1dGlvbiBmb3Igc2V0dGluZyBkZWZhdWx0CnZhcmlhYmxlcyBhdCBydW50aW1lIGJ1
dCBzZWVtcyBpdCBpcyBub3QgZmluaXNoZWQgeWV0LgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

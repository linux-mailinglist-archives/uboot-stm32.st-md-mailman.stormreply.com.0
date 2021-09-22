Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F35414FCE
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Sep 2021 20:25:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B90BBC5A4CD;
	Wed, 22 Sep 2021 18:25:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE0CCC5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 18:25:13 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E4DFA832CE;
 Wed, 22 Sep 2021 20:25:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1632335113;
 bh=LokVjwv0uj3n1K/FGEE/xk+VtnUmpWhbyBCHsj7KMhk=;
 h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
 b=dGqY23oXA5z86fIyFyeqfhSH/5roVEPO9xs2MysIG/JtzaOLwJeJF+iGS6KgieYNZ
 R8CuBFCjHL+pjpOsqRbvKw1dCG/dv+l3AwxZxDGGaD9zqTvr8Rab3LVQ1Y1QM7puJ8
 gjHVQ4N+5X/ftqIugPlqnkK1zTzmWBe4NPODPKdYJhuvbu5Y05voeiCnMUUZT2iOgH
 ljN7Wviypk9tEJmWShENCNquJ5a22/m/IZl6z9ufaVRnWynk5UO0KPlNoZnM5Ug3Jx
 tUDCQV3mZL0nmRmEJdG/hn6qJEDMRiUuWQOPQX09WRMGDSQsdRiTlIlQJID/pk68pc
 2lqFLj2G8Hv1w==
From: Marek Vasut <marex@denx.de>
To: =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>
References: <20210922162909.1857566-1-patrick.delaunay@foss.st.com>
 <20210922192925.723abcba@thinkpad>
Message-ID: <a38d6126-2d09-34d4-0b08-0d1da94ed415@denx.de>
Date: Wed, 22 Sep 2021 20:24:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210922192925.723abcba@thinkpad>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

T24gOS8yMi8yMSA3OjI5IFBNLCBNYXJlayBCZWjDum4gd3JvdGU6Cj4gKEFkZGluZyBhbHNvIFRv
bS4pCj4gCj4gSGkgUGF0cmljaywgTWFyZWssCj4gCj4gSSBmaW5kIHRoaXMgZWl0aGVyIG5vdCBj
b21wbGV0ZSBvciBub3QgbmVlZGVkOgo+IAo+IC0gZWl0aGVyIHlvdSBuZWVkIG10ZCBuYW1lcyB0
byBiZSBvZiB0aGlzIGZvcm1hdCBzbyB0aGF0IG9sZCBNVERQQVJUUwo+ICAgIGNvbmZpZyBkZWZp
bml0aW9ucyBkbyBub3QgbmVlZCB0byBiZSBjaGFuZ2VkLCBpLmUuIHNvbWV0aGluZyBsaWtlCj4g
ICAgICBDT05GSUdfTVREUEFSVFNfREVGQVVMVD0ibm9yMDoxTSh1LWJvb3QpLDB4MTAwMEAweGZm
ZjAwMChlbnYpIgo+ICAgIGRvZXMgbm90IHdvcmsgY3VycmVudGx5LCBhbmQgeW91IHdhbnQgdG8g
bWFrZSBpdCB3b3JrLgo+IAo+ICAgIEkgZmluZCB5b3VyIHNvbHV0aW9uIGhlcmUgaW5jb21wbGV0
ZSBiZWNhdXNlIE1URFBBUlRTIGNhbiBhbHNvIGJlCj4gICAgdXNlZCB0byBiZSBwYXNzZWQgdG8g
TGludXggYXMgbXRkcGFydHMgcGFyYW1ldGVyLCBidXQgdGhlcmUgaXMgbm8KPiAgICBndWFyYW50
ZWUgdGhhdCB0aGUgIm5vck4iIG51bWJlcmluZyB5b3UgYXJlIGNyZWF0aW5nIGluIFUtQm9vdCB3
aWxsCj4gICAgYmUgdGhlIHNhbWUgYXMgdGhlIG9uZSBpbiBrZXJuZWwuCj4gCj4gLSBvciBpdCBp
cyBub3QgbmVlZGVkLCBiZWNhdXNlIHlvdSBjYW4gcmVtb3ZlIE1URFBBUlRTIGRlZmluaXRpb24g
ZnJvbQo+ICAgIHRoZSBib2FyZCBjb25maWcgZW50aXJlbHkgYW5kIG1vdmUgdGhlIGluZm9ybWF0
aW9uIGludG8gZGV2aWNlIHRyZWUuCj4gICAgSW4gZmFjdCB0aGlzIHdhcyB0aGUgbWFpbiBpZGVh
IGJlaGluZCBtYWtpbmcgdGhlIHNlcmllcwo+ICAgICAgU3VwcG9ydCBTUEkgTk9ScyBhbmQgT0Yg
cGFydGl0aW9ucyBpbiBgbXRkIGxpc3RgCj4gICAgVGhlIFNQSS1OT1IgTVREcyBhZnRlciB0aGlz
IHNlcmllcyBjYW4gaGF2ZSBjb25mbGljdGluZyBuYW1lcywKPiAgICBiZWNhdXNlIHlvdSBjYW4g
c3RpbGwgY2hvb3NlIGJldHdlZW4gdGhlbSB2aWEgT0YgcGF0aCB3aXRoIHRoZSBgbXRkYAo+ICAg
IGNvbW1hbmQuCj4gCj4gICAgVG9tIGFuZCBJIHdlcmUgb2YgdGhlIG9waW5pb24gdGhhdCBNVERQ
QVJUUyBzaG91bGQgYmUgZGVwcmVjYXRlZCBhbmQKPiAgICByZW1vdmVkIGluIGZhdm9yIG9mIE9G
LiBNYXJlayBWYXN1dCBzYXlzIHRoYXQgdGhpcyBpcyBub3QgcG9zc2libGUKPiAgICBmb3IgZXZl
cnkgYm9hcmQsIGFuZCBzbyBuZWVkcyB0byBzdGF5Lgo+IAo+IEJUVywgSSBmaW5kIGl0IGEgbGl0
dGxlIHdlaXJkIGZvciBNYXJlayB0byBkZWZlbmQgb2xkIEFQSSB3aGljaCBzaG91bGQKPiBiZSBj
b252ZXJ0ZWQgdG8gRFQsIHdoZW4gaW4gZGlzY3Vzc2lvbiBhYm91dCBETSBVU0IgLyBOb2tpYSBO
OTAwCj4gVVNCIFRUWSBjb25zb2xlIFsxXSBoZSB3YXMgZGVmZW5kaW5nIHRoZSBvcGluaW9uIHRo
YXQgd2Ugc2hvdWxkIGJlCj4gaGVhZGluZyB0byBEVCBpbiBVLUJvb3QuCj4gCj4gWzFdCj4gaHR0
cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L3Vib290L3BhdGNoLzIwMjEwNjE4MTQ1
NzI0LjI1NTgtMS1wYWxpQGtlcm5lbC5vcmcvCgpUaGF0IFVTQiBkaXNjdXNzaW9uIGlzIGNvbXBs
ZXRlbHkgdW5yZWxhdGVkIHRvIHRoZSBwcm9ibGVtIGhlcmUsIHRoZSBVU0IgCmRpc2N1c3Npb24g
aXMgYWJvdXQgaW50ZXJuYWwgKGkuZS4gbm90IHVzZXIgZmFjaW5nKSBjb252ZXJzaW9uIHRvIERN
L0RULiAKVGhlIHVzZXItZmFjaW5nIEFCSSBkb2VzIG5vdCBjaGFuZ2UgdGhlcmUuIEFsc28sIHRo
YXQgZGlzY3Vzc2lvbiB3YXMgCmFib3V0IHBhdGNoaW5nIFVTQiBzdGFjayB0byBwZXJtaXQgbmV3
IG5vbi1ETS9EVCBvcGVyYXRpb24sIG5vdCBmaXhpbmcgCmV4aXN0aW5nIG9uZS4KClRoaXMgcHJv
YmxlbSBoZXJlIGlzIHVzZXIgZmFjaW5nIEFCSSwgdGhlIG10ZHBhcnRzL210ZGlkcy4gVGhhdCB1
c2VyIApmYWNpbmcgQUJJIGdvdCBicm9rZW4uIEJvYXJkcyB3aGljaCBkbyBkZXBlbmQgb24gaXQs
IGV2ZW4gdGhvc2UgCmN1cnJlbnRseSBpbiB0cmVlLCBhcmUgYnJva2VuLiBOb3QgYWxsIGJvYXJk
cyBjYW4gdXBkYXRlIHRoZWlyIAplbnZpcm9ubWVudCwgc28gc29tZSBiYWNrd2FyZCBjb21wYXRp
YmlsaXR5IG9mIHRoZSB1c2VyIGZhY2luZyBBQkkgCnNob3VsZCBiZSBpbiBwbGFjZSwgZXZlbiB0
aG91Z2ggaXQgbWlnaHQgbm90IGJlIHRvIHRoZSBkZWdyZWUgTGludXggCmtlcm5lbCBkb2VzIHNv
LiBTbyBmYXIsIGl0IHNlZW1zIG1vc3Qgb2YgdGhlIFUtQm9vdCBjb21tYW5kIGxpbmUgCmludGVy
ZmFjZSBoYXMgbWFuYWdlZCB0byByZXRhaW4gYmFja3dhcmQgY29tcGF0aWJpbGl0eSwgSSBkb24n
dCBzZWUgd2h5IAp0aGlzIGhlcmUgc2hvdWxkIGJlIGhhbmRsZWQgYW55IGRpZmZlcmVudGx5LgoK
Tm90ZSB0aGF0IHRoZXJlIGFyZSBub3QganVzdCBhIGZldyBib2FyZHMgdGhhdCBhcmUgYnJva2Vu
LCBidXQgaHVuZHJlZHMuIApJIGJlbGlldmUgdGhhdCBpdHNlbGYganVzdGlmaWVzIGEgZml4LCBp
bnN0ZWFkIG9mIGp1c3QgdGhyb3dpbmcgYWxsIAp0aG9zZSBodW5kcmVkcyBvZiBib2FyZHMgb3Zl
cmJvYXJkLgoKdS1ib290JCBnaXQgZ3JlcCAtbCBDT05GSUdfTVRESURTIGNvbmZpZ3MgfCB3YyAt
bAoyMDMKCkhvcGVmdWxseSB0aGF0IGNsYXJpZmllcyB0aGUgZGlmZmVyZW5jZS4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGlu
ZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3852741508A
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Sep 2021 21:36:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C52CDC5A4CD;
	Wed, 22 Sep 2021 19:36:48 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01F00C5A4CE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 19:36:47 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6F8CE832F4;
 Wed, 22 Sep 2021 21:36:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1632339406;
 bh=px0lStrgB0GBMU8DwgtX7rgSiJMLbF4tk68Im6JAnxc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=PO12BjaG0iGkgxMmzCpKR4C+s1tEIkrlgEYPfcKyxcyzlwYej29fdpnP2WiNQfoTn
 nE4k0gwwJZF3YmWoLlgBWjq1AQcWf3OyV+lbufR/ZMQ+00eqIvIAmadrkBpkcNHPgr
 ssaM9GxS/3q/0uqstSDYXOB2HKKq7miLyu7u+KfUreL7Ec9urcAJZeWn9v6AXfWL8H
 skhdX28V4I+AV5CobfHHzg4ACzPNHHN5De3CWIFyhRBsymns9t/VyjKWAukoUAXphE
 t3ILedlvN5vmlzm5hMS5fKg/mOHEbs9/FXwRFGXTHM1BpmwouMMHhOVsUjWTzIc+kU
 ZRKkhP3bfOU+w==
To: =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>
References: <20210922162909.1857566-1-patrick.delaunay@foss.st.com>
 <20210922192925.723abcba@thinkpad>
 <a38d6126-2d09-34d4-0b08-0d1da94ed415@denx.de>
 <20210922210536.6c9c2f9e@thinkpad>
From: Marek Vasut <marex@denx.de>
Message-ID: <56df80f7-aa1d-3cff-5b29-16fdafcf7bcf@denx.de>
Date: Wed, 22 Sep 2021 21:24:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210922210536.6c9c2f9e@thinkpad>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Tom Rini <trini@konsulko.com>, Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
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

T24gOS8yMi8yMSA5OjA1IFBNLCBNYXJlayBCZWjDum4gd3JvdGU6CgpIaSwKClsuLi5dCgo+Pj4g
SSBmaW5kIHRoaXMgZWl0aGVyIG5vdCBjb21wbGV0ZSBvciBub3QgbmVlZGVkOgo+Pj4KPj4+IC0g
ZWl0aGVyIHlvdSBuZWVkIG10ZCBuYW1lcyB0byBiZSBvZiB0aGlzIGZvcm1hdCBzbyB0aGF0IG9s
ZCBNVERQQVJUUwo+Pj4gICAgIGNvbmZpZyBkZWZpbml0aW9ucyBkbyBub3QgbmVlZCB0byBiZSBj
aGFuZ2VkLCBpLmUuIHNvbWV0aGluZyBsaWtlCj4+PiAgICAgICBDT05GSUdfTVREUEFSVFNfREVG
QVVMVD0ibm9yMDoxTSh1LWJvb3QpLDB4MTAwMEAweGZmZjAwMChlbnYpIgo+Pj4gICAgIGRvZXMg
bm90IHdvcmsgY3VycmVudGx5LCBhbmQgeW91IHdhbnQgdG8gbWFrZSBpdCB3b3JrLgo+Pj4KPj4+
ICAgICBJIGZpbmQgeW91ciBzb2x1dGlvbiBoZXJlIGluY29tcGxldGUgYmVjYXVzZSBNVERQQVJU
UyBjYW4gYWxzbyBiZQo+Pj4gICAgIHVzZWQgdG8gYmUgcGFzc2VkIHRvIExpbnV4IGFzIG10ZHBh
cnRzIHBhcmFtZXRlciwgYnV0IHRoZXJlIGlzIG5vCj4+PiAgICAgZ3VhcmFudGVlIHRoYXQgdGhl
ICJub3JOIiBudW1iZXJpbmcgeW91IGFyZSBjcmVhdGluZyBpbiBVLUJvb3Qgd2lsbAo+Pj4gICAg
IGJlIHRoZSBzYW1lIGFzIHRoZSBvbmUgaW4ga2VybmVsLgo+Pj4KPj4+IC0gb3IgaXQgaXMgbm90
IG5lZWRlZCwgYmVjYXVzZSB5b3UgY2FuIHJlbW92ZSBNVERQQVJUUyBkZWZpbml0aW9uIGZyb20K
Pj4+ICAgICB0aGUgYm9hcmQgY29uZmlnIGVudGlyZWx5IGFuZCBtb3ZlIHRoZSBpbmZvcm1hdGlv
biBpbnRvIGRldmljZSB0cmVlLgo+Pj4gICAgIEluIGZhY3QgdGhpcyB3YXMgdGhlIG1haW4gaWRl
YSBiZWhpbmQgbWFraW5nIHRoZSBzZXJpZXMKPj4+ICAgICAgIFN1cHBvcnQgU1BJIE5PUnMgYW5k
IE9GIHBhcnRpdGlvbnMgaW4gYG10ZCBsaXN0YAo+Pj4gICAgIFRoZSBTUEktTk9SIE1URHMgYWZ0
ZXIgdGhpcyBzZXJpZXMgY2FuIGhhdmUgY29uZmxpY3RpbmcgbmFtZXMsCj4+PiAgICAgYmVjYXVz
ZSB5b3UgY2FuIHN0aWxsIGNob29zZSBiZXR3ZWVuIHRoZW0gdmlhIE9GIHBhdGggd2l0aCB0aGUg
YG10ZGAKPj4+ICAgICBjb21tYW5kLgo+Pj4KPj4+ICAgICBUb20gYW5kIEkgd2VyZSBvZiB0aGUg
b3BpbmlvbiB0aGF0IE1URFBBUlRTIHNob3VsZCBiZSBkZXByZWNhdGVkIGFuZAo+Pj4gICAgIHJl
bW92ZWQgaW4gZmF2b3Igb2YgT0YuIE1hcmVrIFZhc3V0IHNheXMgdGhhdCB0aGlzIGlzIG5vdCBw
b3NzaWJsZQo+Pj4gICAgIGZvciBldmVyeSBib2FyZCwgYW5kIHNvIG5lZWRzIHRvIHN0YXkuCj4+
Pgo+Pj4gQlRXLCBJIGZpbmQgaXQgYSBsaXR0bGUgd2VpcmQgZm9yIE1hcmVrIHRvIGRlZmVuZCBv
bGQgQVBJIHdoaWNoIHNob3VsZAo+Pj4gYmUgY29udmVydGVkIHRvIERULCB3aGVuIGluIGRpc2N1
c3Npb24gYWJvdXQgRE0gVVNCIC8gTm9raWEgTjkwMAo+Pj4gVVNCIFRUWSBjb25zb2xlIFsxXSBo
ZSB3YXMgZGVmZW5kaW5nIHRoZSBvcGluaW9uIHRoYXQgd2Ugc2hvdWxkIGJlCj4+PiBoZWFkaW5n
IHRvIERUIGluIFUtQm9vdC4KPj4+Cj4+PiBbMV0KPj4+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFi
cy5vcmcvcHJvamVjdC91Ym9vdC9wYXRjaC8yMDIxMDYxODE0NTcyNC4yNTU4LTEtcGFsaUBrZXJu
ZWwub3JnLwo+Pgo+PiBUaGF0IFVTQiBkaXNjdXNzaW9uIGlzIGNvbXBsZXRlbHkgdW5yZWxhdGVk
IHRvIHRoZSBwcm9ibGVtIGhlcmUsIHRoZSBVU0IKPj4gZGlzY3Vzc2lvbiBpcyBhYm91dCBpbnRl
cm5hbCAoaS5lLiBub3QgdXNlciBmYWNpbmcpIGNvbnZlcnNpb24gdG8gRE0vRFQuCj4+IFRoZSB1
c2VyLWZhY2luZyBBQkkgZG9lcyBub3QgY2hhbmdlIHRoZXJlLiBBbHNvLCB0aGF0IGRpc2N1c3Np
b24gd2FzCj4+IGFib3V0IHBhdGNoaW5nIFVTQiBzdGFjayB0byBwZXJtaXQgbmV3IG5vbi1ETS9E
VCBvcGVyYXRpb24sIG5vdCBmaXhpbmcKPj4gZXhpc3Rpbmcgb25lLgo+IAo+IFRoaXMgaXMgbm90
IG9ubHkgYWJvdXQgdGhlIHVzZXIgQUJJIChhbHRvdWdoIG5vdyBJIGFncmVlIHRoYXQgeW91IGFy
ZQo+IGNvcnJlY3QgdGhlcmUsIHNlZSBiZWxvdykuIFdoYXQgSSBtZWFudCBpcyB0aGlzOgo+ICAg
IFNob3VsZCB3ZSBwdXNoIGZvciBjb252ZXJ0aW5nIHRvIGRldmljZS10cmVlIGV2ZW4gaWYgZm9y
IHNvbWUgYm9hcmRzCj4gICAgaXQgaXMgbm90IHBvc3NpYmxlLCBhbmQgd291bGQgbWVhbiByZW1v
dmluZyB0aGVtPwoKVGhlIE45MDAgY291bGQgaG93ZXZlciBiZSBjb252ZXJ0ZWQgdG8gRFQgYXMg
ZmFyIGFzIEkgY2FuIHRlbGwsIHRoZXJlIAp3YXMgYSBzb2x1dGlvbiB3aGljaCBkaWRuJ3QgZW5k
IHVwIHBhdGNoaW5nIHRoZSBVU0IgY29yZSB3aXRoIGxlZ2FjeSBzdHVmZi4KCj4gICAgQmVjYXVz
ZSB5b3UgYXJlIHNheWluZyB0aGF0IE1URFBBUlRTIGNhbm5vdCBiZSBjb252ZXJ0ZWQgdG8gRFQg
Zm9yCj4gICAgc29tZSBib2FyZHMuCj4gCj4gICAgQnV0IE45MDAgYWxzbyBjYW5ub3QgYmUgcmVh
c29uYWJseSBjb252ZXJ0ZWQgYmVjYXVzZSBvZiBzcGFjZQo+ICAgIGlzc3VlcywgYXMgZmFyIGFz
IEkgdW5kZXJzdG9vZC4gWWVzLCBpdCBoYXMgZ2lnYWJ5dGVzIG9mIGVNTUMgc3RvcmFnZSwKPiAg
ICBhbmQgaXQgd2FzIHByb3Bvc2VkIHRvIHB1dCBTUEwgaW4gTVREIGFuZCBVLUJvb3QgcHJvcGVy
IGludG8gZU1NQyBvbgo+ICAgIFZGQVQvZXh0NCwgYnV0IHRoaXMgc2ltcGx5IGNhbm5vdCBiZSBk
b25lIHJlYXNvbmFibHksIGJlY2F1c2U6Cj4gICAgLSBpdCB3b3VsZCBicmVhayBMaW51eCB1c2Vy
c3BhY2UgKGV4aXN0aW5nIE9TIHVwZ3JhZGUgc3lzdGVtIHdvdWxkCj4gICAgICBoYXZlIHRvIGJl
IHJld3JpdHRlbiBhbmQgYmFja3dvcmRzIGNvbXBhdGliaWxpdHkgd291bGQgYmUgYnJva2VuKQoK
Tm90IHJlYWxseSwgdGhlcmUgd2FzIGFsc28gdGhlIHN1Z2dlc3Rpb24gdG8gdXNlIGZhbGNvbiBi
b290IGFuZCBoYXZlIApTUEwgYm9vdCBMaW51eCBkaXJlY3RseSAoaS5lLiB1c2UgU1BMIGluc3Rl
YWQgb2YgVS1Cb290KSwgd2hpbGUgb25seSBwdXQgClUtQm9vdCBpbnRvIGVNTUMgYW5kIGJvb3Qg
aXQgaWYgbmVlZGVkIGFuZC9vciBhcyBhIGZhbGxiYWNrLgoKVGhhdCB3YXkgeW91IHdvdWxkbid0
IGJyZWFrIHRoZSBleGlzdGluZyB1cGRhdGVycywgYmVjYXVzZSB5b3UgaW5zdGFsbCAKdGhhdCBT
UEwgaW5zdGVhZCBvZiBjdXJyZW50IFUtQm9vdCwgYW5kIG5ldyBvbmUgY291bGQgYmUgYWRkZWQg
dG8gCmluc3RhbGwgdGhlIGV4dHJhIHUtYm9vdCBiaW5hcnkuIEFuZCB0aGF0IHNvbHZlcyB5b3Vy
IHNwYWNlIGlzc3VlLCAKZm9yZXZlciBubyBsZXNzLgoKPiAgICAtIGl0IHdvdWxkIG1ha2UgYm9v
dHN0cmFwcGluZyAoYm9vdGluZyBuZXdlciB2ZXJzaW9uIG9mIFUtQm9vdCkgd2hpbGUKPiAgICAg
IGRldmVsb3BpbmcgVS1Cb290IGEgcGFpbiBpbiB0aGUgYXNzIG9yIG1heWJlIGV2ZW4gaW1wb3Nz
aWJsZQoKQm9vdGluZyBVLUJvb3QgZnJvbSBVLUJvb3QgaXMgdW5zdXBwb3J0ZWQgYXMgZmFyIGFz
IEkgY2FuIHRlbGwuIEl0IG1heSAKb3IgbWF5IG5vdCB3b3JrLgoKPiAgICAtIEkgYmVsZWl2ZSB0
aGVyZSB3YXMgc29tZSBvdGhlciByZWFzb24gUGFsaSBtZW50aW9uZWQsIGJ1dCBJIGNhbm5vdAo+
ICAgICAgcmVtZW1iZXIgYW55bW9yZQo+IAo+PiBUaGlzIHByb2JsZW0gaGVyZSBpcyB1c2VyIGZh
Y2luZyBBQkksIHRoZSBtdGRwYXJ0cy9tdGRpZHMuIFRoYXQgdXNlcgo+PiBmYWNpbmcgQUJJIGdv
dCBicm9rZW4uIEJvYXJkcyB3aGljaCBkbyBkZXBlbmQgb24gaXQsIGV2ZW4gdGhvc2UKPj4gY3Vy
cmVudGx5IGluIHRyZWUsIGFyZSBicm9rZW4uIE5vdCBhbGwgYm9hcmRzIGNhbiB1cGRhdGUgdGhl
aXIKPj4gZW52aXJvbm1lbnQsIHNvIHNvbWUgYmFja3dhcmQgY29tcGF0aWJpbGl0eSBvZiB0aGUg
dXNlciBmYWNpbmcgQUJJCj4+IHNob3VsZCBiZSBpbiBwbGFjZSwgZXZlbiB0aG91Z2ggaXQgbWln
aHQgbm90IGJlIHRvIHRoZSBkZWdyZWUgTGludXgKPj4ga2VybmVsIGRvZXMgc28uIFNvIGZhciwg
aXQgc2VlbXMgbW9zdCBvZiB0aGUgVS1Cb290IGNvbW1hbmQgbGluZQo+PiBpbnRlcmZhY2UgaGFz
IG1hbmFnZWQgdG8gcmV0YWluIGJhY2t3YXJkIGNvbXBhdGliaWxpdHksIEkgZG9uJ3Qgc2VlIHdo
eQo+PiB0aGlzIGhlcmUgc2hvdWxkIGJlIGhhbmRsZWQgYW55IGRpZmZlcmVudGx5Lgo+IAo+IE9L
LCBJIGdldCB0aGF0IHRoZSBpZiBgbXRkIG5vcjBgIHdhcyB3b3JraW5nIGJlZm9yZSwgaXQgc2hv
dWxkIHdvcmsgYWxzbwo+IG5vdy4gQnV0IHRoZSBjb252ZXJzaW9uIGZyb20gTVREUEFSVFMgdG8g
ZGV2aWNlIHRyZWUgY291bGQgYmUgcHJvYmFibHkKPiBkb25lIGZvciBsb3RzIG9mIHRoZXNlLCBz
ZWUgYmVsb3cuCgpCYXNlZCBvbiB0aGUgY29tbWVudCBmcm9tIFRvbSwgSSB0aGluayB3ZSBhcmUg
dGFsa2luZyBhYm91dCB0d28gCmRpZmZlcmVudCB0aGluZ3MgaGVyZS4gSSBhbSBOT1QgdGFsa2lu
ZyBhYm91dCBwYXNzaW5nIG10ZHBhcnRzIHRvIExpbnV4IAphdCBhbGwsIHRoZXJlIHVzaW5nIERU
IGlzIGNsZWFyLgoKSSBhbSB0YWxraW5nIGFib3V0IHVzaW5nIG5vciVkIGluIE1URElEUyBpbiBV
LUJvb3QgVUJJIGNvZGUgdG8gbG9vayB1cCAKZnJvbSB3aGljaCBkZXZpY2UgdG8gYXR0YWNoIFVC
SSBpbiBVLUJvb3QuCgo+PiBOb3RlIHRoYXQgdGhlcmUgYXJlIG5vdCBqdXN0IGEgZmV3IGJvYXJk
cyB0aGF0IGFyZSBicm9rZW4sIGJ1dCBodW5kcmVkcy4KPj4gSSBiZWxpZXZlIHRoYXQgaXRzZWxm
IGp1c3RpZmllcyBhIGZpeCwgaW5zdGVhZCBvZiBqdXN0IHRocm93aW5nIGFsbAo+PiB0aG9zZSBo
dW5kcmVkcyBvZiBib2FyZHMgb3ZlcmJvYXJkLgo+Pgo+PiB1LWJvb3QkIGdpdCBncmVwIC1sIENP
TkZJR19NVERJRFMgY29uZmlncyB8IHdjIC1sCj4+IDIwMwo+IAo+IE9ubHkgOTYgb2YgdGhvc2Ug
YWxzbyBncmVwIHRoZSBzdWJzdHJpbmcgIm5vciIuIEJ1dCBva2F5LCB0aGF0IGlzIHN0aWxsCj4g
YSBsb3QuIFRoZSBxdWVzdGlvbiBpcyBob3cgbWFueSBvZiB0aGVtIGNvdWxkIGJlIHJld3JpdHRl
biB0byBEVDoKPiAKPiAgICBmb3IgY2ZnIGluICQoZ2l0IGdyZXAgLWwgJ0NPTkZJR19NVERJRFMu
Km5vclswLTldJyBjb25maWdzKTsgZG8KPiAgICAgIGZncmVwIENPTkZJR19ERUZBVUxUX0RFVklD
RV9UUkVFICIkY2ZnIgo+ICAgIGRvbmUgfCB3YyAtbAo+IAo+IDkyIG9mIHRob3NlIDk2IGhhdmUg
Q09ORklHX0RFRkFVTFRfREVWSUNFX1RSRUUgZGVmaW5lZC4KPiAKPiBPZiB0aGVzZSwgNjUgY29u
dGFpbiBDT05GSUdfRE1fU1BJX0ZMQVNIPXksIHNvIGF0IGxlYXN0IHRoZXNlIDY1IGNvdWxkCj4g
YmUgY29udmVydGVkLiBPZiB0aGUgcmVzdCAyNywgaG93IG1hbnkgY291bGQgYWxzbyBiZSBjb252
ZXJ0ZWQgdG8gRE0/Cj4gSG93IG1heSB1c2Ugbm9uLURNIGRyaXZlcnM/CgpTZWUgbXkgcmVtYXJr
IGFib3ZlLCBhcmUgd2UgYm90aCB0YWxraW5nIGFib3V0IHRoZSBzYW1lIHRoaW5nIC0tIG10ZCVk
IAp1c2FnZSBpbiBVLUJvb3QgTVREIGNvZGUgdG8gbG9vayB1cCBNVEQgZGV2aWNlIGZvciBVQkkg
aW4gVS1Cb290ID8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vdWJvb3Qtc3RtMzIK

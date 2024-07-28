Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE3993E8E0
	for <lists+uboot-stm32@lfdr.de>; Sun, 28 Jul 2024 20:35:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1987C6DD96;
	Sun, 28 Jul 2024 18:35:38 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C58FC6B460
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Jul 2024 18:35:31 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2B00087705;
 Sun, 28 Jul 2024 20:35:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1722191730;
 bh=k1AFgygvFHZ/zHSDrCNFMP54zJy2JPbF+8/VUQ/Extc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=E95E+AaqxU/+atfpQ090+6A6zZEY9c7cUP0yJ765Tj/3Y1t2sVixWaHp7jtSUSLtE
 PNMThkHyC9YT1IxZykQaWfPrngHvGza+S44PItDnFxuLxw1QW7jpNOPFH9sePYHQMA
 1kViKesylQXdVH3t6O0ZyS9z3e8DwtvzfYeMVfVBpLdNXpwxyemBN52P/azSGKkVNV
 sEYB6qkPtgS07GWXqOfTdPcfHkR2HGbqwWkl/CLxhDkCcIESE/+7F3J67ThDxtsLKc
 IExQ5Uyw4HWlhefPjHsVtkcihmDCJvIIJlSIg4CzPc21qOg6M+ptopvexRsQbQl3+h
 hJk6K2pRnUvnQ==
Message-ID: <0910419d-e8ab-4bf9-a083-dc2783afaca1@denx.de>
Date: Sun, 28 Jul 2024 20:35:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Svyatoslav Ryhel <clamor95@gmail.com>
References: <20240626235717.272219-1-marex@denx.de>
 <a73dffe5-87e3-4e96-965f-9d029f2af8ed@denx.de>
 <CAPVz0n0C6TPdBRUEvJmgAUGAKoetuzr1j=0cMXweP2EqMTwn=g@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAPVz0n0C6TPdBRUEvJmgAUGAKoetuzr1j=0cMXweP2EqMTwn=g@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Quentin Schulz <quentin.schulz@cherry.de>, Sam Day <me@samcday.com>,
 Kever Yang <kever.yang@rock-chips.com>, u-boot@lists.denx.de,
 Max Krummenacher <max.krummenacher@toradex.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Dragan Simic <dsimic@manjaro.org>,
 Tom Rini <trini@konsulko.com>, u-boot-qcom@groups.io,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Kostya Porotchkin <kostap@marvell.com>,
 Ben Wolsieffer <benwolsieffer@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Jonas Karlman <jonas@kwiboo.se>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Chris Morgan <macromorgan@hotmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, u-boot@dh-electronics.com,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Simon Glass <sjg@chromium.org>,
 Sumit Garg <sumit.garg@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 1/4] power: regulator: Trigger probe of
 regulators which are always-on or boot-on
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

T24gNy8yOC8yNCA3OjU1IFBNLCBTdnlhdG9zbGF2IFJ5aGVsIHdyb3RlOgo+INC90LQsIDI4INC7
0LjQvy4gMjAyNOKAr9GALiDQviAxOTozOCBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4g0L/Q
uNGI0LU6Cj4+Cj4+IE9uIDYvMjcvMjQgMTo1NSBBTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+PiBJ
biBjYXNlIGEgcmVndWxhdG9yIERUIG5vZGUgY29udGFpbnMgcmVndWxhdG9yLWFsd2F5cy1vbiBv
ciByZWd1bGF0b3ItYm9vdC1vbgo+Pj4gcHJvcGVydHksIG1ha2Ugc3VyZSB0aGUgcmVndWxhdG9y
IGdldHMgY29ycmVjdGx5IGNvbmZpZ3VyZWQgYnkgVS1Cb290IG9uIHN0YXJ0Cj4+PiB1cC4gVW5j
b25kaXRpb25hbGx5IHByb2JlIHN1Y2ggcmVndWxhdG9yIGRyaXZlcnMuIFRoaXMgaXMgYSBwcmVw
YXJhdG9yeSBwYXRjaAo+Pj4gZm9yIGludHJvZHVjdGlvbiBvZiAucmVndWxhdG9yX3Bvc3RfcHJv
YmUoKSB3aGljaCB3b3VsZCB0cmlnZ2VyIHRoZSByZWd1bGF0b3IKPj4+IGNvbmZpZ3VyYXRpb24u
Cj4+Pgo+Pj4gUGFyc2luZyBvZiByZWd1bGF0b3ItYWx3YXlzLW9uIGFuZCByZWd1bGF0b3ItYm9v
dC1vbiBEVCBwcm9wZXJ0eSBoYXMgYmVlbgo+Pj4gbW92ZWQgdG8gcmVndWxhdG9yX3Bvc3RfYmlu
ZCgpIGFzIHRoZSBpbmZvcm1hdGlvbiBpcyByZXF1aXJlZCBlYXJseSwgdGhlCj4+PiByZXN0IG9m
IHRoZSBEVCBwYXJzaW5nIGhhcyBiZWVuIGtlcHQgaW4gcmVndWxhdG9yX3ByZV9wcm9iZSgpIHRv
IGF2b2lkCj4+PiBzbG93aW5nIGRvd24gdGhlIGJvb3QgcHJvY2Vzcy4KPj4KPj4gSXMgdGhlcmUg
YW55dGhpbmcgYmxvY2tpbmcgdGhpcyBzZXJpZXMgZnJvbSBiZWluZyBhcHBsaWVkID8KPiAKPiBU
aGlzIHBhdGNoc2V0IGNhdXNlcyBQTUlDIHJlZ3VsYXRvcnMgcHJvYmUgdG9vIGVhcmx5IHdoaWNo
IHJlc3VsdHMgaW4KPiBpMmMgbGluZSBzZXR1cCBmYWlsdXJlLiBUaGVzZSBwYXRjaGVzIE1VU1Qg
Tk9UIGJlIGFwcGxpZWQgaW4gdGhpcyBmb3JtCj4gc2luY2UgdGhleSB3aWxsIGJyZWFrIGF0IGxl
YXN0IDE1IFRlZ3JhIDMgZGV2aWNlcyB3aGljaCB1c2UgRE0gUE1JQywKPiBtYXliZSBtb3JlLgoK
VGhhbmsgeW91IGZvciB0ZXN0aW5nLiBJIGRvIG5vdCBoYXZlIGFueSB0ZWdyYSAzIGRldmljZXMs
IGJ1dCB0aGlzIApwYXRjaHNldCBkb2VzIG5vdCBkbyBhbnl0aGluZyB3aXRoIHBpbm11eGluZy4g
SWYgYSByZWd1bGF0b3IgaXMgcHJvYmVkLCAKYWxsIG9mIGl0cyBkZXBlbmRlbmNpZXMgKGkyYyBi
dXMsIHBpbm11eCBjb25maWd1cmF0aW9uLCBldGMuKSBzaG91bGQgYmUgCnByb2JlZCBhcyB3ZWxs
LiBDYW4geW91IGhhdmUgYSBsb29rIGF0IHdoYXQgdGhlIHByb2JsZW0gd2l0aCBwaW5tdXhpbmcg
CmlzIG9uIHRlZ3JhIDM/IEl0IHNlZW1zIGl0IG1pZ2h0IGJlIHVucmVsYXRlZCB0byB0aGlzIHBh
dGNoc2V0IGFuZCB3b3VsZCAKZXZlbnR1YWxseSBzaG93IHVwIGVsc2V3aGVyZT8KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGlu
ZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B3B9860D1
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Sep 2024 16:34:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5E16C78006;
	Wed, 25 Sep 2024 14:34:29 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3963C6C841
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 14:34:21 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5B38A86E61;
 Wed, 25 Sep 2024 16:34:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727274856;
 bh=mDA8nYm085iMQg82Ruu/WNYO/8JmotOYpZYNOBeNcdQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Tui23UPtVgOIxEEO6PgYEFsJsB4rGyLsqDAhkI6BYrS7UgO+ykKq06A0yD4HGetIJ
 DJKGZ0L8h1ByKg/Esr/jxg6ZSvdqFD1Xif1vs4669HfwafHDGu3f1RRPc5f82vVy8t
 XXzl/0Kb3AZEX2LNBUlB3civOIaW5aD0Hkzir0x1d4gmV03nnph51wDE4ZAvGGYsve
 +ZRu2T8B5muZbACDw2wSi13IgI3v7zOP3i7qBxrg659Un8Rc4Dd2MZdcQpPynTeXW6
 kH9M8qwaaL1wwNTxCp/CoK+wb61ldOVSiLyNvgPcfBLjZUr/sLE0XZE6N9j/bGxarX
 YD+/CcaQ2fFuw==
Message-ID: <3ed23dbc-588c-439b-b018-489aafb8ec25@denx.de>
Date: Wed, 25 Sep 2024 16:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Svyatoslav Ryhel <clamor95@gmail.com>
References: <20240626235717.272219-1-marex@denx.de>
 <CAFLszTjwbWdKqs_UBqXvr2F2ahoGd0-BFE-XLNr3-uq73ZLFHg@mail.gmail.com>
 <6abad4ba-b29a-47a3-addb-91e8f46ee425@denx.de>
 <CAFLszTgAqOXbkcJxYKxM4gn6_oOg7+nyaBK-Y34r_zVaPBScvA@mail.gmail.com>
 <616b231b-0291-4bb3-93d9-85970419ed62@denx.de>
 <CAFLszTiHy7yn0Z18GdkSLgykH0s=z8tJ=-QGf+knXPggKwyk9Q@mail.gmail.com>
 <20240916162758.GE4252@bill-the-cat>
 <CAPVz0n1krz0GxwEXA+FFr1DHVz-c4R4zm++Ji1KhmBTab9m_2g@mail.gmail.com>
 <20240920164856.GI4252@bill-the-cat> <20240924234406.GX4252@bill-the-cat>
 <CAPVz0n09xf42O1X7QBO8nraDV86EEUOdw+S7qZdr327v0gcQ1A@mail.gmail.com>
 <5f2103ff-cc78-46b6-b008-127678c23592@denx.de>
 <CAPVz0n3cH5_1iK+0PSW1mBFKQz13Z0DKJyi6GdsGpPQpvBQ7mg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAPVz0n3cH5_1iK+0PSW1mBFKQz13Z0DKJyi6GdsGpPQpvBQ7mg@mail.gmail.com>
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

T24gOS8yNS8yNCAzOjA0IFBNLCBTdnlhdG9zbGF2IFJ5aGVsIHdyb3RlOgo+INGB0YAsIDI1INCy
0LXRgC4gMjAyNOKAr9GALiDQviAxNTo0OCBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4g0L/Q
uNGI0LU6Cj4+Cj4+IE9uIDkvMjUvMjQgMTI6MTggUE0sIFN2eWF0b3NsYXYgUnloZWwgd3JvdGU6
Cj4+Cj4+IFsuLi5dCj4+Cj4+PiBIZWxsbyB0aGVyZSEKPj4+IEkgd2FzIGRpZ2dpbmcgdGhpcyB3
aGVuIEkgaGFkIHNvbWUgZnJlZSB0aW1lIGFuZCBmb3VuZCB0aGF0IHdpdGgKPj4+IHBhdGNoZXMg
ZnJvbSBNYXJlayB0aGUgb25seSBkaWZmZXJlbmNlIGlzIHRoYXQgZnVuY3Rpb24KPj4+IGkyY19n
ZXRfY2hpcF9mb3JfYnVzbnVtIGlzIG5vdCBjYWxsZWQgZm9yIFBNSUMncyBtYWluIGkyYyBhZGRy
ZXNzCj4+Cj4+IElzIGl0IHBvc3NpYmxlIHRoaXMgaXMgY2FsbGVkIGVhcmxpZXIsIGJlZm9yZSBV
QVJUIG91dHB1dCBpcwo+PiBpbml0aWFsaXplZCwgc28gaXQgZG9lcyBub3Qgc2hvdyB1cCBpbiB0
aGUgbG9nIGJlbG93ID8KPj4KPiBJdCBpcyBoaWdobHkgdW5saWtlbHksIHRoaXMgZnVuY3Rpb24g
aXMgY2FsbGVkIHdoZW4gdWFydCBpcyBhbHJlYWR5Cj4gd29ya2luZyBhbmQgcGlubXV4IGlzIHNl
dC4KCkl0IGNvdWxkIGJlIGNhbGxlZCBlYXJsaWVyIG5vdywgdHJ5IHRvIGVuYWJsZSBDT05GSUdf
Qk9PVFNUQUdFIGFuZCBhZGQgCkJPT1RTVEFHRV9NQVJLRVIoKSB0byBwb2ludHMgb2YgaW50ZXJl
c3QgKGxpa2UgdGhlIEkyQyBmdW5jdGlvbnMpLiBZb3UgCnNob3VsZCBiZSBhYmxlIHRvIHNlZSB3
aGV0aGVyIHRoYXQgZnVuY3Rpb24gd2FzIGNhbGxlZCBpbiAnYm9vdHN0YWdlJyAKY29tbWFuZCBv
dXRwdXQsIGV2ZW4gaWYgVUFSVCB3YXNuJ3QgYWN0aXZlIGF0IHRoYXQgcG9pbnQgeWV0LgoKPj4g
Q291bGQgaXQgYmUgdGhhdCBpdCBpcyBjYWxsZWQgYmVmb3JlIHlvdXIgcGlubXV4IGlzIHByb3Bl
cmx5Cj4+IGluaXRpYWxpemVkLCBoZW5jZSBubyBVQVJULCBhbmQgdGhhdCBpcyB3aHkgdGhlIEky
QyBjb21tdW5pY2F0aW9uIGZhaWxzPwo+Pgo+IEJ1dCBpZiB3ZSBhc3N1bWUgdGhhdCBwaW5tdXgg
aXMgbm90IHNldCwgdGhlbiBob3cgd2UgcmVzb2x2ZSBzaXR1YXRpb24KPiB3aGVuIHBpbm11eCBh
bmQgcmVndWxhdG9yIGVuYWJsZSBhcmUgYm90aCBzZXQgYnkgcHJvYmUgYWZ0ZXIgYmluZCBhbmQK
PiByZWd1bGF0b3JzIGFyZSBwcm9iZWQgYmVmb3JlIHBpbm11eC4gUmVndWxhdG9ycyB3aWxsIGZh
aWwsIHRoZXkgd2lsbAo+IG5vdCBkZWZmZXIgdGlsbCBwaW5tdXggcHJvYmVzLiBPciB5b3UgcHJv
cG9zZSByZXR1cm4gdG8gcHJlLURNIHZlcnNpb24KPiBvZiBwaW5tdXg/IEluY29uc2lzdGVuY3ku
CgpJIGFtIG5vdCBnb2luZyB0byBndWVzcyB3aGF0IHRoZSBwcm9ibGVtIGlzLCBjdXJyZW50bHkg
aXQgaXMgdW5jbGVhci4gCk9uY2Ugd2Uga25vdyB3aGF0IHRoZSBwcm9ibGVtIGlzLCB3ZSBjYW4g
ZGV0ZXJtaW5lIHRoZSBiZXN0IHNvbHV0aW9uLgoKPj4gU28gZmFyLCBJIG9ubHkgZm91bmQgVG9y
YWRleCBUZWdyYSBUMjAgYm9hcmQgaGVyZSwgbm8gVDMwLgo+IFdoYXQgZG8geW91IG1lYW4/IFNw
ZWNpZnkgcGxlYXNlCgpJIGhhdmUgVG9yYWRleCBUZWdyYSBUMjAgU29NIGFuZCBib2FyZCBoZXJl
LCBwcm9iYWJseSBub3QgdXNlZnVsLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

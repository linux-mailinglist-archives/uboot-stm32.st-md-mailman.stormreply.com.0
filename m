Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 888BF97D874
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 Sep 2024 18:40:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 384C8C6C841;
	Fri, 20 Sep 2024 16:40:56 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81D64CFAC50
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Sep 2024 16:40:48 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-378c16a4d3eso2301131f8f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Sep 2024 09:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726850448; x=1727455248;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YjTpfrqYfPm0t81VoMBFCfW8GHAniRCwt4aYaCwgPC0=;
 b=CGAzvbpFufuLU/44qHCl4sv2Tu0vbBD+Cs9hMCGraPh0xGXyxrPjc7xZS6Ot3pkrAI
 KxN6YIN3pclov2s/YOVRQlaiL0Q6dIcIlEesO1hm+c+qv3zUGJbQhvpzhO7WF49NPZlS
 PRyVnbMIUma0SLBp8Fgn6lXN9S3LpNKV3tZfOTXrUSS5LCcDdxAZEh54ykYWFmmrp8ol
 6yTUiGpVhojkuDCj2zIlCobMbI63Ypfrz6wzhH3crMmxPH+9jmf642A0CQ3Dm2yYZ1dE
 RMIKJ9XaX1AR/xOyIjvQSaf3BtKKVqABqFacNxoZUbDBW1NWwygUoo/RlyOfP13MSvT2
 1dqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726850448; x=1727455248;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YjTpfrqYfPm0t81VoMBFCfW8GHAniRCwt4aYaCwgPC0=;
 b=T4ItluUYlPHvZel18NBisiFLuoIp2CThRcRV7HsDoFjxmv3JGne97uQqVAubDHktZb
 uVahSGXKA0rqpcxFaVCMvQwabbHK+wCZK6lxAuixwKpLHJKAqR9fIX/UVTeagYTCPYlv
 H32oirYDPxWvp4eQSlGDTmVdf30LnKL/6Zv+DuOc1aNvAeK6ZuzVALP3DLu9TsHda2e5
 iKvVF9l7OTkpjgQSF1Huhj4JxNw6yLUE6dSV/d/8IbsJwRGO8QgZzg3YR50ZnLSff3X/
 vlWeUUmCTt6ZGJmFNRQ59Eirq6qDAeU8P3Cx7lV/A90ZkTJLWYkFlBuGnWVdWulpDNvB
 v6bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPEhvuOJ3pnVBx1Ay0uPetY5CPTYHPXVduXCKOk+FoDzpLjzubYQbFDgFRXGk87PYtf4ngzCGgKOvBFw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwYXuP4bNep2HNVS2TpYUy51dxgzjghx4dd6RCQXWXp7EmJZBqs
 iMHC3+0QgquD3A1fCzXkSVtOepudClLW8Uwh6zdZl1G2Dhf7Js2k7u0NYfD4Lfj6kDEcIOPX5SZ
 QoyEuHq3nidkxrDu9tLxOJbY6/jQ=
X-Google-Smtp-Source: AGHT+IEsEXZntFy6xgwz/q/9vWCl6qOIitTPjYnk/mQkYzrjqD/JcYbc9Z6FOTI2qB1SHx8XX2O8rsySf8miAdxoDSs=
X-Received: by 2002:a05:6000:d8b:b0:374:c3e4:d6b1 with SMTP id
 ffacd0b85a97d-37a42367ed1mr2708320f8f.44.1726850447713; Fri, 20 Sep 2024
 09:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240626235717.272219-1-marex@denx.de>
 <CAFLszTjwbWdKqs_UBqXvr2F2ahoGd0-BFE-XLNr3-uq73ZLFHg@mail.gmail.com>
 <6abad4ba-b29a-47a3-addb-91e8f46ee425@denx.de>
 <CAFLszTgAqOXbkcJxYKxM4gn6_oOg7+nyaBK-Y34r_zVaPBScvA@mail.gmail.com>
 <616b231b-0291-4bb3-93d9-85970419ed62@denx.de>
 <CAFLszTiHy7yn0Z18GdkSLgykH0s=z8tJ=-QGf+knXPggKwyk9Q@mail.gmail.com>
 <20240916162758.GE4252@bill-the-cat>
In-Reply-To: <20240916162758.GE4252@bill-the-cat>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 20 Sep 2024 19:40:35 +0300
Message-ID: <CAPVz0n1krz0GxwEXA+FFr1DHVz-c4R4zm++Ji1KhmBTab9m_2g@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>, Marek Vasut <marex@denx.de>,
 Simon Glass <sjg@chromium.org>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, Sam Day <me@samcday.com>,
 Kever Yang <kever.yang@rock-chips.com>, u-boot@lists.denx.de,
 Max Krummenacher <max.krummenacher@toradex.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Dragan Simic <dsimic@manjaro.org>,
 u-boot-qcom@groups.io, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 u-boot-amlogic@groups.io, Jaehoon Chung <jh80.chung@samsung.com>,
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

0L/QvSwgMTYg0LLQtdGALiAyMDI04oCv0YAuINC+IDE5OjI4IFRvbSBSaW5pIDx0cmluaUBrb25z
dWxrby5jb20+INC/0LjRiNC1Ogo+Cj4gT24gV2VkLCBTZXAgMTEsIDIwMjQgYXQgMDc6MDA6NTZQ
TSAtMDYwMCwgU2ltb24gR2xhc3Mgd3JvdGU6Cj4gPiBIaSBNYXJlaywKPiA+Cj4gPiBPbiBGcmks
IDI4IEp1biAyMDI0IGF0IDA3OjI2LCBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4gd3JvdGU6
Cj4gPiA+Cj4gPiA+IE9uIDYvMjgvMjQgOTozMiBBTSwgU2ltb24gR2xhc3Mgd3JvdGU6Cj4gPiA+
ID4gSGkgTWFyZWssCj4gPiA+Cj4gPiA+IEhpLAo+ID4gPgo+ID4gPiBbLi4uXQo+ID4gPgo+ID4g
PiA+Pj4+IEBAIC00NzMsOCArNDgzLDYgQEAgc3RhdGljIGludCByZWd1bGF0b3JfcHJlX3Byb2Jl
KHN0cnVjdCB1ZGV2aWNlICpkZXYpCj4gPiA+ID4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtRU5PREFUQSk7Cj4gPiA+ID4+Pj4gICAgICAgICAg
IHVjX3BkYXRhLT5tYXhfdUEgPSBkZXZfcmVhZF91MzJfZGVmYXVsdChkZXYsICJyZWd1bGF0b3It
bWF4LW1pY3JvYW1wIiwKPiA+ID4gPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC1FTk9EQVRBKTsKPiA+ID4gPj4+PiAtICAgICAgIHVjX3BkYXRh
LT5hbHdheXNfb24gPSBkZXZfcmVhZF9ib29sKGRldiwgInJlZ3VsYXRvci1hbHdheXMtb24iKTsK
PiA+ID4gPj4+PiAtICAgICAgIHVjX3BkYXRhLT5ib290X29uID0gZGV2X3JlYWRfYm9vbChkZXYs
ICJyZWd1bGF0b3ItYm9vdC1vbiIpOwo+ID4gPiA+Pj4+ICAgICAgICAgICB1Y19wZGF0YS0+cmFt
cF9kZWxheSA9IGRldl9yZWFkX3UzMl9kZWZhdWx0KGRldiwgInJlZ3VsYXRvci1yYW1wLWRlbGF5
IiwKPiA+ID4gPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAwKTsKPiA+ID4gPj4+PiAgICAgICAgICAgdWNfcGRhdGEtPmZvcmNlX29mZiA9
IGRldl9yZWFkX2Jvb2woZGV2LCAicmVndWxhdG9yLWZvcmNlLWJvb3Qtb2ZmIik7Cj4gPiA+ID4+
Pj4gLS0KPiA+ID4gPj4+PiAyLjQzLjAKPiA+ID4gPj4+Pgo+ID4gPiA+Pj4KPiA+ID4gPj4+IFRo
aXMgaXMgcmVhZGluZyBhIGxvdCBvZiBEVCBzdHVmZiB2ZXJ5IGVhcmx5LCB3aGljaCBtYXkgYmUg
c2xvdy4gSXQgaXMKPiA+ID4gPj4+IGFsc28gcmVhZGluZyBmcm9tIHRoZSBEVCBpbiB0aGUgYmlu
ZCgpIHN0ZXAgd2hpY2ggd2Ugc29tZXRpbWVzIGhhdmUgdG8KPiA+ID4gPj4+IGRvLCBidXQgdHJ5
IHRvIGF2b2lkLgo+ID4gPiA+Pgo+ID4gPiA+PiBBY3R1YWxseSwgaXQgaXMgcmVhZGluZyBvbmx5
IHRoZSBiYXJlIG1pbmltdW0gdmVyeSBlYXJseSBpbiBiaW5kLCB0aGUKPiA+ID4gPj4gYWx3YXlz
LW9uIGFuZCBib290LW9uLCB0aGUgcmVzdCBpcyBpbiBwcmVfcHJvYmUsIGkuZS4gbGF0ZXIuCj4g
PiA+ID4KPiA+ID4gPiBZZXMsIEkgc2VlIHRoYXQuIEFsc28gaXQgaXMgaW5ldml0YWJsZSB0aGF0
IHRoZXNlIHByb3BlcnRpZXMgbmVlZCB0bwo+ID4gPiA+IGJlIHJlYWQgYmVmb3JlIHByb2JlKCks
IHNpbmNlIHRoZXkgY29udHJvbCB3aGV0aGVyIHRvIHByb2JlKCkuCj4gPiA+ID4KPiA+ID4gPj4K
PiA+ID4gPj4+IEFsc28gdGhpcyBzZWVtcyB0byBoYXBwZW4gaW4gU1BMIGFuZCBhZ2FpbiBwcmUt
cmVsb2MgYW5kIGFnYWluIGluCj4gPiA+ID4+PiBVLUJvb3QgcG9zdC1yZWxvYz8KPiA+ID4gPj4K
PiA+ID4gPj4gV2hhdCBkb2VzLCB0aGUgdWNsYXNzIHBvc3RfYmluZCA/Cj4gPiA+ID4KPiA+ID4g
PiBJIG1lYW4gdGhhdCB0aGlzIGNvZGUgd2lsbCBiZSBjYWxsZWQgaW4gU1BMIChpZiB0aGUgcmVn
dWxhdG9ycyBhcmUgaW4KPiA+ID4gPiB0aGUgRFQgdGhlcmUpLCBVLUJvb3QgcHJlLXJlbG9jIGFu
ZCBwb3N0LXJlbG9jLCBlYWNoIHRpbWUgdHVybmluZyBvbgo+ID4gPiA+IHRoZSByZWd1bGF0b3Jz
LiBXZSBuZWVkIGEgd2F5IHRvIGNvbnRyb2wgdGhhdCwgZG9uJ3Qgd2U/Cj4gPiA+Cj4gPiA+IEkg
d291bGQgYXNzdW1lIHRoYXQgaWYgdGhvc2UgcmVndWxhdG9ycyBhcmUgdHVybmVkIG9uIG9uY2Ug
aW4gdGhlCj4gPiA+IGVhcmxpZXN0IHN0YWdlICwgdHVybmluZyB0aGVtIG9uIGFnYWluIGluIHRo
ZSBmb2xsb3cgdXAgc3RhZ2Ugd291bGQgYmUgYQo+ID4gPiBub29wID8gVGhpcyBpcyB0aGUgcG9p
bnQgb2YgcmVndWxhdG9yLSotb24sIHRvIGtlZXAgdGhlIHJlZ3VsYXRvcnMgb24uCj4gPgo+ID4g
Tm8sIHRoZXJlIGlzIHNvbWV0aW1lcyBhIHBhcnRpY3VsYXIgc2VxdWVuY2UgbmVlZGVkLgo+ID4K
PiA+ID4KPiA+ID4gPj4+IFNob3VsZCB3ZSBoYXZlIGEgc3RlcCBpbiB0aGUgaW5pdCBzZXF1ZW5j
ZSB3aGVyZSB3ZSBzZXQgdXAgdGhlCj4gPiA+ID4+PiByZWd1bGF0b3JzLCBieSBjYWxsaW5nIHJl
Z3VsYXRvcnNfZW5hYmxlX2Jvb3Rfb24oKSA/Cj4gPiA+ID4+Cj4gPiA+ID4+IExldCdzIG5vdCBk
byB0aGlzICwgdGhlIGVudGlyZSBwb2ludCBvZiB0aGlzIHNlcmllcyBpcyB0byBnZXQgcmlkIG9m
Cj4gPiA+ID4+IHRob3NlIGZ1bmN0aW9ucyBhbmQgZG8gdGhlIHJlZ3VsYXRvciBjb25maWd1cmF0
aW9uIHRoZSBzYW1lIHdheSBMRUQKPiA+ID4gPj4gc3Vic3lzdGVtIGRvZXMgaXQgLS0gYnkgcHJv
YmluZyBhbHdheXMtb24vYm9vdC1vbiByZWd1bGF0b3JzIGFuZAo+ID4gPiA+PiBjb25maWd1cmlu
ZyB0aGVtIGNvcnJlY3RseSBvbiBwcm9iZS4KPiA+ID4gPj4KPiA+ID4gPj4gVG8gbWUgcmVndWxh
dG9yc19lbmFibGVfYm9vdF9vbigpIGFuZCB0aGUgbGlrZSB3YXMgYWx3YXlzIGFuCj4gPiA+ID4+
IGluY29uc2lzdGVudGx5IGFwcGxpZWQgd29ya2Fyb3VuZCBmb3IgbWlzc2luZyBETV9GTEFHX1BS
T0JFX0FGVEVSX0JJTkQgLAo+ID4gPiA+PiB3aGljaCBpcyBub3cgaW1wbGVtZW50ZWQsIHNvIHN1
Y2ggd29ya2Fyb3VuZHMgY2FuIGJlIHJlbW92ZWQuCj4gPiA+ID4KPiA+ID4gPiBUaGF0IHBhdGNo
IHNlZW1lZCB0byBzbGlwIHVuZGVyIHRoZSByYWRhciwgc2VudCBhbmQgYXBwbGllZCBvbiB0aGUK
PiA+ID4gPiBzYW1lIGRheSEgV2UgcmVhbGx5IG5lZWQgdG8gYWRkIGEgdGVzdCBmb3IgaXQsIEJU
Vy4KPiA+ID4KPiA+ID4gV2hpY2ggcGF0Y2ggPyBNeSByZWNvbGxlY3Rpb24gb2YgRE1fRkxBR19Q
Uk9CRV9BRlRFUl9CSU5EIHdhcyB0aGF0IGl0Cj4gPiA+IHRvb2sgYSB3aGlsZSB0byBnZXQgaW4u
Cj4gPgo+ID4gWzFdCj4gPgo+ID4gPgo+ID4gPiA+IE15IGNvbmNlcm4gaXMgdGhhdCB0aGlzIG1p
Z2h0IGNhdXNlIHVzIG9yZGVyaW5nIHByb2JsZW1zLiBXZSBwZXJoYXBzCj4gPiA+ID4gd2FudCB0
aGUgcmVndWxhdG9ycyB0byBiZSBkb25lIGZpcnN0LiBJZiBkcml2ZXJzIGFyZSBwcm9iZWQgd2hp
Y2ggdXNlCj4gPiA+ID4gcmVndWxhdG9ycywgdGhlbiBwcmVzdW1hYmx5IHRoZXkgd2lsbCBlbmFi
bGUgdGhlbS4gQ29uc2lkZXIgdGhpczoKPiA+ID4gPgo+ID4gPiA+IC0gTEVEIGRyaXZlciBhdXRv
LXByb2Jlcwo+ID4gPiA+ICAgICAtIHByb2JlcyBJMkMgYnVzIDIKPiA+ID4gPiAgICAgLSBwcm9i
ZXMgTERPMSB3aGljaCBpcyBhdXRvc2V0IHNvIHR1cm5zIG9uCj4gPiA+ID4gLSBMRE8xIHByb2Jl
cywgYnV0IGlzIGFscmVhZHkgcnVubmluZwo+ID4gPiA+IC0gTERPMiBwcm9iZXMsIHdoaWNoIGlz
IGF1dG9zZXQgc28gdHVybnMgb24KPiA+ID4gPgo+ID4gPiA+IFNvIGxvbmcgYXMgaXQgaXMgT0sg
dG8gZW5hYmxlIHRoZSByZWd1bGF0b3JzIGluIGFueSBvcmRlciwgdGhlbiB0aGlzCj4gPiA+ID4g
c2VlbXMgZmluZS4gQnV0IGlzIGl0PyBIb3cgZG8gd2UgaGFuZGxlIHRoZSBjYXNlIHdoZXJlIGFy
ZSBwYXJ0aWN1bGFyCj4gPiA+ID4gc2VxdWVuY2UgaXMgbmVlZGVkPwo+ID4gPgo+ID4gPiBEaWQg
d2UgZmluYWxseSBhcnJpdmUgYXQgdGhlIHBvaW50IHdoZXJlIHdlIG5lZWQgLUVQUk9CRV9ERUZF
UiBhbGlrZQo+ID4gPiBtZWNoYW5pc20gPwo+ID4KPiA+IE5vcGUuIEJ1dCBJIGFtIGNvbmNlcm5l
ZCB0aGF0IHRoaXMgcGF0Y2ggaXMgbGVhZGluZyB1cyB0aGVyZS4gYmluZCgpCj4gPiByZWFsbHkg
bmVlZHMgdG8gYmUgYXMgY2xlYW4gYXMgcG9zc2libGUuIEl0IGlzIG9uZSBvZiB0aGUgZGVzaWdu
Cj4gPiBlbGVtZW50cyBvZiBkcml2ZXIgbW9kZWwgd2hpY2ggTGludXggc2hvdWxkIGFkb3B0Lgo+
ID4KPiA+IFRoZXJlIGlzIGFsd2F5cyBhIHJhY2UgdG8gYmUgdGhlIGZpcnN0IHRvIGluaXQgc29t
ZXRoaW5nLCBtb3ZlIHRoZQo+ID4gaW5pdCBlYXJsaWVyLCBldGMuLi4gSSBkb24ndCBzZWUgYW55
IGdlbmVyYWwgbmVlZCB0byBpbml0IHRoZQo+ID4gcmVndWxhdG9ycyByaWdodCBhdCB0aGUgc3Rh
cnQuIEl0IHNob3VsZCBiZSBkb25lIGluIGEgc2VwYXJhdGUKPiA+IGZ1bmN0aW9uIGFuZCBiZSBv
cHRpb25hbC4gSSBhbSBoYXBweSB0byBzZW5kIGEgcGF0Y2ggaWYgeW91IGxpa2UuCj4KPiBTaW5j
ZSB3ZSdyZSBjdXJyZW50bHkgc3R1Y2sgb24gdGhlIHBvaW50IHdoZXJlIE1hcmVrIGhhcyBwYXRj
aGVzIHRoYXQKPiBmaXggYSByZWFsIHByb2JsZW0sIGFuZCBTdnlhdG9zbGF2IGhhcyBhIHByb2Js
ZW0gd2l0aCB0aGVtLCBidXQgaXNuJ3QKPiBjdXJyZW50bHkgYWJsZSB0byBkZWJ1ZyBpdCwgeWVz
LCBwbGVhc2UgcHV0IGZvcndhcmQgeW91ciBwYXRjaCB0aGF0Cj4gbWlnaHQgYWRkcmVzcyBib3Ro
IHNldHMgb2YgcHJvYmxlbXMgc28gd2UgY2FuIGFsbCBmaWd1cmUgb3V0IGhvdyB0bwo+IHJlc29s
dmUgdGhlIHByb2JsZW1zLCB0aGFua3MhCj4KPiAtLQo+IFRvbQoKV2l0aCBwYXRjaGVzIGZyb20g
TWFyZWsgdGhlcmUgaXMgbm8gaTJjIGNoaXAgcHJvYmUgb2YgUE1JQywgd2hpbGUKd2l0aG91dCBp
MmMgY2hpcCBwcm9iZSBpcyBjYWxsZWQgKHByb2JlX2NoaXAgZnVuY3Rpb24pLiBIb3cgdGhpcyBp
cwpldmVuIHBvc3NpYmxlPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

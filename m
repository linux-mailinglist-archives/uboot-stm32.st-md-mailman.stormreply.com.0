Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F17D985826
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Sep 2024 13:38:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46EABC78006;
	Wed, 25 Sep 2024 11:38:03 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D1A0C57194
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 11:37:56 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6cb25aad5dfso2752176d6.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 04:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727264275; x=1727869075;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4hFEMNur252euyH5KLeLMgv3HkxBPIqpVpertN5ufXY=;
 b=nMus4Z0J8I3Ne19kafhZok2GZzhLb160KsbuOhmkKFQZYjuG/mnS4HYN2bzbnRwxqT
 mxMyrX8DRQHdWiGkeP9uOTd6GXHtuNcfy4vYZi2wf5fb3fiL6Uw3dROBk3Dm8RiE7PeG
 VbaNt/ZzC7j1xGWJgvRw336Hcfe4IH+kwzC4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727264275; x=1727869075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4hFEMNur252euyH5KLeLMgv3HkxBPIqpVpertN5ufXY=;
 b=OaRu8gdHmhY+ThTD/0WIGoEeEuYyRfZNgOytXqx5jnyjSUhzbRBp/5CmzolEhYl3uk
 ERwepjE6gCMfBgokke+1ToJt1QSLSXX3pE72Pe9KGKzy8weZM1NWgTID2lEkZUpuie7e
 foyIMS9sjRMUBr8GHvbbRQPjtpmgb4dhY2vxSbP2hXsBy+Yz6aJu1Hx4Lew7vtqv/s6S
 kc05myqCnA/Cx5lT+YT9Qogpn4ZiDNIa3LssPYCdrlI7Jxmp72t+FPi+/Yl5ryiJmwbj
 sdBtl+fCyf/AVS/kDKhVC7nzHf7bOf5RZrS+nAc0ERAqERPZ2Rb4c/xnZ0tm09Go5w/T
 dVTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPgFkxwgTsYj4z6NnCcrWmJC0vaoEGgJt4OxDU8BudIkcEcbN6cOLX6dsaLTm8R83shCYVVlNc0awHPg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwzEzkj9BDaEX8TK5GVZvST1lpFAt31SUnzb+bXgP/Mt94+DnAE
 oiHyfIrOf5rBTB3K5ewWl2WJ5P03fOx7t7v4EWIQ4eGnQAy2uhzOkIj0FUZ+UUq5qDbakSPk9oe
 sTLN4DFAbomB8M1eN6zvcEK7Pb0sQIZJTPpZl
X-Google-Smtp-Source: AGHT+IERT/uHerpGeNcyKnkhtSSlndfTw9TRWtaxXp1Vi6Estl+jw/DRqoCHoqqtttjfL2aUl8gMKIjZLNh3UHi+3/4=
X-Received: by 2002:a05:6214:54c6:b0:6c5:52c9:950c with SMTP id
 6a1803df08f44-6cb1dd6f0e8mr35811796d6.25.1727264274928; Wed, 25 Sep 2024
 04:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240626235717.272219-1-marex@denx.de>
 <CAFLszTjwbWdKqs_UBqXvr2F2ahoGd0-BFE-XLNr3-uq73ZLFHg@mail.gmail.com>
 <6abad4ba-b29a-47a3-addb-91e8f46ee425@denx.de>
 <CAFLszTgAqOXbkcJxYKxM4gn6_oOg7+nyaBK-Y34r_zVaPBScvA@mail.gmail.com>
 <616b231b-0291-4bb3-93d9-85970419ed62@denx.de>
 <CAFLszTiHy7yn0Z18GdkSLgykH0s=z8tJ=-QGf+knXPggKwyk9Q@mail.gmail.com>
 <20240916162758.GE4252@bill-the-cat>
 <CAPVz0n1krz0GxwEXA+FFr1DHVz-c4R4zm++Ji1KhmBTab9m_2g@mail.gmail.com>
 <20240920164856.GI4252@bill-the-cat>
In-Reply-To: <20240920164856.GI4252@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 25 Sep 2024 13:37:41 +0200
Message-ID: <CAFLszTiAqmYUVhC4K4KXBkzwj_kWQqYSPfSmnu0higN2_9+-Hw@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, Sam Day <me@samcday.com>,
 Kever Yang <kever.yang@rock-chips.com>, u-boot@lists.denx.de,
 Max Krummenacher <max.krummenacher@toradex.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Dragan Simic <dsimic@manjaro.org>,
 Marek Vasut <marex@denx.de>, u-boot-qcom@groups.io,
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
 Svyatoslav Ryhel <clamor95@gmail.com>,
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

SGksCgpPbiBGcmksIDIwIFNlcHQgMjAyNCBhdCAxODo0OSwgVG9tIFJpbmkgPHRyaW5pQGtvbnN1
bGtvLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIFNlcCAyMCwgMjAyNCBhdCAwNzo0MDozNVBNICsw
MzAwLCBTdnlhdG9zbGF2IFJ5aGVsIHdyb3RlOgo+ID4g0L/QvSwgMTYg0LLQtdGALiAyMDI04oCv
0YAuINC+IDE5OjI4IFRvbSBSaW5pIDx0cmluaUBrb25zdWxrby5jb20+INC/0LjRiNC1Ogo+ID4g
Pgo+ID4gPiBPbiBXZWQsIFNlcCAxMSwgMjAyNCBhdCAwNzowMDo1NlBNIC0wNjAwLCBTaW1vbiBH
bGFzcyB3cm90ZToKPiA+ID4gPiBIaSBNYXJlaywKPiA+ID4gPgo+ID4gPiA+IE9uIEZyaSwgMjgg
SnVuIDIwMjQgYXQgMDc6MjYsIE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPiB3cm90ZToKPiA+
ID4gPiA+Cj4gPiA+ID4gPiBPbiA2LzI4LzI0IDk6MzIgQU0sIFNpbW9uIEdsYXNzIHdyb3RlOgo+
ID4gPiA+ID4gPiBIaSBNYXJlaywKPiA+ID4gPiA+Cj4gPiA+ID4gPiBIaSwKPiA+ID4gPiA+Cj4g
PiA+ID4gPiBbLi4uXQo+ID4gPiA+ID4KPiA+ID4gPiA+ID4+Pj4gQEAgLTQ3Myw4ICs0ODMsNiBA
QCBzdGF0aWMgaW50IHJlZ3VsYXRvcl9wcmVfcHJvYmUoc3RydWN0IHVkZXZpY2UgKmRldikKPiA+
ID4gPiA+ID4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtRU5PREFUQSk7Cj4gPiA+ID4gPiA+Pj4+ICAgICAgICAgICB1Y19wZGF0YS0+bWF4X3VB
ID0gZGV2X3JlYWRfdTMyX2RlZmF1bHQoZGV2LCAicmVndWxhdG9yLW1heC1taWNyb2FtcCIsCj4g
PiA+ID4gPiA+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLUVOT0RBVEEpOwo+ID4gPiA+ID4gPj4+PiAtICAgICAgIHVjX3BkYXRhLT5hbHdheXNf
b24gPSBkZXZfcmVhZF9ib29sKGRldiwgInJlZ3VsYXRvci1hbHdheXMtb24iKTsKPiA+ID4gPiA+
ID4+Pj4gLSAgICAgICB1Y19wZGF0YS0+Ym9vdF9vbiA9IGRldl9yZWFkX2Jvb2woZGV2LCAicmVn
dWxhdG9yLWJvb3Qtb24iKTsKPiA+ID4gPiA+ID4+Pj4gICAgICAgICAgIHVjX3BkYXRhLT5yYW1w
X2RlbGF5ID0gZGV2X3JlYWRfdTMyX2RlZmF1bHQoZGV2LCAicmVndWxhdG9yLXJhbXAtZGVsYXki
LAo+ID4gPiA+ID4gPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAwKTsKPiA+ID4gPiA+ID4+Pj4gICAgICAgICAgIHVjX3BkYXRhLT5mb3Jj
ZV9vZmYgPSBkZXZfcmVhZF9ib29sKGRldiwgInJlZ3VsYXRvci1mb3JjZS1ib290LW9mZiIpOwo+
ID4gPiA+ID4gPj4+PiAtLQo+ID4gPiA+ID4gPj4+PiAyLjQzLjAKPiA+ID4gPiA+ID4+Pj4KPiA+
ID4gPiA+ID4+Pgo+ID4gPiA+ID4gPj4+IFRoaXMgaXMgcmVhZGluZyBhIGxvdCBvZiBEVCBzdHVm
ZiB2ZXJ5IGVhcmx5LCB3aGljaCBtYXkgYmUgc2xvdy4gSXQgaXMKPiA+ID4gPiA+ID4+PiBhbHNv
IHJlYWRpbmcgZnJvbSB0aGUgRFQgaW4gdGhlIGJpbmQoKSBzdGVwIHdoaWNoIHdlIHNvbWV0aW1l
cyBoYXZlIHRvCj4gPiA+ID4gPiA+Pj4gZG8sIGJ1dCB0cnkgdG8gYXZvaWQuCj4gPiA+ID4gPiA+
Pgo+ID4gPiA+ID4gPj4gQWN0dWFsbHksIGl0IGlzIHJlYWRpbmcgb25seSB0aGUgYmFyZSBtaW5p
bXVtIHZlcnkgZWFybHkgaW4gYmluZCwgdGhlCj4gPiA+ID4gPiA+PiBhbHdheXMtb24gYW5kIGJv
b3Qtb24sIHRoZSByZXN0IGlzIGluIHByZV9wcm9iZSwgaS5lLiBsYXRlci4KPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gWWVzLCBJIHNlZSB0aGF0LiBBbHNvIGl0IGlzIGluZXZpdGFibGUgdGhhdCB0
aGVzZSBwcm9wZXJ0aWVzIG5lZWQgdG8KPiA+ID4gPiA+ID4gYmUgcmVhZCBiZWZvcmUgcHJvYmUo
KSwgc2luY2UgdGhleSBjb250cm9sIHdoZXRoZXIgdG8gcHJvYmUoKS4KPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4+Cj4gPiA+ID4gPiA+Pj4gQWxzbyB0aGlzIHNlZW1zIHRvIGhhcHBlbiBpbiBTUEwg
YW5kIGFnYWluIHByZS1yZWxvYyBhbmQgYWdhaW4gaW4KPiA+ID4gPiA+ID4+PiBVLUJvb3QgcG9z
dC1yZWxvYz8KPiA+ID4gPiA+ID4+Cj4gPiA+ID4gPiA+PiBXaGF0IGRvZXMsIHRoZSB1Y2xhc3Mg
cG9zdF9iaW5kID8KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSSBtZWFuIHRoYXQgdGhpcyBjb2Rl
IHdpbGwgYmUgY2FsbGVkIGluIFNQTCAoaWYgdGhlIHJlZ3VsYXRvcnMgYXJlIGluCj4gPiA+ID4g
PiA+IHRoZSBEVCB0aGVyZSksIFUtQm9vdCBwcmUtcmVsb2MgYW5kIHBvc3QtcmVsb2MsIGVhY2gg
dGltZSB0dXJuaW5nIG9uCj4gPiA+ID4gPiA+IHRoZSByZWd1bGF0b3JzLiBXZSBuZWVkIGEgd2F5
IHRvIGNvbnRyb2wgdGhhdCwgZG9uJ3Qgd2U/Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSSB3b3VsZCBh
c3N1bWUgdGhhdCBpZiB0aG9zZSByZWd1bGF0b3JzIGFyZSB0dXJuZWQgb24gb25jZSBpbiB0aGUK
PiA+ID4gPiA+IGVhcmxpZXN0IHN0YWdlICwgdHVybmluZyB0aGVtIG9uIGFnYWluIGluIHRoZSBm
b2xsb3cgdXAgc3RhZ2Ugd291bGQgYmUgYQo+ID4gPiA+ID4gbm9vcCA/IFRoaXMgaXMgdGhlIHBv
aW50IG9mIHJlZ3VsYXRvci0qLW9uLCB0byBrZWVwIHRoZSByZWd1bGF0b3JzIG9uLgo+ID4gPiA+
Cj4gPiA+ID4gTm8sIHRoZXJlIGlzIHNvbWV0aW1lcyBhIHBhcnRpY3VsYXIgc2VxdWVuY2UgbmVl
ZGVkLgo+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gPj4+IFNob3VsZCB3ZSBoYXZlIGEgc3Rl
cCBpbiB0aGUgaW5pdCBzZXF1ZW5jZSB3aGVyZSB3ZSBzZXQgdXAgdGhlCj4gPiA+ID4gPiA+Pj4g
cmVndWxhdG9ycywgYnkgY2FsbGluZyByZWd1bGF0b3JzX2VuYWJsZV9ib290X29uKCkgPwo+ID4g
PiA+ID4gPj4KPiA+ID4gPiA+ID4+IExldCdzIG5vdCBkbyB0aGlzICwgdGhlIGVudGlyZSBwb2lu
dCBvZiB0aGlzIHNlcmllcyBpcyB0byBnZXQgcmlkIG9mCj4gPiA+ID4gPiA+PiB0aG9zZSBmdW5j
dGlvbnMgYW5kIGRvIHRoZSByZWd1bGF0b3IgY29uZmlndXJhdGlvbiB0aGUgc2FtZSB3YXkgTEVE
Cj4gPiA+ID4gPiA+PiBzdWJzeXN0ZW0gZG9lcyBpdCAtLSBieSBwcm9iaW5nIGFsd2F5cy1vbi9i
b290LW9uIHJlZ3VsYXRvcnMgYW5kCj4gPiA+ID4gPiA+PiBjb25maWd1cmluZyB0aGVtIGNvcnJl
Y3RseSBvbiBwcm9iZS4KPiA+ID4gPiA+ID4+Cj4gPiA+ID4gPiA+PiBUbyBtZSByZWd1bGF0b3Jz
X2VuYWJsZV9ib290X29uKCkgYW5kIHRoZSBsaWtlIHdhcyBhbHdheXMgYW4KPiA+ID4gPiA+ID4+
IGluY29uc2lzdGVudGx5IGFwcGxpZWQgd29ya2Fyb3VuZCBmb3IgbWlzc2luZyBETV9GTEFHX1BS
T0JFX0FGVEVSX0JJTkQgLAo+ID4gPiA+ID4gPj4gd2hpY2ggaXMgbm93IGltcGxlbWVudGVkLCBz
byBzdWNoIHdvcmthcm91bmRzIGNhbiBiZSByZW1vdmVkLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiBUaGF0IHBhdGNoIHNlZW1lZCB0byBzbGlwIHVuZGVyIHRoZSByYWRhciwgc2VudCBhbmQgYXBw
bGllZCBvbiB0aGUKPiA+ID4gPiA+ID4gc2FtZSBkYXkhIFdlIHJlYWxseSBuZWVkIHRvIGFkZCBh
IHRlc3QgZm9yIGl0LCBCVFcuCj4gPiA+ID4gPgo+ID4gPiA+ID4gV2hpY2ggcGF0Y2ggPyBNeSBy
ZWNvbGxlY3Rpb24gb2YgRE1fRkxBR19QUk9CRV9BRlRFUl9CSU5EIHdhcyB0aGF0IGl0Cj4gPiA+
ID4gPiB0b29rIGEgd2hpbGUgdG8gZ2V0IGluLgo+ID4gPiA+Cj4gPiA+ID4gWzFdCj4gPiA+ID4K
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE15IGNvbmNlcm4gaXMgdGhhdCB0aGlzIG1pZ2h0IGNhdXNl
IHVzIG9yZGVyaW5nIHByb2JsZW1zLiBXZSBwZXJoYXBzCj4gPiA+ID4gPiA+IHdhbnQgdGhlIHJl
Z3VsYXRvcnMgdG8gYmUgZG9uZSBmaXJzdC4gSWYgZHJpdmVycyBhcmUgcHJvYmVkIHdoaWNoIHVz
ZQo+ID4gPiA+ID4gPiByZWd1bGF0b3JzLCB0aGVuIHByZXN1bWFibHkgdGhleSB3aWxsIGVuYWJs
ZSB0aGVtLiBDb25zaWRlciB0aGlzOgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAtIExFRCBkcml2
ZXIgYXV0by1wcm9iZXMKPiA+ID4gPiA+ID4gICAgIC0gcHJvYmVzIEkyQyBidXMgMgo+ID4gPiA+
ID4gPiAgICAgLSBwcm9iZXMgTERPMSB3aGljaCBpcyBhdXRvc2V0IHNvIHR1cm5zIG9uCj4gPiA+
ID4gPiA+IC0gTERPMSBwcm9iZXMsIGJ1dCBpcyBhbHJlYWR5IHJ1bm5pbmcKPiA+ID4gPiA+ID4g
LSBMRE8yIHByb2Jlcywgd2hpY2ggaXMgYXV0b3NldCBzbyB0dXJucyBvbgo+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiBTbyBsb25nIGFzIGl0IGlzIE9LIHRvIGVuYWJsZSB0aGUgcmVndWxhdG9ycyBp
biBhbnkgb3JkZXIsIHRoZW4gdGhpcwo+ID4gPiA+ID4gPiBzZWVtcyBmaW5lLiBCdXQgaXMgaXQ/
IEhvdyBkbyB3ZSBoYW5kbGUgdGhlIGNhc2Ugd2hlcmUgYXJlIHBhcnRpY3VsYXIKPiA+ID4gPiA+
ID4gc2VxdWVuY2UgaXMgbmVlZGVkPwo+ID4gPiA+ID4KPiA+ID4gPiA+IERpZCB3ZSBmaW5hbGx5
IGFycml2ZSBhdCB0aGUgcG9pbnQgd2hlcmUgd2UgbmVlZCAtRVBST0JFX0RFRkVSIGFsaWtlCj4g
PiA+ID4gPiBtZWNoYW5pc20gPwo+ID4gPiA+Cj4gPiA+ID4gTm9wZS4gQnV0IEkgYW0gY29uY2Vy
bmVkIHRoYXQgdGhpcyBwYXRjaCBpcyBsZWFkaW5nIHVzIHRoZXJlLiBiaW5kKCkKPiA+ID4gPiBy
ZWFsbHkgbmVlZHMgdG8gYmUgYXMgY2xlYW4gYXMgcG9zc2libGUuIEl0IGlzIG9uZSBvZiB0aGUg
ZGVzaWduCj4gPiA+ID4gZWxlbWVudHMgb2YgZHJpdmVyIG1vZGVsIHdoaWNoIExpbnV4IHNob3Vs
ZCBhZG9wdC4KPiA+ID4gPgo+ID4gPiA+IFRoZXJlIGlzIGFsd2F5cyBhIHJhY2UgdG8gYmUgdGhl
IGZpcnN0IHRvIGluaXQgc29tZXRoaW5nLCBtb3ZlIHRoZQo+ID4gPiA+IGluaXQgZWFybGllciwg
ZXRjLi4uIEkgZG9uJ3Qgc2VlIGFueSBnZW5lcmFsIG5lZWQgdG8gaW5pdCB0aGUKPiA+ID4gPiBy
ZWd1bGF0b3JzIHJpZ2h0IGF0IHRoZSBzdGFydC4gSXQgc2hvdWxkIGJlIGRvbmUgaW4gYSBzZXBh
cmF0ZQo+ID4gPiA+IGZ1bmN0aW9uIGFuZCBiZSBvcHRpb25hbC4gSSBhbSBoYXBweSB0byBzZW5k
IGEgcGF0Y2ggaWYgeW91IGxpa2UuCj4gPiA+Cj4gPiA+IFNpbmNlIHdlJ3JlIGN1cnJlbnRseSBz
dHVjayBvbiB0aGUgcG9pbnQgd2hlcmUgTWFyZWsgaGFzIHBhdGNoZXMgdGhhdAo+ID4gPiBmaXgg
YSByZWFsIHByb2JsZW0sIGFuZCBTdnlhdG9zbGF2IGhhcyBhIHByb2JsZW0gd2l0aCB0aGVtLCBi
dXQgaXNuJ3QKPiA+ID4gY3VycmVudGx5IGFibGUgdG8gZGVidWcgaXQsIHllcywgcGxlYXNlIHB1
dCBmb3J3YXJkIHlvdXIgcGF0Y2ggdGhhdAo+ID4gPiBtaWdodCBhZGRyZXNzIGJvdGggc2V0cyBv
ZiBwcm9ibGVtcyBzbyB3ZSBjYW4gYWxsIGZpZ3VyZSBvdXQgaG93IHRvCj4gPiA+IHJlc29sdmUg
dGhlIHByb2JsZW1zLCB0aGFua3MhCj4gPgo+ID4gV2l0aCBwYXRjaGVzIGZyb20gTWFyZWsgdGhl
cmUgaXMgbm8gaTJjIGNoaXAgcHJvYmUgb2YgUE1JQywgd2hpbGUKPiA+IHdpdGhvdXQgaTJjIGNo
aXAgcHJvYmUgaXMgY2FsbGVkIChwcm9iZV9jaGlwIGZ1bmN0aW9uKS4gSG93IHRoaXMgaXMKPiA+
IGV2ZW4gcG9zc2libGU/Cj4KPiBZZXMsIGl0J3MgdmVyeSBwdXp6bGluZy4gRG8geW91IGhhdmUg
dGhlIGFiaWxpdHkgdG8gZ2V0IHNvbWUgZGVidWcKPiBjb25zb2xlIHR5cGUgaW5mb3JtYXRpb24g
b3V0IHNvIHlvdSBjYW4gc3ByaW5rbGUgaW4gc29tZSBwcmludHMgYW5kCj4gZmlndXJlIGl0IG91
dD8KCldlIGRpZCBoYXZlIGEgcG1pYyBtYWludGFpbmVyIGZvciBhIHdoaWxlLCBidXQgcGVyaGFw
cyBoYXMgZ29uZSBxdWlldD8KCkkgYW0gT0sgd2l0aCBhIGNhbGwgdG8gcmVndWxhdG9yc19lbmFi
bGVfYm9vdF9vbigpLCBidXQgd2hlcmUgc2hvdWxkCml0IGdvPyBTaG91bGQgaXQgaGFwcGVuIGlu
IFNQTD8gU2hvdWxkIGl0IGhhcHBlbiBiZWZvcmUgcmVsb2NhdGlvbj8KSG93IGlzIHRoYXQgZGVj
aWRlZCBhbmQgY29udHJvbGxlZD8KCkkgYWN0dWFsbHkgZG9uJ3QgbGlrZSBETV9GTEFHX1BST0JF
X0FGVEVSX0JJTkQgc2luY2UgaXQgbWFrZXMgYmluZCA9PQpwcm9iZSwgc29tZXRoaW5nIHdoaWNo
IEkgYmVsaWV2ZSBVLUJvb3Qgc2hvdWxkIHJlYWxseSB0cnkgdG8gYXZvaWQuIEkKd291bGQgZXZl
biByYXRoZXIgaGF2ZSBhbiBleHBsaWNpdCBjYWxsIGluIGluaXRmX2RtKCkgLSBvciBwZXJoYXBz
CmJldHRlciBpbml0cl9kbSgpPyBNeSBmYXZvdXJpdGUgb3B0aW9uIHdvdWxkIGJlIGEgbmV3IGxp
bmUgaW4gdGhlCmJvYXJkX3IgaW5pdCBzZXF1ZW5jZSBpbnN0ZWFkIG9mIHBvd2VyX2luaXRfYm9h
cmQoKSwgd2hpY2ggcHJlZGF0ZXMKZHJpdmVyIG1vZGVsLgoKUmVnYXJkcywKU2ltb24KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFp
bGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3Rt
MzIK

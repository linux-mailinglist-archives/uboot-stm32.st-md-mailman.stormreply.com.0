Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CCB768DED
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 Jul 2023 09:18:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70BC9C712A3;
	Mon, 31 Jul 2023 07:18:23 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59D2CC6A5E6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jul 2023 05:34:21 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-51e5e4c6026so2014219a12.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 22:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689917661; x=1690522461;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I9mEUbf6KLaTAq23xWoW1vtKdWSY0SFRU6efoOtyMWw=;
 b=IbUUpKJN4GbX6NfanDQfaL4ecBmBtyh5CGO0t0RLodR/AwDWQCxo8JmjCEQ830JmHf
 TibGBiMhMUIi7YQEJoi0UxXIh/f5rHhZlkmXqxNnj/RH6wfspwFUjxoy3Sss0bj3LBLp
 PD1k0pBrII53R0evZ5wN18Ifgaw2GIRJi1LZ0E8EepKRqx3jzYrs01OwOCbF8fGowrbf
 iTF4/nKdLXJXX+dyOC3ZVU/WSssNkv7bCzWZexxnDftcRvz425rYnpWPJbaT9K/1H0iy
 tycVWOur0GVKuPc3sTm/i+QbydhhsOy9AfY5PBJ2jRIR9ezXiSy0gymYnJqUBlE/hS8m
 HWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689917661; x=1690522461;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I9mEUbf6KLaTAq23xWoW1vtKdWSY0SFRU6efoOtyMWw=;
 b=EdQ9oNEDSKtuiyhPbG2o5U8+spn0StSI6/CXFyHF9kfYyAk1EDQea4QQWNp6yiERFu
 bD2BBWI4eUSpEG8x/OoORQaoSwaW+VTS4oFYhfIPP6YJhpcPfE2F0DYaFNnefSOu4O7g
 oPsx4rldfgURpaRETSvJ0jRKzKFFnPBXhJZrhNh1k2u6/Z25E2WeiDqxMVa+zF+4aHH/
 f8e5KTe2w99aHhk09i/zim+A9VX4so9/MV/2+3MAsq7J5xPZ0zrqP8NApe1nA2G4Pt63
 UH6fPavUPCbMe/ip3POnQiHY5/L5bX28MiZtZsAgrevYTjIAxVn0iP5x5lFfd6NIWs5M
 +mIA==
X-Gm-Message-State: ABy/qLZ1nVfT6GDOxUZiAxAdsAQRqL/yZV4zU7n+s8jc8IVnvH8+eBFV
 5mweV7TRr9mLuB7jRRtDsB3sHGQlOMhk7k7bl00=
X-Google-Smtp-Source: APBJJlGz31nwHLeqhIwGIpMNUX8bWMEWprROZmCcLGdZZvaDrmUPeJsFtnlB+fjVb7mQWerLrqKmEWKVtWndKZPeBfQ=
X-Received: by 2002:a17:907:75ec:b0:992:91ce:4508 with SMTP id
 jz12-20020a17090775ec00b0099291ce4508mr686509ejc.53.1689917660744; Thu, 20
 Jul 2023 22:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230720123744.26854-1-clamor95@gmail.com>
 <20230720123744.26854-4-clamor95@gmail.com>
 <CAPnjgZ3jXmqtB=MTv7-SvEaKGyHHgO=zh5m8yPP=hbobh=B=pg@mail.gmail.com>
In-Reply-To: <CAPnjgZ3jXmqtB=MTv7-SvEaKGyHHgO=zh5m8yPP=hbobh=B=pg@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 21 Jul 2023 08:34:09 +0300
Message-ID: <CAPVz0n2wxT_u0BDSdq5+VOkScdDJxAsBntr_p6ajawxiEszyzg@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:18:21 +0000
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 u-boot@dh-electronics.com, Matteo Lisi <matteo.lisi@engicam.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 3/7] power: regulator-uclass: perform
 regulator setup inside uclass
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

0YfRgiwgMjAg0LvQuNC/LiAyMDIz4oCv0YAuINC+IDIyOjQzIFNpbW9uIEdsYXNzIDxzamdAY2hy
b21pdW0ub3JnPiDQv9C40YjQtToKPgo+IEhpIFN2eWF0b3NsYXYsCj4KPiBPbiBUaHUsIDIwIEp1
bCAyMDIzIGF0IDA2OjM4LCBTdnlhdG9zbGF2IFJ5aGVsIDxjbGFtb3I5NUBnbWFpbC5jb20+IHdy
b3RlOgo+ID4KPiA+IFJlZ3VsYXRvcnMgaW5pdGlhbCBzZXR1cCB3YXMgcHJldmlvdXNseSBkZXBl
bmRlbnQgb24gYm9hcmQgY2FsbC4KPiA+IFRvIG1vdmUgZnJvbSB0aGlzIGJlaGF2aW91ciB3ZXJl
IGludHJvZHVjZWQgdHdvIHN0ZXBzLiBGaXJzdCBpcwo+ID4gdGhhdCBhbGwgaW5kaXZpZHVhbCBy
ZWd1bGF0b3JzIHdpbGwgYmUgcHJvYmVkIGp1c3QgYWZ0ZXIgYmluZGluZwo+Cj4gV2UgbXVzdCBu
b3QgcHJvYmUgZGV2aWNlcyBhdXRvbWF0aWNhbGx5IHdoZW4gYm91bmQuIFRoZSBpMmMgaW50ZXJm
YWNlCj4gbWF5IG5vdCBiZSBhdmFpbGFibGUsIGV0Yy4gRG8gYSBwcm9iZSBhZnRlcndhcmRzLgo+
Cj4gUGVyaGFwcyBJIGFtIG1pc3VuZGVyc3RhbmRpbmcgdGhpcywgaXdjIHBsZWFzZSByZXdvcmQg
dGhpcyBjb21taXQgbWVzc2FnZS4KCkFmdGVyIGJvdW5kLiBJZiB0aGUgcmVndWxhdG9yIGlzIGEg
c2VsZi1zdWZmaWNpZW50IGkyYyBkZXZpY2UgdGhlbiBpdAp3aWxsIGJlIGJvdW5kCmFmdGVyIGky
YyBpcyBhdmFpbGFibGUgYnkgY29kZSBkZXNpZ24gc28gaTJjIGludGVyZmFjZSBzaG91bGQgYmUK
YXZhaWxhYmxlIGF0IHRoYXQKbW9tZW50LiBBdCBsZWFzdCBsZWQgYW5kIGdwaW8gdWNsYXNzZXMg
cGVyZm9ybSB0aGlzIGZvciBpbml0aWFsIHNldHVwCm9mIGRldmljZXMuCgpQbGF0Zm9ybSByZWd1
bGF0b3JzIChha2EgZml4ZWQvZ3BpbyByZWd1bGF0b3JzKSB3b3JrIHBlcmZlY3RseSBmaW5lLiBJ
CmhhdmUgbm8gaTJjCnJlZ3VsYXRvcnMgdG8gdGVzdCBkZWVwbHkuCgpBcyBmb3Igbm93IG9ubHkg
b25lIHVjbGFzcyBpcyBub3QgY29tcGF0aWJsZSB3aXRoIHRoaXMgc3lzdGVtIC0gUE1JQyB3aGlj
aCBoYXMKc3Ryb25nIGRlcGVuZGVuY3kgYmV0d2VlbiByZWd1bGF0b3IgYW5kIG1haW4gbWZkLiBU
aGlzIGlzIHdoeSBwcm9iaW5nIGFmdGVyCmJpbmQgZm9yIHBtaWMgcmVndWxhdG9ycyBpcyBkaXNh
YmxlZCBhbmQgcG1pYyByZWd1bGF0b3JzIGFyZSBwcm9iZWQgb24gcG1pYyBjb3JlCnBvc3RfcHJv
YmUuCgo+ID4gd2hpY2ggZW5zdXJlcyB0aGF0IHJlZ3VsYXRvciBwZGF0YSBpcyBmaWxsZWQgYW5k
IHNlY29uZCBpcyBzZXR0aW5nCj4gPiB1cCByZWd1bGF0b3IgaW4gcG9zdCBwcm9iZSB3aGljaCBl
bnNlcmVzIHRoYXQgY29ycmVjdCByZWd1bGF0b3IKPiA+IHN0YXRlIGFjY29yZGluZyB0byBwZGF0
YSBpcyByZWFjaGVkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFN2eWF0b3NsYXYgUnloZWwgPGNs
YW1vcjk1QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvcG93ZXIvcmVndWxhdG9yL3Jl
Z3VsYXRvci11Y2xhc3MuYyB8IDIxMiArKysrKystLS0tLS0tLS0tLS0tLS0KPiA+ICBpbmNsdWRl
L3Bvd2VyL3JlZ3VsYXRvci5oICAgICAgICAgICAgICAgICAgfCAxMTkgLS0tLS0tLS0tLS0tCj4g
PiAgMiBmaWxlcyBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspLCAyNjkgZGVsZXRpb25zKC0pCj4K
PiBSZWdhcmRzLAo+IFNJbW9uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==

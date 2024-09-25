Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6636A985D2E
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Sep 2024 15:04:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17B73C78006;
	Wed, 25 Sep 2024 13:04:34 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3BF9C6C841
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 13:04:26 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42cb0f28bfbso58558505e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 06:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727269466; x=1727874266;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QDD++45rr4z9OpHh7T9S7/W/evwkqFgsBhhHyLXhORs=;
 b=ihvczWgotG+Qcrzvgz6VOmo2NNaAo+U04KwziVc6cX9ipQwZi/262esmlwcelpzad1
 RE5wXE8eO+VCuaklLG/cPuMthZmEbzlTDUmXkafgAVD0/6u5kqHDEo3HAKcPRWHm56bk
 rNaqPJefCM5Hk/f3aPimdHw3LkzOyMGz+3iaqKB26hZua/sxd0KQlIMdCZkVObZhe07N
 pQwLZ1DQLcq2W3G79nPfvA46OlTnRYZYuPOFl5aiWE93ZHYipTs9UZsX+DS5XF8flFIe
 /Q9wUeyn2+Az2C08NxEQxTvniZWzxInJm55hauD81VxSJABPUsDZ4O4YDLkNski/NS1+
 BfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727269466; x=1727874266;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QDD++45rr4z9OpHh7T9S7/W/evwkqFgsBhhHyLXhORs=;
 b=hi1y01vtQm4MzUgYUhI0hIH1q3h64KDHBpic5/QpLlYomW+FeDi5R6Q8ojlKm8oy+p
 S11MGyOd11bBXtAc89RoGa/JNzK8Kca9XlU0bUmcTL6ylkowGJj1Ee0Py20TbklpASEv
 myAFAnGDizORrU21jSS33V++vO5M7PPGsS8XtKFvCiatOcXELcGeujdid+0a9fqKbpid
 48cbHKzNsr3x421bKka2TILA93BK9K3jcqkl9t0+WoSg1VRR7DBRmD3qMF5MrqLwpCr+
 Crnn96pDC+18mndVhLg/obQNsxWW8arU91RuWNRtH7ld7OpsoItVxqn8ZOQ89l6LpVLy
 FFxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZXsLq+QFpsjqCA6638dckoEbck9ehQNXlfuts1swe6xNsSaKXm5D1bca2+Zo3JQMV/AtVXus5o/gRvA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzEF1oBjzH+syBbvdMXbU/65gSfB4/K7ivzqoi5rdy7bwyCMudk
 cKKtx9Kvu5ucqd4A5ZKgUINyzCoLZNVQnLYjGL2h6Esg8cCb/U8H/HadotqHeOhmMq13Bbx8Guw
 4F9tYQ8Tlq4nVtKJ8GDbhPotUIT0=
X-Google-Smtp-Source: AGHT+IHn1pvV5x/oNt3LZgMPQSzEbkojqXRVdw9uB0ltNpEjyGBgh5zfEfz/KM16xNDY0NH3ndAcrgb3u04y0EKWcek=
X-Received: by 2002:adf:f14e:0:b0:375:c4c7:c7ac with SMTP id
 ffacd0b85a97d-37cc24ca3f6mr1734527f8f.49.1727269465909; Wed, 25 Sep 2024
 06:04:25 -0700 (PDT)
MIME-Version: 1.0
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
In-Reply-To: <5f2103ff-cc78-46b6-b008-127678c23592@denx.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 25 Sep 2024 16:04:12 +0300
Message-ID: <CAPVz0n3cH5_1iK+0PSW1mBFKQz13Z0DKJyi6GdsGpPQpvBQ7mg@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

0YHRgCwgMjUg0LLQtdGALiAyMDI04oCv0YAuINC+IDE1OjQ4IE1hcmVrIFZhc3V0IDxtYXJleEBk
ZW54LmRlPiDQv9C40YjQtToKPgo+IE9uIDkvMjUvMjQgMTI6MTggUE0sIFN2eWF0b3NsYXYgUnlo
ZWwgd3JvdGU6Cj4KPiBbLi4uXQo+Cj4gPiBIZWxsbyB0aGVyZSEKPiA+IEkgd2FzIGRpZ2dpbmcg
dGhpcyB3aGVuIEkgaGFkIHNvbWUgZnJlZSB0aW1lIGFuZCBmb3VuZCB0aGF0IHdpdGgKPiA+IHBh
dGNoZXMgZnJvbSBNYXJlayB0aGUgb25seSBkaWZmZXJlbmNlIGlzIHRoYXQgZnVuY3Rpb24KPiA+
IGkyY19nZXRfY2hpcF9mb3JfYnVzbnVtIGlzIG5vdCBjYWxsZWQgZm9yIFBNSUMncyBtYWluIGky
YyBhZGRyZXNzCj4KPiBJcyBpdCBwb3NzaWJsZSB0aGlzIGlzIGNhbGxlZCBlYXJsaWVyLCBiZWZv
cmUgVUFSVCBvdXRwdXQgaXMKPiBpbml0aWFsaXplZCwgc28gaXQgZG9lcyBub3Qgc2hvdyB1cCBp
biB0aGUgbG9nIGJlbG93ID8KPgpJdCBpcyBoaWdobHkgdW5saWtlbHksIHRoaXMgZnVuY3Rpb24g
aXMgY2FsbGVkIHdoZW4gdWFydCBpcyBhbHJlYWR5CndvcmtpbmcgYW5kIHBpbm11eCBpcyBzZXQu
Cgo+IENvdWxkIGl0IGJlIHRoYXQgaXQgaXMgY2FsbGVkIGJlZm9yZSB5b3VyIHBpbm11eCBpcyBw
cm9wZXJseQo+IGluaXRpYWxpemVkLCBoZW5jZSBubyBVQVJULCBhbmQgdGhhdCBpcyB3aHkgdGhl
IEkyQyBjb21tdW5pY2F0aW9uIGZhaWxzPwo+CkJ1dCBpZiB3ZSBhc3N1bWUgdGhhdCBwaW5tdXgg
aXMgbm90IHNldCwgdGhlbiBob3cgd2UgcmVzb2x2ZSBzaXR1YXRpb24Kd2hlbiBwaW5tdXggYW5k
IHJlZ3VsYXRvciBlbmFibGUgYXJlIGJvdGggc2V0IGJ5IHByb2JlIGFmdGVyIGJpbmQgYW5kCnJl
Z3VsYXRvcnMgYXJlIHByb2JlZCBiZWZvcmUgcGlubXV4LiBSZWd1bGF0b3JzIHdpbGwgZmFpbCwg
dGhleSB3aWxsCm5vdCBkZWZmZXIgdGlsbCBwaW5tdXggcHJvYmVzLiBPciB5b3UgcHJvcG9zZSBy
ZXR1cm4gdG8gcHJlLURNIHZlcnNpb24Kb2YgcGlubXV4PyBJbmNvbnNpc3RlbmN5LgoKPiBTbyBm
YXIsIEkgb25seSBmb3VuZCBUb3JhZGV4IFRlZ3JhIFQyMCBib2FyZCBoZXJlLCBubyBUMzAuCldo
YXQgZG8geW91IG1lYW4/IFNwZWNpZnkgcGxlYXNlCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==

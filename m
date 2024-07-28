Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC30393E8CE
	for <lists+uboot-stm32@lfdr.de>; Sun, 28 Jul 2024 19:55:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F6AFC6DD96;
	Sun, 28 Jul 2024 17:55:21 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80675C6DD66
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Jul 2024 17:55:13 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-367940c57ddso960142f8f.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Jul 2024 10:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722189313; x=1722794113;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XuLif95oo8Vc95yl+NcoucyXKoSKsTdFXYZX9JLI1Kc=;
 b=gTv5sxQ61caP7LSN4zEJ3X464+ndq8J2RrCB3ILN8joSWgSd/sNMehR8VtYqhtgp1I
 OQ28DP0lL4lmOPso4V99TI+w2s1DdXyDUs2qhK7BfGiSKfX52JxVa5aQFXEJogcptzPi
 qDkgdHvE1oZayt7N/EJ1Q/XKeqb8osJajw/uaNiplVGzosJFzY99CGc5//22+p3PzTKI
 9uqBciJvK/EXrXGeCc2Vefy3AdHhP8N0/7dvUQNtrkQMqhwhaZsCyfhUYZwEcHvxc7RY
 7GP3aEQ6EgV2t+SZ3OsvdeqO7ILsuW6QUiaRSiAVDClQ747ThXncrP+Qa6t2rUoGEDvR
 SdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722189313; x=1722794113;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XuLif95oo8Vc95yl+NcoucyXKoSKsTdFXYZX9JLI1Kc=;
 b=LHpnwNnjrhT6xSy72CxoLhu0eGbqQh5i05xC89IxqPkYA0CKuyP8p1LsxA/C4+yiQA
 gKQ9+6XFcymHTdGvuzvO2vbsqSZ+1UMbkD8kqlgAJ8m+f55me+sOb24A48l1tpOfzJUu
 cii5oWl9fO6l0HGdeoRfkmvrV8kZ9CZDvJ2N31rOSqdomRmT0maGzkjrfXffpB6PdxUu
 1Npek8VtzaQlMj7fF2UPLW6HGIVqE9HT/w4F8R9yN1luOMqAZ5CINjmG285JbBzDHzkD
 u4vaSeG9HXPvp4PD1VRIvPYyLxemhEVPghI1OTjX9+qxSplzDNBPmjL+rm+eD99dTaZd
 57WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTx8OtOg0cuI5kQz7nD0FcbyjulqlMVppWwSgLbWwFOUp4r5wpwfElFfOWZPn7Bzuis6RxiNPhT/T85zC6/eHEF+3Lunm+0kVKbWkmbSP6uRotLAR4M7OI
X-Gm-Message-State: AOJu0YzEHQZBi11gpJ4i2H+LhCjU1he2jN1VlftaOrorwWf33LYc85RS
 QcnjXrAwINS9MPrP4JOHrMTMLnQMEG6ibQqbuGWU5acl0caI7j2M+zlyiurbPWVHhZj7H9YnQq/
 zZbV/3BtJQaDztC0k7viJB6uwcJM=
X-Google-Smtp-Source: AGHT+IEXccUotEEis3LUoAkPv4+NVUfzyS3O5how4MkRKe11zkrDwrYFo4jppYKBUBQmB1H8h5wDraDHmd2XkBamLps=
X-Received: by 2002:a05:6000:bc3:b0:368:7fca:9040 with SMTP id
 ffacd0b85a97d-36b5d0ace36mr3567938f8f.39.1722189312647; Sun, 28 Jul 2024
 10:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240626235717.272219-1-marex@denx.de>
 <a73dffe5-87e3-4e96-965f-9d029f2af8ed@denx.de>
In-Reply-To: <a73dffe5-87e3-4e96-965f-9d029f2af8ed@denx.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 28 Jul 2024 20:55:01 +0300
Message-ID: <CAPVz0n0C6TPdBRUEvJmgAUGAKoetuzr1j=0cMXweP2EqMTwn=g@mail.gmail.com>
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

0L3QtCwgMjgg0LvQuNC/LiAyMDI04oCv0YAuINC+IDE5OjM4IE1hcmVrIFZhc3V0IDxtYXJleEBk
ZW54LmRlPiDQv9C40YjQtToKPgo+IE9uIDYvMjcvMjQgMTo1NSBBTSwgTWFyZWsgVmFzdXQgd3Jv
dGU6Cj4gPiBJbiBjYXNlIGEgcmVndWxhdG9yIERUIG5vZGUgY29udGFpbnMgcmVndWxhdG9yLWFs
d2F5cy1vbiBvciByZWd1bGF0b3ItYm9vdC1vbgo+ID4gcHJvcGVydHksIG1ha2Ugc3VyZSB0aGUg
cmVndWxhdG9yIGdldHMgY29ycmVjdGx5IGNvbmZpZ3VyZWQgYnkgVS1Cb290IG9uIHN0YXJ0Cj4g
PiB1cC4gVW5jb25kaXRpb25hbGx5IHByb2JlIHN1Y2ggcmVndWxhdG9yIGRyaXZlcnMuIFRoaXMg
aXMgYSBwcmVwYXJhdG9yeSBwYXRjaAo+ID4gZm9yIGludHJvZHVjdGlvbiBvZiAucmVndWxhdG9y
X3Bvc3RfcHJvYmUoKSB3aGljaCB3b3VsZCB0cmlnZ2VyIHRoZSByZWd1bGF0b3IKPiA+IGNvbmZp
Z3VyYXRpb24uCj4gPgo+ID4gUGFyc2luZyBvZiByZWd1bGF0b3ItYWx3YXlzLW9uIGFuZCByZWd1
bGF0b3ItYm9vdC1vbiBEVCBwcm9wZXJ0eSBoYXMgYmVlbgo+ID4gbW92ZWQgdG8gcmVndWxhdG9y
X3Bvc3RfYmluZCgpIGFzIHRoZSBpbmZvcm1hdGlvbiBpcyByZXF1aXJlZCBlYXJseSwgdGhlCj4g
PiByZXN0IG9mIHRoZSBEVCBwYXJzaW5nIGhhcyBiZWVuIGtlcHQgaW4gcmVndWxhdG9yX3ByZV9w
cm9iZSgpIHRvIGF2b2lkCj4gPiBzbG93aW5nIGRvd24gdGhlIGJvb3QgcHJvY2Vzcy4KPgo+IElz
IHRoZXJlIGFueXRoaW5nIGJsb2NraW5nIHRoaXMgc2VyaWVzIGZyb20gYmVpbmcgYXBwbGllZCA/
CgpUaGlzIHBhdGNoc2V0IGNhdXNlcyBQTUlDIHJlZ3VsYXRvcnMgcHJvYmUgdG9vIGVhcmx5IHdo
aWNoIHJlc3VsdHMgaW4KaTJjIGxpbmUgc2V0dXAgZmFpbHVyZS4gVGhlc2UgcGF0Y2hlcyBNVVNU
IE5PVCBiZSBhcHBsaWVkIGluIHRoaXMgZm9ybQpzaW5jZSB0aGV5IHdpbGwgYnJlYWsgYXQgbGVh
c3QgMTUgVGVncmEgMyBkZXZpY2VzIHdoaWNoIHVzZSBETSBQTUlDLAptYXliZSBtb3JlLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBt
YWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1z
dG0zMgo=

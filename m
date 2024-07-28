Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEE693E8B5
	for <lists+uboot-stm32@lfdr.de>; Sun, 28 Jul 2024 19:00:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85D17C6DD96;
	Sun, 28 Jul 2024 17:00:44 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A469C6B460
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Jul 2024 17:00:38 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-368313809a4so648397f8f.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Jul 2024 10:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722186037; x=1722790837;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NU7vFGsFVz9XttDSW/bkfmdXC55CVByOcRuEzg2DDFw=;
 b=O/y/iV2lQqISRFJLZ7xVk8Vp9pXOThgXBUNimGkYJGiPTBX4svzQL9JQxonuei3C2b
 EfDjOCATe+rNFbQwuY4CX5y+aZucgoNV78YHGsQxJLxjHZtrNQeq1AdkodSvVM7RG2Zw
 HhaxQS8orS4S6YV3mKHMhR2A/6/I7DWZy2J9k6bYGqKzivVvk/GZCOYsJivdzUEzP1qE
 4XLgVybLgu/7owdlabcg4ANPiFGQP1FP99zJUqdnjp+2jb4Z8qcTQ+xFfOBNOLzIsr78
 DzGptPonTIjrv0xDMYhpxzkMy35+ZcaAFW7JJcninzGdR+UOLtzruWw0q8fZGGCOgjgs
 TLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722186037; x=1722790837;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NU7vFGsFVz9XttDSW/bkfmdXC55CVByOcRuEzg2DDFw=;
 b=EnLQKYsopvMdQTcTy4yFUfnpgrI1+ggwLrrl/Svh3o8tQsRwLM/O+1r/ODBgykCPbW
 +thVRYdBen5Gwn3JngN2hm3tAFlmrXNYioyJkrH1ol6lCk+Cnbbqw0aQtAlcw1e+tUQ1
 aHO/T5zXxCDRimwwwvpicIHjPVsbZTZxvInRln3/YJUVL+HyVDKHVlSXMYfmzJ0SndmQ
 +CgM6VD6CNZcKEyJh2T5u6OULVc+87KXTojm7tr+xiZ6mG5CqcB02fBnKGxgjLvlVwmy
 Plq56T8c0s3SB0g9GkuA4lWWH9ijplPvV9WhD5p56NhFeDhs47B78vejtd8ojPNLkl4Z
 JdSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH3eY8Sp6zbk4Bl3yYS8PpvYa5fZbWQZ+b/BOgv+z+835eb/XfegVqnvmTVbeZcMlB3qB6IyWyNHL1cP5lGr/gQFtNLv+1LKGfomRe0NcqsGdAYGA9tYL7
X-Gm-Message-State: AOJu0YyaD0Hi2Ks8Ec5Kz8rZaBwEBKGTyjaIQ+9v8Qn2fLB+D8yY64Jz
 6JZotNyk+4V8RNPPEWaVmxxPHALKDK7NuydG3McWycVy3HOu/dBdM4M3Hh+nDxBiS6wsMUx+p8/
 q4yLMxx1CU9aU5CpNUlITln97trg=
X-Google-Smtp-Source: AGHT+IFLXABcTYMcrmM3hytyaQW+HN19qzm+5VB+qqS6LEf4j+QYQxtuAoWqKqdfFYtD/IQf9TyZFesJZgdKl1dXn+M=
X-Received: by 2002:a5d:604f:0:b0:362:4679:b5a with SMTP id
 ffacd0b85a97d-36b5d7d0054mr3401525f8f.16.1722186037138; Sun, 28 Jul 2024
 10:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240626235717.272219-1-marex@denx.de>
 <a73dffe5-87e3-4e96-965f-9d029f2af8ed@denx.de>
In-Reply-To: <a73dffe5-87e3-4e96-965f-9d029f2af8ed@denx.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 28 Jul 2024 20:00:25 +0300
Message-ID: <CAPVz0n0QWCjSgh6QPyo_wnXGQYwhnt30XKJ_ofJK1O08rK9qyA@mail.gmail.com>
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
CgpJIHdvdWxkIGxpa2UgdG8gdHJ5IGl0IHRvIGJlIHN1cmUgdGhhdCBpdCBkb2VzIG5vdCBicmVh
ayBteSBkZXZpY2VzLiBJCndpbGwgcmVzcG9uZCB3aXRoaW4gbmV4dCAyNCBob3Vycy4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFp
bGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3Rt
MzIK

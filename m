Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5A6746CF9
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Jul 2023 11:14:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53ABBC6B45A;
	Tue,  4 Jul 2023 09:14:53 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04375C6A5E6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jul 2023 09:14:51 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-57045429f76so61246347b3.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Jul 2023 02:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1688462091; x=1691054091;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cyRU7qaAf/IEUZvpoGHPFnlOTjLhGB609EHx8AOyIGk=;
 b=LwIXuelbifHNKF9Cgg65eI4aFy240O5ZaLHFYa8jBYWH98Av38wiAA6bPFpHM4Oh0Q
 tvsMWuj9jogMaKVQAJSmZrTSkCw/S2+5BsdKz0YYk3Ju1nRgqxYa+9BBw+RQNbJxnPLJ
 DTf0o/ruUDyrT1pK/RPfDqtXLxPdBJJ4Z0pQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688462091; x=1691054091;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyRU7qaAf/IEUZvpoGHPFnlOTjLhGB609EHx8AOyIGk=;
 b=dVsdlMYi3aZz7fcp3wjmalN6i9gEmy/8aqfbAEWJ1mCvUer0AVk9pyc1ID3aGDww8h
 WNM3St150g9JlGrmHJcLsUi3yMG2FjrdL2lyYLvo6fFHhZKJ+4Q5OiL3I3a3OkBsUIlC
 8qRKGbDMNjyAd4wyYtvGebbfTEp1W9zSwa4u9yjk2Nj0hr0K4ZuDjSY8L5o/xmAijypx
 9wYUsoNOhZU5w8gmgPghhBSPGiJdOkVmdc9DBZvweaO3/rWwSyjhDNCK2XQ/AhT874A1
 Ssf9ossRe/G2FJ89Um6nM77AFa6uOjYF+BMFwiZjaSp1prgovegkCAE/QuEN7xbQoF2j
 AWcA==
X-Gm-Message-State: ABy/qLay2nKDX0CDNrCPLnCKlTpSrgTmBNHYLLhkrSQJTrqRqc3aD693
 BvzCqyZwMhpVduEsWzmnlIqdhe0UQIKXjBOdDXqw4g==
X-Google-Smtp-Source: APBJJlEep+6Y4S8RKAD/z3GPkDoK/Mnq7wW0oyDLDjkym0PXuHo5/FMZ1zEuMeqxaQ9jQutDdihV5E0ZC+UM7BtMkq8=
X-Received: by 2002:a81:838f:0:b0:579:dfac:f507 with SMTP id
 t137-20020a81838f000000b00579dfacf507mr8027522ywf.34.1688462090821; Tue, 04
 Jul 2023 02:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230703162754.2341117-1-dario.binacchi@amarulasolutions.com>
 <ZKPUJpRdRG7fH79S@nx64de-df6d00>
In-Reply-To: <ZKPUJpRdRG7fH79S@nx64de-df6d00>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 4 Jul 2023 11:14:39 +0200
Message-ID: <CABGWkvo=Be70U_azqj73vF-aN5+A6nN5awBFTQMUo77E3Cy=NA@mail.gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de, 
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] board: stm32mp1: add splash screen on dk2
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

SGkgYWxsLAoKT24gVHVlLCBKdWwgNCwgMjAyMyBhdCAxMDoxMeKAr0FNIEdyemVnb3J6IFN6eW1h
c3playA8Z3N6eW1hc3pla0BzaG9ydC5wbD4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIE1vbiwgSnVs
IDAzLCAyMDIzIGF0IDA2OjI3OjU0UE0gKzAyMDAsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+ID4g
ZGlmZiAtLWdpdCBhL2JvYXJkL3N0L3N0bTMybXAxL3N0bTMybXAxLmMgYi9ib2FyZC9zdC9zdG0z
Mm1wMS9zdG0zMm1wMS5jCj4gPiAtJTwtCj4gPiAgI2luY2x1ZGUgPHN5c2Nvbi5oPgo+ID4gKyNp
bmNsdWRlIDxzcGxhc2guaD4KPiA+ICsjaW5jbHVkZSA8c3RfbG9nb19kYXRhLmg+Cj4gPiAgI2lu
Y2x1ZGUgPHVzYi5oPgo+Cj4gVGhlc2UgdHdvIHNob3VsZCBiZSBwdXQgYWJvdmUgc3lzY29uLmgg
aWYgeW91IHdhbnQgdG8ga2VlcCB0aGUgaW5jbHVkZXMKPiBzb3J0ZWQgYWxwaGFiZXRpY2FsbHku
Cgp5ZXMsIHlvdSBhcmUgcmlnaHQuIEkgd2lsbCB1cGRhdGUgaW4gdjIKCj4KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICB1bG9uZyBsb2dvID0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICh1bG9uZylzdG1pY3JvZWxlY3Ryb25pY3NfdWJvb3RfbG9nb184Yml0X3JsZTsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICBibXBfZGlzcGxheShsb2dvLCBCTVBfQUxJR05fQ0VOVEVSLCBC
TVBfQUxJR05fQ0VOVEVSKTsKPgo+IFRlY2huaWNhbGx5IGxvZ28gaXMgY29uc3QuCgppbnQgYm1w
X2Rpc3BsYXkodWxvbmcgYWRkciwgaW50IHgsIGludCB5KTsKQW5kIHRocm91Z2hvdXQgdGhlIGNv
ZGUsIEkgb25seSBmaW5kIHVsb25nIHBhcmFtZXRlcnMgYmVpbmcgcGFzc2VkIHRvCnRoaXMgZnVu
Y3Rpb24uClBlcmhhcHMgSSBjYW4gcmVwbGFjZSAibG9nbyIgd2l0aCAiYWRkciIuCgpUaGFua3Mg
YW5kIHJlZ2FyZHMsCkRhcmlvCgo+Cj4KPiBBbGwgdGhlIGJlc3QKPgo+IC0tCj4gR3J6ZWdvcnoK
CgoKLS0gCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVtYmVkZGVkIExpbnV4IERldmVsb3BlcgoK
ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0aW9ucyBTUkwKClZpYSBMZSBDYW5ldmFyZSAz
MCwgMzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoKVC4gKzM5IDA0MiAyNDMgNTMxMAppbmZvQGFt
YXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBs
aXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK

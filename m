Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2E3768DEE
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 Jul 2023 09:18:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F76DC712BD;
	Mon, 31 Jul 2023 07:18:23 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE2C8C6A5E6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jul 2023 06:03:54 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-98df3dea907so244066666b.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 23:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689919434; x=1690524234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cNLLhmHZNPN/ci64esiNrDUIahsqBQX3HfOhUzRCl3I=;
 b=gyUabZxnPudzS1L4qjasZPAyNHxFk7Zp4TD1Y7BRnN8WTUg5+HYwgk6yj/e31KtWGM
 6+Z4ykcKMD1/jlgYVBWgHGHWrJ7D0BEynHqI+JcOyHbVbLDs8SRtEjESlsfDLW1cs00d
 z+evVb1Fo7Fh5IjkpGPBO6ylYrzEPR4grCnJZCxxOQSYqbRrRG8hnMYg7xrcbSXyura/
 dvKGjvp1LQomqr+L9cGl9/QLLyC57C3VtA45s5jqZBwbggfCTFvRwwBLJGwb5mxRvGMG
 T9VnhodP5+UVT3d5EWc/+nJSU3Tj/TOY/YegWtZ90Oj4XVUEziTPQJqy+klmLWCLvisf
 /reQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689919434; x=1690524234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cNLLhmHZNPN/ci64esiNrDUIahsqBQX3HfOhUzRCl3I=;
 b=PnA2iZVK/TxxW7ubkytBVzCENQYejQO0uqJKT8RTIcxIWcjJtcvFQrFBLr/Og0Eu5T
 AjZKGEpHkxHVDQ8afPA8znSuBplevh8c81mqRb0SaSAqYM7KA7i69Lr8zMzkpQFNv8h+
 QfjaIZNVKJ7Ep88vaxjHsN2Ctxf8YBgcriyUMVe9pDZJzMfiFljhcnFap8S2eOrS6Clk
 JmoZ+J8fdhmBgVT4xLMk9aojekJYlxLLszYj/l9GP6i3b4q07BsUXbKGwC7DBEtUxbrk
 LxKGXGO1wjaBrOh2Q9ThZpmtmSk1h6BlflBf6q7ah4L1oDOjn1NZLgbKDs7ZiQm5JeYT
 mVoQ==
X-Gm-Message-State: ABy/qLbdmNPtN5OD2OloJT+u7pRYth5lytUihqN4afFwAr1U88hqSRQe
 smSVP9LtiA0LM0Nxap2M5rzjnecLnvbWD7VPjD8=
X-Google-Smtp-Source: APBJJlHf27BvYmvSNhSfopW46pxyMu6KCeeUBStzSuOHLcAG7awwj/wkz95VY/NPs3yHMn7DQeXefDAZZgKxBOjXIyQ=
X-Received: by 2002:a17:906:8a46:b0:993:ec0b:1a24 with SMTP id
 gx6-20020a1709068a4600b00993ec0b1a24mr881288ejc.7.1689919433765; Thu, 20 Jul
 2023 23:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230720123744.26854-1-clamor95@gmail.com>
 <20230720123744.26854-6-clamor95@gmail.com>
 <CAPnjgZ1XXXmi2CaM6WbaoyZRzsXE1o--PTcYZhN3C5FNVBwTiw@mail.gmail.com>
In-Reply-To: <CAPnjgZ1XXXmi2CaM6WbaoyZRzsXE1o--PTcYZhN3C5FNVBwTiw@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 21 Jul 2023 09:03:42 +0300
Message-ID: <CAPVz0n0tmXW3f6DMWXyhYHrX0+xV+hp8hUNJ7pSAWGuAE+yM1g@mail.gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH v2 5/7] power: pmic-uclass: probe every
	child on pmic_post_probe
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
b3RlOgo+ID4KPiA+IE1haW4gZ29hbCBpcyB0byBwcm9iZSBhbGwgcmVndWxhdG9yIGNoaWxkcmVu
cyBmb3IgdGhlaXIKPiA+IHByb3BlciBzZXR1cCBidXQgaWYgcG1pYyBoYXMgbm9uIHJlZ3VsYXRv
ciBjaGlsZHJlbiB0aGV5Cj4gPiBzaG91bGQgbm90IHN1ZmZlciBmcm9tIHRoaXMgZWl0aGVyLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFN2eWF0b3NsYXYgUnloZWwgPGNsYW1vcjk1QGdtYWlsLmNv
bT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvcG93ZXIvcG1pYy9wbWljLXVjbGFzcy5jIHwgMTAgKysr
KysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcG93ZXIvcG1pYy9wbWljLXVjbGFzcy5jIGIvZHJpdmVycy9wb3dl
ci9wbWljL3BtaWMtdWNsYXNzLmMKPiA+IGluZGV4IDBlMmY1ZTFmNDEuLjhjYTcxN2JkNWUgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3Bvd2VyL3BtaWMvcG1pYy11Y2xhc3MuYwo+ID4gKysrIGIv
ZHJpdmVycy9wb3dlci9wbWljL3BtaWMtdWNsYXNzLmMKPiA+IEBAIC0xNiw2ICsxNiw3IEBACj4g
PiAgI2luY2x1ZGUgPGRtL2RldmljZS1pbnRlcm5hbC5oPgo+ID4gICNpbmNsdWRlIDxkbS91Y2xh
c3MtaW50ZXJuYWwuaD4KPiA+ICAjaW5jbHVkZSA8cG93ZXIvcG1pYy5oPgo+ID4gKyNpbmNsdWRl
IDxwb3dlci9yZWd1bGF0b3IuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvY3R5cGUuaD4KPgo+IEkn
bSBub3Qgc3VyZSBhYm91dCB0aGlzLgo+Cj4gVGhlIGlkZWEgaXMgdGhhdCBwb3dlciBpcyBoYW5k
bGluZyBhdXRvbWF0aWNhbGx5LCBlLmcuIGEgZGV2aWNlIGlzCj4gcHJvYmVkIGFuZCBzbyBpdHMg
cG93ZXIgaXMgZW5hYmxlZC4gSWYgeW91IGRvIGV2ZXJ5dGhpbmcgYXQgdGhlIHN0YXJ0LAoKV2h5
IGRvIHlvdSB0aGluayBwcm9iZSA9PSBwb3dlciBvbj8gQXMgZm9yIG5vdyBpbiB1LWJvb3QgcG1p
YyBjaGlsZHJlbnMgYXJlCm1vc3RseSByZWd1bGF0b3JzIHdpdGggZmV3IG1pbm9yIGV4Y2VwdGlv
bnMuIFVubGlrZSBhbnkgb3RoZXIgZGV2aWNlcwpyZWd1bGF0b3JzIGhhdmUgc3BlY2lhbCBwcm9w
ZXJ0aWVzIGxpa2UgYm9vdC1vbiBvciBhbHdheXMtb24gYW5kIGFyZQpyZXF1aXJlZCBieSBvdGhl
ciBkZXZpY2VzIHRvIG9wZXJhdGUgY29ycmVjdGx5LgoKQmVmb3JlIHRoaXMgcGF0Y2ggc3BlY2lh
bCBwcm9wZXJ0aWVzIHdlcmUgZWl0aGVyIG5lZ2xlY3RlZCBvciB0aGVpcgplc3RhYmxpc2htZW50
IHdhcyBwZXJmb3JtZWQgd2l0aCBhIGJvYXJkIGNhbGwsIGJvdGggd2F5cyBhcmUgYmFkCnNvbHV0
aW9ucy4gV2l0aCB0aGlzIHBhdGNoIGFsbCBwbWljIHJlZ3VsYXRvcnMgYXJlIHByb2JlZCBhbmQg
c2V0CmFjY29yZGluZyB0byB0aGVpciBkdHMgcHJvcGVydGllcyAoeWVzLCBpZiB0aGUgcmVndWxh
dG9yIGlzIG5vdCBpbiB1c2UKaXQgd2lsbCBiZSB0dXJuZWQgb2ZmIHNvIG5vIHBvd2VyIGNvbnN1
bXB0aW9uIGlzc3VlIHRoZXJlKSB3aGljaCBpcwpkZXNpcmVkIGJlaGF2aW9yLgoKPiBkb2Vzbid0
IHRoYXQgdmlvbGF0ZSB0aGUgJ2xhenknIGluaXQgc2lkZSBvZiBVLUJvb3Q/Cj4KClRoYXQgJ2xh
enknIGluaXQgcmVzdWx0ZWQgaW4gbW9yZSBpc3N1ZXMgZm9yIG1lIChoYWxmIHdvcmtpbmcgZGV2
aWNlcywKYnJva2VuIHVzYikgdGhlbiBpZiBpdCB3YXMgaGFuZGxlZCBhY3RpdmVseS4gSSBhbSBu
b3QgYWdhaW5zdCB0aGlzCmFwcHJvYWNoLCBidXQgcG1pYyBhbmQgcmVndWxhdG9ycyBpcyBub3Qg
dGhlIGRldmljZSB3aGljaCBzaG91bGQKZW1icmFjZSBpdC4KCj4gPgo+ID4gICNpZiBDT05GSUdf
SVNfRU5BQkxFRChQTUlDX0NISUxEUkVOKQo+ID4gQEAgLTE5OCw5ICsxOTksMTggQEAgc3RhdGlj
IGludCBwbWljX3ByZV9wcm9iZShzdHJ1Y3QgdWRldmljZSAqZGV2KQo+ID4gICAgICAgICByZXR1
cm4gMDsKPiA+ICB9Cj4gPgo+ID4gK3N0YXRpYyBpbnQgcG1pY19wb3N0X3Byb2JlKHN0cnVjdCB1
ZGV2aWNlICpkZXYpCj4gPiArewo+ID4gKyAgICAgICBzdHJ1Y3QgdWRldmljZSAqY2hpbGQ7Cj4g
PiArCj4gPiArICAgICAgIGRldmljZV9mb3JlYWNoX2NoaWxkX3Byb2JlKGNoaWxkLCBkZXYpOwo+
ID4gKyAgICAgICByZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiAgVUNMQVNTX0RSSVZFUihwbWlj
KSA9IHsKPiA+ICAgICAgICAgLmlkICAgICAgICAgICAgID0gVUNMQVNTX1BNSUMsCj4gPiAgICAg
ICAgIC5uYW1lICAgICAgICAgICA9ICJwbWljIiwKPiA+ICAgICAgICAgLnByZV9wcm9iZSAgICAg
ID0gcG1pY19wcmVfcHJvYmUsCj4gPiArICAgICAgIC5wb3N0X3Byb2JlICAgICA9IHBtaWNfcG9z
dF9wcm9iZSwKPiA+ICAgICAgICAgLnBlcl9kZXZpY2VfYXV0byAgICAgICAgPSBzaXplb2Yoc3Ry
dWN0IHVjX3BtaWNfcHJpdiksCj4gPiAgfTsKPiA+IC0tCj4gPiAyLjM5LjIKPiA+Cj4KPiBSZWdh
cmRzLAo+IFNpbW9uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL3Vib290LXN0bTMyCg==

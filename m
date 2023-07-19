Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC58C758AA1
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Jul 2023 03:08:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DF4AC6B442;
	Wed, 19 Jul 2023 01:08:17 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BE7EC6A611
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jul 2023 01:08:15 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-4fb761efa7aso10289431e87.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 18:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689728895; x=1692320895;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7N6UkBHhUU7ORvIrPnM4xReqc84vlsIhl/RqGweK2ic=;
 b=IrgY1zF417+Kt0ku006aacH/DEHojhTrPtTR/D39vFXFA4o/RLiDKb7hw0zfAuhfpU
 CjxzXO2gStNSWlvquWXnZPsAmnvg+Wb8wF3qmJ3m3nfEn8POWzBq/tTHg6i7Gnxu4C5u
 qpzCuIt41ct2y7mwv4qvmVAgHYKfCWi8RCB5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689728895; x=1692320895;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7N6UkBHhUU7ORvIrPnM4xReqc84vlsIhl/RqGweK2ic=;
 b=Q41uTAenomgD++1ZDCh+bKQ9JB/vwqcYTWVWRGeLiHHcpoxZhmZZVb2VZJjjNtkEvY
 +psFrqS1BEtX0UTG09Sg3kLh06hnLQJKXkcPsYa80VXOBWDkHoCwTFEByeg0Nn99SEeB
 UB/VZQbMOCv8DQIid3iqUY54YiPutZj6FpHYxr2ZoXJa9sMlneqWDjT3WxjIqiDFWOko
 CFyhdE6HyXyKLOqHoxwGxO470WPg6KX+SFhU6zKqf4H3/z79RrxdfbTUhSZrkaGqz6Zf
 b3hd705NRD4sgSOHb9bv45BXy+5xjHqJvVTGvtoyfCW3ZfIAp67O8dA0rpkYZuxBCo8+
 x6UA==
X-Gm-Message-State: ABy/qLbS7Hzn9ltnjP0MBsuC/yvQivBmp1wC24HclOK78tLxbzXigLg+
 tiM6FQjgbWaaIIbeqKihM0j+kgFCsjW+76MF971KwA==
X-Google-Smtp-Source: APBJJlGsCIMili3HOPeEjO1BNwRkPTEBofaSB9eKAfZpG7/dgqp6YobXSthvOht9H94lCmvKEQQoDLZeSdNndY5HqIQ=
X-Received: by 2002:a19:6459:0:b0:4fb:9105:58b0 with SMTP id
 b25-20020a196459000000b004fb910558b0mr10936977lfj.20.1689728894809; Tue, 18
 Jul 2023 18:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230718070504.19810-1-clamor95@gmail.com>
 <20230718070504.19810-2-clamor95@gmail.com>
 <f796704a-900e-2794-89fb-26dde4512ad1@collabora.com>
 <CAPVz0n3FDTs7LKCXe0DEc7bN3uS7xvJ8+SvURYV6CfcO2MayWQ@mail.gmail.com>
In-Reply-To: <CAPVz0n3FDTs7LKCXe0DEc7bN3uS7xvJ8+SvURYV6CfcO2MayWQ@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 18 Jul 2023 19:08:02 -0600
Message-ID: <CAPnjgZ0G2EogMJ=vOVUfvRuXauBfNNOnWwt3xUms297bLLPVMg@mail.gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 u-boot@dh-electronics.com, Matteo Lisi <matteo.lisi@engicam.com>,
 Jonas Karlman <jonas@kwiboo.se>, u-boot@lists.denx.de,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Kostya Porotchkin <kostap@marvell.com>, Anatolij Gustschin <agust@denx.de>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/4] power: regulator: expand basic
 reference counter onto all uclass
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

SGksCgpPbiBUdWUsIDE4IEp1bCAyMDIzIGF0IDAxOjM5LCBTdnlhdG9zbGF2IFJ5aGVsIDxjbGFt
b3I5NUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4g0LLRgiwgMTgg0LvQuNC/LiAyMDIz4oCv0YAuINC+
IDEwOjM2IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZAY29sbGFib3JhLmNvbT4g0L/QuNGI
0LU6Cj4gPgo+ID4gSGkgU3Z5YXRvc2xhdiwKPiA+Cj4gPgo+ID4gT24gNy8xOC8yMyAxMDowNSwg
U3Z5YXRvc2xhdiBSeWhlbCB3cm90ZToKPiA+ID4gQ29tbWl0IGlzIGJhc2VkIG9uIDRmY2JhNWQg
KCJyZWd1bGF0b3I6IGltcGxlbWVudCBiYXNpYyByZWZlcmVuY2UKPiA+ID4gY291bnRlciIpIGJ1
dCBleHBhbmRzIHRoZSBpZGVhIHRvIGFsbCByZWd1bGF0b3JzIGluc3RlYWQgb2YganVzdAo+ID4g
PiBmaXhlZC9ncGlvIHJlZ3VsYXRvcnMuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFN2eWF0
b3NsYXYgUnloZWwgPGNsYW1vcjk1QGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICAgZHJpdmVy
cy9wb3dlci9yZWd1bGF0b3IvcmVndWxhdG9yLXVjbGFzcy5jIHwgMjIgKysrKysrKysrKysrKysr
KysrKysrKwo+ID4gPiAgIGRyaXZlcnMvcG93ZXIvcmVndWxhdG9yL3JlZ3VsYXRvcl9jb21tb24u
YyB8IDIyIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gICBkcml2ZXJzL3Bvd2VyL3JlZ3Vs
YXRvci9yZWd1bGF0b3JfY29tbW9uLmggfCAyMSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4g
ICBpbmNsdWRlL3Bvd2VyL3JlZ3VsYXRvci5oICAgICAgICAgICAgICAgICAgfCAgMiArKwo+ID4g
PiAgIDQgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRpb25zKC0pCgpE
b2VzIHRoaXMgYWZmZWN0IHRlc3RzPyBDYW4geW91IG1ha2Ugc3VyZSB0aGF0IHRoZXJlIGlzIHRl
c3QgY292ZXJhZ2UKaW4gdGVzdC9kbS8uLi4KClJlZ2FyZHMsClNpbW9uCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlz
dApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==

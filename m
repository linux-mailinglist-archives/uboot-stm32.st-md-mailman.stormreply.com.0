Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5F864A15D
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Dec 2022 14:39:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 247D1C65E74;
	Mon, 12 Dec 2022 13:39:24 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24064C65047
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Dec 2022 13:39:22 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 t11-20020a17090a024b00b0021932afece4so15731381pje.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Dec 2022 05:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L68LAyAsd57kV3upHNRI1Eo0Et/Mk6euvgDgiuorIqM=;
 b=IfqvaEdOO40FkCKjH2TJgXTb9x07d59CqE4BWWCcEMeUgMLWMid0uF3aJIltuTjTtu
 49MPftb2wZEBzT8p/KQSQD3y0F+rTeRYcIawAyuOh++8d+yi4u2cVdlmkiTbv36i4Deo
 oztQ31OdOZOmVE1GXQdiMG0YBq62ZwJ6flPz/TPU57rcZaYQ5Kc7bnvZLAAkWwGEKkRj
 2RRCjirbCXTaEcfAVWLvkON81K4KVIW7lA/AvSjQPElfy9dJc/ZYzlx9C9u6G1/3JXIB
 Gr0k8/soTrW3Q6vcMgFopJGTdfCZPzVTJmFTtv2+dc6S48Y7Sh8mTjug68PQBhAqmlge
 wJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L68LAyAsd57kV3upHNRI1Eo0Et/Mk6euvgDgiuorIqM=;
 b=InPLJB5hdK2UH6rPcS87J07vYVYMTBrFWeQE74F80alkEWisMkgAln0i63w/dQgi9D
 uH2gVl2bcJEnWhe7OUFtHy8ugwIfe9lOSfsaKcS1hehHfXRnBisp7SI2MkFo2aBu38Sc
 GHOWxc8F9KLG3bPs96x7flDfISBQPOtfRIKfas+ShyAhuPsAZ+18wEVtJgG4PZVt9aHG
 UE8jPySWGCixluYISFcecpTWWNWv8DQAj0in/DnzYqlUl++bCfbsALNUXOKAc9S6F53f
 prd3jsFRZVJ2NKZuqQDjgCWIVUidlI6UikpmWI1k5yynpDF92JWy4Nuo15S9VvJitBMo
 ZJLQ==
X-Gm-Message-State: ANoB5pmOakEfkur79uoXxpHmgjo7gBJ2A1uWgqGSuVGqIYS1S6WO/8oX
 fad6OU9Uv2Nxe8cv6LWa9StIfayv8qEjai+idLs=
X-Google-Smtp-Source: AA0mqf54j1Y6GbMTrhjnKYogDLMod7GfLCxhaZ72adV2NiEJ1rclcloqf6vwSL+6V9hb79Ce9bSvc3M+3TK+Yt3ctPc=
X-Received: by 2002:a17:90a:d510:b0:219:2f88:ae3a with SMTP id
 t16-20020a17090ad51000b002192f88ae3amr16002028pju.106.1670852360724; Mon, 12
 Dec 2022 05:39:20 -0800 (PST)
MIME-Version: 1.0
References: <20221128084122.3456680-1-max.oss.09@gmail.com>
 <20221128084122.3456680-2-max.oss.09@gmail.com>
 <20221208202410.GN3787616@bill-the-cat>
In-Reply-To: <20221208202410.GN3787616@bill-the-cat>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Mon, 12 Dec 2022 14:39:09 +0100
Message-ID: <CAEHkU3WR8PKLHHjU7k6FK32mvpwxBenGkW_piQeabs9m4ogbgg@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Du Huanpeng <dhu@hodcarrier.org>, AKASHI Takahiro <takahiro.akashi@linaro.org>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Heiko Thiery <heiko.thiery@gmail.com>,
 Stefan Roese <sr@denx.de>, Adam Ford <aford173@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v5 1/1] u-boot-initial-env: rework make
	target
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

SGkgVG9tCgpPbiBUaHUsIERlYyA4LCAyMDIyIGF0IDk6MjQgUE0gVG9tIFJpbmkgPHRyaW5pQGtv
bnN1bGtvLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE5vdiAyOCwgMjAyMiBhdCAwOTo0MToyMkFN
ICswMTAwLCBNYXggS3J1bW1lbmFjaGVyIHdyb3RlOgo+Cj4gPiBGcm9tOiBNYXggS3J1bW1lbmFj
aGVyIDxtYXgua3J1bW1lbmFjaGVyQHRvcmFkZXguY29tPgo+ID4KPiA+IFdpdGggTFRPIGVuYWJs
ZWQgdGhlIFUtQm9vdCBpbml0aWFsIGVudmlyb25tZW50IGlzIG5vIGxvbmdlciBzdG9yZWQKPiA+
IGluIGFuIGVhc3kgYWNjZXNzaWJsZSBzZWN0aW9uIGluIGVudi9jb21tb24uby4gSS5lLiB0aGUg
c2VjdGlvbiBuYW1lCj4gPiBjaGFuZ2VzIGZyb20gYnVpbGQgdG8gYnVpbGQsIGl0cyBjb250ZW50
IG1heWJlIGNvbXByZXNzZWQgYW5kIGl0IGlzCj4gPiBhbm5vdGF0ZWQgd2l0aCBhZGRpdGlvbmFs
IGRhdGEuCj4gPgo+ID4gRHJvcCB0cnlpbmcgdG8gcmVhZCB0aGUgaW5pdGlhbCBlbnYgd2l0aCBl
bGYgdG9vbHMgZnJvbSB0aGUgY29tcGlsZXIKPiA+IHNwZWNpZmljIG9iamVjdCBmaWxlIGluIGZh
dm91ciBvZiBhZGRpbmcgYW5kIHVzaW5nIGEgaG9zdCB0b29sIHdpdGgKPiA+IHRoZSBvbmx5IGZ1
bmN0aW9uYWxpdHkgb2YgcHJpbnRpbmcgdGhlIGluaXRpYWwgZW52IHRvIHN0ZG91dC4KPiA+Cj4g
PiBTZWUgYWxzbzoKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC85MjdiMTIyZS0xZjYy
LWU3OTAtZjVjYS0zMGJhZTQzMzJjNzdAZm9zcy5zdC5jb20vCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogTWF4IEtydW1tZW5hY2hlciA8bWF4LmtydW1tZW5hY2hlckB0b3JhZGV4LmNvbT4KPiA+IEFj
a2VkLWJ5OiBQYWxpIFJvaMOhciA8cGFsaUBrZXJuZWwub3JnPgo+ID4gUmV2aWV3ZWQtYnk6IFNp
bW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgo+Cj4gQXBwbGllZCB0byB1LWJvb3QvbmV4dCwg
dGhhbmtzIQoKVGhlIGNvbW1pdCBub3Qgb25seSBmaXhlcyB0aGUgdXNlIGNhc2Ugb24gYXJtNjQg
d2l0aCBMVE8gZW5hYmxlZCwgaXQgYWxzbwpmaXhlcyBzYW5kYm94IGZvciB4ODYtNjQuIEZvciBt
ZSBvbiBGZWRvcmEgd2l0aCBhIGBnY2MgKEdDQykgMTEuMy4xIDIwMjIwNDIxYApib3RoIGBtYWtl
IHNhbmRib3hfZGVmY29uZmlnOyBtYWtlIHUtYm9vdC1pbml0aWFsLWVudmAgYW5kCmBtYWtlIHNh
bmRib3hfZGVmY29uZmlnOyA8dW5zZWxlY3QgTFRPPjsgbWFrZSB1LWJvb3QtaW5pdGlhbC1lbnZg
IGZhaWwgd2l0aApgYGAKICBHRU5FTlYgIHUtYm9vdC1pbml0aWFsLWVudgpvYmpjb3B5OiBlbnYv
Y29tbW9uLm86IGNhbid0IGR1bXAgc2VjdGlvbgonLnJvZGF0YS5kZWZhdWx0X2Vudmlyb25tZW50
JyAtIGl0IGRvZXMgbm90IGV4aXN0OiBmaWxlIGZvcm1hdCBub3QKcmVjb2duaXplZApzZWQ6IGNh
bid0IHJlYWQgdS1ib290LWluaXRpYWwtZW52OiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CmBg
YAoKV291bGRuJ3QgdGhhdCBtZXJpdCBhcHBseWluZyB0aGUgY29tbWl0IHRvIG1hc3RlciwgaS5l
LiBpbmNsdWRlIGl0IGluIHYyMDIzLjAxPwoKUmVnYXJkcwpNYXgKClAuUy46ClRoZSB0ZXN0IGlu
IFsxXSBjYXRjaGVzIHRoaXMgZmFpbHVyZSwgc28gWzFdIHNob3VsZCBnbyBpbiBhZnRlciB0aGlz
IGNvbW1pdAp0byBoYXZlIENJIHRlc3RzIG5vdCBmYWlsaW5nLgpbMV0gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjIxMjA5MTIwOTU2LjIyODY2MTktMS1tYXgub3NzLjA5QGdtYWlsLmNv
bS8KCj4KPiAtLQo+IFRvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

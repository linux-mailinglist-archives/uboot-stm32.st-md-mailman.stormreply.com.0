Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D96249B6037
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2024 11:33:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B32AC78023;
	Wed, 30 Oct 2024 10:33:53 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3E76C78020
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 10:33:45 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-6ea339a41f1so12942247b3.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 03:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1730284424; x=1730889224;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0nHFHL+yh0ghY8Jnvo30o7uW2WpaN/45SGY7zNK1fSA=;
 b=B/YHERwW97NdRl0sTb5I/OWN3bIfx8a+Is52RJNAHPv9JdQgyvQ7efII03gAIfavN6
 shnNKoyzf4T+Bm4iR/wFlTeUdasTnJZ2f6QQTHgvAOgqrm5+qNoFDDaBTpownnKF5tA3
 yW5jvdqsf28YzvHOuHkvSfouniFCsZ+2zWo20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730284424; x=1730889224;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0nHFHL+yh0ghY8Jnvo30o7uW2WpaN/45SGY7zNK1fSA=;
 b=MBvHeZdogwg8EcKtoMkR2MyUcPmDPdhGt5vWuL0Mp81dMIi9qi9KjjQe/TC9S9IpF5
 XSCG324Y4JJGeUX/C+QspAmLaLFHQwK9RAsYN7h/mt3fgT8mQdlhStWhsqPs/22OtyhN
 mpr7i/Rj/nOkdOon+kVdBdGJEllP5h7uZY9IRLysToYz1YpVq5FGxEC4v/hrX/MPgQN4
 XkflklEWuEnlb5lgWmcXVtQ0vXdB5sI4fq9OgHH2vdB0gEqvWokeCuphQpBepN7eaK0N
 RaEaCpdb6GCCWBGefZnYF6Lgdg9FuAu7tdfZpv/guQ6mgL1nR+RTEbWFlNtT12VZ7Caj
 z4Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiyxqaoWaw8Afis/v6WJwr4hd/jjAbhrdCafXsmBwDpUJpOE1IYWGOavgeXpZJmBDrK36XlWb8P0Ublg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxoF+98RUceTPpjrot6dv72A7np7iQpDZ8WDhYFFFvMRH4ZdPx1
 7To2Ffjo1aI2Nwdzg9abieDbpd9U2qvIkjPLWspCMfcnbaQGt0TWqKA76uT7HeDpt65CeAP8yML
 zWMiGoq690XYmGUy7IoxrEWPkuRrp66EScvvayA==
X-Google-Smtp-Source: AGHT+IGoTHZE8RPPt1Yff40nueyu+POcqJ/m8R9pocAMfcKuKaRY82ev+KFHNWU3WjiAmA38kflryqvHLn+KuymdZN4=
X-Received: by 2002:a05:690c:6a0a:b0:6e3:dc4a:34b0 with SMTP id
 00721157ae682-6e9d89947b6mr137174347b3.22.1730284424601; Wed, 30 Oct 2024
 03:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 30 Oct 2024 16:03:33 +0530
Message-ID: <CAMty3ZB3ngMezv9S2XrNjXL69q+z9x-=qnQGga51FgTfA4fanQ@mail.gmail.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Tom Rini <trini@konsulko.com>, Michael Walle <mwalle@kernel.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Ashok Reddy Soma <ashok.reddy.soma@amd.com>, u-boot@lists.denx.de,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [Uboot-stm32] [PATCH 1/9] mtd: spi-nor: Remove recently added
 nor->addr_width == 3 test
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

SGkgTWFyZWssCgpPbiBTdW4sIE9jdCAyNywgMjAyNCBhdCAxOjQ44oCvQU0gTWFyZWsgVmFzdXQK
PG1hcmVrLnZhc3V0K3JlbmVzYXNAbWFpbGJveC5vcmc+IHdyb3RlOgo+Cj4gUmVtb3ZlIHVuZG9j
dW1lbnRlZCBub3ItPmFkZHJfd2lkdGggPT0gMyB0ZXN0LiBUaGlzIHdhcyBhZGRlZCBpbiBjb21t
aXQKPiA1ZDQwYjNkMzg0ZGMgKCJtdGQ6IHNwaS1ub3I6IEFkZCBwYXJhbGxlbCBhbmQgc3RhY2tl
ZCBtZW1vcmllcyBzdXBwb3J0IikKPiB3aXRob3V0IGFueSBleHBsYW5hdGlvbiBpbiB0aGUgY29t
bWl0IG1lc3NhZ2UuIFJlbW92ZSBpdC4KPgo+IFRoaXMgYWxzbyBoYXMgYSBiYWQgc2lkZS1lZmZl
Y3Qgd2hpY2ggYnJlYWtzIFJFQUQgb3BlcmF0aW9uIG9mIGV2ZXJ5IFNQSSBOT1IKPiB3aGljaCBk
b2VzIG5vdCB1c2UgYWRkcl93aWR0aCA9PSAzLCBlLmcuIHMyNWZzNTEycyBkb2VzIG5vdCB3b3Jr
IGF0IGFsbC4gVGhpcwo+IGlzIGJlY2F1c2UgaWYgYWRkcl93aWR0aCAhPSAzLCByZW1fYmFua19s
ZW4gaXMgYWx3YXlzIDAsIGFuZCBpZiByZW1fYmFua19sZW4KPiBpcyAwLCB0aGVuIHJlYWRfbGVu
IGlzIDAgYW5kIGlmIHJlYWRfbGVuIGlzIDAsIHRoZW4gdGhlIHNwaV9ub3JfcmVhZCgpIHJldHVy
bnMKPiAtRUlPLgo+Cj4gQmFzaWMgcmVwcm9kdWNlciBpcyBhcyBmb2xsb3dzOgo+ICIKPiA9PiBz
ZiBwcm9iZSA7IHNmIHJlYWQgMHg1MDAwMDAwMCAwIDB4MTAwMDAKPiBTRjogRGV0ZWN0ZWQgczI1
ZnM1MTJzIHdpdGggcGFnZSBzaXplIDI1NiBCeXRlcywgZXJhc2Ugc2l6ZSAyNTYgS2lCLCB0b3Rh
bCA2NCBNaUIKPiBkZXZpY2UgMCBvZmZzZXQgMHgwLCBzaXplIDB4MTAwMDAKPiBTRjogNjU1MzYg
Ynl0ZXMgQCAweDAgUmVhZDogRVJST1IgLTUKPiAiCj4KPiBGaXhlczogNWQ0MGIzZDM4NGRjICgi
bXRkOiBzcGktbm9yOiBBZGQgcGFyYWxsZWwgYW5kIHN0YWNrZWQgbWVtb3JpZXMgc3VwcG9ydCIp
Cj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmVrLnZhc3V0K3JlbmVzYXNAbWFpbGJv
eC5vcmc+Cj4gLS0tCj4gQ2M6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBhcm0uY29t
Pgo+IENjOiBBc2hvayBSZWRkeSBTb21hIDxhc2hvay5yZWRkeS5zb21hQGFtZC5jb20+Cj4gQ2M6
IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IENjOiBNaWNoYWVsIFdh
bGxlIDxtd2FsbGVAa2VybmVsLm9yZz4KPiBDYzogTWljaGFsIFNpbWVrIDxtaWNoYWwuc2ltZWtA
YW1kLmNvbT4KPiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5j
b20+Cj4gQ2M6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+
Cj4gQ2M6IFByYXR5dXNoIFlhZGF2IDxwLnlhZGF2QHRpLmNvbT4KPiBDYzogUXVlbnRpbiBTY2h1
bHogPHF1ZW50aW4uc2NodWx6QGNoZXJyeS5kZT4KPiBDYzogU2VhbiBBbmRlcnNvbiA8c2Vhbmdh
MkBnbWFpbC5jb20+Cj4gQ2M6IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgo+IENjOiBU
YWthaGlybyBLdXdhbm8gPFRha2FoaXJvLkt1d2Fub0BpbmZpbmVvbi5jb20+Cj4gQ2M6IFRvbSBS
aW5pIDx0cmluaUBrb25zdWxrby5jb20+Cj4gQ2M6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFy
dXNAbGluYXJvLm9yZz4KPiBDYzogVmVua2F0ZXNoIFlhZGF2IEFiYmFyYXB1IDx2ZW5rYXRlc2gu
YWJiYXJhcHVAYW1kLmNvbT4KPiBDYzogdS1ib290QGxpc3RzLmRlbnguZGUKPiBDYzogdWJvb3Qt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+IC0tLQoKSXMgdGhpcyBwYXRjaC1z
ZXQgbmV4dCB2ZXJzaW9uIGZvciAncHJldmlvdXMnIHJldmVydGVkIHNlcmllcz8KCkphZ2FuLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0z
MiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9v
dC1zdG0zMgo=

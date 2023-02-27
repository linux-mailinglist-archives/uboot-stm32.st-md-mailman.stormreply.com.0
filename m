Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B896A493B
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Feb 2023 19:07:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73A12C6A5E7;
	Mon, 27 Feb 2023 18:07:26 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F36A9C69067
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Feb 2023 18:07:24 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id o12so29314947edb.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Feb 2023 10:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6i6cB4qV8gthPbrDCJMTfDZQ6ecrn4DV1T1/EnEO7QI=;
 b=j4uiaAfM+6FPiwOoo97hbY81G4FxN0lvK0xmN4smtZnsI7k1vdKINFTm4UPtup0Xhk
 Yjq0fpocWciavo3A6UFrH+UH8du7jYqhvxMyOEZTUANmjONfaNbVQcEBWLmnKh2kjUNk
 ctgyR6fQPYVZ9AsCqvQsLUfWVIOe49VWRENts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6i6cB4qV8gthPbrDCJMTfDZQ6ecrn4DV1T1/EnEO7QI=;
 b=5hJEBhlmIhEmAjOzg4L3cZ9KBsIlzil9y0k9rFT+01dd9LGHZzh04JT8bywXhKzodk
 F7FFtMMe/YJpTI9YQuSjcVihhGgdKig7V4m/5/28qaDtW4BtNgvnE57f5/dyct+DavPa
 5RBDYxu6jh5cDiqvNiYCbodxAVsx8eL5Uq8ILdfaWxhZcJ2go+GCuCQj96NzuGnH2S0U
 9Fbz+xceIq0W9NXrK8/tBYXVgK8HVS280Lrbp+dKeWNbi8H7EKP0Wx7tNBhsCmQKz7cx
 drLaNOQXKxjIIbvjdFdZCY927fv8zzdTlIHuBLutRZGAm3xYY43Gii8ctLRQHnhkwobk
 M+hg==
X-Gm-Message-State: AO0yUKXalVKqGh3sJ9rgrfkUQFuDgObF4D/j/frDI8v5dXvw/zLQW0qM
 23DtlBoVK9rrvwGsr5Lz74LQsS9snsZ2Kl0ARr0wPg==
X-Google-Smtp-Source: AK7set81obp4N6qzlOggSp+TmeMTurJwffzHGQ4VZ1fhYM64b7vpAIN2As2t/hcSOz73TGYv0YM4C0/qnfgM+lCJw54=
X-Received: by 2002:a17:906:858f:b0:8b2:23fb:dfd8 with SMTP id
 v15-20020a170906858f00b008b223fbdfd8mr16471292ejx.12.1677521244313; Mon, 27
 Feb 2023 10:07:24 -0800 (PST)
MIME-Version: 1.0
References: <20230213173005.913823-1-patrice.chotard@foss.st.com>
 <0dba65d9-6415-569f-b4fb-34b10b1c710d@kontron.de>
 <CAOf5uw=a0op1ZCe0wGUXnJbMq64=LfqvX3N4zE5pOq5Y6o1Z-Q@mail.gmail.com>
In-Reply-To: <CAOf5uw=a0op1ZCe0wGUXnJbMq64=LfqvX3N4zE5pOq5Y6o1Z-Q@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 27 Feb 2023 19:07:13 +0100
Message-ID: <CAOf5uwnPjYFJ+WM0fm3j90OxsDGi2Dpbk8jRnSfMGtEz6hFjNw@mail.gmail.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Stefan Roese <sr@denx.de>,
 Jagan Teki <jagan@openedev.com>, Peter Pan <peterpandong@micron.com>
Subject: Re: [Uboot-stm32] [PATCH] mtd: spinand: Fix display of unknown raw
	ID
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

SGkKCk9uIFR1ZSwgRmViIDE0LCAyMDIzIGF0IDExOjUy4oCvQU0gTWljaGFlbCBOYXp6YXJlbm8g
VHJpbWFyY2hpCjxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToKPgo+IEhpCj4K
PiBPbiBUdWUsIEZlYiAxNCwgMjAyMyBhdCA5OjE0IEFNIEZyaWVkZXIgU2NocmVtcGYKPiA8ZnJp
ZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPiB3cm90ZToKPiA+Cj4gPiBPbiAxMy4wMi4yMyAxODoz
MCwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+ID4gPiBJbiBjYXNlIElEIGlzIG5vdCBmb3VuZCBp
biBtYW51ZmFjdHVyZXIgdGFibGUsIHRoZSByYXcgSUQgaXMKPiA+ID4gcHJpbnRlZCB1c2luZyAl
KnBoTiBmb3JtYXQgd2hpY2ggaXMgbm90IHN1cHBvcnRlZCBieSBsaWIvdnNwcmludGYuYy4KPiA+
ID4gVGhlIGluZm9ybWF0aW9uIGRpc3BsYXllZCBkb2Vzbid0IHJlZmxlY3QgdGhlIHJhdyBJRCBy
ZXR1cm4gYnkgdGhlCj4gPiA+IHVua25vd24gc3BpLW5hbmQuCj4gPiA+Cj4gPiA+IFVzZSAlMDJ4
IGZvcm1hdCBpbnN0ZWFkLCBhcyBkb25lIGluIHNwaS1ub3ItY29yZS5jLgo+ID4gPgo+ID4gPiBG
b3IgZXhhbXBsZSwgYmVmb3JlIHRoaXMgcGF0Y2g6Cj4gPiA+ICAgRVJST1I6IHNwaS1uYW5kOiBz
cGlfbmFuZCBmbGFzaEAwOiB1bmtub3duIHJhdyBJRCBmNzRlYzA0MAo+ID4gPiBhZnRlcgo+ID4g
PiAgIEVSUk9SOiBzcGktbmFuZDogc3BpX25hbmQgZmxhc2hAMDogdW5rbm93biByYXcgSUQgMDAg
YzIgMjYgMDMKPiA+ID4KPiA+ID4gRml4ZXM6IDBhNmQ2YmFlMDM4NiAoIm10ZDogbmFuZDogQWRk
IGNvcmUgaW5mcmFzdHJ1Y3R1cmUgdG8gc3VwcG9ydCBTUEkgTkFORHMiKQo+ID4gPgo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNv
bT4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogRnJpZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1w
ZkBrb250cm9uLmRlPgo+Cj4gQWNrZWQtYnk6IE1pY2hhZWwgVHJpbWFyY2hpIDxtaWNoYWVsQGFt
YXJ1bGFzb2x1dGlvbnMuY29tPgo+CgpBcHBsaWVkIHRoYW5rcwoKTWljaGFlbApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5n
IGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

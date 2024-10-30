Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1C49B6579
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2024 15:18:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E664C78027;
	Wed, 30 Oct 2024 14:18:00 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63B75C78023
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 14:17:53 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6e9f69cc576so26472477b3.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 07:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1730297872; x=1730902672;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4HYzZgfoh0GaQkDprol1pWrqKS0v+HpEiGeQ9Nb7j2M=;
 b=nbuFuVXQN56Fj2iu3n3MFHzIqgMt2v2v1t3jWeJS66IJPaTilpRxQ0Ku5cHsYFOTNS
 JExQx/laZkN5acqk14Nb/yyRMEr+VszAUxb+fIY2gcoBxZ7KYGGOy5bklykPJfMebHaf
 9fSxx/B2CvbReohElmEXhBlwH2hZcNd3PnxhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730297872; x=1730902672;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4HYzZgfoh0GaQkDprol1pWrqKS0v+HpEiGeQ9Nb7j2M=;
 b=YiAXC2zWVBVLb9lyb7s5vgbgc+EghcYqg5UC+AKopxeSGtvKCcY36v0Zy0k4OJb91T
 H+FxssbbBshBSKJUWzCi/0AKIKeraWBvS7NUs7iI0uNEQFUw6FJVYWNRraQsPluKDmA7
 S20BTjH6c4Sd5r/cKIs1RJjzuCgHBgGpV0kh3KYaxXPtapXS4NG4I2n7Sx/pWxUDhphQ
 WzOO600pzBZ3E7tFltoU+27ccQXnJdOnETpHaclIhqrtNEVJ7IQxih9F6MCiV7G+ckW9
 wlWdiiFDyfu6HBQaTuzxOytufaLD7A2GOtLZLOaskROGCzDQW2l1MQqbaO1qrzqZw4aD
 S/NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/BgOqJQJuKpVmRNLlBL4Tzx2BSjyoMO1KvVuMLTD0oOx7JmHau2qzOsTzVa0Li+yop7jpCf/RBAMjNQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw0L0sy1kT3j/xyD5aj25ipeT3Swn4WtIhKJAvHhnoXGkeqGaNf
 IX+27Fda+lYJxz3LvUm/G3u2IycUoXt1xKiXX0FybHsMkc8A92Gl3W3ANkNy4F7iK/KO4DDY5Cu
 Duw3wdVEX1p/TqXJjezGpE9x+oGUxECu4A9Jr8Q==
X-Google-Smtp-Source: AGHT+IEHsfGMaPfeQMp4X35GtXF5eGsT1dxDLvpG/oK8cox7xgqmoEcGfy0jLRQmC3LZTquimmQt+W+LZJ6fnBaEr+o=
X-Received: by 2002:a05:690c:45c4:b0:6e3:23df:cc25 with SMTP id
 00721157ae682-6e9d8a76a3emr183562557b3.26.1730297872240; Wed, 30 Oct 2024
 07:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
 <CAMty3ZB3ngMezv9S2XrNjXL69q+z9x-=qnQGga51FgTfA4fanQ@mail.gmail.com>
 <19fc4486-f8fe-4286-8941-76ff2a81b7d9@linaro.org>
In-Reply-To: <19fc4486-f8fe-4286-8941-76ff2a81b7d9@linaro.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 30 Oct 2024 19:47:41 +0530
Message-ID: <CAMty3ZAJrKvUAxWg9CfKtyrjw+WnHOgwkfAJb+N-7d3NyXUrxA@mail.gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Michael Walle <mwalle@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Ashok Reddy Soma <ashok.reddy.soma@amd.com>, Pratyush Yadav <p.yadav@ti.com>,
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

T24gV2VkLCBPY3QgMzAsIDIwMjQgYXQgNDoxNeKAr1BNIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFt
YmFydXNAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPgo+Cj4gT24gMTAvMzAvMjQgMTA6MzMgQU0sIEph
Z2FuIFRla2kgd3JvdGU6Cj4gPiBIaSBNYXJlaywKPiA+Cj4gPiBPbiBTdW4sIE9jdCAyNywgMjAy
NCBhdCAxOjQ44oCvQU0gTWFyZWsgVmFzdXQKPiA+IDxtYXJlay52YXN1dCtyZW5lc2FzQG1haWxi
b3gub3JnPiB3cm90ZToKPiA+Pgo+ID4+IFJlbW92ZSB1bmRvY3VtZW50ZWQgbm9yLT5hZGRyX3dp
ZHRoID09IDMgdGVzdC4gVGhpcyB3YXMgYWRkZWQgaW4gY29tbWl0Cj4gPj4gNWQ0MGIzZDM4NGRj
ICgibXRkOiBzcGktbm9yOiBBZGQgcGFyYWxsZWwgYW5kIHN0YWNrZWQgbWVtb3JpZXMgc3VwcG9y
dCIpCj4gPj4gd2l0aG91dCBhbnkgZXhwbGFuYXRpb24gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLiBS
ZW1vdmUgaXQuCj4gPj4KPiA+PiBUaGlzIGFsc28gaGFzIGEgYmFkIHNpZGUtZWZmZWN0IHdoaWNo
IGJyZWFrcyBSRUFEIG9wZXJhdGlvbiBvZiBldmVyeSBTUEkgTk9SCj4gPj4gd2hpY2ggZG9lcyBu
b3QgdXNlIGFkZHJfd2lkdGggPT0gMywgZS5nLiBzMjVmczUxMnMgZG9lcyBub3Qgd29yayBhdCBh
bGwuIFRoaXMKPiA+PiBpcyBiZWNhdXNlIGlmIGFkZHJfd2lkdGggIT0gMywgcmVtX2JhbmtfbGVu
IGlzIGFsd2F5cyAwLCBhbmQgaWYgcmVtX2JhbmtfbGVuCj4gPj4gaXMgMCwgdGhlbiByZWFkX2xl
biBpcyAwIGFuZCBpZiByZWFkX2xlbiBpcyAwLCB0aGVuIHRoZSBzcGlfbm9yX3JlYWQoKSByZXR1
cm5zCj4gPj4gLUVJTy4KPiA+Pgo+ID4+IEJhc2ljIHJlcHJvZHVjZXIgaXMgYXMgZm9sbG93czoK
PiA+PiAiCj4gPj4gPT4gc2YgcHJvYmUgOyBzZiByZWFkIDB4NTAwMDAwMDAgMCAweDEwMDAwCj4g
Pj4gU0Y6IERldGVjdGVkIHMyNWZzNTEycyB3aXRoIHBhZ2Ugc2l6ZSAyNTYgQnl0ZXMsIGVyYXNl
IHNpemUgMjU2IEtpQiwgdG90YWwgNjQgTWlCCj4gPj4gZGV2aWNlIDAgb2Zmc2V0IDB4MCwgc2l6
ZSAweDEwMDAwCj4gPj4gU0Y6IDY1NTM2IGJ5dGVzIEAgMHgwIFJlYWQ6IEVSUk9SIC01Cj4gPj4g
Igo+ID4+Cj4gPj4gRml4ZXM6IDVkNDBiM2QzODRkYyAoIm10ZDogc3BpLW5vcjogQWRkIHBhcmFs
bGVsIGFuZCBzdGFja2VkIG1lbW9yaWVzIHN1cHBvcnQiKQo+ID4+IFNpZ25lZC1vZmYtYnk6IE1h
cmVrIFZhc3V0IDxtYXJlay52YXN1dCtyZW5lc2FzQG1haWxib3gub3JnPgo+ID4+IC0tLQo+ID4+
IENjOiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT4KPiA+PiBDYzogQXNo
b2sgUmVkZHkgU29tYSA8YXNob2sucmVkZHkuc29tYUBhbWQuY29tPgo+ID4+IENjOiBKYWdhbiBU
ZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KPiA+PiBDYzogTWljaGFlbCBXYWxsZSA8
bXdhbGxlQGtlcm5lbC5vcmc+Cj4gPj4gQ2M6IE1pY2hhbCBTaW1layA8bWljaGFsLnNpbWVrQGFt
ZC5jb20+Cj4gPj4gQ2M6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3Qu
Y29tPgo+ID4+IENjOiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3Qu
Y29tPgo+ID4+IENjOiBQcmF0eXVzaCBZYWRhdiA8cC55YWRhdkB0aS5jb20+Cj4gPj4gQ2M6IFF1
ZW50aW4gU2NodWx6IDxxdWVudGluLnNjaHVsekBjaGVycnkuZGU+Cj4gPj4gQ2M6IFNlYW4gQW5k
ZXJzb24gPHNlYW5nYTJAZ21haWwuY29tPgo+ID4+IENjOiBTaW1vbiBHbGFzcyA8c2pnQGNocm9t
aXVtLm9yZz4KPiA+PiBDYzogVGFrYWhpcm8gS3V3YW5vIDxUYWthaGlyby5LdXdhbm9AaW5maW5l
b24uY29tPgo+ID4+IENjOiBUb20gUmluaSA8dHJpbmlAa29uc3Vsa28uY29tPgo+ID4+IENjOiBU
dWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+Cj4gPj4gQ2M6IFZlbmthdGVz
aCBZYWRhdiBBYmJhcmFwdSA8dmVua2F0ZXNoLmFiYmFyYXB1QGFtZC5jb20+Cj4gPj4gQ2M6IHUt
Ym9vdEBsaXN0cy5kZW54LmRlCj4gPj4gQ2M6IHVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KPiA+PiAtLS0KPiA+Cj4gPiBJcyB0aGlzIHBhdGNoLXNldCBuZXh0IHZlcnNp
b24gZm9yICdwcmV2aW91cycgcmV2ZXJ0ZWQgc2VyaWVzPwo+ID4KPgo+IG15IDJjOiBJIHRoaW5r
IEkgbGVhbiB0b3dhcmRzIHJldmVydGluZyB0aGUgc3RhY2tlZC9wYXJhbGxlbCBzdXBwb3J0Lgo+
IFRoZSBvbmx5IG9uZSB0aGF0IGJlbmVmaXRzIG9mIGlzIEFNRCwgd2hpbGUgYWZmZWN0aW5nIHRo
ZSBjb3JlIGNvZGUKPiBxdWFsaXR5LiBJdCBhbHNvIHNsb3dzIGRvd24gZnVydGhlciBjb250cmli
dXRpb25zIGFuZCBJIGFzc3VtZSBpdAo+IGhhcmRlbnMgbWFpbnRhaW5lcidzIGpvYi4KCkkgZGlk
IHRyeSB0aGlzIGJlZm9yZSBhbmQgaXQgaXMgaGFyZCB0byBzZXBhcmF0ZSBmcm9tIHRoZSBjb3Jl
LiBhbmQgYXQKdGhlIHNhbWUgdGltZSBpdCBpcyBoYXJkIHRvIG1haW50YWluIHRoZSBjb3JlIHRv
by4KCj4KPiBFdmVuIGlmIEkgKHdlPykgaGF2ZW4ndCBtYWRlIG15IG1pbmQgb24gaG93IHRvIGJl
c3QgaW1wbGVtZW50IHRoaXMsIGl0J3MKPiBjbGVhciB0aGF0IGl0IHNoYWxsIGJlIGFib3ZlIFNQ
SSBOT1Igd2l0aG91dCBhZmZlY3RpbmcgY3VycmVudCBkZXZpY2VzLgo+Cj4gTm90IHN1cmUgaWYg
aXQncyBmaW5lIHRvIHJldmVydCBldmVyeXRoaW5nLCBoYXZlbid0IGZvbGxvd2VkIHUtYm9vdAo+
IGxhdGVseSwgeW91ciBjaG9pY2UgdG8gbWFrZS4KCklmIHdlIGZpbmQgYSB3YXkgKG5vdCBzdXJl
IGlmIGl0J3MgcG9zc2libGUpIHNlcGFyYXRlIGxpa2UgYSB3cmFwcGVyCm9yIGZpeCB0aGUgdGhp
bmdzIHdpdGhvdXQgcmV2ZXJ0IC0gdGhlc2UgYXJlIHR3byBwb2ludHMgSSBjYW4gc2VlIGFzCm9m
IG5vdy4KCkphZ2FuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

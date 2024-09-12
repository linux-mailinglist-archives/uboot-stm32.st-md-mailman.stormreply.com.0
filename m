Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 838A5975E49
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Sep 2024 03:00:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3724EC6C855;
	Thu, 12 Sep 2024 01:00:40 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0043C57194
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Sep 2024 01:00:32 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-718d6ad6050so319149b3a.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Sep 2024 18:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1726102831; x=1726707631;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qN9BG419/gWkhYof1uI+wL0WMyUhWbwlAHezuR7Fmkk=;
 b=e2y7nke7OuL1OhkNONkCEvicMuUIqGtgZvzt0eLh61Klu55JqH7t/HCNvRDqzvJ7do
 jaDci+6KF5ZX4madP60v2UwzHDdKyawk+dlKJJWBpht41sO9Iiso2cLZHiHrKtJDE28u
 Gm2eBHX8zYhrvmdtejXnhn6eE0/zxK5qcMO9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726102831; x=1726707631;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qN9BG419/gWkhYof1uI+wL0WMyUhWbwlAHezuR7Fmkk=;
 b=MG0FCNz2wb7t06Z8JazpG34U1F0vnYMmst6Obx8EHv7TdXF968NuyPBYhjCBl7vcgs
 KicGiI3lGjuu6Q1rCvzl4ydu3fw2Qcp0STviWgm6Ea3H0HPS9NGGV7r1SG0XRCXGCv5h
 1EfNu4XNlmj2f2I8W8GalQWBs8dEQ8qlZG7b//lOjjHo25jigBwo7wDs6ehcD3oXil51
 ESLlgPZm9kZ5bvMBwIaAfZxDiv7paErdt8MFaftSK/TvMp7nscqXd3qfIrG1y1h+3UTe
 cZ00XqF4ktnKjmKC7+bWKIyDSDkI/QmAPiPoH3eJyalrEJoE2O2THsyyKf2tPsxPd8BK
 JpTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH8SXpd8wd2/0XH7mzLLhT3lfXHct6Hm9wDDbjvZt4o0mzpzNaJ2dFVhmICKG/YNdS1optAjq9VuWRdg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwTtze7Daem+RitzBJ7YDpOJvy3xwGjUJMab9q1Z9XI9Vu8NfUr
 CcC8enhMSE5IMmadtRQaUaL+deDFNYoxpL6XZkAugPIdpatYant3akJ86WjIqqUusnbOzYDvcvw
 CNa6oRzddfmkGAxMYB8Oi+gc5gMPPmmh+Wht+
X-Google-Smtp-Source: AGHT+IHiZu33iyo5NkYXLR10lf3TGbBLsugivLlPbQCG8ZJQZRsS1XrZEVvn1jS5UzwjPUm7S+jbsNX9LD2ncgcyKAo=
X-Received: by 2002:a05:6a00:4f8b:b0:70d:2796:bce8 with SMTP id
 d2e1a72fcca58-719261e794fmr1813501b3a.20.1726102831104; Wed, 11 Sep 2024
 18:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAPVz0n3Ji1sKQK+Lnq8rP3ZqwX3o-kXe2btj93UuVBa3T5C=qw@mail.gmail.com>
 <eced1020-2157-44a4-98a9-845e218529d9@denx.de>
 <45c74c58-98cf-43df-b837-c48b0341c551@denx.de>
 <CAPVz0n2-DCKDcVrAi00kF6yDcE2bN1mtUhzBcw7JDiZoXgzu0w@mail.gmail.com>
 <e5837ce4-0a14-4822-960d-6ab667a9f4b1@denx.de>
 <CAPVz0n323ktF6kb3WHR9JcE+xOzQr9-aWOR47+ZvwQr=ib18rg@mail.gmail.com>
 <f778366b-bdaf-415d-a94e-c995f62e8c71@denx.de>
 <CAPVz0n0ru1rPb9SNw515mkwfs4=nNSOPjZY74JVkqnGbEouSLQ@mail.gmail.com>
 <cfc1a158-6c35-4288-aed0-fcc78a8db832@denx.de>
 <CAPVz0n1Vh7Vgnt8_Lx6U8p42QvtVnHB9yvb=RmjYrS=w1G3u1A@mail.gmail.com>
 <20240911162503.GQ4252@bill-the-cat>
In-Reply-To: <20240911162503.GQ4252@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 11 Sep 2024 18:59:59 -0600
Message-ID: <CAFLszTjsJFmdsTUEOC-uFKUMyQDJkLhzvcyrSTSFhLF4L=Cp6w@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Marek Vasut <marex@denx.de>, Sumit Garg <sumit.garg@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
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

SGkgVG9tLAoKT24gV2VkLCAxMSBTZXB0IDIwMjQgYXQgMTA6MjUsIFRvbSBSaW5pIDx0cmluaUBr
b25zdWxrby5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBTZXAgMTEsIDIwMjQgYXQgMDI6MTI6MTJQ
TSArMDMwMCwgU3Z5YXRvc2xhdiBSeWhlbCB3cm90ZToKPiA+INGB0YAsIDExINCy0LXRgC4gMjAy
NOKAr9GALiDQviAxNDowMSBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4g0L/QuNGI0LU6Cj4g
PiA+Cj4gPiA+IE9uIDkvMTEvMjQgNzo1NyBBTSwgU3Z5YXRvc2xhdiBSeWhlbCB3cm90ZToKPiA+
ID4KPiA+ID4gWy4uLl0KPiA+ID4KPiA+ID4gPj4+PiBZb3UgZGlkIG1lbnRpb24gc29tZXRoaW5n
IHJlZ2FyZGluZyBJMkMvUE1JQyBkcml2ZXIgcHJvYmUgdGltaW5nLCBidXQgaXQKPiA+ID4gPj4+
PiBzZWVtcyB0aGUgSTJDIGRyaXZlciBhbmQgUE1JQyBkcml2ZXJzIHByb2JlIHJvdWdobHkgYXJv
dW5kIHRoZSBzYW1lIHRpbWUKPiA+ID4gPj4+PiBpbiBib3RoIHBhc3MgYW5kIGZhaWwgY2FzZXMg
Pwo+ID4gPiA+Pj4KPiA+ID4gPj4+IFllcywgaGVyZSBJIGFncmVlIHRoYXQgdGhleSBib3RoIHBy
b2JlIGFuZCBwcm9iZSBwYXNzZXMsIGJ1dCBJIGFzc3VtZQo+ID4gPiA+Pj4gdGltaW5nIG9mIGky
YyBjYWxsIGlzIGNyaXRpY2FsIGFuZCB0aGVyZSBtYXkgYmUgc29tZSBkZXBlbmRlbmN5IHdoaWNo
Cj4gPiA+ID4+PiBpcyBub3QgcmVhZHkuCj4gPiA+ID4+Cj4gPiA+ID4+IE15IGd1ZXNzIHdvdWxk
IGJlIHBpbm11eCBvciBjbG9jaywgbWF5YmUgdGhlIGkyYyBjb250cm9sbGVyIGlzIG1hcmtlZCBh
cwo+ID4gPiA+PiBib290cGgtKiBpbiBEVCBhbmQgaXRzIHBpbm11eC9jbG9jayBpcyBub3Q/IE1h
eWJlIHRoZSBpMmMgb24gdGVncmEgd29ya3MKPiA+ID4gPj4gYnkgc2hlZXIgY29pbmNpZGVuY2Ug
cmlnaHQgbm93PyBDYW4geW91IGhhdmUgYSBsb29rPwo+ID4gPiA+Cj4gPiA+ID4gUG93ZXIgaTJj
IGxpbmUgKG9uZSB0aGF0IGhvc3RzIFBNSUMpIGlzIGNvbmZpZ3VyZWQgZXh0cmVtZWx5IGVhcmx5
IGluCj4gPiA+ID4gU1BMIHNpbmNlIGl0IGlzIG5lZWRlZCBmb3IgY3B1IGFuZCBjb3JlIHZvbHRh
Z2Ugc2V0dXAgc28gZXZlbiBpZiwgYXMKPiA+ID4gPiB5b3Ugc2F5LCB0ZWdyYSB3b3JrcyBieSBz
aGVlciBjb2luY2lkZW5jZSwgc3BlY2lmaWNhbGx5IHRoaXMgaTJjIGxpbmUKPiA+ID4gPiBzaG91
bGQgd29yayBub24gdGhlIGxlc3MsIHNpbmNlIGl0IGhhcyBhbGwgaXRzIHByZS1yZXF1aXNpdGVz
IChjbG9jawo+ID4gPiA+IGFuZCBwaW5tdXgpIGNvbmZpZ3VyZWQgb24gZWFybHkgc3RhZ2UuCj4g
PiA+Cj4gPiA+IElzIGl0IHBvc3NpYmxlIHRoYXQgdGhpcyBjb25maWd1cmF0aW9uIGlzIHNvbWVo
b3cgcmVzZXQgb3IgcmVjb25maWd1cmVkCj4gPiA+IGZyb20gRFQgZWFybHkgb24gaW4gVS1Cb290
IHByb3BlciA/Cj4gPgo+ID4gTm8KPiA+Cj4gPiA+IERvIHlvdSBoYXZlIHNlcmlhbCBjb25zb2xl
IG91dHB1dCBpbiBib2FyZF9mLmMgdGltZSBpbiBVLUJvb3QgcHJvcGVyICwKPiA+ID4gcG9zc2li
bHkgdXNpbmcgREVVQkdfVUFSVCAsIHRvIGNoZWNrIGlmIHRoZXJlIG1pZ2h0IGJlIHNvbWUgcHJp
b3IKPiA+ID4gZmFpbGluZyBJMkMgdHJhbnNmZXIgYXQgdGhhdCBib2FyZF9mLmMgdGltZSA/Cj4g
Pgo+ID4gSGF2ZW4ndCBzcG90dGVkIGFueXRoaW5nIHdlaXJkIHRoZXJlLgo+ID4KPiA+ID4gPiBB
cyBJIGhhdmUgdG9sZCwgSSB3YXMgbm90IGFibGUgdG8gZGV0ZXJtaW5lIGV4YWN0IHJlYXNvbiB3
aHkgdGhpcwo+ID4gPiA+IGhhcHBlbnMsIGl0IHNob3VsZCBub3QgYW5kIHlldCBpdCBkb2VzLiBU
aGlzIGlzIHdoeSBJIGhhdmUgYWJhbmRvbmVkCj4gPiA+ID4gbXkgYXR0ZW1wdCB0byBpbXBsZW1l
bnQgc2FtZSBjaGFuZ2VzIHlvdSBhcmUgY3VycmVudGx5IHByb3Bvc2luZy4KPiA+ID4KPiA+ID4g
SWYgdGVncmEgaGFzIGEgcHJvYmxlbSwgaXQgc2hvdWxkIGJlIGZpeGVkIG9uIHRlZ3JhIHNpZGUg
YW5kIG5vdCBibG9jawo+ID4gPiBjb3JlIHBsdW1iaW5nLiBJIGFtIG5vdCBzZWVpbmcgdGhlIHBy
b2JsZW0gb24gc3RtMzIgb3IgaW14IHN5c3RlbXMsIHNvIEkKPiA+ID4gYW0gYmFua2luZyB0b3dh
cmQgdGVncmEtc3BlY2lmaWMgaXNzdWUuCj4gPiA+Cj4gPgo+ID4gQW5kIHlldCB5b3UgYXJlIHB1
c2hpbmcgdGVncmEgYnJlYWtpbmcgc3R1ZmYuIEkgd2lsbCBpbnNpc3Qgb24KPiA+IHJldmVydGlu
ZyB0aGlzIGlzIGl0IHBhc3Nlcy4KPiA+Cj4gPiA+IEFyZSB5b3UgYWJsZSB0byBkZWJ1ZyB0aGlz
ID8KPiA+Cj4gPiBObywgSSBhbSBub3QgYWJsZSBmaW5kIGV4YWN0IGN1c2Ugb2YgdGhpcyBiZWhh
dmlvci4KPgo+IEhvdyBkbyB5b3UgcHJvcG9zZSB3ZSByZXNvbHZlIHRoaXMgdGhlbiwgU3Z5YXRv
c2xhdj8gSSB0aHJldyB0aGlzIHBhdGNoCj4gYXQgc29tZSBUSSBwbGF0Zm9ybXMgYXMgd2VsbCBh
bmQgdGhleSdyZSBhbGwgZmluZS4gQXJlIHlvdSB1bmFibGUgdG8gZ2V0Cj4gc29tZSBlYXJseSBk
ZWJ1Z2luZyBpbmZvcm1hdGlvbiBvdXQgbGlrZSBNYXJlayB3YXMgYXNraW5nPyBUaGFua3MuCgpB
dCB0aGlzIHBvaW50IEkgd291bGQgbGlrZSB0byBoYXZlIGFuIG9wdGlvbmFsIEtjb25maWcgdG8g
ZW5hYmxlIHRoZQphbHdheXMtb24gcmVndWxhdG9ycyBpbiB0aGUgaW5pdCBzZXF1ZW5jZSwgcGVy
aGFwcyBhcyBwYXJ0IG9mCmluaXRmX2RtKCkuIEl0IHNob3VsZCBub3QgYmUgaW4gRE0gY29yZSwg
c29ycnkuCgoKPiAtLQo+IFRvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

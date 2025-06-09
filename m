Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 073A5AD1F77
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Jun 2025 15:46:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B302FC32E8F;
	Mon,  9 Jun 2025 13:46:41 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D790C349C5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jun 2025 13:46:40 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e818a572828so3244451276.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Jun 2025 06:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1749476799; x=1750081599;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NHNtEv6GUHFHoLc/4f6bjebbun7rJWirlIrwg3vfsHM=;
 b=fwMfsUFGqEwBlUE07yAXzHcG6FSB3wXgVDtI0BCwRfH0KQjpCs9p+WyGMBQXTX81px
 7Z49cVd0uhw9sMreJ8qsWrMp5qvyO1/lX/w+mczBlXC7Y6JVKr7S5T4qldG6/apGqTxK
 tGdB1swZ0A2eAKOP1Yw+OFboh8kGFoll/V+YA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749476799; x=1750081599;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NHNtEv6GUHFHoLc/4f6bjebbun7rJWirlIrwg3vfsHM=;
 b=Tuzac8Mq/r0Pb500XvT/C7keYu+e/Iu2lbemMAeJrESOYvrzfFoxBiWBgL34uqvNdz
 p2ME/l2bu9Qf0Bc1D7Tq/rsSHk66FG8gNX5gnvsSyyyWF0GOglxzxqpQ12AuL5qwiThe
 dNPbSyiQ9qRibZGOJ1+TfZ1W5xxyCU2hmNVRI1KFqZTjpIXfh8W+TbsxZOVs8aCku+Nn
 xUsNGdoj78waOHWhn4Shw9Y51hKMxrInQhuVrkphp1D4RHd1v2Zm8ifXeot//dddue1n
 SBz9UOwWVOgStferxpZUC7AWsRcYwyzNmkCkZFi+ny5f9qL8bsJPRIBCV6EivYlyZhJO
 YraA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPSjWCESW6Z3L+pFNsXCPiVBh96mEBswV0ihBRibbB+fhG6vkwrFJ7N4/fDBEObqrSQmvdaNuhSHZvHg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzhLVIgp3rGLaZEZA+5NfB8gsJGW4hkr3kjxlynCCTMJK+QSy5s
 GRK6Wv5Xoi2OMVTiqcCErUHYA6rUDeA0aksRJNMZIqk4M1yAJvkeGWEoxNaBsgWk5wwu7lwumEQ
 vVKVcZ4gOkl7Z8ExWA2sr2C2r25+h4RohyzPCKVdBjg==
X-Gm-Gg: ASbGncuQkJzVHiZcj6tIAYAMcsERrDlTpJUvsz76uBTlB9sQo66ZPBxrmizn5d6NU4Q
 KLr6N5x61basKJK6RUqeXxlt3oNU2UjpXMZpS8Ff2+q/VjC+8EWh/JQ0RRGPFpaxXBr78JFhTAl
 KxRyj3dmqwG5hGrPhyGj5dK1IhuDVRoQ==
X-Google-Smtp-Source: AGHT+IHAoO3T2+5L6fIqX4FaWxHP4DyUt4F6Vs/XbbVOKdWjzW6PaZeiOQ2b18yHJK6r94R35DXbjfS98oqZJh999UY=
X-Received: by 2002:a05:6902:e02:b0:e81:347a:2a9c with SMTP id
 3f1490d57ef6-e81a20d37e2mr18567465276.7.1749476799047; Mon, 09 Jun 2025
 06:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
 <dc8bb4a3-c465-4ae0-a61d-bb2f74a42b64@foss.st.com> <aEbgxo0WUDPd-S8Z@sumit-X1>
In-Reply-To: <aEbgxo0WUDPd-S8Z@sumit-X1>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 9 Jun 2025 15:46:27 +0200
X-Gm-Features: AX0GCFtTDCAfN-0SAn9TfxclWY59BUCyNHLlf7ttWAVDH7HslvpIgrTjmtUK7ao
Message-ID: <CABGWkvox-1a1VSGjX8toQ=WsVTma0JcL8su=MGWaAwq4UZFkrQ@mail.gmail.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 linux-amarula@amarulasolutions.com,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>, u-boot@lists.denx.de,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Sean Anderson <seanga2@gmail.com>,
 Dillon Min <dillon.minfei@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 0/9] Support stm32h747-discovery board
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

SGkgU3VtaXQsCgpPbiBNb24sIEp1biA5LCAyMDI1IGF0IDM6MjXigK9QTSBTdW1pdCBHYXJnIDxz
dW1pdC5nYXJnQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGF0cmljZSwKPgo+IE9uIE1vbiwg
SnVuIDA5LCAyMDI1IGF0IDAzOjE1OjE0UE0gKzAyMDAsIFBhdHJpY2UgQ0hPVEFSRCB3cm90ZToK
PiA+Cj4gPgo+ID4gT24gNi83LzI1IDExOjM3LCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPiA+ID4g
VGhlIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHN0bTMyaDc0Ny1kaXNjb3ZlcnkgYm9hcmQuCj4g
PiA+Cj4gPiA+IERldGFpbGVkIGluZm9ybWF0aW9uIGNhbiBiZSBmb3VuZCBhdDoKPiA+ID4gaHR0
cHM6Ly93d3cuc3QuY29tL2VuL2V2YWx1YXRpb24tdG9vbHMvc3RtMzJoNzQ3aS1kaXNjby5odG1s
Cj4gPiA+Cj4gPiA+Cj4gPiA+IERhcmlvIEJpbmFjY2hpICg5KToKPiA+ID4gICBBUk06IGR0czog
c3RtMzJoNy1waW5jdHJsOiBhZGQgX2Egc3VmZml4IHRvIHVbc11hcnRfcGlucyBwaGFuZGxlcwo+
ID4gPiAgIGR0LWJpbmRpbmdzOiBhcm06IHN0bTMyOiBhZGQgY29tcGF0aWJsZSBmb3Igc3RtMzJo
NzQ3aS1kaXNjbyBib2FyZAo+ID4gPiAgIGR0LWJpbmRpbmdzOiBjbG9jazogc3RtMzJoNzogcmVu
YW1lIFVTQVJUezcsOH1fQ0sgdG8gVUFSVHs3LDh9X0NLCj4gPiA+ICAgQVJNOiBkdHM6IHN0bTMy
OiBhZGQgdWFydDggbm9kZSBmb3Igc3RtMzJoNzQzIE1DVQo+ID4gPiAgIEFSTTogZHRzOiBzdG0z
MjogYWRkIHBpbiBtYXAgZm9yIFVBUlQ4IGNvbnRyb2xsZXIgb24gc3RtMzJoNzQzCj4gPiA+ICAg
QVJNOiBkdHM6IHN0bTMyOiBhZGQgYW4gZXh0cmEgcGluIG1hcCBmb3IgVVNBUlQxIG9uIHN0bTMy
aDc0Mwo+ID4gPiAgIEFSTTogZHRzOiBzdG0zMjogc3VwcG9ydCBTVE0zMmg3NDdpLWRpc2NvIGJv
YXJkCj4gPiA+ICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgc3RtMzJoNzQ3aS1kaXNjby11LWJvb3Qg
RFRTIGZpbGUKPiA+ID4gICBib2FyZDogc3RtMzI6IGFkZCBzdG0zMmg3NDctZGlzY292ZXJ5IGJv
YXJkIHN1cHBvcnQKPiA+Cj4gPgo+ID4gSGkgRGFyaW8KPiA+Cj4gPiBGb3IgdGhlIHdob2xlIHNl
cmllcwo+ID4gQXBwbGllZCB0byB1LWJvb3Qtc3RtMzIvbmV4dAo+Cj4gUGxlYXNlIGdpdmUgc29t
ZSB0aW1lIGZvciBvdGhlciBtYWludGFpbmVycyB0byByZXZpZXcgdGhpcyBwYXRjaC1zZXQuCj4g
VGhlIGR0cy91cHN0cmVhbSBwYXRjaGVzIGluIHRoaXMgc2VyaWVzIGFyZW4ndCBjbGVhbiBjaGVy
cnkgcGljayBmcm9tCj4gdXBzdHJlYW0uCgpBbGwgdGhlIGNvbW1pdHMgYXJlIGFscmVhZHkgaW4g
dGhlIG1haW5saW5lIExpbnV4IGtlcm5lbCwgc3BlY2lmaWNhbGx5CmluIHY2LjE2LXJjMS4KSWYg
eW91J3JlIHJlZmVycmluZyB0byB0aGUgZmFjdCB0aGF0IHRoZSBwYXRjaGVzIGNhbid0IGJlIGFw
cGxpZWQKY2xlYW5seSwgSSBiZWxpZXZlIGl0J3MKYmVjYXVzZSB0aGUgdGFyZ2V0IHBhdGggaW4g
dGhlIExpbnV4IGtlcm5lbCBkb2Vzbid0IG1hdGNoIHRoZSBvbmUgaW4gVS1Cb290LgpJbiBmYWN0
LCB0aGUgRFRTIGZpbGVzIGFyZSBsb2NhdGVkIGluIHR3byBkaWZmZXJlbnQgcmVsYXRpdmUgcGF0
aHMuCgpUaGFua3MgYW5kIHJlZ2FyZHMsCkRhcmlvCgo+IFRoaXMgaGFzIHRvIGJlIGZpeGVkIGFz
IG90aGVyd2lzZSByYW5kb20gcGF0Y2hlcyBhcmUgZ29pbmcgdG8KPiBjYXVzZSBEVCBzeW5jIGlz
c3Vlcy4KPgo+IC1TdW1pdAo+Cj4gPgo+ID4gVGhhbmtzCj4gPiBQYXRyaWNlCj4gPgo+ID4gPgo+
ID4gPiAgYXJjaC9hcm0vZHRzL3N0bTMyaDc0N2ktZGlzY28tdS1ib290LmR0c2kgICAgIHwgMTA0
ICsrKysrKysrKysrKysrCj4gPiA+ICBhcmNoL2FybS9tYWNoLXN0bTMyL3N0bTMyaDcvS2NvbmZp
ZyAgICAgICAgICAgfCAgIDQgKwo+ID4gPiAgYm9hcmQvc3Qvc3RtMzJoNzQ3LWRpc2NvL0tjb25m
aWcgICAgICAgICAgICAgIHwgIDE1ICsrCj4gPiA+ICBib2FyZC9zdC9zdG0zMmg3NDctZGlzY28v
TUFJTlRBSU5FUlMgICAgICAgICAgfCAgIDcgKwo+ID4gPiAgYm9hcmQvc3Qvc3RtMzJoNzQ3LWRp
c2NvL01ha2VmaWxlICAgICAgICAgICAgIHwgICA2ICsKPiA+ID4gIGJvYXJkL3N0L3N0bTMyaDc0
Ny1kaXNjby9zdG0zMmg3NDctZGlzY28uYyAgICB8ICA0MiArKysrKysKPiA+ID4gIGNvbmZpZ3Mv
c3RtMzJoNzQ3LWRpc2NvX2RlZmNvbmZpZyAgICAgICAgICAgICB8ICAzNSArKysrKwo+ID4gPiAg
ZHJpdmVycy9jbGsvc3RtMzIvY2xrLXN0bTMyaDcuYyAgICAgICAgICAgICAgIHwgICA1ICsKPiA+
ID4gIGR0cy91cHN0cmVhbS9CaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbCAgICB8ICAgNCAr
Cj4gPiA+ICAuLi4vaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zdG0zMmg3LWNsa3MuaCAgfCAg
IDQgKy0KPiA+ID4gIGR0cy91cHN0cmVhbS9zcmMvYXJtL3N0L3N0bTMyaDctcGluY3RybC5kdHNp
ICB8ICAzNCArKysrLQo+ID4gPiAgZHRzL3Vwc3RyZWFtL3NyYy9hcm0vc3Qvc3RtMzJoNzQzLmR0
c2kgICAgICAgIHwgICA4ICsrCj4gPiA+ICBkdHMvdXBzdHJlYW0vc3JjL2FybS9zdC9zdG0zMmg3
NDNpLWRpc2NvLmR0cyAgfCAgIDIgKy0KPiA+ID4gIGR0cy91cHN0cmVhbS9zcmMvYXJtL3N0L3N0
bTMyaDc0M2ktZXZhbC5kdHMgICB8ICAgMiArLQo+ID4gPiAgZHRzL3Vwc3RyZWFtL3NyYy9hcm0v
c3Qvc3RtMzJoNzQ3aS1kaXNjby5kdHMgIHwgMTM2ICsrKysrKysrKysrKysrKysrKwo+ID4gPiAg
ZHRzL3Vwc3RyZWFtL3NyYy9hcm0vc3Qvc3RtMzJoNzUwaS1hcnQtcGkuZHRzIHwgICA2ICstCj4g
PiA+ICBpbmNsdWRlL2NvbmZpZ3Mvc3RtMzJoNzQ3LWRpc2NvLmggICAgICAgICAgICAgfCAgMzIg
KysrKysKPiA+ID4gIDE3IGZpbGVzIGNoYW5nZWQsIDQzNSBpbnNlcnRpb25zKCspLCAxMSBkZWxl
dGlvbnMoLSkKPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9kdHMvc3RtMzJoNzQ3
aS1kaXNjby11LWJvb3QuZHRzaQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3N0L3N0
bTMyaDc0Ny1kaXNjby9LY29uZmlnCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvc3Qv
c3RtMzJoNzQ3LWRpc2NvL01BSU5UQUlORVJTCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYm9h
cmQvc3Qvc3RtMzJoNzQ3LWRpc2NvL01ha2VmaWxlCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
Ym9hcmQvc3Qvc3RtMzJoNzQ3LWRpc2NvL3N0bTMyaDc0Ny1kaXNjby5jCj4gPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgY29uZmlncy9zdG0zMmg3NDctZGlzY29fZGVmY29uZmlnCj4gPiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgZHRzL3Vwc3RyZWFtL3NyYy9hcm0vc3Qvc3RtMzJoNzQ3aS1kaXNjby5k
dHMKPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2NvbmZpZ3Mvc3RtMzJoNzQ3LWRp
c2NvLmgKPiA+ID4KCgoKLS0gCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVtYmVkZGVkIExpbnV4
IERldmVsb3BlcgoKZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0aW9ucyBTUkwKClZpYSBM
ZSBDYW5ldmFyZSAzMCwgMzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoKVC4gKzM5IDA0MiAyNDMg
NTMxMAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3Rt
MzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJv
b3Qtc3RtMzIK

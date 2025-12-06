Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC7BCAC642
	for <lists+uboot-stm32@lfdr.de>; Mon, 08 Dec 2025 08:44:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5D2CC5A4CA;
	Mon,  8 Dec 2025 07:44:13 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EB0AC35E2B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Dec 2025 18:18:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 396D74E41A92;
 Sat,  6 Dec 2025 18:18:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 092BE606AC;
 Sat,  6 Dec 2025 18:18:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 40505102F1956; Sat,  6 Dec 2025 19:18:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765045109; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=KntAam1pk9/fgU0GHYUwLx7EDdpTpCo7DQotlL0soZQ=;
 b=VU08MoflJkQZmitDMweJtqjbFDHMGqJ8ogz61t9YPmVPtP5m3c2+giyNHps6Zch+6ATmTU
 YnfaFvdK6SAH92zcSTLt58tc8OxGHbkJ+4o439yIrh4TZRqF1WJoyzmIlWmV7ItbAdlngl
 rqz2C6krVwGGjVxRDCniL212Rg4WETlfE7PIgYSITSJJc56/N5GRjju1+tKtykBVgCsRCY
 l6ba1zdzhYnqXMzyhkF9DbmN7rXnXD8bhEbcOTwyn6Yw1cjUKJ7CtNuENr8gW3gqsQ6y65
 ZEP54GcZKKUJIFnQmDm+FHdEd+LNbeaTRviKFv3cTVStUq6GAZ6as5K/9YsQog==
Message-ID: <04500684-5d95-4b2b-abf9-32a5a31a9dc4@bootlin.com>
Date: Sat, 6 Dec 2025 19:18:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Heiko Schocher <hs@nabladev.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
References: <20251205133641.2052099-1-richard.genoud@bootlin.com>
 <d9943642-1cce-4513-8334-1ba3d675d9da@foss.st.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <d9943642-1cce-4513-8334-1ba3d675d9da@foss.st.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Mon, 08 Dec 2025 07:44:12 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH] i2c: stm32f7_i2c: save some ms in
 stm32_i2c_choose_solution
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

TGUgMDUvMTIvMjAyNSDDoCAxNzo0OSwgUGF0cmljZSBDSE9UQVJEIGEgw6ljcml0wqA6Cj4gCj4g
Cj4gT24gMTIvNS8yNSAxNDozNiwgUmljaGFyZCBHZW5vdWQgd3JvdGU6Cj4+IEluIHN0bTMyX2ky
Y19jaG9vc2Vfc29sdXRpb24sIHRoZSBkb3VibGUgbG9vcCBjb250aW51ZXMgZXZlbiBhZnRlciBh
Cj4+IHNvbHV0aW9uIGlzIGZvdW5kLgo+Pgo+PiBCcmVha2luZyBvdXQgb2YgdGhpcyBkb3VibGUg
bG9vcCBvbmNlIGEgc29sdXRpb24gaXMgZm91bmQgcGVybWl0cyB0bwo+PiBnYWluIHNvbWUgcHJl
Y2lvdXMgbXMuCj4+Cj4+IFRoaXMgc2F2ZXMgYWJvdXQgMTNtcyBpbiBVLUJvb3QuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IFJpY2hhcmQgR2Vub3VkIDxyaWNoYXJkLmdlbm91ZEBib290bGluLmNvbT4K
Pj4gLS0tCj4+ICAgZHJpdmVycy9pMmMvc3RtMzJmN19pMmMuYyB8IDIgKysKPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9z
dG0zMmY3X2kyYy5jIGIvZHJpdmVycy9pMmMvc3RtMzJmN19pMmMuYwo+PiBpbmRleCAzZjUxYjFk
ZDFkYjQuLmNiNWUyYzBlMzFlNSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9pMmMvc3RtMzJmN19p
MmMuYwo+PiArKysgYi9kcml2ZXJzL2kyYy9zdG0zMmY3X2kyYy5jCj4+IEBAIC02NTEsMTEgKzY1
MSwxMyBAQCBzdGF0aWMgaW50IHN0bTMyX2kyY19jaG9vc2Vfc29sdXRpb24odTMyIGkyY2NsaywK
Pj4gICAJCQkJCQl2LT5zY2xoID0gaDsKPj4gICAJCQkJCQlzb2xfZm91bmQgPSB0cnVlOwo+PiAg
IAkJCQkJCW1lbWNweShzLCB2LCBzaXplb2YoKnMpKTsKPj4gKwkJCQkJCWdvdG8gZW5kX2xvb3A7
Cj4+ICAgCQkJCQl9Cj4+ICAgCQkJCX0KPj4gICAJCQl9Cj4+ICAgCQl9Cj4+ICAgCX0KPj4gK2Vu
ZF9sb29wOgo+PiAgIAo+PiAgIAlpZiAoIXNvbF9mb3VuZCkgewo+PiAgIAkJbG9nX2Vycigibm8g
c29sdXRpb24gYXQgYWxsXG4iKTsKPj4KPj4gYmFzZS1jb21taXQ6IGM1ZTZkMmFiN2ViYTY4Y2Jm
YjYwMGNkYzEzMWMwYzM3NWNlZDJlYzkKPiAKPiAKPiBIaSBSaWNoYXJkCj4gCj4gSWYgaSBoYXZl
IHdlbGwgdW5kZXJzdG9vZCB0aGUgYWxnb3JpdGhtLCB0aGUgb3JpZ2luYWwgaW1wbGVtZW50YXRp
b24gc2VsZWN0cyB0aGUgKmJlc3QqIHNvbHV0aW9uCj4gd2hlcmVhcyB3aXRoIHlvdXIgcGF0Y2gs
IHRoZSBhbGdvcml0aG0gc2VsZWN0cyB0aGUgKmZpcnN0KiBzb2x1dGlvbi4KPiAKPiBQYXRyaWNl
CgpIdW0sIGluZGVlZC4gVGhlIHNvbHV0aW9uIHdpdGggdGhlIGxlc3NlciBlcnJvciBpcyBzZWxl
Y3RlZC4KSSdsbCBoYXZlIHRvIHN0dWR5IHRoaXMgYWxnb3JpdGhtIGEgbGl0dGxlIGJpdCBtb3Jl
IHRvIHNlZSBpdCB3ZSBjYW4gCnRha2Ugc29tZSBzaG9ydGN1dC4KClRoYW5rcyEKClJlZ2FyZHMs
ClJpY2hhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vdWJvb3Qtc3RtMzIK

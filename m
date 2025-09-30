Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63784BABFB0
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Sep 2025 10:17:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C9B6C3F93C;
	Tue, 30 Sep 2025 08:17:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E40BC36B1F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 08:17:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 54964C0245C;
 Tue, 30 Sep 2025 08:16:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D4F0D606E4;
 Tue, 30 Sep 2025 08:17:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 46D1B102F176F; 
 Tue, 30 Sep 2025 10:16:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759220228; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=VnYS36EZv1J+QEb60PCk+tsRuaeFe9/jiU5uW3UhX14=;
 b=R0lznwep0TsovGVoVj5Fzt8rKGAU7gcVa2/MuODU0+zUcttTrXn2GpRD0OPAL6v10+TAxB
 kXOxdYttZUZ6GZxyKYYMfQ8T6WcUBRZ7g3nMceN+mGZIdGJxZDNfKG2gbd9oGeKIJ5f8mh
 BBX25+u8n8HNUXxej1Ub5AARuuEVO0/XK6E0I8OLHk/YnP2dvf0PNWUWBiA6oT00g6e9at
 rXcFUQPF+cFE0wX7ufy9/WEQQ8a7PPEob8PW6JrkrFAd9U1WuaAR/ejgD/9+GNzNCHgXqY
 b6/wRfA7yeeTwIaWPhmtQWUSAuvNEwvh0LtrOi+y9VWmkujU3LL250AI5PA+cA==
Date: Tue, 30 Sep 2025 10:16:56 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <20250930101656.28f4bcd0@kmaincent-XPS-13-7390>
In-Reply-To: <fd32f45e-a3c9-4170-8886-5a31dda0e4c9@foss.st.com>
References: <20250917141736.59732-1-kory.maincent@bootlin.com>
 <55d0805b-dcb2-4277-a4da-f4c26b48a2dd@foss.st.com>
 <20250929170912.3bee3f9d@kmaincent-XPS-13-7390>
 <fd32f45e-a3c9-4170-8886-5a31dda0e4c9@foss.st.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, u-boot@lists.denx.de,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, thomas.petazzoni@bootlin.com,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] Revert "board: st: stm32mp1: Clean
	env_get_location()"
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

T24gVHVlLCAzMCBTZXAgMjAyNSAwOTo0NTowOCArMDIwMApQYXRyaWNlIENIT1RBUkQgPHBhdHJp
Y2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IE9uIDkvMjkvMjUgMTc6MDksIEtvcnkg
TWFpbmNlbnQgd3JvdGU6Cj4gPiBPbiBUaHUsIDE4IFNlcCAyMDI1IDE2OjE2OjM1ICswMjAwCj4g
PiBQYXRyaWNlIENIT1RBUkQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4g
PiAgIAo+ID4+IE9uIDkvMTcvMjUgMTY6MTcsIEtvcnkgTWFpbmNlbnQgd3JvdGU6ICAKPiAgWy4u
Ll0gIAo+ID4gICAKPiA+PiBSZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNo
b3RhcmRAZm9zcy5zdC5jb20+ICAKPiA+IAo+ID4gSGVsbG8sCj4gPiAKPiA+IEFueSBuZXdzIGZy
b20gdGhlIG1haW50YWluZXJzPyBJcyB0aGVyZSBhIHJlYXNvbiBmb3Igbm90IGJlaW5nIG1lcmdl
Pwo+ID4gCj4gPiBSZWdhcmRzLCAgCj4gCj4gSGkgS29yeQo+IAo+IEkgZXhwZWN0IHRvIHNlbmQg
YSBwdWxsIHJlcXVlc3QgYmVmb3JlIGVuZCBvZiB0aGlzIHdlZWsgZm9yIG1hc3RlciBicmFuY2gK
PiBpbmNsdWRpbmcgeW91ciBwYXRjaC4KCk9oIG9rLiBUaGFua3MgZm9yIHRoaXMgdXBkYXRlLgoK
UmVnYXJkcywKLS0gCkvDtnJ5IE1haW5jZW50LCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBr
ZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJv
b3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

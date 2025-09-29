Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBA6BA9C21
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Sep 2025 17:09:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EF9FC3F93C;
	Mon, 29 Sep 2025 15:09:25 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90ED7C3F939
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Sep 2025 15:09:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 17F4E1A0FAE;
 Mon, 29 Sep 2025 15:09:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D56D6606AE;
 Mon, 29 Sep 2025 15:09:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D5FB9102F16F4; 
 Mon, 29 Sep 2025 17:09:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759158563; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=lTD18vd2Pbp/DP+emuLeju/kvkOcELPvR0FpifC1yNc=;
 b=TZSFfH7Jh7on5jx/75At2rJa03Zpei54djtI0bw/oxAudM5TF7ivekIHPexHPslvGFQkFX
 0d3dz43QCUBofV4TryKpXzPm1HYeALQ5diNpT0SQY9gHbj76+2c/RpinuS54s+Z8t4eKR/
 hCoMcKTSrfkDDDWfNopbRW/hxSLFY4F/k0NGm7uM9nMe8M8I6cN6HDUFqwxw2qNOKpjiTc
 6ObPkoc6zS2Ix0LIvp+aR5nMMTAQuMf2pOyeKe+NmctF2kBtUlrZ+wcXODThZnJbL0xi0e
 QSedOei6N0uIsN71TNUnzVD4+bbQOTRqXNwhwDnYouId94HbstuMSo6V+eiJPw==
Date: Mon, 29 Sep 2025 17:09:12 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <20250929170912.3bee3f9d@kmaincent-XPS-13-7390>
In-Reply-To: <55d0805b-dcb2-4277-a4da-f4c26b48a2dd@foss.st.com>
References: <20250917141736.59732-1-kory.maincent@bootlin.com>
 <55d0805b-dcb2-4277-a4da-f4c26b48a2dd@foss.st.com>
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

T24gVGh1LCAxOCBTZXAgMjAyNSAxNjoxNjozNSArMDIwMApQYXRyaWNlIENIT1RBUkQgPHBhdHJp
Y2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IE9uIDkvMTcvMjUgMTY6MTcsIEtvcnkg
TWFpbmNlbnQgd3JvdGU6Cj4gPiBUaGlzIHJldmVydHMgY29tbWl0IGQzNzY0MWM2MWJhMjEyMjQx
YzM4ZTNmZDIyZjAzMzVmYzBiZWJjOTYuCj4gPiAKPiA+IFJlc3RvcmUgc3VwcG9ydCBmb3IgZW52
aXJvbm1lbnQgc3RvcmFnZSBpbiBFWFQ0IGZpbGVzeXN0ZW0gb24gZU1NQyBib290Lgo+ID4gVGhl
IHByZXZpb3VzIGNsZWFudXAgaW5jb3JyZWN0bHkgcmVtb3ZlZCB0aGlzIGZhbGxiYWNrIG9wdGlv
biB3aGljaCBpcwo+ID4gbmVlZGVkIGZvciBib2FyZHMgdGhhdCBzdG9yZSB0aGVpciBlbnZpcm9u
bWVudCBpbiBhbiBFWFQ0IHBhcnRpdGlvbi4KPiA+IAo+ID4gVGhpcyBjb25maWd1cmF0aW9uIGlz
IE9TLXNwZWNpZmljIHJhdGhlciB0aGFuIGJvYXJkLWRlcGVuZGVudCBhbmQgc2hvdWxkCj4gPiBy
ZW1haW4gYXMgaXQgaXMgY29uZmlndXJhYmxlIHZpYSBtZW51Y29uZmlnLiBFdmVuIGlmIGl0IGlz
IG5vdCBkZXNjcmliZWQKPiA+IGluIFNUIGRlZmNvbmZpZ3MgcGVvcGxlIG1heSBoYXZlIGVuYWJs
ZWQgaXQgaW4gdGhlaXIgZGVmY29uZmlnLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBLb3J5IE1h
aW5jZW50IDxrb3J5Lm1haW5jZW50QGJvb3RsaW4uY29tPgoKPiBSZXZpZXdlZC1ieTogUGF0cmlj
ZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+CgpIZWxsbywKCkFueSBuZXdz
IGZyb20gdGhlIG1haW50YWluZXJzPyBJcyB0aGVyZSBhIHJlYXNvbiBmb3Igbm90IGJlaW5nIG1l
cmdlPwoKUmVnYXJkcywKLS0gCkvDtnJ5IE1haW5jZW50LCBCb290bGluCkVtYmVkZGVkIExpbnV4
IGFuZCBrZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxp
c3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D6A87A04A
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Mar 2024 01:53:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39555C6C83C;
	Wed, 13 Mar 2024 00:53:03 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1E67C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Mar 2024 00:53:01 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-5d862e8b163so2013217a12.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 17:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710291180; x=1710895980;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tc/rkX+cHNlwLghCnE2uWp0QPX3H/EIMPGFUtOSUsp4=;
 b=aU3uBA0Zy7+ZcBUPrmtB+MoouArlINFdibq5be7vFrpJYQIatdE+rToRYNw+SSES0R
 MxF3O3vO+sHbY5yJmog7YUWjx3wznCEjBP4jI4uFL3D9nf8q6sVQL7xVDayzgIMe1V26
 W9EXG0vE6JUYUs5osw4aB6eWlJJ6t5cIKtMJX1ce/00O0n33CkTdu6g3vuB8E133Y+2h
 pwL+X60oIwNHYtAOcG44j+e/3WPpF8e9vu9C6RuhYlbf+2LOu9FmB328qJg3LvwS5iLu
 CFX2d8+7TrVBP5SYKQDhWzZmBF1AzHj7NoBamVSll1PNkdtUNXemiGkhtocHA0MN4QFt
 563g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710291180; x=1710895980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tc/rkX+cHNlwLghCnE2uWp0QPX3H/EIMPGFUtOSUsp4=;
 b=mM0AbPZ5Q736/lAoSnozct0aJXmoEv+N78/dIJwqbma9yAi1cYwws8uowy+7l7zOne
 wHeQrTuHIftAXZEfFRACRZ8K/nIapUzJtAOYyAfvqLNQfL8X3XBypSMmICdFoya8D6eY
 PGNfMxrwzCCH81b84SHJFUtj88KsJhCR5rcomR+bclfKGoOdIi36izXCTt1OkgNn7GFq
 BS6oD8LPBhOsVpqiUQJYQVsX3NYpFqX7LElvqcM6uo1FfaYRabwk4Do6qRmCSWpmcNHU
 uxGLdK2rTdWUXhdD2RhoEDhbufDixHBdJUtOiCLfoeZeKlWm2hXRllDBInBs/2HczeaP
 EBNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEyz2sTmZdX8C0THWdHDl9ge1pKbJmhQVP4xXEy4zyw2MVZBEeL/b3Ioj8qiGmqxN9fkjCbLWrAJ6HCDT9Z9ycpwXl11rnvpHBRHf9MPahEV74SfzXospz
X-Gm-Message-State: AOJu0YyQffB7xfHpg9GtRHt39DtmXitP0BlT2e6XCyE7UY/Q+E+XRtWR
 CYDuRTXXDUjVu951hQEyTiqO46oQ1+xDxqAYR6YPxc9/3GFSdLEnyRPDL2E3slj3XEyM9WTtXD0
 eCommJi+7Nv3hNOCbpRvhNvlqlIw=
X-Google-Smtp-Source: AGHT+IGnEYbbNJojD66SzBzWtyqdyiwFXxhsuFKq6nCc9XZmb90Kqztj9x2v8NFvjiC8svLKxxMRInCF4jXOBH/kxek=
X-Received: by 2002:a17:90a:a116:b0:29b:f75d:bf5d with SMTP id
 s22-20020a17090aa11600b0029bf75dbf5dmr244445pjp.4.1710291180127; Tue, 12 Mar
 2024 17:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240312211628.32842-1-marex@denx.de>
In-Reply-To: <20240312211628.32842-1-marex@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 12 Mar 2024 21:52:48 -0300
Message-ID: <CAOMZO5BL0-1r63OiKLwgj1D2X1BHw4sN45g+QVeJ6vOSHrNFig@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@dh-electronics.com,
 Stefano Babic <sbabic@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] ARM: imx: stm32: Test whether ethernet
 node is enabled before reading MAC EEPROM on DHSOM
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

SGkgTWFyZWssCgpPbiBUdWUsIE1hciAxMiwgMjAyNCBhdCA2OjE24oCvUE0gTWFyZWsgVmFzdXQg
PG1hcmV4QGRlbnguZGU+IHdyb3RlOgoKPiBOT1RFOiBJdCBpcyBwcm9iYWJseSBiZXN0IGlmIHRo
aXMgZ29lcyBpbiB2aWEgZWl0aGVyIGlteCBvciBzdG0zMiB0cmVlLAo+ICAgICAgIEkgY2FuIGJy
ZWFrIHRoZSBwYXRjaCB1cCwgYnV0IHRoYXQgd291bGQgaW50cm9kdWNlIGRlcGVuZGVuY3kKPiAg
ICAgICBiZXR3ZWVuIHR3byBQUnMgaW4gZGlmZmVyZW50IHRyZWVzLiBMZXQgbWUga25vdyB3aGF0
IHlvdSBwcmVmZXIuCgpJIGNhbiBhcHBseSBpdCB0byB1LWJvb3QtaW14IG5leHQgaWYgUGF0cmlj
ZSBhbmQgUGF0cmljayBhcmUgT0suCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==

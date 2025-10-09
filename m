Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC94BC9C9C
	for <lists+uboot-stm32@lfdr.de>; Thu, 09 Oct 2025 17:28:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28297C555B3;
	Thu,  9 Oct 2025 15:28:13 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFD4FC555B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Oct 2025 14:59:58 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-58afb2f42e3so1276903e87.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Oct 2025 07:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1760021998; x=1760626798;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zD3B9HrUJqoSAwXB9G8KMgyMIdZkO7cN1UAxgQWNUSQ=;
 b=FyRS8w/nNd9hmdcsuTRopfN/sD6Kvcd9tCj202pvmASySS3JB+jQCqIlvJ0k0zYpTu
 +XqtYXJDh3ZhRe87LPqiisnCij2S1Bi3uXKnMp8pX7GgUhcXbyFF6qVzYxjCJTtCxiTB
 iuvEfikIOK1wxXLraYhluHR8qRk91Wp040SmOgqEVir7fBsdQmioGT4odaXYOTlV4WAf
 Shh2Iu07UhyPNOFOT1VEFApy3xa0Ycx0q/fYNGihBrvG2dqj5XcmBv0e3tyh77abKLDF
 xU/tRioqkrJEnKh3q6NcOLO+jOmadpybQGmjeAUKq8VEk4jNMPjjeS4a6UgNKrP6qZtT
 NGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021998; x=1760626798;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zD3B9HrUJqoSAwXB9G8KMgyMIdZkO7cN1UAxgQWNUSQ=;
 b=thc0X+rf4R+7/X5dt4oe8RW+umVliLZfpSJyildYbi8fnCyruiSRG66DNSP7f2GkjE
 JLSI2bX2Y63jvZH02m9IOxTHshxfAPJSSd0FD5UAhGiHVFS2ztGDVXr1W0J2duQaMqu3
 5cCG3nNa7Ea/LdunlTz4p6t9D5wZVPT9KVn5gv7pMAEJ6aTP/TGJze2p7Tx50tThO4hc
 qGMdQc0JIgdfdmKzVLX96+FL0AOQignEVIzalYFnp/FPRTTypgCqoaGLt0nBHWZFifQX
 W+AQpfuBoSBcwmZY/9tjhkA+a4YhDYmi2EKlvNF2rW6QSSkuXJ4zb2PyyfFQsETQQ484
 5YYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsR2mqHoVYvGI/E7mcjeN8ubtSrpj2QhdkncguR/yzmkDo7RfgjyyaNPhCnlz6FRJeYTls+ZKBXkxFKw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzp0yIkkya5Bsh4/oYfePUYC49L2noPREaoqFGL3iGP0k0VlLyl
 Wcr0YQ1t4f52OM6KYVCgm9F2UlkN9HMbhyvsUMI7W6TyaC/PBkN/bnHr2D0knMG4TUUrR76GW0l
 Vdno53VynhaiHr7I106wRRHm1/vnOhT4=
X-Gm-Gg: ASbGncvHTXicWBM8K6YfGWDXmJoEbcNut+xm5WOMuRnC19oI1zQHpIzlxSX7F1UA03X
 t16PA7i6CGLdUn+Yug5H/LQ3XA8fnqzg0MPi/x5+liKdZeqicnh3VoSiS0t2HeAuOIqvCjPsLJg
 Uda713OrZVGnY6kTJQ6hNniGTwO2c3HiromCWHBaN5jZTP3f1DpeURlenH83a0KBXptM9opfi4z
 UWYdQ8SB7HjH+RjeDzy63RPZZWjCRg8
X-Google-Smtp-Source: AGHT+IG8v/muyGMAy7CAf8o0iwJgk58RPdja0g0LwMQP/IdIlVoApxVY+O8sN7ynFoi6YIt+3miZNRNPXNwJ77+dyfg=
X-Received: by 2002:a05:6512:3ca9:b0:57e:4245:114e with SMTP id
 2adb3069b0e04-5906dc18396mr2279325e87.24.1760021997773; Thu, 09 Oct 2025
 07:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <20251009130844.11703-1-patrice.chotard@foss.st.com>
 <20251009130844.11703-3-patrice.chotard@foss.st.com>
In-Reply-To: <20251009130844.11703-3-patrice.chotard@foss.st.com>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 9 Oct 2025 16:59:45 +0200
X-Gm-Features: AS18NWCYuu3-bk5PDEc1L_bncwrYGVRefQ7kWm3KXDekVY472_l2bSia4MYl2_0
Message-ID: <CAGm1_kuxrK+Fzd0qZiejw7uHnGGGZUa0dxNMt=17Ei7YAhkBxg@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailman-Approved-At: Thu, 09 Oct 2025 15:28:11 +0000
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v1 2/2] led: Add LED dependency for
	LED_ACTIVITY and LED_BOOT
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

T24gVGh1LCBPY3QgOSwgMjAyNSBhdCAzOjA54oCvUE0gUGF0cmljZSBDaG90YXJkCjxwYXRyaWNl
LmNob3RhcmRAZm9zcy5zdC5jb20+IHdyb3RlOgo+Cj4gQWRkIExFRCBkZXBlbmRlbmN5IGZvciBM
RURfQUNUSVZJVFkgYW5kIExFRF9CT09ULgo+Cj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90
YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gQ2M6IFllZ29yIFllZnJlbW92IDx5
ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBZZWdvciBZZWZyZW1vdiA8
eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cgo+IC0tLQo+Cj4gIGRyaXZlcnMvbGVkL0tjb25m
aWcgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2xlZC9LY29uZmlnIGIvZHJpdmVycy9sZWQvS2NvbmZpZwo+IGluZGV4IGM5
OGNiZjkyZmFiLi43ZmY1Y2VmZDI5ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2xlZC9LY29uZmln
Cj4gKysrIGIvZHJpdmVycy9sZWQvS2NvbmZpZwo+IEBAIC0xMSw2ICsxMSw3IEBAIGNvbmZpZyBM
RUQKPgo+ICBjb25maWcgTEVEX0JPT1QKPiAgICAgICAgIGJvb2wgIkVuYWJsZSBMRUQgYm9vdCBz
dXBwb3J0Igo+ICsgICAgICAgZGVwZW5kcyBvbiBMRUQKPiAgICAgICAgIGhlbHAKPiAgICAgICAg
ICAgRW5hYmxlIExFRCBib290IHN1cHBvcnQuCj4KPiBAQCAtMjIsNiArMjMsNyBAQCBjb25maWcg
TEVEX0JPT1QKPgo+ICBjb25maWcgTEVEX0FDVElWSVRZCj4gICAgICAgICBib29sICJFbmFibGUg
TEVEIGFjdGl2aXR5IHN1cHBvcnQiCj4gKyAgICAgICBkZXBlbmRzIG9uIExFRAo+ICAgICAgICAg
aGVscAo+ICAgICAgICAgICBFbmFibGUgTEVEIGFjdGl2aXR5IHN1cHBvcnQuCj4KPiAtLQo+IDIu
NDMuMAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==

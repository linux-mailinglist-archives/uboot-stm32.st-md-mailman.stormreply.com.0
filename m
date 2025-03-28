Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2E1A75376
	for <lists+uboot-stm32@lfdr.de>; Sat, 29 Mar 2025 00:39:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8372C78F83;
	Fri, 28 Mar 2025 23:39:41 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82DD8C78F77
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 23:39:40 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso531741066b.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 16:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1743205180; x=1743809980;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4gOnA/xeexjmqtl7hKiH9adWaFIeYtrQPtKssWT+ejE=;
 b=a+w9sw5hBoT5Rg2+aGfrlNEb1tj7s+p3jbq65BVc1pOdSVN1R434zB7Cxmu8d1uoGI
 whFbQuXL/5XxcBZ2XIuHb/KIOg5W/Z31+7X42v3EOcXqQTlc537Fy3hb4BWcN6IzzivS
 Rb3z9gmBjjoR41+x9o2DVR81tPbgyhXb+jf8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743205180; x=1743809980;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4gOnA/xeexjmqtl7hKiH9adWaFIeYtrQPtKssWT+ejE=;
 b=Rfod5WczQdydVay0f7e3JBoJUbFGfh2UAq1PZtHDH3Za82ymJrMcfOdztv9pITE4WH
 /w4TuZ4RwaANamyL0Kq9CZjWyjoXINvUcEglVaxIFKUihokjGFLaxpHM8ulGYK8AoHoo
 UmoU3D/Q5qjiW045HwK304IPbu158lJ6s+oUbswQGIJw+0dQVJD3eoNva2fWLLddIp1V
 lZQROsT77Dxp19h3FZgxFlLF1YK48dMUaB98T/u0ArmcWGJ2219J0C/yTYwzUQQNacRL
 sV8uvoIWLnOiQ3UY76OZiy3q/aFGxNM2uLL6fteKnZHXhy7NEG3SuC4nt3WqwlBQFm0i
 IL4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQGZW71aDRjDjfyBqx0+qoEmMysmhjkcpQeq4I+vLADl7SSZesqZolUyph7eFFSToXGQwIjlU/0vMM+A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzmsSfHYN7AaWjtkeoupezRsbpB1kDVios/jaO6aoZ6mVFE5bKY
 LCrMqqlo3HJKCzrDbjtsviK2qDxlbMPe88TokITeGZ6m+w3MySmaZEO6H+jhEoNu8lojGEk78ew
 gxgyQ3qERai5EmrxfiDRKZ6E9Uph158wI9+Aq
X-Gm-Gg: ASbGncvbVIGf6z6wbjIo6XsRMxDAHxxKMNLMcEZHlc60W8iak1naRrF93dxq91ATVZa
 AHvLpNMiSzAsnPpSf4G6uly5TE5zNdaLmurtFKx8hmIE/a7ig+TDxieAwopLxBRhWzJbLeJw1Zs
 lXivASHKq7lEIktxPG1keKFEbWvyI=
X-Google-Smtp-Source: AGHT+IE+9jmAJGWhcJcZx9he5t+LX2r9exT6C7ZSKiC6e+itWn6hXAdyh2uD1geDDssnTZTiYurP/faU6eDvOjP3QCA=
X-Received: by 2002:a17:906:c148:b0:ac6:eaea:c0e3 with SMTP id
 a640c23a62f3a-ac738c6f017mr78608966b.49.1743205179741; Fri, 28 Mar 2025
 16:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250328163115.642347-1-patrice.chotard@foss.st.com>
 <CALeDE9NHP6J97A0Zy13TDB66cpcJutT0DYvU=Ts6G4aBN+RwVg@mail.gmail.com>
 <355ebc65-18fc-4b1a-b1e0-a1d0d7b5e9cf@foss.st.com>
In-Reply-To: <355ebc65-18fc-4b1a-b1e0-a1d0d7b5e9cf@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 28 Mar 2025 23:39:24 +0000
X-Gm-Features: AQ5f1Jo89H-CxNXpN8AY8XPAuSY7vrt_kxSXXRnH8Di58Pci8RSEZ_cutW0PGzc
Message-ID: <CAFLszTg9PCwGD43sOD_anAhY412+J_qLgw=XrNOw2wJJPu+33Q@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Peter Robinson <pbrobinson@gmail.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] dtc: introduce label relative path
	references
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrice,

On Fri, 28 Mar 2025 at 11:35, Patrice CHOTARD
<patrice.chotard@foss.st.com> wrote:
>
>
>
> On 3/28/25 18:06, Peter Robinson wrote:
> > On Fri, 28 Mar 2025 at 16:52, Patrice Chotard <patrice.chotard@foss.st.com>
> > wrote:
> >
> >> Since introduction of OF_UPSTREAM flag, U-Boot's dtc must be able
> >> to compile Kernel's device tree.
> >>
> >> Since kernel commit 7de129f5389b ("ARM: dts: stm32: stm32mp151a-prtt1l:
> >> Fix QSPI configuration"), label relative path references has been
> >> introduced. These label relative path references is not supported
> >> by current U-Boot dtc version 1.5.0: (see mailing list discussion [1]).
> >>
> >> In order to support such label relative patch references
> >> adds following commit from upstream DTC tree:
> >>
> >
> > Maybe we need to rebase to the latest upstream dtc, I'm not sure pulling in
> > a random set of bits from upstream is the right way to do things as it's
> > brings things selectively which may bring along other issues.
>
> Hi Peter
>
> Initially it was expected to migrate to dtc 1.7.1 as proposed by Tom,
> but as explained here [1] it has huge impacts on several U-Boot components
> mainly due to DT header alignment on 8 bytes (even if some DT check can
> be bypassed using FDT_ASSUME_MASK, i am not sure it's a good option).
>
> I have spent time to investigate some issue raised by U-Boot CI-Build and
> it's a huge time consuming task, more than expected.

I'm fine with this change and I'm not likely to try to figure out this
mess either.

>
> Thanks
> Patrice
>
> >
> >
> >> commit 651410e54cb9 ("util: introduce xstrndup helper")
> >> commit ec7986e682cf ("dtc: introduce label relative path references")
> >>
> >> [1] https://lore.kernel.org/all/20250115144428.GZ3476@bill-the-cat/T/
> >>
> >> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> >> Cc: Tom Rini <trini@konsulko.com>
> >> Cc: Simon Glass <sjg@chromium.org>
> >> ---
> >>
> >>  scripts/dtc/dtc-lexer.l  |  2 +-
> >>  scripts/dtc/dtc-parser.y | 13 +++++++++++++
> >>  scripts/dtc/livetree.c   | 33 ++++++++++++++++++++++++++++++---
> >>  scripts/dtc/util.c       | 11 +++++++++++
> >>  scripts/dtc/util.h       |  1 +
> >>  5 files changed, 56 insertions(+), 4 deletions(-)
> >>

Reviewed-by: Simon Glass <sjg@chromium.org>

Regards,
SImon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

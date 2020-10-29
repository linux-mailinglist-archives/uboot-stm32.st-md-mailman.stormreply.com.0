Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C790A29F2B8
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Oct 2020 18:11:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EAA1C424B3
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Oct 2020 17:11:49 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE93CC36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 17:11:48 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id w27so4889579ejb.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 10:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dH3bNb1GqyHkUVS67IKo7dvtzFvBe6EeilFz13htb6M=;
 b=MXhDGr5PQaPgruuuYl6P+gqetfmhw3QuEjg706re2/Keyd3uFrbLQkJGDx51ULkipA
 s6IhgiS4bN0ocv+zD7d4DoBvUVG3iZspOxbu6YzKe8NEWhGKrqFb4fdWcD+UysVq9b4+
 tfZWLnS1lx+HwpKOHTDtNs2aFFpzFV7oktuMh/ZuB9aP9Od+Yq/KxTwccUkmpNZHnFic
 7P3ySgZ663yMaHQthV1SWFWKy8e3j9/MBxpBsEAFM+mRgAOGkWKx8Zp61jsJ/pxXDnUm
 Dt47Gu60MjL1InHSizHX6vM09+4L/eH2lb0xlrrZixKrEI4db2boDNe5q8n6eR+zubgA
 hzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dH3bNb1GqyHkUVS67IKo7dvtzFvBe6EeilFz13htb6M=;
 b=YrKeXXPe/JOs+rwKiUoza/D7d++e/fHF/fWx3Er964c2ecU4W6bKbTJKbybMEvSE3E
 JSTufzU1p/4buZlouNoDjNhl0DAbCUmgM4nI7ZbYN7yzNdQBe6zcc0AHgmOUsE0oLPlo
 GMz8Xxl5aH3XzhtRP3aesVC3b1Uh5F3ow5ABZuGVbp+OrZ+WRMNqoHoprRuk7Id5zQFr
 5qNGzYsC3O+ZqAEnwDnlU8HqR/aok6u6Q4v9k7qXPfs9LFCcybcBDu2DhgUppiBQOLCi
 qx+hAoR3ffvPe/e4MYq3EdAdyEB43Hs0f+yRYB8hqEcltBOvvS2jwrC6d0Mg+JC7b+LQ
 E+0Q==
X-Gm-Message-State: AOAM533yemDElRCML7NqZwAGWcvP+TaLuo3twqNBYbCFL7R5bArK4XjP
 dzF3PCwoxADmZIWrMiURjje6c4gh82MSIPlCEvUSCA==
X-Google-Smtp-Source: ABdhPJy49HeV/6CL9qWkjcpirVpS5jM7FKIFht/xomU1NaxDZz0cAtGJ7hRJnOcxaSOhFm1q5jVzFz8lleLdZshfXk8=
X-Received: by 2002:a17:906:c315:: with SMTP id
 s21mr4913003ejz.285.1603991507990; 
 Thu, 29 Oct 2020 10:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201006163602.21687-1-patrick.delaunay@st.com>
 <CAMj1kXET8=ERg7gGqWa-FwLZzAuztBsVMhyTGmYEMAxzb63_sw@mail.gmail.com>
 <190d019a-7e18-b4bc-9276-e14bbe4c2855@pengutronix.de>
 <258ba4fa-8d1e-56be-e0de-2d6c09812c13@pengutronix.de>
 <CAMj1kXFoJx7henE0FbSXzsATH4z4Xg8EfJkc+ki7=i33cz3Vew@mail.gmail.com>
 <f629253d8c92446ca1d33a25058c1676@SFHDAG2NODE3.st.com>
 <20201027172533.GD14816@bill-the-cat>
 <CAMj1kXGmW7bm10X9uQV1Aod=RrE30x_v5=1ACPSagoNyRjZ3Pw@mail.gmail.com>
 <976b2b1443424f659fa85a2d11b4b507@SFHDAG2NODE3.st.com>
 <CAN5uoS-ePc6u9Pbh6TR3MScPGZzOkAR5xSWQNnLjjmVrpW5zsg@mail.gmail.com>
 <CAMj1kXHiVrPs4g7AOCz7ja=q=vH921e-8x-XnZN25e0u=yme1Q@mail.gmail.com>
 <CAN5uoS-OEcfwMhLUvOYRoRSf1cpkdeBayS0yUC56_XPUxvHzrg@mail.gmail.com>
 <54533fa8-0e11-56de-90c2-d05817de738d@forissier.org>
In-Reply-To: <54533fa8-0e11-56de-90c2-d05817de738d@forissier.org>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Thu, 29 Oct 2020 18:11:36 +0100
Message-ID: <CAN5uoS9_xOqxQd6AGqfQ86=U1WkVUacUVhHztxjrBCwdX7msmQ@mail.gmail.com>
To: Jerome Forissier <jerome@forissier.org>
Cc: chenshuo <chenshuo@eswin.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "marek.bykowski@gmail.com" <marek.bykowski@gmail.com>,
 Stefan Roese <sr@denx.de>, Ard Biesheuvel <ardb@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>,
 Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Rajesh Ravi <rajesh.ravi@broadcom.com>,
 Thirupathaiah Annapureddy <thiruan@linux.microsoft.com>,
 Joakim Bech <joakim.bech@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>,
 Tero Kristo <t-kristo@ti.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 0/7] arm: cache: cp15: don't map reserved
 region with no-map property
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

On Thu, 29 Oct 2020 at 17:35, Jerome Forissier <jerome@forissier.org> wrote:
>
>
>
> On 10/29/20 5:06 PM, Etienne Carriere wrote:
> > On Thu, 29 Oct 2020 at 12:26, Ard Biesheuvel <ardb@kernel.org> wrote:
> >> The point I made before was that secure and non-secure are two
> >> disjoint address spaces. The fact that TZ firewalls exist where you
> >> can move things from one side to the other does not imply that things
> >> works like this in the general case.
> >>
> >> E.g., you could have
> >>
> >> secure DRAM at S 0x0
> >> non-secure DRAM at NS 0x0
> >>
> >> where the ranges are backed by *different* memory. Since the DT
> >> description does not include the S/NS distinction, only the address
> >> range, the only thing we can assume when looking at memory@ and
> >> /reserved-memory is that everything it describes is NS.
> >
> > From Arm Trustzone stand point, both secure and non-secure worlds
> > share the very same physical address space. I your example, physical
> > address 0x0 would refer to the same DRAM cell. Whether this cell is secure
> > or non-secure is a configuration set in the DRAM firmwall.
>
> No, like Ard said it is a possibility but it doesn't have to be the
> case. See the Armv8-A ARM (DDI 0487F.c) section D5.1.3 VMSA address
> types and address spaces, "Physical address (PA)".

Ok. I didn't know that. Thanks both to highlight this and thanks for the refs.

However, I think this does not change the question on whether or not a memory
node in non-secure world FDT can cover address ranges that are carved out
with reserved-memory/no-map because non-secure world generic mapping
cannot presume valid default mapping attributes.


> If we need to differentiate between non-secure and secure PA I suppose
> we could use the status and secure-status properties in the memory
> nodes, consistent with the usual usage described in [1].
>
> As Etienne says, it seems that a majority of systems actually have a
> single PA space with access control added on top, and by default the
> secure state can access non-secure memory. That goes well with memory
> nodes without a status nor a secure-status property, yet other
> configurations can easily be supported.
>
> [1]
> https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/secure.txt
>
> --
> Jerome

Cheers,
Etienne
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

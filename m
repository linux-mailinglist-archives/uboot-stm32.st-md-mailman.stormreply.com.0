Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A30D835FFB2
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Apr 2021 03:41:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F106C57B78;
	Thu, 15 Apr 2021 01:41:42 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2392EC57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 01:41:39 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id a21so9602513oib.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Apr 2021 18:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x6rJNJJADaztPE9Of6aJE0g0bxqTdHaHGf4iDGeeyDQ=;
 b=nX+QfH7urTbUZwxGoGoswqhJw73huHGh3nTo3PeV5PNSuYC8BVCzv2pr5K8+cdRf7u
 vRY0JPb7hu+KVtWwRR3ACkHm48dfKvHbiR4bGzO85pcIvft9y+n+lB1+WsT+fEHU5OG8
 vCEju4WqsK70Im1x38oV/IyzwtFlPNtIU/Dux8+kjMsMTCd573FDZFKHS6AW0Soxsnol
 wEhLdInuwuL+JIo7UC4z0ikmaZY4dzSjIOGjMk71reX2mOFpCF3oqgnOfaX0LWfhehYn
 YV8Zbq0wY1rPV7ZHp6rvjnybgRxN6eQ2Hj9a6X1TaSesIlGePPgFl0l7WKRKYgZaLquH
 Y9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x6rJNJJADaztPE9Of6aJE0g0bxqTdHaHGf4iDGeeyDQ=;
 b=rSofK67yy1gbG/69GAh9p9l6TVB9ttyt5fHf8+LiUNSPIE/jUcyAp+6M5rXfLWffVs
 CdW10C59errgv8l62dvssRTqnKRj09YLCAmV6DFSVzyh/dnzPaG3xmzVSgt/+GjJezPU
 ah9DSPh0BwNg8GUFbPkQzL437klraewxzk8A2FHXZoHtLxB7S8C4Z4Vn4YnOie9cRToC
 EIMEsb+V6HQ9btlyy60Qfe6nIcr5I6U18Fo9sirxYAfjJyUMBk9q0Y6c3OQY7ztBJbij
 x76TdPSMaq0xnFrb4WY4f90mwS+7zO8chOXjVMX6LQ3WTNPGFOO0LlM7w+k3Wq+MYFiW
 L9Gg==
X-Gm-Message-State: AOAM531I47m0TF+Q0Gq37HRpBirOr+uJK5guBDebGjCWQWFDlei1K1Ij
 Yz2xE2ARfJfP72gmCCmCjfNqgLgw3jLF1XpfYjo=
X-Google-Smtp-Source: ABdhPJyy17QkAmiCeFgnjY/H9rpu+JQc78fe1BipfIMTwqMmNboWcUsMbDwZm/sJLOb7bhBmFesAoTWk14suo7uYsnM=
X-Received: by 2002:aca:a989:: with SMTP id s131mr825603oie.179.1618450898613; 
 Wed, 14 Apr 2021 18:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210409100022.1.I93dea8b89ea632e7d8f2640a6eca6f6e69fed319@changeid>
 <bf1fcbd0-b54e-b03f-1ac2-27475ee747e2@denx.de>
 <68133a1e-5440-0a5d-d5a4-2c1d85ef0c1b@foss.st.com>
 <5deab9a1-3326-5115-71e2-569aa4077ab6@denx.de>
In-Reply-To: <5deab9a1-3326-5115-71e2-569aa4077ab6@denx.de>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Thu, 15 Apr 2021 04:41:25 +0300
Message-ID: <CAGi-RU+QZRQ8EVPfX7XZET2LodgrU5mkYG+scWNzow9aLFPFEA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Stephen Warren <swarren@nvidia.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@st.com>
Subject: Re: [Uboot-stm32] [PATCH] net: dwc_eth_qos: add support of device
 tree configuration for reset delay
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

On Wed, Apr 14, 2021 at 5:36 PM Marek Vasut <marex@denx.de> wrote:
>
> On 4/14/21 4:07 PM, Patrick DELAUNAY wrote:
> > Hi,
>
> Hi,
>
> > On 4/9/21 2:22 PM, Marek Vasut wrote:
> >> On 4/9/21 10:00 AM, Patrick Delaunay wrote:
> >>> The gpio reset assert/deassert delay are today harcoded in U-Boot driver
> >>> but the value should be read from DT.
> >>>
> >>> STM32 use the generic binding defined in linux:
> >>> Documentation/devicetree/bindings/net/ethernet-phy.yaml
> >>>
> >>>    reset-gpios:
> >>>      maxItems: 1
> >>>      description:
> >>>        The GPIO phandle and specifier for the PHY reset signal.
> >>>
> >>>    reset-assert-us:
> >>>      description:
> >>>        Delay after the reset was asserted in microseconds. If this
> >>>        property is missing the delay will be skipped.
> >>>
> >>>    reset-deassert-us:
> >>>      description:
> >>>        Delay after the reset was deasserted in microseconds. If
> >>>        this property is missing the delay will be skipped.
> >>>
> >>> See also U-Boot: doc/device-tree-bindings/net/phy.txt
> >>
> >> Since this is a PHY property, shouldn't that be handled in
> >> drivers/net/phy/ instead of MAC driver ?
> >
> >
> > I was my first idea but I don't found found the correct location in phy
> > (driver or uclass)
> >
> > to manage these generic property and the generic property "reset-gpios"
> > was already
> >
> > managed in eth driver, so I continue to patch the driver.
> >
> >
> > But I come back to this idea after your remark....
> >
> > => in linux these property are managed in
> >
> >      drivers/net/mdio/of_mdio.c::of_mdiobus_phy_device_register
> >
> >          parse DT node and add info in mdio
> >
> >      drivers/net/phy/mdio_device.c::mdio_device_reset
> >
> >          called in  mdio_probe / mdio_remove
> >
> >
> > In my first search, I don't found the same level in the U-Boot drivers
> > in drivers/net/phy/
>
> Note that this is MDIO-wide PHY reset (e.g. you can have single reset
> line connected to multiple PHYs on single MDIO bus), this is not
> PHY-specific reset.
>
> > but I miss the uclass defined in drivers/net/eth-phy-uclass.c
> >
> >
> > Finally I think I need to manage the generic binding property
> >
> > (reset-gpios, reset-assert-us, reset-deassert-us) directly  in
> >
> > => drivers/net/mdio-uclass
> >
> >
> > The GPIO RESET will be managed in mdio  ops: pre_probe/ post_remove
> >
> > as it is done in linux
> >
> > warning: today post_remove ops don't exit in u-class.
> >
> >
> > Do you think it is the correct location ?
>
> For single-PHY reset, the correct location is in drivers/net/phy/ somewhere.
>
> > Do you think it should be a new serie (migrate the eqos property in mdio)
> >
> > after this eqos is accepted
> >
> > or I shoudl sent a new serie to replace this serie.
>
> I'll leave that decision to Ramon/Joe.
Joe, I'll leave this to you.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

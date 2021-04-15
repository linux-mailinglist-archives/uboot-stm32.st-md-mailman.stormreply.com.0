Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E0F36022B
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Apr 2021 08:08:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 301C1C57B78;
	Thu, 15 Apr 2021 06:08:21 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F659C57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 06:08:17 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id i81so23203908oif.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Apr 2021 23:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lzA11OF7JG3r47o0x5u/0WDLF6OCSMiAwS6Y733qGP8=;
 b=PRhb6lu5LM/ovRQ3RRYqix5YgiqvEF+P8dQ2Vl64L+Fxr58zTRxGjMACDp0zks+DfD
 eh8juvnzG1D85M0ApRff0ND4M5vkWzG1UEHCKVIPR5C5OqhtCmoEpGVBIbop96BWr7VY
 yvWIjahY9LR/D22vivkVUcVPxJuJLRMwjHwWgE/4fhVRb1kr8FKrHOu9Dw+PfcwWzDbU
 6TEX3O9BToU6NC9glheoiaMybjbvcidsawVsunC6/01ypg2KbGiMQPZUL0tNozX6kN9z
 96iEzimR1lM6paMbOs9+mEBqXNbwNh8zhrCGcAixulL3afO5x5SrHmnwYlZS2LtJbS8W
 ZDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lzA11OF7JG3r47o0x5u/0WDLF6OCSMiAwS6Y733qGP8=;
 b=jTHnMdn1GOvRUCIybfmGYzSPkW58NDEA3oO5rjf8fHXB5/oLINW5wiJEuCh7jDbf/R
 VVUrvMooSFrZDD4hcaFGhCkZBsNUFgY4WMCyXz2ihCRXG0MAbApWqMgDQQ7BTr3Te/gL
 q+NwKeFo4lRfizoU6DCgntoEl5J7TRteRpRquasouR6wtCB7kX2jEfGJu+2IjkmrewkB
 GYnfGeQLyxtM5e6WAYpU3300i2FPmfmfa/ci96ZtMiOd0Dh6xctUyaeq/riQFCpESryR
 sdrp2CoZP8oicQ65g4iCVGlBWI94lopjKEK2ytNvELS5PBtM/RufqciiSSLDMVlXqVTz
 /JaQ==
X-Gm-Message-State: AOAM530Rgeg7pHI295YsBNPvznwqyZtobbLAd3qxMq2xZ0nqZmVoVlfB
 emB/QvQU7jo0aatMlZ0QHHJID/eeL9e0n45pDAY=
X-Google-Smtp-Source: ABdhPJyZ1aZ5fx2exUVDQGgi54jvYtVy60/zMJDZQi0LRZgjFxE9bZ8/hfPeh79HWBHy64WbYdjndJpOUjrNYNpMAUI=
X-Received: by 2002:aca:1a17:: with SMTP id a23mr1409655oia.22.1618466896265; 
 Wed, 14 Apr 2021 23:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210409100022.1.I93dea8b89ea632e7d8f2640a6eca6f6e69fed319@changeid>
 <bf1fcbd0-b54e-b03f-1ac2-27475ee747e2@denx.de>
 <68133a1e-5440-0a5d-d5a4-2c1d85ef0c1b@foss.st.com>
 <5deab9a1-3326-5115-71e2-569aa4077ab6@denx.de>
 <CAGi-RU+QZRQ8EVPfX7XZET2LodgrU5mkYG+scWNzow9aLFPFEA@mail.gmail.com>
In-Reply-To: <CAGi-RU+QZRQ8EVPfX7XZET2LodgrU5mkYG+scWNzow9aLFPFEA@mail.gmail.com>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Thu, 15 Apr 2021 09:08:05 +0300
Message-ID: <CAGi-RU+5mak+v3OZ4Yuuv7-2tMdoj4BHy3g4kbEf2ij9pNszoQ@mail.gmail.com>
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

On Thu, Apr 15, 2021 at 4:41 AM Ramon Fried <rfried.dev@gmail.com> wrote:
>
> On Wed, Apr 14, 2021 at 5:36 PM Marek Vasut <marex@denx.de> wrote:
> >
> > On 4/14/21 4:07 PM, Patrick DELAUNAY wrote:
> > > Hi,
> >
> > Hi,
> >
> > > On 4/9/21 2:22 PM, Marek Vasut wrote:
> > >> On 4/9/21 10:00 AM, Patrick Delaunay wrote:
> > >>> The gpio reset assert/deassert delay are today harcoded in U-Boot driver
> > >>> but the value should be read from DT.
> > >>>
> > >>> STM32 use the generic binding defined in linux:
> > >>> Documentation/devicetree/bindings/net/ethernet-phy.yaml
> > >>>
> > >>>    reset-gpios:
> > >>>      maxItems: 1
> > >>>      description:
> > >>>        The GPIO phandle and specifier for the PHY reset signal.
> > >>>
> > >>>    reset-assert-us:
> > >>>      description:
> > >>>        Delay after the reset was asserted in microseconds. If this
> > >>>        property is missing the delay will be skipped.
> > >>>
> > >>>    reset-deassert-us:
> > >>>      description:
> > >>>        Delay after the reset was deasserted in microseconds. If
> > >>>        this property is missing the delay will be skipped.
> > >>>
> > >>> See also U-Boot: doc/device-tree-bindings/net/phy.txt
> > >>
> > >> Since this is a PHY property, shouldn't that be handled in
> > >> drivers/net/phy/ instead of MAC driver ?
> > >
> > >
> > > I was my first idea but I don't found found the correct location in phy
> > > (driver or uclass)
> > >
> > > to manage these generic property and the generic property "reset-gpios"
> > > was already
> > >
> > > managed in eth driver, so I continue to patch the driver.
> > >
> > >
> > > But I come back to this idea after your remark....
> > >
> > > => in linux these property are managed in
> > >
> > >      drivers/net/mdio/of_mdio.c::of_mdiobus_phy_device_register
> > >
> > >          parse DT node and add info in mdio
> > >
> > >      drivers/net/phy/mdio_device.c::mdio_device_reset
> > >
> > >          called in  mdio_probe / mdio_remove
> > >
> > >
> > > In my first search, I don't found the same level in the U-Boot drivers
> > > in drivers/net/phy/
> >
> > Note that this is MDIO-wide PHY reset (e.g. you can have single reset
> > line connected to multiple PHYs on single MDIO bus), this is not
> > PHY-specific reset.
> >
> > > but I miss the uclass defined in drivers/net/eth-phy-uclass.c
> > >
> > >
> > > Finally I think I need to manage the generic binding property
> > >
> > > (reset-gpios, reset-assert-us, reset-deassert-us) directly  in
> > >
> > > => drivers/net/mdio-uclass
> > >
> > >
> > > The GPIO RESET will be managed in mdio  ops: pre_probe/ post_remove
> > >
> > > as it is done in linux
> > >
> > > warning: today post_remove ops don't exit in u-class.
> > >
> > >
> > > Do you think it is the correct location ?
> >
> > For single-PHY reset, the correct location is in drivers/net/phy/ somewhere.
> >
> > > Do you think it should be a new serie (migrate the eqos property in mdio)
> > >
> > > after this eqos is accepted
> > >
> > > or I shoudl sent a new serie to replace this serie.
> >
> > I'll leave that decision to Ramon/Joe.
> Joe, I'll leave this to you.

You know what, let's go with the new series, please migrate it to the net/phy.
Thanks,
Ramon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

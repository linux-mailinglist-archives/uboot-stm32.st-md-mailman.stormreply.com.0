Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5DF3C331D
	for <lists+uboot-stm32@lfdr.de>; Sat, 10 Jul 2021 07:40:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FA63C57B5F;
	Sat, 10 Jul 2021 05:40:46 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8554C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Jul 2021 05:40:43 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 i5-20020a9d68c50000b02904b41fa91c97so7411746oto.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Jul 2021 22:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sBzLNnP33LQkF2qWNmgcia9cgCV+7EgICXc1eT/jHiA=;
 b=U46QV8OXXlIOC8ZTE3pb5BKfwOllSxoA4u93VHl0DZruhC9BKDFUzjKTzBNuI0FMHZ
 2jCwBzwudBqC5IzG+gxce0gjCX9JXbCJvIgTPCma8DwJwBRYuTNzJa42vvZ94VN4xIiQ
 PGG9X//FMX05WIJw5RRdyrr6BgZDVHysdDqWwTVd8dhhX/1F/6f6VMHKm3HGCYky4q3g
 +t7rcm45Ql0sh2ngzReuobjGNUrOjAu+Qjsk3MyJgoZX8kS7oBkZIrALs8j8P6VLuYjf
 KTfkeGizneao5IuIgTzt11pU4+Dq4HWvvmDDF4M+InDh14X/QW4aaB8iXZ55n7nAsdIi
 OG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sBzLNnP33LQkF2qWNmgcia9cgCV+7EgICXc1eT/jHiA=;
 b=BgL5xerqgvA9UWd1+QfcZ3z5OJ232AxHuVW1tfgPQymM4ym9246YAIpcylfBqC/sOn
 yoRk+ChSIFT3ehAGr0FxFehda41PPV5f4Yx2zMC5oShnrFj6p8FnW4GrEtrZjfqvo4dq
 o/+N7mBbMwa3JKgQVEnoht9MOOw/83/oRPqbVcdn33MNgOadsibjrUp6vn0b2Sr8RFB6
 ePc/5r1L5TjlIcTdQQoVRLoqBLBwvAqPC3knW8GRsuATaDJBuld78pvAcKrXCo1cFnhb
 5xi5mhHIxFtR5vrM5Iy7ktowk2pqURbPXL8OTcOplzduBRsWuo46jERqDGcrxgJcxc3Q
 5dfw==
X-Gm-Message-State: AOAM533ysyAgOR1+LBO+wWpfDWv8ZBWjPoAyuuWyU4f2v5OYWCcX7yW6
 jyXweQPlEHa7EfmJe+WCqh2HFoQc/vOF5Sa14D0=
X-Google-Smtp-Source: ABdhPJwgfJkd/8i6DPpsOQjEH52Y9FlZ62QUk9nH72obZAYzJ4Tcd2mYRk/SZl3My3Yt6zi1EiwCIxSLeaqLdYQYdw4=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr11397120otl.370.1625895641933; 
 Fri, 09 Jul 2021 22:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
 <856dc613-018c-20a2-99ac-b602678aa922@foss.st.com>
In-Reply-To: <856dc613-018c-20a2-99ac-b602678aa922@foss.st.com>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Sat, 10 Jul 2021 08:40:30 +0300
Message-ID: <CAGi-RUKbAc1fBVE8T40omNEvLB4yrtGY-DjJ64HAfE5xxTXOOA@mail.gmail.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 Christophe Roullier <christophe.roullier@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 0/6] net: dwc_eth_qos: add support of
 device tree configuration for reset delay
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

On Fri, Jul 9, 2021 at 1:35 PM Patrick DELAUNAY
<patrick.delaunay@foss.st.com> wrote:
>
> Hi Ramon,
>
> On 4/26/21 5:46 PM, Patrick Delaunay wrote:
> > It is the V2 version of [1] after Marek remarks: all commit are new.
> >
> > I change the DWC_ETH_QOS STM32 variant by using generic eth phy driver.
> >
> > This driver is updated to use the gpio reset and assert/deassert delay
> > from DT with the generic binding defined in linux:
> >    Documentation/devicetree/bindings/net/ethernet-phy.yaml
> > or in U-Boot: doc/device-tree-bindings/net/phy.txt
> >
> > [1] net: dwc_eth_qos: add support of device tree configuration for reset delay
> >      http://patchwork.ozlabs.org/project/uboot/list/?series=238253&state=*
> >
> >
> > Changes in v2:
> > - Update eth-phy driver (NEW)
> > - use log macro in eth-phy driver (NEW)
> > - update eth-phy driver to support STM32 binding with a mdio0 subnode (NEW)
> > - remove unused element in the struct eqos_priv (NEW)
> > - use generic ethernet phy for stm32 variant, this patch is a REWORK of
> >    previous serie: the device parsing is done in eth-phy driver and the gpio
> >    support is removed in stm32 variant: eqos_start/stop_resets_stm32 and
> >    eqos_probe_resources_stm32.
> > - cleanup ops by adding a common null ops (NEW)
> >
> > Patrick Delaunay (6):
> >    net: eth-phy: add support of device tree configuration for gpio reset
> >    net: eth-phy: use dev_dbg and log_notice
> >    net: eth-phy: manage subnode mdio0
> >    net: dwc_eth_qos: remove the field phyaddr of the struct eqos_priv
> >    net: dwc_eth_qos: use generic ethernet phy for stm32 variant
> >    net: dwc: add a common empty ops eqos_null_ops
> >
> >   drivers/net/Kconfig          |   1 +
> >   drivers/net/dwc_eth_qos.c    | 152 +++++------------------------------
> >   drivers/net/eth-phy-uclass.c |  78 +++++++++++++++---
> >   3 files changed, 91 insertions(+), 140 deletions(-)
> >
>
> This serie is also accepted in patchwork,  but not merged in
> u-boot-net/network_master:
>
> http://patchwork.ozlabs.org/project/uboot/list/?series=240808&state=*
>
> Do you plan to integrate it in you next pull request for v2021.10 ?
>
>
> Regards
>
> Patrick
>
>
Slipped under my arms someway, I will review shortly.
Sorry.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

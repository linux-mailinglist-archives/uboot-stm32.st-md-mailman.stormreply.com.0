Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDC736F0D2
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Apr 2021 22:10:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68372C58D5A;
	Thu, 29 Apr 2021 20:10:50 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80968C58D59
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 20:10:49 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id i11so5765757oig.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 13:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b8fTPiVSi7jVKJkc5HOL5dvpC80JqCkmAmbMcoYf0Nk=;
 b=qWAOTFS+9qikrIMd2jCW1tNBL9sDOAODrx6QKje39CKCtJS/boeJ9PklFOQ9NvVXz6
 VcB/3V++9EGj+0yojeh8Om8RRgolGCK1d7IjELpHZoZ8IkPe/k0gHPza4gD0Oevh6rJZ
 6YorHAXl9ocjvSlf6lCriGvQ0+J9tCEEFxc3SlnMKg4GL+4AbIEfRhzv8FCkyV0dkzGD
 IZmleTOumWeZwZRobcRrY9PXUH41fUCjm1uX8URNobFkzBfOQBEhi+5kurNKsqw8mzV6
 y2Pd5m4vXq235exVHlaBXedI7nuUdmA1IkicgzojNw62eRJGYoPkWYrsm/Dn80MxKD9Y
 G/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b8fTPiVSi7jVKJkc5HOL5dvpC80JqCkmAmbMcoYf0Nk=;
 b=qcek6YO8jL775oheTa7GrXMr72vZ/0XxR/Omm23nS/LaUKy5YKpyMfRgSN+bLq1f4B
 B0+Ofn7vboVC2Adi8XVeVXIVAdJUefc3fRQB9o67t/72+4we5MeBFv1kx5uDV7t3ndlX
 ZSwrJ+V9di26YZeqF5syD1Yri1uwNDfDzUNtxKvqaQsBoHMqoqpoLKYTFa88T49IHHr7
 41KDRf6FHMi5yBa4rQVxYZHiJcYeNfFX8G/tSJThzu0cG5Z0mKYUlBXp6SnD6ho80C85
 ATdKC8LpGiMesMd2YFJMFEwQzY+WateCeHSZX42ltRINmLqoosLhE1L7p4wtudOHOJf1
 dqng==
X-Gm-Message-State: AOAM531CYZdd5LGkoAaqushYDsJ04pSV+qaof38Tn5yxZKE/AwkxKoGX
 xkpWYXbljGPrU6WE6Qk57UXXTNNivNYpxfWHgb8=
X-Google-Smtp-Source: ABdhPJzeaS0gKLgSPDhrQOxuRZAwfEtWev9/59MMtDXPVnXyGt2LaZN2VT8oSJWpM8RCP2sFF0f47eEpA30RBDaJw/A=
X-Received: by 2002:a05:6808:211:: with SMTP id
 l17mr8315871oie.92.1619727048417; 
 Thu, 29 Apr 2021 13:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
 <20210426174647.v2.2.I523f439458f0ff2d770a2b8e8a7c8e0969e783dd@changeid>
In-Reply-To: <20210426174647.v2.2.I523f439458f0ff2d770a2b8e8a7c8e0969e783dd@changeid>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Thu, 29 Apr 2021 23:10:37 +0300
Message-ID: <CAGi-RUL0xSZWj6uYLHB_8SX1jF2RTW-aXUy+fRf=GaM7MJcxYg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Roullier <christophe.roullier@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/6] net: eth-phy: use dev_dbg and
	log_notice
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

On Mon, Apr 26, 2021 at 6:47 PM Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Replace debug trace and printf to log macros:
> - debug() replaced by dev_dbg() when device is available, this macro
> indicate the device name since commit ceb70bb870ac ("dm: Print device
> name in dev_xxx like Linux")
> - printf() replaced by log_notice() to allow  dispatch to log backends.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> Changes in v2:
> - use log macro in eth-phy driver (NEW)
>
>  drivers/net/eth-phy-uclass.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/net/eth-phy-uclass.c b/drivers/net/eth-phy-uclass.c
> index 153f6909eb..962084a7c9 100644
> --- a/drivers/net/eth-phy-uclass.c
> +++ b/drivers/net/eth-phy-uclass.c
> @@ -5,8 +5,10 @@
>
>  #include <common.h>
>  #include <dm.h>
> +#include <log.h>
>  #include <net.h>
>  #include <asm-generic/gpio.h>
> +#include <dm/device_compat.h>
>  #include <dm/device-internal.h>
>  #include <dm/uclass-internal.h>
>  #include <dm/lists.h>
> @@ -27,25 +29,25 @@ int eth_phy_binds_nodes(struct udevice *eth_dev)
>
>         mdio_node = dev_read_subnode(eth_dev, "mdio");
>         if (!ofnode_valid(mdio_node)) {
> -               debug("%s: %s mdio subnode not found!", __func__,
> -                     eth_dev->name);
> +               dev_dbg(eth_dev, "%s: %s mdio subnode not found!", __func__,
> +                       eth_dev->name);
>                 return -ENXIO;
>         }
>
>         ofnode_for_each_subnode(phy_node, mdio_node) {
>                 node_name = ofnode_get_name(phy_node);
>
> -               debug("* Found child node: '%s'\n", node_name);
> +               dev_dbg(eth_dev, "* Found child node: '%s'\n", node_name);
>
>                 ret = device_bind_driver_to_node(eth_dev,
>                                                  "eth_phy_generic_drv",
>                                                  node_name, phy_node, NULL);
>                 if (ret) {
> -                       debug("  - Eth phy binding error: %d\n", ret);
> +                       dev_dbg(eth_dev, "  - Eth phy binding error: %d\n", ret);
>                         continue;
>                 }
>
> -               debug("  - bound phy device: '%s'\n", node_name);
> +               dev_dbg(eth_dev, "  - bound phy device: '%s'\n", node_name);
>         }
>
>         return 0;
> @@ -86,14 +88,14 @@ struct mii_dev *eth_phy_get_mdio_bus(struct udevice *eth_dev)
>                          */
>                         uc_priv = (struct eth_phy_device_priv *)(dev_get_uclass_priv(phy_dev));
>                         if (uc_priv->mdio_bus)
> -                               printf("Get shared mii bus on %s\n", eth_dev->name);
> +                               log_notice("Get shared mii bus on %s\n", eth_dev->name);
>                         else
> -                               printf("Can't get shared mii bus on %s\n", eth_dev->name);
> +                               log_notice("Can't get shared mii bus on %s\n", eth_dev->name);
>
>                         return uc_priv->mdio_bus;
>                 }
>         } else {
> -               printf("FEC: can't find phy-handle\n");
> +               log_notice("FEC: can't find phy-handle\n");
>         }
>
>         return NULL;
> @@ -106,7 +108,7 @@ int eth_phy_get_addr(struct udevice *dev)
>
>         if (dev_read_phandle_with_args(dev, "phy-handle", NULL, 0, 0,
>                                        &phandle_args)) {
> -               debug("Failed to find phy-handle");
> +               dev_dbg(dev, "Failed to find phy-handle");
>                 return -ENODEV;
>         }
>
> --
> 2.17.1
>
Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 870483D2C61
	for <lists+uboot-stm32@lfdr.de>; Thu, 22 Jul 2021 21:07:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F2C3C5A4CD;
	Thu, 22 Jul 2021 19:07:06 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A6C7C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 19:07:05 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id p67so7726179oig.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 12:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RY53BrB7EYz3Q2vnUd+/6g52NBY4/yVAdKYy7w83I/I=;
 b=LHqEwake8yXizw/0zHyPRRoheZMx8+S34wyqosxBtflk6O6nrTnp+WOzh028J9lMvi
 PQ7ouxUbEjqp2nRSSpDVnC5DCvUT639s8Ucm89KD3dzyRnE4jNI7go/rTv+y+bS09W5F
 3uhx8QLhfVjN106ip0nBv+TCPkDzgrdRs1PXk+zQM2nEXZOmecBoDpV1ZWHbBWodmQob
 z1R/WzEs2Fwq+HoLUwl4Eoczx6LVSnT6sBLvHsCnVJMLgGXRc1is4MaJdCmhFYgH/jHZ
 9BnQTWctzw2ickiE/kLM4r4uPwyrrq9KGrnEN1U/VuxtzqcnoLlbHPMD7GAWv4349fG7
 oeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RY53BrB7EYz3Q2vnUd+/6g52NBY4/yVAdKYy7w83I/I=;
 b=OUa64Domjqz4YTGjB1v7D+o92BxH8CI5vYw6tlzJ8OqEA9ww48jfX6if8QLNBDDEJ2
 yPw2ltFENk32y2r0o2wewMMrdkbvTBym68Diix26XyE9GXLYi4Flqb8obJGhB0hn2CQW
 MmR0JH3egg8/FBNQiW0X84rE0geYBnyfcB2jP7Udd688SjXV16cSUs6tHRKFbuD6pp0v
 LUZCYnIYiCwUydZ6Yjj9pM3J4yPVWPrIf27Y0zMNzxmOAv1tWSl/6l1fEU4ZNg65JhMN
 rMyi1CJZmxnMPlSu46twYxP5h2hr+ej+DoUJhXOJXoAPkJ/qtUs1Gr6/92baCd/ZlKm4
 /Pjg==
X-Gm-Message-State: AOAM530Kd4VakxW2h0daesciGhoF3uRY5E9bZuMjn/Wl0guOK42Azn3T
 xAfNcGHtALwJMGWmcPYFCLCEOA8P+brrt5SJ3C8=
X-Google-Smtp-Source: ABdhPJwqOY00lHhaHUB+dtpXwC6xONn9oaopiUp1ikhZZZaRcoRU9azDAtaobKHb4dZ3DkKLesA3tEQE1T1NWrJuh+Q=
X-Received: by 2002:a05:6808:f8a:: with SMTP id
 o10mr6728528oiw.22.1626980823912; 
 Thu, 22 Jul 2021 12:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210720180957.2948197-1-patrick.delaunay@foss.st.com>
 <20210720200940.v3.2.I523f439458f0ff2d770a2b8e8a7c8e0969e783dd@changeid>
In-Reply-To: <20210720200940.v3.2.I523f439458f0ff2d770a2b8e8a7c8e0969e783dd@changeid>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Thu, 22 Jul 2021 22:06:52 +0300
Message-ID: <CAGi-RULE667QmMyBLVy1=fsma_9XaKrp-rxXcvQmRQRER_nEtQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v3 2/6] net: eth-phy: use dev_dbg and
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

On Tue, Jul 20, 2021 at 9:10 PM Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Replace debug trace and printf to log macros:
> - debug() replaced by dev_dbg() when device is available, this macro
> indicate the device name since commit ceb70bb870ac ("dm: Print device
> name in dev_xxx like Linux")
> - printf() replaced by log_notice() to allow  dispatch to log backends.
>
> Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - use log macro in eth-phy driver (NEW)
>
>  drivers/net/eth-phy-uclass.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/net/eth-phy-uclass.c b/drivers/net/eth-phy-uclass.c
> index 7abed14392..aa5b05abc8 100644
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
> 2.25.1
>
Applied to u-boot-net/network-master
Thanks,
Ramon.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

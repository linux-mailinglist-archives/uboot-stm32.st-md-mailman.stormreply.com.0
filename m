Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 979AE36F0D1
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Apr 2021 22:10:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 599B1C58D5A;
	Thu, 29 Apr 2021 20:10:23 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86F81C58D59
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 20:10:21 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id i11so5764443oig.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 13:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bKDAeABraefoSKMJIP5BtHu+sgPF9HODS3zuFqXNet8=;
 b=NxaqBfEjzP8GsvDFU1cHJVdaF2TbVIlDA/nCZFdGXdMMPdYjlwisWDc4R26OUfbsVJ
 9hywtRosOv6JQHU2tBRbnW8NSUpJhbeEvyn0+7scm4wUWTMfcT9O7/qtEGK5T5vAF6n4
 8qmnPCy3Tg6UWq2PE5mIWApYaplMrPrnuHF0yXqIdHlB4K7HLTc9sXzfJKk1IPZt64zS
 Q5DA+DpzD6qFGV1H7VDNV5ae+NOlYKEtLKfdudQsT1FZBfVpHdvpVoAPvOXqw9zmom5W
 cXk86ieCKZkWZC/bVzKB1xOE52qUG5hO7wpXNmgBsFBSx0iaPJgYT0JeRZZwKRv3IxkC
 JV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bKDAeABraefoSKMJIP5BtHu+sgPF9HODS3zuFqXNet8=;
 b=dW8YTc1AKf+r6evFnkp0D1a/OzWkQD+9M5/FKwbkipZ67rWFKPE/reHBb2YJZMLzIK
 xBE1VMeBHx8eSX/ZdUpvO5arxaXTgqhqvB+4IQkuQYXqpgtWobbeE0nLEcyX5mP2IjLY
 dTvZi3k1e5Yfah4goW087MRsHEbKwk9oJ7UGdTrI2YbPGmZjpBkmYSLSgUb10TJ3bRkm
 i3K8wXM2r+KvcJFAiPvezt0Ho4JOqXAkVBd3rMzqSyOPc8bv4IlIAXS1KeaWKUl7cphT
 bd7ShCdRanR9MDlx0S6tCUtrjrES7LBmFocytCFeUEH3opg8iT3C5dlTKOujavGoFn6t
 x7Uw==
X-Gm-Message-State: AOAM530xSfYqWn3Zn3MraxSpGoRmHSinyfYUpdDy+6A/zfwixaeQuQbR
 7teO7UrzKs1jlsNWKSXvAGzV1/P8EIpBJ5sUYBQ=
X-Google-Smtp-Source: ABdhPJyTqmBILvC7pufuOd/DUy/DZ3+NzaNt2cNhDr5y3565U9iX+ryLrTejoQ/dBIqH6ZSACoVzm757Rb/dbwrxfI4=
X-Received: by 2002:aca:c3cf:: with SMTP id t198mr8468776oif.179.1619727020294; 
 Thu, 29 Apr 2021 13:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
 <20210426174647.v2.1.I5a50f8eef93c11cb54dfdd3b11183422a82fb373@changeid>
In-Reply-To: <20210426174647.v2.1.I5a50f8eef93c11cb54dfdd3b11183422a82fb373@changeid>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Thu, 29 Apr 2021 23:10:09 +0300
Message-ID: <CAGi-RU+7ua3UjFW5cAL8Bc=fpozgpNm4Cf51xno4H7gbgCsZjA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Roullier <christophe.roullier@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/6] net: eth-phy: add support of
 device tree configuration for gpio reset
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
> The gpio reset and the assert or deassert delay are defined in generic
> binding of the ethernet phy in Linux:
> Documentation/devicetree/bindings/net/ethernet-phy.yaml
>
>   reset-gpios:
>     maxItems: 1
>     description:
>       The GPIO phandle and specifier for the PHY reset signal.
>
>   reset-assert-us:
>     description:
>       Delay after the reset was asserted in microseconds. If this
>       property is missing the delay will be skipped.
>
>   reset-deassert-us:
>     description:
>       Delay after the reset was deasserted in microseconds. If
>       this property is missing the delay will be skipped.
>
> See also U-Boot: doc/device-tree-bindings/net/phy.txt
>
> This patch adds the parsing of this common DT properties in the
> u-class "eth_phy_generic", used by default in the associated driver
> "eth_phy_generic_drv"
>
> This parsing function eth_phy_of_to_plat can be reused by other
> ethernet phy drivers for this uclass UCLASS_ETH_PHY.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> Changes in v2:
> - Update eth-phy driver (NEW)
>
>  drivers/net/eth-phy-uclass.c | 50 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/drivers/net/eth-phy-uclass.c b/drivers/net/eth-phy-uclass.c
> index 07aebd935e..153f6909eb 100644
> --- a/drivers/net/eth-phy-uclass.c
> +++ b/drivers/net/eth-phy-uclass.c
> @@ -6,12 +6,17 @@
>  #include <common.h>
>  #include <dm.h>
>  #include <net.h>
> +#include <asm-generic/gpio.h>
>  #include <dm/device-internal.h>
>  #include <dm/uclass-internal.h>
>  #include <dm/lists.h>
> +#include <linux/delay.h>
>
>  struct eth_phy_device_priv {
>         struct mii_dev *mdio_bus;
> +       struct gpio_desc reset_gpio;
> +       u32 reset_assert_delay;
> +       u32 reset_deassert_delay;
>  };
>
>  int eth_phy_binds_nodes(struct udevice *eth_dev)
> @@ -110,13 +115,58 @@ int eth_phy_get_addr(struct udevice *dev)
>         return reg;
>  }
>
> +/* parsing generic properties of devicetree/bindings/net/ethernet-phy.yaml */
> +static int eth_phy_of_to_plat(struct udevice *dev)
> +{
> +       struct eth_phy_device_priv *uc_priv = dev_get_uclass_priv(dev);
> +       int ret;
> +
> +       /* search "reset-gpios" in phy node */
> +       ret = gpio_request_by_name(dev, "reset-gpios", 0,
> +                                  &uc_priv->reset_gpio,
> +                                  GPIOD_IS_OUT);
> +       if (ret != -ENOENT)
> +               return ret;
> +
> +       uc_priv->reset_assert_delay = dev_read_u32_default(dev, "reset-assert-us", 0);
> +       uc_priv->reset_deassert_delay = dev_read_u32_default(dev, "reset-deassert-us", 0);
> +
> +       return 0;
> +}
> +
> +void eth_phy_reset(struct udevice *dev, int value)
> +{
> +       struct eth_phy_device_priv *uc_priv = dev_get_uclass_priv(dev);
> +       u32 delay;
> +
> +       if (!dm_gpio_is_valid(&uc_priv->reset_gpio))
> +               return;
> +
> +       dm_gpio_set_value(&uc_priv->reset_gpio, value);
> +
> +       delay = value ? uc_priv->reset_assert_delay : uc_priv->reset_deassert_delay;
> +       if (delay)
> +               udelay(delay);
> +}
> +
> +static int eth_phy_pre_probe(struct udevice *dev)
> +{
> +       /* Assert and deassert the reset signal */
> +       eth_phy_reset(dev, 1);
> +       eth_phy_reset(dev, 0);
> +
> +       return 0;
> +}
> +
>  UCLASS_DRIVER(eth_phy_generic) = {
>         .id             = UCLASS_ETH_PHY,
>         .name           = "eth_phy_generic",
>         .per_device_auto        = sizeof(struct eth_phy_device_priv),
> +       .pre_probe      = eth_phy_pre_probe,
>  };
>
>  U_BOOT_DRIVER(eth_phy_generic_drv) = {
>         .name           = "eth_phy_generic_drv",
>         .id             = UCLASS_ETH_PHY,
> +       .of_to_plat     = eth_phy_of_to_plat,
>  };
> --
> 2.17.1
>
Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 964863D2C5D
	for <lists+uboot-stm32@lfdr.de>; Thu, 22 Jul 2021 21:06:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4398FC5A4CD;
	Thu, 22 Jul 2021 19:06:54 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1394C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 19:06:52 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 f93-20020a9d03e60000b02904b1f1d7c5f4so2732176otf.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 12:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ay+6kjZ0wXyDmwOX6f4DeXshIDAe4JS7R6GbFZfjNMo=;
 b=V/uE6hheEw6sKASkt1zIWFMJj8fWC1C6/fs5vtPz5FsrcPNEeAJRBCRPJDo4ULqxBr
 xNOVhI3sTOctohVXPbfvmDZjL1Wh9Fx2Z+sEp2YYBbKHKrqfa2GM/hpb6wpzzceF5L7j
 vlPGbMBzWmlRdEV+9dmEpEu/YEnfbzvvVO/SZNugWu7ClcX33HW7RFYgN5shALOdipLY
 BXFQmr+ZIeD02gEV6O38yXOjMciLRIjatVwAfS7BRN0NHPSWL4W3JPh8uNJ/70Y5tBVe
 BGx3NwrN3rsild2vlxNZ3dNNru5TBb7X6B7y+fDzqUnwJSSFxCD6gyCqddFyExNiTu2H
 OVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ay+6kjZ0wXyDmwOX6f4DeXshIDAe4JS7R6GbFZfjNMo=;
 b=lRN6BbTcDtMvhjpDuvsLOsZW/qYq3BLxQRNhdVmOSscYFpIoTGIR2WCxwgcWt/eskh
 5+q0gBtqbHvTuqwsHYpLFXrXIqDPzF6cvgpZYPRlARVCf6KIPASWeLPGTe09cBJxSdfD
 bFT4vuP2IrcDujqGx5zmCywzxgzA98iqm8tszd6z01sWzfbVb/qeH9Smu/Kq60Yy2kiz
 jwgeElrtCkUYBdXmjazHjMO5iqei7V/vtRkKE88xsAdI2066Dqo9D+WeRHvl/EAbY5Jd
 AB+eC6YyZyHlBETSAWctfq/+EJqboj6eHu5GVIDi1NCnusrSCqv0ZwQUeqHN1JHPi5tb
 txUQ==
X-Gm-Message-State: AOAM533MQAw/FJrqDUwAUT4cK+Z6s0D4MKc9V2vDnO4dsZ5gt2Eq4SqF
 huRDrf2BincmM36FEg7U0105jxetpL7lvUDoirQ=
X-Google-Smtp-Source: ABdhPJyhoJIXVj+TCsjxIBA5P8Y5u1zxMGHf8UNXw/dliXOViQ9LhTEte5QlWjuBnM7Klwe7R0ikWxxkW3Ts0ZnZbpI=
X-Received: by 2002:a9d:12f:: with SMTP id 44mr902297otu.14.1626980811660;
 Thu, 22 Jul 2021 12:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210720180957.2948197-1-patrick.delaunay@foss.st.com>
 <20210720200940.v3.1.I5a50f8eef93c11cb54dfdd3b11183422a82fb373@changeid>
In-Reply-To: <20210720200940.v3.1.I5a50f8eef93c11cb54dfdd3b11183422a82fb373@changeid>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Thu, 22 Jul 2021 22:06:40 +0300
Message-ID: <CAGi-RULLcab9yb3+w-jU7MvSSS8CAFWCojxrRyrMx9Ge+ym6Vw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v3 1/6] net: eth-phy: add support of
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

On Tue, Jul 20, 2021 at 9:10 PM Patrick Delaunay
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
> Changes in v3:
> - allow compilation without DM_GPIO
>
> Changes in v2:
> - Update eth-phy driver (NEW)
>
>  drivers/net/eth-phy-uclass.c | 56 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>
> diff --git a/drivers/net/eth-phy-uclass.c b/drivers/net/eth-phy-uclass.c
> index 07aebd935e..7abed14392 100644
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
> @@ -110,13 +115,64 @@ int eth_phy_get_addr(struct udevice *dev)
>         return reg;
>  }
>
> +/* parsing generic properties of devicetree/bindings/net/ethernet-phy.yaml */
> +static int eth_phy_of_to_plat(struct udevice *dev)
> +{
> +       struct eth_phy_device_priv *uc_priv = dev_get_uclass_priv(dev);
> +       int ret;
> +
> +       if (!CONFIG_IS_ENABLED(DM_GPIO))
> +               return 0;
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
> +       if (!CONFIG_IS_ENABLED(DM_GPIO))
> +               return;
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
> 2.25.1
>
Applied to u-boot-net/network-master
Thanks,
Ramon.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3289436F0D6
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Apr 2021 22:13:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECC5FC58D5A;
	Thu, 29 Apr 2021 20:13:30 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2498C58D59
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 20:13:27 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 z20-20020a0568301294b02902a52ecbaf18so10151121otp.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 13:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EcHsaPTyk6zuRpGt7RvBVOHDnK0YRSAr5A/P5zHeVPA=;
 b=gZwQruKwGbigqBvcz3ZjegLwN6Qf5CvvpGOfveDE3OPYl6QoDeUszQ9iHbeF0kN6cr
 Xm8KJD0ZrOOrVzXhVNwpvgOSV+DBCFr4SYw93rdpXYDHhXglJvRNXNVYEmMyPO3wIR8Q
 vUAjExiAexKov+VNWjFrFS9Y8ax878PIpP2qZxN54fikSos44nRdjYzG7wYpsZ6OmAKL
 Fi9e6kdeiyQ9wjONVh3vBB23jJAf4woengnt3C8bippBkxBsNNMwvFG9HWd4QqLegxil
 rQ3aYG1yvqeL8BbIrw7HiDkdkzdYmtTBq1bD+xRUmasRVDuHG7FfcaSO5U6VR+vpWL1A
 QRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EcHsaPTyk6zuRpGt7RvBVOHDnK0YRSAr5A/P5zHeVPA=;
 b=L8rR+ws7RmNSCMjibo0rS+l7m2W0FkBihuxrChjKitLLLYMh+hWB6GeSDzd8cQePgm
 yj7wvM6niJjWu4+/EcoMSqJWlh+E//WDE5UBltXB/sY/nymKCoKQ90r3bb6F4rM3gsSu
 xt1HXeYqn8Y2CfrVZvUcGjpNrrlI3rCfOSR8FXe65Hmx5aqpiajv1Dv+ambiWXMf48ST
 Q5nIxcMNAf/XIt0XDjskyj9v5M8pQfrK6iOvlX/8TkI8obT6rKrS2TMIu2JXqJI/eAMx
 K0mYP4PS+G+8SCXc0+jJv2sdzN841mG9NNwUaw3xWjjfkDPQMD3vatKK7Es7b5Aa2mQs
 V8ng==
X-Gm-Message-State: AOAM530PJ0j7URkCLoHxqAaG0JeH3Zo7j7XUQ0yCS2tmXEUe4hCudcMC
 /+k03gCBJrh499cPjoAWVxciXZ69jReLx3kT134=
X-Google-Smtp-Source: ABdhPJyJHYMqfES35XYehkr0uuUp6kEHSaYUyRfFH5MTHO82wFDnbR3kTf1B9Nef8SIemdIczdAAjwsJe27pxtOUg2E=
X-Received: by 2002:a9d:4683:: with SMTP id z3mr910716ote.370.1619727206546;
 Thu, 29 Apr 2021 13:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
 <20210426174647.v2.5.I52d5d9f5fb91b6bd92ec7fed517bfe36074d487d@changeid>
In-Reply-To: <20210426174647.v2.5.I52d5d9f5fb91b6bd92ec7fed517bfe36074d487d@changeid>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Thu, 29 Apr 2021 23:13:15 +0300
Message-ID: <CAGi-RUKN3FRz+zRqVScP3yYq6ROCr3vtdNF6xHVidXHvBdukHQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Roullier <christophe.roullier@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v2 5/6] net: dwc_eth_qos: use generic
 ethernet phy for stm32 variant
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
> Use the generic ethernet phy which already manages the correct binding
> for gpio reset, including the assert an deassert delays.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> Changes in v2:
> - use generic ethernet phy for stm32 variant, this patch is a REWORK of
>   previous serie: the device parsing is done in eth-phy driver and the gpio
>   support is removed in stm32 variant: eqos_start/stop_resets_stm32 and
>   eqos_probe_resources_stm32.
>
>  drivers/net/Kconfig       |  1 +
>  drivers/net/dwc_eth_qos.c | 50 ---------------------------------------
>  2 files changed, 1 insertion(+), 50 deletions(-)
>
> diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
> index 382639044b..adf43fb42a 100644
> --- a/drivers/net/Kconfig
> +++ b/drivers/net/Kconfig
> @@ -206,6 +206,7 @@ config DWC_ETH_QOS_IMX
>  config DWC_ETH_QOS_STM32
>         bool "Synopsys DWC Ethernet QOS device support for STM32"
>         depends on DWC_ETH_QOS
> +       select DM_ETH_PHY
>         default y if ARCH_STM32MP
>         help
>           The Synopsys Designware Ethernet QOS IP block with the specific
> diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
> index e625aea8d1..3fb8bfaf3a 100644
> --- a/drivers/net/dwc_eth_qos.c
> +++ b/drivers/net/dwc_eth_qos.c
> @@ -700,29 +700,6 @@ static int eqos_start_resets_tegra186(struct udevice *dev)
>
>  static int eqos_start_resets_stm32(struct udevice *dev)
>  {
> -       struct eqos_priv *eqos = dev_get_priv(dev);
> -       int ret;
> -
> -       debug("%s(dev=%p):\n", __func__, dev);
> -       if (dm_gpio_is_valid(&eqos->phy_reset_gpio)) {
> -               ret = dm_gpio_set_value(&eqos->phy_reset_gpio, 1);
> -               if (ret < 0) {
> -                       pr_err("dm_gpio_set_value(phy_reset, assert) failed: %d",
> -                              ret);
> -                       return ret;
> -               }
> -
> -               udelay(2);
> -
> -               ret = dm_gpio_set_value(&eqos->phy_reset_gpio, 0);
> -               if (ret < 0) {
> -                       pr_err("dm_gpio_set_value(phy_reset, deassert) failed: %d",
> -                              ret);
> -                       return ret;
> -               }
> -       }
> -       debug("%s: OK\n", __func__);
> -
>         return 0;
>  }
>
> @@ -743,18 +720,6 @@ static int eqos_stop_resets_tegra186(struct udevice *dev)
>
>  static int eqos_stop_resets_stm32(struct udevice *dev)
>  {
> -       struct eqos_priv *eqos = dev_get_priv(dev);
> -       int ret;
> -
> -       if (dm_gpio_is_valid(&eqos->phy_reset_gpio)) {
> -               ret = dm_gpio_set_value(&eqos->phy_reset_gpio, 1);
> -               if (ret < 0) {
> -                       pr_err("dm_gpio_set_value(phy_reset, assert) failed: %d",
> -                              ret);
> -                       return ret;
> -               }
> -       }
> -
>         return 0;
>  }
>
> @@ -1785,7 +1750,6 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
>         struct eqos_priv *eqos = dev_get_priv(dev);
>         int ret;
>         phy_interface_t interface;
> -       struct ofnode_phandle_args phandle_args;
>
>         debug("%s(dev=%p):\n", __func__, dev);
>
> @@ -1825,20 +1789,6 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
>         if (ret)
>                 pr_warn("No phy clock provided %d", ret);
>
> -       ret = dev_read_phandle_with_args(dev, "phy-handle", NULL, 0, 0,
> -                                        &phandle_args);
> -       if (!ret) {
> -               /* search "reset-gpios" in phy node */
> -               ret = gpio_request_by_name_nodev(phandle_args.node,
> -                                                "reset-gpios", 0,
> -                                                &eqos->phy_reset_gpio,
> -                                                GPIOD_IS_OUT |
> -                                                GPIOD_IS_OUT_ACTIVE);
> -               if (ret)
> -                       pr_warn("gpio_request_by_name(phy reset) not provided %d",
> -                               ret);
> -       }
> -
>         debug("%s: OK\n", __func__);
>         return 0;
>
> --
> 2.17.1
>
Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

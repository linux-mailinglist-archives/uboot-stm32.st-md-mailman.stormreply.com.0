Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A403D2C64
	for <lists+uboot-stm32@lfdr.de>; Thu, 22 Jul 2021 21:07:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4766EC5A4CE;
	Thu, 22 Jul 2021 19:07:44 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BA97C5A4CD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 19:07:41 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id y66so7706454oie.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 12:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o6TUN0clg4hpxA5A5rD05D1OvLuyNmhler02qOXHvk8=;
 b=bi+2gC3a+tK7cLVJQMG3/rTY/FLOQvv/v63L7hyW6St4T2/Cyy6SHg1nox13/79Bqe
 oiEhiCKZBRWmyUqxPPcgYKQ5IH+1TxVw/TRwv4sPn3tlCa2MNWsxDBEbcloWs4u/HBOG
 V1JIhKWhki0heispsRlC5tWAqj2MzvOW8EhQ2pF6/DtHnfiVOBv/VbZgdGUyGX9daiIJ
 hS5LGGU0r4LzYmcpLXrqS27wDwUNie7kZQQiEvMS5P1lHHLT+fLNPEVIoB+7YgpGVK7i
 aETGm0oUM2l7WdDKbXixoOVRaJ+2QgOFvsxb/duLg27YRFaS7r3ioNaC8HDjKRGQhVuj
 K92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o6TUN0clg4hpxA5A5rD05D1OvLuyNmhler02qOXHvk8=;
 b=Y05y+XYhY7/eJC/bnYTkycOuQ2WPgiWRZkLTE0yXtQHxG7JKbZpB2zr/j4w1cmHGy7
 43AtNutCuPk9XAqVdkpv7R6hZ9/QJQBb0qxL80t7vw6uP/aNsmslkt8X+HQO+lpx/F5Y
 iuS2ZrPwAyTxIAhVCWM4AcONzbYil/Z61II6WKw7Cs5Dtp/g9nKGXWf1PUTAcAfBdyxu
 XHpzzFkRYZ3o7J6KASdroOb089rPgIJYywzp0I1RXNogYrAVkqRShRKw7CPFy6C6VAeF
 10Pz7pb1EI+CvpnsmnGmuwas3LpfUCjIeJyVj+EqqMEVCyn6OE87f4NN5V6vrl4jcTjS
 yYsg==
X-Gm-Message-State: AOAM531q0xXm4ttsl2nqI25/tKNsa77gwJUwhHXvIpy69MJRBU2/ieV4
 rWYMkVvi7G5lLJHm6mvX8bdSQW8MM6M1i1/jevw=
X-Google-Smtp-Source: ABdhPJwMhlLB3XcSYEwNZvmvjp5HOe29XL6aEpIp0RRaW5b78D9b5HpXDJbZOBhhxgCLPGQkLjTZu1KTlNzj6yHl2MI=
X-Received: by 2002:a05:6808:f8a:: with SMTP id
 o10mr6730464oiw.22.1626980860569; 
 Thu, 22 Jul 2021 12:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210720180957.2948197-1-patrick.delaunay@foss.st.com>
 <20210720200940.v3.5.I52d5d9f5fb91b6bd92ec7fed517bfe36074d487d@changeid>
In-Reply-To: <20210720200940.v3.5.I52d5d9f5fb91b6bd92ec7fed517bfe36074d487d@changeid>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Thu, 22 Jul 2021 22:07:29 +0300
Message-ID: <CAGi-RUJD1Wkgf9usCJCd6mddNhs4yPvdZTMDFthfSwHfUR-qew@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v3 5/6] net: dwc_eth_qos: use generic
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

On Tue, Jul 20, 2021 at 9:10 PM Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Use the generic ethernet phy which already manages the correct binding
> for gpio reset, including the assert an deassert delays.
>
> Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> (no changes since v2)
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
> index 726ad36b7c..130db9fb39 100644
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
> index a57c35785f..9b1746b78b 100644
> --- a/drivers/net/dwc_eth_qos.c
> +++ b/drivers/net/dwc_eth_qos.c
> @@ -696,29 +696,6 @@ static int eqos_start_resets_tegra186(struct udevice *dev)
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
> @@ -739,18 +716,6 @@ static int eqos_stop_resets_tegra186(struct udevice *dev)
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
> @@ -1772,7 +1737,6 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
>         struct eqos_priv *eqos = dev_get_priv(dev);
>         int ret;
>         phy_interface_t interface;
> -       struct ofnode_phandle_args phandle_args;
>
>         debug("%s(dev=%p):\n", __func__, dev);
>
> @@ -1812,20 +1776,6 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
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
> 2.25.1
>
Applied to u-boot-net/network-master
Thanks,
Ramon.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

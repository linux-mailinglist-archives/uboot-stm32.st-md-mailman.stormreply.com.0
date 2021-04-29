Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 412D236F0DF
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Apr 2021 22:14:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09900C58D5A;
	Thu, 29 Apr 2021 20:14:16 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABC39C58D59
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 20:14:13 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id i11so5775330oig.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 13:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yay4+NUI8nXkkO0gTD0WjWD0QN78StmMAyv9G/Hwvu8=;
 b=PS0ahdB0S8743OTrR6R1RcdejB/vqqJdSM87z2yXMqM0IFujmySF4SME7pKMMEXSkH
 lm4x/L9kBqxVCk0TCRPoh7mTMJBrBlq5e90iALU2e92Ntuhmq8YSpp3AYqm93Uz5jTdC
 QID80zvt2pqGhr4ssHPmnkpCqs9/aHmlgY8gumFRaIV3RvM+TkCU4YBwVW9N3Z8i/j7S
 TB7buNPQIxQSvA1v+/CV+/qDr7Nflhh16+NZrq2bSBhctuiume0sXCyQcFtwmn4sp3qP
 0xugaqh39O7dPLB3i/Y8zaCDUCTVsugd1vYpBlay/PR6SPV5F1S9Oppt/6NEYWdVtc8z
 YF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yay4+NUI8nXkkO0gTD0WjWD0QN78StmMAyv9G/Hwvu8=;
 b=dalScNV4fRpIB3o+39YBkwBqnQPve3NJP6eF5J+BMah+Vk3eutiweDHffCNM14ckof
 XqKYJrcwEf4JHU32bTOH88Qd6YtthJc+JdPwgg/ci9kKkQVHl+LxkpQ/EodpqMG5X5er
 3ZZLwpUMNAP2vE4jWQQqRALlxYj/6aZMmnhz5sScGE0WMxk1IRPUvtIitnHr6FGuOLt4
 GJCq9QiJZ74Pm4GVqU8czMDqrMrtBlNBgAg1Qx0Yio4fLf+djrcNDWRol8NOoRYnEo5d
 DQdRCTFsLcE5se4MsoeNQdeJLIRomgG46EHWjUNB6/IAnd/krtfevAPRZhfc8nCWqiiL
 V9aw==
X-Gm-Message-State: AOAM533nW+zvr0vCj0zytmAJaxWSxE9bGMXnnjXq6QRtE74/OByBFm+7
 s6ygGEtgcIsqUcM/De3MD47+8YZfPvxTaLcz0hQ=
X-Google-Smtp-Source: ABdhPJwbvCZxWKBzpkmqAVmHYUkzTQtl2JmSQCRWawmKK1s6C1r75oxQd0DzXKWcCsmIWdu2SgttV3fQELMcXWUAdqY=
X-Received: by 2002:aca:4cc:: with SMTP id 195mr8329750oie.22.1619727252762;
 Thu, 29 Apr 2021 13:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
 <20210426174647.v2.6.I05af0032a32df49c4d6b7a18a84e2fd409097989@changeid>
In-Reply-To: <20210426174647.v2.6.I05af0032a32df49c4d6b7a18a84e2fd409097989@changeid>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Thu, 29 Apr 2021 23:14:01 +0300
Message-ID: <CAGi-RU+_LFNPv1fDSQTgLWUbEsukccpQATNx4+tLy60kBibx_g@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Roullier <christophe.roullier@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v2 6/6] net: dwc: add a common empty ops
	eqos_null_ops
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
> Add a common empty ops: eqos_null_ops() to remove the duplicated empty
> functions and reduce the driver size for stm32 and imx config.
>
> This patch also aligns the prototype of ops 'eqos_stop_clks' with other
> eqos ops by adding return value.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> Changes in v2:
> - cleanup ops by adding a common null ops (NEW)
>
>  drivers/net/dwc_eth_qos.c | 97 +++++++++------------------------------
>  1 file changed, 22 insertions(+), 75 deletions(-)
>
> diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
> index 3fb8bfaf3a..4d1e5d6f8f 100644
> --- a/drivers/net/dwc_eth_qos.c
> +++ b/drivers/net/dwc_eth_qos.c
> @@ -285,7 +285,7 @@ struct eqos_ops {
>         int (*eqos_remove_resources)(struct udevice *dev);
>         int (*eqos_stop_resets)(struct udevice *dev);
>         int (*eqos_start_resets)(struct udevice *dev);
> -       void (*eqos_stop_clks)(struct udevice *dev);
> +       int (*eqos_stop_clks)(struct udevice *dev);
>         int (*eqos_start_clks)(struct udevice *dev);
>         int (*eqos_calibrate_pads)(struct udevice *dev);
>         int (*eqos_disable_calibration)(struct udevice *dev);
> @@ -615,12 +615,7 @@ err:
>  #endif
>  }
>
> -static int eqos_start_clks_imx(struct udevice *dev)
> -{
> -       return 0;
> -}
> -
> -static void eqos_stop_clks_tegra186(struct udevice *dev)
> +static int eqos_stop_clks_tegra186(struct udevice *dev)
>  {
>  #ifdef CONFIG_CLK
>         struct eqos_priv *eqos = dev_get_priv(dev);
> @@ -635,9 +630,10 @@ static void eqos_stop_clks_tegra186(struct udevice *dev)
>  #endif
>
>         debug("%s: OK\n", __func__);
> +       return 0;
>  }
>
> -static void eqos_stop_clks_stm32(struct udevice *dev)
> +static int eqos_stop_clks_stm32(struct udevice *dev)
>  {
>  #ifdef CONFIG_CLK
>         struct eqos_priv *eqos = dev_get_priv(dev);
> @@ -652,11 +648,7 @@ static void eqos_stop_clks_stm32(struct udevice *dev)
>  #endif
>
>         debug("%s: OK\n", __func__);
> -}
> -
> -static void eqos_stop_clks_imx(struct udevice *dev)
> -{
> -       /* empty */
> +       return 0;
>  }
>
>  static int eqos_start_resets_tegra186(struct udevice *dev)
> @@ -698,16 +690,6 @@ static int eqos_start_resets_tegra186(struct udevice *dev)
>         return 0;
>  }
>
> -static int eqos_start_resets_stm32(struct udevice *dev)
> -{
> -       return 0;
> -}
> -
> -static int eqos_start_resets_imx(struct udevice *dev)
> -{
> -       return 0;
> -}
> -
>  static int eqos_stop_resets_tegra186(struct udevice *dev)
>  {
>         struct eqos_priv *eqos = dev_get_priv(dev);
> @@ -718,16 +700,6 @@ static int eqos_stop_resets_tegra186(struct udevice *dev)
>         return 0;
>  }
>
> -static int eqos_stop_resets_stm32(struct udevice *dev)
> -{
> -       return 0;
> -}
> -
> -static int eqos_stop_resets_imx(struct udevice *dev)
> -{
> -       return 0;
> -}
> -
>  static int eqos_calibrate_pads_tegra186(struct udevice *dev)
>  {
>         struct eqos_priv *eqos = dev_get_priv(dev);
> @@ -816,26 +788,6 @@ static ulong eqos_get_tick_clk_rate_imx(struct udevice *dev)
>         return imx_get_eqos_csr_clk();
>  }
>
> -static int eqos_calibrate_pads_stm32(struct udevice *dev)
> -{
> -       return 0;
> -}
> -
> -static int eqos_calibrate_pads_imx(struct udevice *dev)
> -{
> -       return 0;
> -}
> -
> -static int eqos_disable_calibration_stm32(struct udevice *dev)
> -{
> -       return 0;
> -}
> -
> -static int eqos_disable_calibration_imx(struct udevice *dev)
> -{
> -       return 0;
> -}
> -
>  static int eqos_set_full_duplex(struct udevice *dev)
>  {
>         struct eqos_priv *eqos = dev_get_priv(dev);
> @@ -932,11 +884,6 @@ static int eqos_set_tx_clk_speed_tegra186(struct udevice *dev)
>         return 0;
>  }
>
> -static int eqos_set_tx_clk_speed_stm32(struct udevice *dev)
> -{
> -       return 0;
> -}
> -
>  static int eqos_set_tx_clk_speed_imx(struct udevice *dev)
>  {
>         struct eqos_priv *eqos = dev_get_priv(dev);
> @@ -1894,11 +1841,6 @@ static int eqos_remove_resources_stm32(struct udevice *dev)
>         return 0;
>  }
>
> -static int eqos_remove_resources_imx(struct udevice *dev)
> -{
> -       return 0;
> -}
> -
>  static int eqos_probe(struct udevice *dev)
>  {
>         struct eqos_priv *eqos = dev_get_priv(dev);
> @@ -1987,6 +1929,11 @@ static int eqos_remove(struct udevice *dev)
>         return 0;
>  }
>
> +static int eqos_null_ops(struct udevice *dev)
> +{
> +       return 0;
> +}
> +
>  static const struct eth_ops eqos_ops = {
>         .start = eqos_start,
>         .stop = eqos_stop,
> @@ -2032,13 +1979,13 @@ static struct eqos_ops eqos_stm32_ops = {
>         .eqos_flush_buffer = eqos_flush_buffer_generic,
>         .eqos_probe_resources = eqos_probe_resources_stm32,
>         .eqos_remove_resources = eqos_remove_resources_stm32,
> -       .eqos_stop_resets = eqos_stop_resets_stm32,
> -       .eqos_start_resets = eqos_start_resets_stm32,
> +       .eqos_stop_resets = eqos_null_ops,
> +       .eqos_start_resets = eqos_null_ops,
>         .eqos_stop_clks = eqos_stop_clks_stm32,
>         .eqos_start_clks = eqos_start_clks_stm32,
> -       .eqos_calibrate_pads = eqos_calibrate_pads_stm32,
> -       .eqos_disable_calibration = eqos_disable_calibration_stm32,
> -       .eqos_set_tx_clk_speed = eqos_set_tx_clk_speed_stm32,
> +       .eqos_calibrate_pads = eqos_null_ops,
> +       .eqos_disable_calibration = eqos_null_ops,
> +       .eqos_set_tx_clk_speed = eqos_null_ops,
>         .eqos_get_tick_clk_rate = eqos_get_tick_clk_rate_stm32
>  };
>
> @@ -2059,13 +2006,13 @@ static struct eqos_ops eqos_imx_ops = {
>         .eqos_inval_buffer = eqos_inval_buffer_generic,
>         .eqos_flush_buffer = eqos_flush_buffer_generic,
>         .eqos_probe_resources = eqos_probe_resources_imx,
> -       .eqos_remove_resources = eqos_remove_resources_imx,
> -       .eqos_stop_resets = eqos_stop_resets_imx,
> -       .eqos_start_resets = eqos_start_resets_imx,
> -       .eqos_stop_clks = eqos_stop_clks_imx,
> -       .eqos_start_clks = eqos_start_clks_imx,
> -       .eqos_calibrate_pads = eqos_calibrate_pads_imx,
> -       .eqos_disable_calibration = eqos_disable_calibration_imx,
> +       .eqos_remove_resources = eqos_null_ops,
> +       .eqos_stop_resets = eqos_null_ops,
> +       .eqos_start_resets = eqos_null_ops,
> +       .eqos_stop_clks = eqos_null_ops,
> +       .eqos_start_clks = eqos_null_ops,
> +       .eqos_calibrate_pads = eqos_null_ops,
> +       .eqos_disable_calibration = eqos_null_ops,
>         .eqos_set_tx_clk_speed = eqos_set_tx_clk_speed_imx,
>         .eqos_get_tick_clk_rate = eqos_get_tick_clk_rate_imx
>  };
> --
> 2.17.1
>
Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

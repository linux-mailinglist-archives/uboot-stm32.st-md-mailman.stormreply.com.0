Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 887703D2C65
	for <lists+uboot-stm32@lfdr.de>; Thu, 22 Jul 2021 21:08:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5370CC5A4CE;
	Thu, 22 Jul 2021 19:08:00 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3809AC5A4CD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 19:07:58 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 42-20020a9d012d0000b02904b98d90c82cso1496122otu.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 12:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8eRSCqAuc3dJV0TjEp0+ccvjdkDY2M3FyZQuw4jl8yo=;
 b=WkdbI4A8NcqNh0soUe26Qfb+sTpedqeoYcYiGi0Ic2YzFssd4Uivjz+GJaZQaPKP3M
 m4agFqJUWTiLy/DguhIaXerIHVOoAkVuNdXOabziURzXgrKXOjZjaGVgjFOKPnSzfFz6
 Dl5TAfAii/V5RtgZkJ6xGU1ZSD4DPYCGzMIlk7CWUapnll4p3kdvPHmV8SAVzFPTkvFH
 4miu8PIvi9q//8M7jTpYdbS2TM4Ki5Zo1OkpA+FjACo49I6bYZl7e5LwITl1offyVISe
 CJOr3LJ6GyVlNRNztoP35g+mIq5JfpF+6jLHHgdWTYS5gzandnRdgD8oT68Ig/PYaZMC
 JG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8eRSCqAuc3dJV0TjEp0+ccvjdkDY2M3FyZQuw4jl8yo=;
 b=ZXs1UKKoLl/9MX9sLNoIsRM61cis3i5EKERY5mQfosgQ9ne6S8gpYo6IWByS6OGRZ5
 JOnwGrF1a+iAbLKut0/Bo3tEk3ba0UZAgrA9Cixmnvx5R9VBTgI/o5Gucs40zZrehym7
 qpc3YA6zF/7uUPK7rvLqsED/Jg5yUeG7T1PrlJUbksVSLe+pB9mmjTnzxbEuPGZYFITz
 SZWT6EG9Avw6TnPu1NOIxfLrA9RfW8JsV0xZtuaNo82cig0lr7ULliDohPjOjcreoiZR
 p9NGYBJbneP3zSidWrS/GOCi4VIj7dAHGfyNxmMq2GsIYWKw1wxnX3zgqWwm5OBwTET0
 b0Zw==
X-Gm-Message-State: AOAM532iBg8xKcQcXg1Yt0GRutBWKYDo26+wltXcZ9TiTrfk20/9eSiX
 FuzyvkGTHvO3LIBNSd6NCsgnbTZS40lXA5CZ5W8=
X-Google-Smtp-Source: ABdhPJyAUZiJEgHFGmMo8Vy5d2ZH80NEEmIYxGrmgBkI8goXXIfEO/OeivRTILFLhUukHmucZi4puNgpuMbeTiRH3u8=
X-Received: by 2002:a9d:12f:: with SMTP id 44mr906149otu.14.1626980877118;
 Thu, 22 Jul 2021 12:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210720180957.2948197-1-patrick.delaunay@foss.st.com>
 <20210720200940.v3.6.I05af0032a32df49c4d6b7a18a84e2fd409097989@changeid>
In-Reply-To: <20210720200940.v3.6.I05af0032a32df49c4d6b7a18a84e2fd409097989@changeid>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Thu, 22 Jul 2021 22:07:46 +0300
Message-ID: <CAGi-RUJUsbdz_St_CnL94CsOHUvW4V6xp2g339WghCWLtAFSuQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v3 6/6] net: dwc: add a common empty ops
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

On Tue, Jul 20, 2021 at 9:10 PM Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Add a common empty ops: eqos_null_ops() to remove the duplicated empty
> functions and reduce the driver size for stm32 and imx config.
>
> This patch also aligns the prototype of ops 'eqos_stop_clks' with other
> eqos ops by adding return value.
>
> Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - cleanup ops by adding a common null ops (NEW)
>
>  drivers/net/dwc_eth_qos.c | 97 +++++++++------------------------------
>  1 file changed, 22 insertions(+), 75 deletions(-)
>
> diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
> index 9b1746b78b..79eb6cc926 100644
> --- a/drivers/net/dwc_eth_qos.c
> +++ b/drivers/net/dwc_eth_qos.c
> @@ -281,7 +281,7 @@ struct eqos_ops {
>         int (*eqos_remove_resources)(struct udevice *dev);
>         int (*eqos_stop_resets)(struct udevice *dev);
>         int (*eqos_start_resets)(struct udevice *dev);
> -       void (*eqos_stop_clks)(struct udevice *dev);
> +       int (*eqos_stop_clks)(struct udevice *dev);
>         int (*eqos_start_clks)(struct udevice *dev);
>         int (*eqos_calibrate_pads)(struct udevice *dev);
>         int (*eqos_disable_calibration)(struct udevice *dev);
> @@ -613,12 +613,7 @@ err:
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
> @@ -633,9 +628,10 @@ static void eqos_stop_clks_tegra186(struct udevice *dev)
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
> @@ -648,11 +644,7 @@ static void eqos_stop_clks_stm32(struct udevice *dev)
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
> @@ -694,16 +686,6 @@ static int eqos_start_resets_tegra186(struct udevice *dev)
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
> @@ -714,16 +696,6 @@ static int eqos_stop_resets_tegra186(struct udevice *dev)
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
> @@ -812,26 +784,6 @@ static ulong eqos_get_tick_clk_rate_imx(struct udevice *dev)
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
> @@ -928,11 +880,6 @@ static int eqos_set_tx_clk_speed_tegra186(struct udevice *dev)
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
> @@ -1881,11 +1828,6 @@ static int eqos_remove_resources_stm32(struct udevice *dev)
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
> @@ -1974,6 +1916,11 @@ static int eqos_remove(struct udevice *dev)
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
> @@ -2019,13 +1966,13 @@ static struct eqos_ops eqos_stm32_ops = {
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
> @@ -2046,13 +1993,13 @@ static struct eqos_ops eqos_imx_ops = {
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
> 2.25.1
>
Applied to u-boot-net/network-master
Thanks,
Ramon.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

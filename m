Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7343D2C63
	for <lists+uboot-stm32@lfdr.de>; Thu, 22 Jul 2021 21:07:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4BF0C5A4CE;
	Thu, 22 Jul 2021 19:07:37 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECF7EC5A4CD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 19:07:34 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id w188so7673136oif.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 12:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/HUxHlG+WHU9Ihj6ZybtZ2vLWJJlfHEt14vAlYdjqsk=;
 b=b+QFho4cSUaWzlLI0NdgPC2oU4l7r3EAtGRF69d029rT4b2V7wpDAFo+C5GQXVQCBN
 AjwTGXgclVvhpBcHeP/sCOH2fQBM+5TUsNgyYpsD2lrbFFe/F8omps35j5ajAg6O8VpK
 z//4Z1JZgdh/JYfwNx0ha2fLhCxxu+aUju6ypzmoUulIj4PcOeQNbeQIVvU7ew1syJoO
 9+AO+oYxH9BTCavIjquIZ69rOx88D55SprIU8WvWMGRHT/itZb3kUXPfkbFQ5bhMzuVv
 ejPVFT91KrFarwtNAtc95DFdGTJ+0NeOfoJLoe6BsKbIdw/NscCyCZZFh347LumEslTZ
 2KfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/HUxHlG+WHU9Ihj6ZybtZ2vLWJJlfHEt14vAlYdjqsk=;
 b=bV0COrPX7sboeDaDR89Rh7wVVUJrgELaXRTZpb0xgLt2SQ8jIxWpzQzYHC8ePLouks
 2GoUh41v5ZCj0zVysLLawbVYPFjBVVCCucRIZPyJuUAiWgF/Rn3CYs1DdbeYv8RAbxb1
 pqvZ3nZLUoatBHPpTl2yITcYqHefXybeW2xo27HZIArToJJ9YS5IeOPawv3LNcjGFSiL
 u6apFcBDXyhF30cmoZp65WVFK48wkJok3eY03DCuHLLQaHODV3yr9PmGzskGGJzOpQ4q
 pENGl5GQfrQU7WtyDSXNmGAao1Ggh7RBtnw6i3xu6zQKCVE8yfaVYKF2DedfZkTJsKEZ
 JESA==
X-Gm-Message-State: AOAM5309Tk0odZthqZVTwPFsXjrJbRflfuggUraXqVIb0mRZ57Pv58Sj
 MjH7hv4GmnN0rcKibgrhbL/3La3gxXRgqDv9pXw=
X-Google-Smtp-Source: ABdhPJzoO8mgjD8VTzKBKPBBBgf2kTnIcUMdW0k73GH7g4Zgw0KqMVS87RUQ5An6ST/e2CviLNuESKzoWBgM4Yw8GeY=
X-Received: by 2002:a05:6808:f04:: with SMTP id
 m4mr6746070oiw.92.1626980853877; 
 Thu, 22 Jul 2021 12:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210720180957.2948197-1-patrick.delaunay@foss.st.com>
 <20210720200940.v3.4.I98726d4bbd3145e65b872950a884cd8424b10131@changeid>
In-Reply-To: <20210720200940.v3.4.I98726d4bbd3145e65b872950a884cd8424b10131@changeid>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Thu, 22 Jul 2021 22:07:22 +0300
Message-ID: <CAGi-RUJrsKGPWUU5a0rPE4aNoSc-tjyRmcaOnU9EgJRGYEww3g@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v3 4/6] net: dwc_eth_qos: remove the field
 phyaddr of the struct eqos_priv
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
> Since the commit commit 6a895d039ba7 ("net: Update eQos driver and FEC
> driver to use eth phy interfaces") the field phyaddr of driver private data
> struct eqos_priv is no more used in eqos_start() for the phy_connect()
> parameter.
>
> Now this variable is only initialized in eqos_probe_resources_stm32()
> it can be removed.
>
> Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - remove unused element in the struct eqos_priv (NEW)
>
>  drivers/net/dwc_eth_qos.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
> index f048e9d585..a57c35785f 100644
> --- a/drivers/net/dwc_eth_qos.c
> +++ b/drivers/net/dwc_eth_qos.c
> @@ -307,7 +307,6 @@ struct eqos_priv {
>         struct clk clk_slave_bus;
>         struct mii_dev *mii;
>         struct phy_device *phy;
> -       int phyaddr;
>         u32 max_speed;
>         void *descs;
>         int tx_desc_idx, rx_desc_idx;
> @@ -1813,7 +1812,6 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
>         if (ret)
>                 pr_warn("No phy clock provided %d", ret);
>
> -       eqos->phyaddr = -1;
>         ret = dev_read_phandle_with_args(dev, "phy-handle", NULL, 0, 0,
>                                          &phandle_args);
>         if (!ret) {
> @@ -1826,9 +1824,6 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
>                 if (ret)
>                         pr_warn("gpio_request_by_name(phy reset) not provided %d",
>                                 ret);
> -
> -               eqos->phyaddr = ofnode_read_u32_default(phandle_args.node,
> -                                                       "reg", -1);
>         }
>
>         debug("%s: OK\n", __func__);
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

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D844036F0D5
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Apr 2021 22:13:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9ECE8C58D5A;
	Thu, 29 Apr 2021 20:13:04 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F022EC58D59
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 20:13:02 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id
 s1-20020a4ac1010000b02901cfd9170ce2so14956397oop.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 13:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dAfZv1fStun4mj1auH0xkIXfZdFVcjSnqP6qgP0HIKk=;
 b=fAvI+gUXliM9+JSEDJwxXe4WMxjFCnRb5tZ6vQ8zO79OwgtfAGqsqBk9OD3QWcC/XO
 kHcw8V2bMfdWyQNTwQttxtJ7ZP6l7GAIhpaVKoON8cRQoFJyfk/aL/UcMngfmVkuCwvu
 WBeDyInsbbjQDZipIM8CI3MjKYN3Jo6GAVEM2ZzKXwbt0n/RGozSeJ3VvHbD89WsDcHV
 614ZWBNgLHp8TXwxio7ajf7Z1hralXxG67ExhNOD7d8m2ZGEPmCMO7Uogkba6nhCyY6o
 LvOpIxfTMtPqNdNxnsso1U+aA+N79zDB0qr0ucQlmPjLJ/NhXpjikcBnR8l/KZV6jVd1
 Mzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dAfZv1fStun4mj1auH0xkIXfZdFVcjSnqP6qgP0HIKk=;
 b=SBLFqfEIy/lJ+cAakf5xnaQI3bMPUaUkdfHnP7sg/cVdYnMPtOapeA4bFAGeDdlo0U
 /5KlSwYfkMKDRX9TaVPbv1S8J5fGRsr067LU++cJXBSkE55rnmen+cwTg2gcH1a+ngYY
 HnS9LX7+Y+95SKz4r0SaO0ykLcL9wqonn7X+HcIXsB/caOosX6eSX7RmMswJVsUBMMf1
 Id5DWqOGZSrrHwoMhh7HW8J0rwTQyXWatga5/JadZjvzGATUxyioPshHfjMKhgCYsVgQ
 Fru1Bh37ACMH7o1zUV+LnKdL4IWPO+G5ure0MEbZIP0y2Hv47sAgEa7uMUFNamUXfVp9
 7Xgg==
X-Gm-Message-State: AOAM530idNPoBgsjO/76LBniO5ilPDIfnLXULqqq/L0SmG1fFgV6Tha/
 HniLT6qG6j+1EXv44B27yPtgoe3Wtwly8RycjOM=
X-Google-Smtp-Source: ABdhPJwBpbHM8kwE91A18bvE/GImTnaKv7LqCmA1/GREiOBcqnra03OWbyYHT6iz5+c03lOB2PbqINLTDuJwPvVCDso=
X-Received: by 2002:a4a:3e44:: with SMTP id t65mr1395191oot.87.1619727181824; 
 Thu, 29 Apr 2021 13:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
 <20210426174647.v2.4.I98726d4bbd3145e65b872950a884cd8424b10131@changeid>
In-Reply-To: <20210426174647.v2.4.I98726d4bbd3145e65b872950a884cd8424b10131@changeid>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Thu, 29 Apr 2021 23:12:50 +0300
Message-ID: <CAGi-RUKbd8hsCCE1y77VB7OPpxpgCrUvTS3J7wRMj3aRNRz0qw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Roullier <christophe.roullier@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v2 4/6] net: dwc_eth_qos: remove the field
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

On Mon, Apr 26, 2021 at 6:47 PM Patrick Delaunay
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
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> Changes in v2:
> - remove unused element in the struct eqos_priv (NEW)
>
>  drivers/net/dwc_eth_qos.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
> index e8242ca4e1..e625aea8d1 100644
> --- a/drivers/net/dwc_eth_qos.c
> +++ b/drivers/net/dwc_eth_qos.c
> @@ -311,7 +311,6 @@ struct eqos_priv {
>         struct clk clk_slave_bus;
>         struct mii_dev *mii;
>         struct phy_device *phy;
> -       int phyaddr;
>         u32 max_speed;
>         void *descs;
>         int tx_desc_idx, rx_desc_idx;
> @@ -1826,7 +1825,6 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
>         if (ret)
>                 pr_warn("No phy clock provided %d", ret);
>
> -       eqos->phyaddr = -1;
>         ret = dev_read_phandle_with_args(dev, "phy-handle", NULL, 0, 0,
>                                          &phandle_args);
>         if (!ret) {
> @@ -1839,9 +1837,6 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
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
> 2.17.1
>
Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

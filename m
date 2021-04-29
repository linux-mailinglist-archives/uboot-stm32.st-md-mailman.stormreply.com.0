Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0C736F0D4
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Apr 2021 22:12:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89047C58D5A;
	Thu, 29 Apr 2021 20:12:34 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2305FC58D59
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 20:12:32 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id e25so37773548oii.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 13:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pZgFifz8avR/1X0+ytUnb1t/vgxBHfWjHWuWpOHrGG0=;
 b=hPvXM54FSNz6oJhCpSOq1RaOFKYlGrClI8TqhOLVunV+eonBkpu2NnEaMvc9CwVAyO
 pdobrinHBRfLmSi1EtsN+jY/fPkuns0mf2n/okw8yoPPBxILeBbrHcCVo7WDJVOLf8rB
 R/sjalfJgoh7spcysW5GYMegDP5JIP18L1FpMnlyYnnbI/LpvJyG7PTTNZ8BNg/PFFbn
 DunqtGUBX3XSVjkAsk/rdgT202VdNpKQvPeinwH7644oAPM27YaxtTaIhbX8LhAKG0EQ
 YsdqazszmXsq/xQjy4kXxkTIoPguSkYttUp1JLEvl08U0WIhMukDov5SepRaDFAAHa3Q
 FiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pZgFifz8avR/1X0+ytUnb1t/vgxBHfWjHWuWpOHrGG0=;
 b=W4/imEUgNWP8w1T2N/Dn5Rnmg4slwmM/YJSzgAHoAnjoA6xC2KJ+FrL5W6TaF8YSAB
 AO03uO0CC4s48iuX/arnmc4nmz9wJS2JhfuSMLa3Ry5zEDR8L9x52V72WCMOM8kLw6LU
 EneQs/RFq3WW1JcVfPoXEmHFm9089zzUC/C3AHeOvO+0IkXDJHnvmQx1SxTPfHh3Y5Rs
 u0MzRjqjQyPmd9QCRZKskCt4XiNjeF9HoOOxWklurc/iWx7dGmxwp6gD/x0ENswu2R/G
 X+BSlnLFcUODjZiBf0jc6fz+yLBLDHfoaJxuwMCjEXGM+oeAtM5crteu09Gp7IfBV0as
 LCyw==
X-Gm-Message-State: AOAM530OfCKpNu0F8HmG6ziha+mFk16zN5Eyp3Zp6n5Y5hBMgwTEBwlY
 CUB2VPV3O222Z2eLAj1i2/qvSxu7iMGYhEf8gtc=
X-Google-Smtp-Source: ABdhPJyBMdslEEjxFj++dMkHDZbMZSZhAsTcw0/MaGlbL4JaQYVXh9yMQbZxg2xv+Qj4LbrIk9xxFkywA0j1nHUXuY0=
X-Received: by 2002:aca:4cc:: with SMTP id 195mr8324040oie.22.1619727151005;
 Thu, 29 Apr 2021 13:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
 <20210426174647.v2.3.Ia198585f58eba36cd65105e2043f61d54e63ceb3@changeid>
In-Reply-To: <20210426174647.v2.3.Ia198585f58eba36cd65105e2043f61d54e63ceb3@changeid>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Thu, 29 Apr 2021 23:12:19 +0300
Message-ID: <CAGi-RU+9=k0YVk9NBZsjnLXtzs=suv1ucKrXTPBb-g-mK9b19Q@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Roullier <christophe.roullier@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v2 3/6] net: eth-phy: manage subnode mdio0
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
> Bind any subnode with name beginning by mdio, mdio0 for example,
> and not only the "mdio" as namei of subnode.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> Changes in v2:
> - update eth-phy driver to support STM32 binding with a mdio0 subnode (NEW)
>
>  drivers/net/eth-phy-uclass.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/eth-phy-uclass.c b/drivers/net/eth-phy-uclass.c
> index 962084a7c9..f04f1c8f09 100644
> --- a/drivers/net/eth-phy-uclass.c
> +++ b/drivers/net/eth-phy-uclass.c
> @@ -27,12 +27,18 @@ int eth_phy_binds_nodes(struct udevice *eth_dev)
>         const char *node_name;
>         int ret;
>
> -       mdio_node = dev_read_subnode(eth_dev, "mdio");
> +       /* search a subnode named "mdio.*" */
> +       dev_for_each_subnode(mdio_node, eth_dev) {
> +               node_name = ofnode_get_name(mdio_node);
> +               if (!strncmp(node_name, "mdio", 4))
> +                       break;
> +       }
>         if (!ofnode_valid(mdio_node)) {
> -               dev_dbg(eth_dev, "%s: %s mdio subnode not found!", __func__,
> +               dev_dbg(eth_dev, "%s: %s mdio subnode not found!\n", __func__,
>                         eth_dev->name);
>                 return -ENXIO;
>         }
> +       dev_dbg(eth_dev, "%s: %s subnode found!\n", __func__, node_name);
>
>         ofnode_for_each_subnode(phy_node, mdio_node) {
>                 node_name = ofnode_get_name(phy_node);
> --
> 2.17.1
>
Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

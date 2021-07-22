Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A933D2C62
	for <lists+uboot-stm32@lfdr.de>; Thu, 22 Jul 2021 21:07:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F98EC5A4CD;
	Thu, 22 Jul 2021 19:07:29 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22930C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 19:07:28 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id a132so7701357oib.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 12:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qep0Rxw3XRWcDo1gr0aiaoFVNPcEL6J4paVrppcGm5I=;
 b=dpeQ1DepfzRjEY2zLb82TM9ZfPoyabBcP5MpbgVU7r0J4yas6Y172eAlsRAj4nU7nW
 tp6DcWCyHKgNgx6+G6Sw57s6pJ7vJdnnidmAhuwbr4DvG+FLh6JInBiy/CTHHfwJj3xw
 8/4JnBe7I2YV5TYFCNN0s2PeHQOqzikYmQ91HIdjAccLx74pzwWh8Ln2HTd6/MDBfuaW
 aobUTwBTrVPI6WtPPMIlV9KKkI+X+yRMDnJVPwAOVbUszWsglMNmpNB0GAJkE0rW6Px/
 1DmDVFZvHT+C/KMvPnhjB9l4NO26jlmHtNzzQDHS1mzPZFNWNC6jD7ZbRCKV/UPFGoMX
 2xuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qep0Rxw3XRWcDo1gr0aiaoFVNPcEL6J4paVrppcGm5I=;
 b=Naifc/9FHrLQlUt68qq4z6hiSnK7nee/F9oY+/ReErD58D1e2VoQ4Ghs/O3XvCPggJ
 wl+RIfMwnTAvKv28Z9EJo9/Qk9AaF5Oxh+l4wJpJBaM+ebY3L4CXK1ntOBDbZoBSFi8/
 TXzIyoESSDEzPlTJAwEr4BxKUh2i8R7zZo1mmrX/RdzTjcHGqKUTBpP/o85mNoUCDyj0
 Gtq9dlxexkAAD7hOnrx8Ah6vpt/CSMWvJ1mjtiG1CtdrI+SW9WChmVZSW+dS+TMfvbXe
 KtuwVgNBxd7u+PO8ccr8kMi6AJOJP+4NRhN8lRuWGvZ9yDqoVWb65hOGU33igYUEcNDM
 kgzA==
X-Gm-Message-State: AOAM533JkLUZmnOE5ve/EcR809cA7On7E1gPfheJIB+qG8KmoqSTLPTN
 6O1dL7EaLlBxd8f7NrjG8H/3RSmxaScobheHmI0=
X-Google-Smtp-Source: ABdhPJyHi8sX8atq/hw6Vfh+1zJwUFP4bURYLK9Q3J8rljZ62gVay2QYu2iM3Jrp9uuED0lznuzOPtAgJYlT9ilwGak=
X-Received: by 2002:aca:b903:: with SMTP id j3mr5391890oif.179.1626980847002; 
 Thu, 22 Jul 2021 12:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210720180957.2948197-1-patrick.delaunay@foss.st.com>
 <20210720200940.v3.3.Ia198585f58eba36cd65105e2043f61d54e63ceb3@changeid>
In-Reply-To: <20210720200940.v3.3.Ia198585f58eba36cd65105e2043f61d54e63ceb3@changeid>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Thu, 22 Jul 2021 22:07:15 +0300
Message-ID: <CAGi-RUJjTf_tk+2uRS0bXdKsL4zET8CzK9v-2yyPSRTOOFZX=Q@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v3 3/6] net: eth-phy: manage subnode mdio0
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
> Bind any subnode with name beginning by mdio, mdio0 for example,
> and not only the "mdio" as namei of subnode.
>
> Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - update eth-phy driver to support STM32 binding with a mdio0 subnode (NEW)
>
>  drivers/net/eth-phy-uclass.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/eth-phy-uclass.c b/drivers/net/eth-phy-uclass.c
> index aa5b05abc8..293579dc34 100644
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
> 2.25.1
>
Applied to u-boot-net/network-master
Thanks,
Ramon.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

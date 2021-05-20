Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1F3389CC1
	for <lists+uboot-stm32@lfdr.de>; Thu, 20 May 2021 06:38:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D51B7C57B60;
	Thu, 20 May 2021 04:38:10 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC17CC57B5F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 May 2021 04:38:09 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so13736084oth.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 May 2021 21:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/MGvAU9CgGXAPiFsPYyG0ckVe74+ce5TJiF05AT+lRs=;
 b=Ua5RizHUX96Hv17hA7BEMPc2l3/rXD/zwu0uw3QIpGQBfr6b4Ym918HlVdUuKCW7bd
 1jsFVyXvkksSy9XbQyQTSu+6F5JvYbROf7WlRTpipHTMflQe0oTXBWygObkpbpbeZwd2
 ZCuXevtqflX9qIX8ao/Skl64mQlxzGkqL4L+oU+Ecw6544XLAsh2Rvk/KiZTYaCdosAt
 hSgz54We0MsqbZJnLrlpGktQsntyZdvWDTOld95ILDG5D3H6Nt/DCdHXY4jQGd53MmJg
 UXr6D8qsNr0Vhc6f937Ravib1VSfhra6JivjoEQ9UpgspBkydP1vsAJFy05JBKr5jjVQ
 5rMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/MGvAU9CgGXAPiFsPYyG0ckVe74+ce5TJiF05AT+lRs=;
 b=hqfffnU95DQLaH3yS7ENUIQ9vhm1GVae44TFx2CtWQ2aJHEjpD0LMT/MrQFA/rK2Iv
 reqVeYk6hrua2wPBAuxoejM8n6F+oNC69zYIXQfaKdnzOFW6zJ3viLNK+LwnSaYYnonO
 QBxs3J610SDGNbrgbmQ4IcDNAyBRAC1ctTHdZjBPWbhnK9fdzhQ0CumPe5bRlVmbSpEz
 D207is63YbG8kKurqRqR2DvnPamfj6lxk8QYRKCfVi/vAm8gNNRJc2Bjj+b6S2s+BUIj
 ggZxw41m05N+bBKugR9VS4smSxos7ggNCYM8wWEkXlkUqJgmy598MPmDFMvoMDYHRLsr
 9R7g==
X-Gm-Message-State: AOAM530qxYNupGZRcm5bGwK9QFV9aj76N5CAGJ2GBcnuEtgVVG0qKozg
 wEr600+NapJktPROrE9GjSKuTVtZrXDIzDra/ks=
X-Google-Smtp-Source: ABdhPJxedFOFRNf9lI9zX5sKoz+BSdZjE5sLiEYdaxgSmnNCh5R3vwfaAZIIkwrMvgOWIhMkOnopqi7amZF735oq02U=
X-Received: by 2002:a9d:66da:: with SMTP id t26mr2469643otm.370.1621485488433; 
 Wed, 19 May 2021 21:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210518134039.26865-1-patrick.delaunay@foss.st.com>
 <20210518154026.1.I98c378739e65e7fed36a680a86d1c307e71c9460@changeid>
In-Reply-To: <20210518154026.1.I98c378739e65e7fed36a680a86d1c307e71c9460@changeid>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Thu, 20 May 2021 07:37:57 +0300
Message-ID: <CAGi-RULO43+JFcSYA3GJ3ShTSudtQLxcz3dUks6Y1ggN=H+nig@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Joe Hershberger <joe.hershberger@ni.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Lars Povlsen <lars.povlsen@microchip.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] net: luton: remove address
	translation after ofnode_read_resource
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

On Tue, May 18, 2021 at 4:40 PM Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Removed call of ofnode_translate_address() after ofnode_read_resource
> in luton_switch.c:luton_probe(); it is unnecessary since
> the commit feb7ac457c20 ("dm: core: Add address translation in
> fdt_get_resource").
>
> Fixes: feb7ac457c20 ("dm: core: Add address translation in fdt_get_resource")
> Reported-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  drivers/net/mscc_eswitch/luton_switch.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/net/mscc_eswitch/luton_switch.c b/drivers/net/mscc_eswitch/luton_switch.c
> index 54afa14c9d..73c950d118 100644
> --- a/drivers/net/mscc_eswitch/luton_switch.c
> +++ b/drivers/net/mscc_eswitch/luton_switch.c
> @@ -588,7 +588,6 @@ static int luton_probe(struct udevice *dev)
>         struct luton_private *priv = dev_get_priv(dev);
>         int i, ret;
>         struct resource res;
> -       fdt32_t faddr;
>         phys_addr_t addr_base;
>         unsigned long addr_size;
>         ofnode eth_node, node, mdio_node;
> @@ -658,9 +657,7 @@ static int luton_probe(struct udevice *dev)
>
>                 if (ofnode_read_resource(mdio_node, 0, &res))
>                         return -ENOMEM;
> -               faddr = cpu_to_fdt32(res.start);
> -
> -               addr_base = ofnode_translate_address(mdio_node, &faddr);
> +               addr_base = res.start;
>                 addr_size = res.end - res.start;
>
>                 /* If the bus is new then create a new bus */
> --
> 2.17.1
>
Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

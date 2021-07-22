Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C529C3D2C79
	for <lists+uboot-stm32@lfdr.de>; Thu, 22 Jul 2021 21:10:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A97FC5A4CE;
	Thu, 22 Jul 2021 19:10:42 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A870C5A4CD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 19:10:40 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id y66so7715275oie.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 12:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aln0tmHuYEVKIkY2ot2Td4ABXvG2Mcx4IR8Pb0I1gxs=;
 b=tEoU0LMvUjTNiVUHRxiBxTKeZcsyBUdNj3FybF+4U98x3GaM6OkRpV0LeRPjLlzAYk
 MOXiS4uxQHMSuEzs3Ri0N4LdrH5suUbjYuXGf3U2qwYbMd4uqu0/m3bZLFuuLBW1hdUt
 3xSux2evKs8pAkyKmTAVYTHzdYcqPgQ98xX3636nMrNWWb0J476ruoOZsgLHwtCoSyVV
 Ph2s57NDs56cCvrTCUYwSfVCGumAQlxTOP5PQV9nwQWrV5CLMMLEqS5zWh8+g6AbsvFR
 lHdDz6/pXs22LqfWFTXGDMo6ibDvDr9+quBtcLcDFlhSRJ2hCN22yoMjeszIB1HQFJr5
 onpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aln0tmHuYEVKIkY2ot2Td4ABXvG2Mcx4IR8Pb0I1gxs=;
 b=taOt1Ac/hQbbqi6Anz8BeCv7YQcCfgLtTpKgawfLVC9W2kEpqmD/LW9LBkonQx6U0u
 c3i+3KxDsh3PLXUC5X0yXKAZguwCh3egU/I9ZlYWTterF4FrZPi4ip+k26aU4PhSjGXC
 EBL5r7DxSJj/r66LwFjNIfcpkyp6bcBNqnJcPYr4zDriElLPBtiCO+KPAB6t4pZSFqFb
 TEdSYTHcckJDRqYjKgFJDRaliYC0/5B3vlQOCGIxI5XBFuymvQUo460Uy6Ilhsn6Jg7x
 xGC3qEg4kzvUPb44TG+85v0Ggsxur8qyCkN0t2PsDtUzR+sv2wlKZduYTVgYQSjb+st0
 C8aQ==
X-Gm-Message-State: AOAM532HyH9dpPY0mwLbUMHFCqJOAavWF03rehP2akwM2nPBCPvyfHod
 /GhyCeVrGY7QkXVZn2MyVAXPoEIHGMKkJbpgqm4=
X-Google-Smtp-Source: ABdhPJxGkaHOA+R4DJ7hMlWPtdgoSMMLRjJaW62u93cWLYZi93vBmAZMhL7XcwMjrZ7lAbxfO1uDQi6DqJwWhAynXks=
X-Received: by 2002:a05:6808:f04:: with SMTP id
 m4mr6755272oiw.92.1626981039193; 
 Thu, 22 Jul 2021 12:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210720181530.2949296-1-patrick.delaunay@foss.st.com>
 <20210720181530.2949296-2-patrick.delaunay@foss.st.com>
In-Reply-To: <20210720181530.2949296-2-patrick.delaunay@foss.st.com>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Thu, 22 Jul 2021 22:10:27 +0300
Message-ID: <CAGi-RULKGFgfbDVTT5jtnDTjx3Y+c9kuxwTidUawUmR3frkP3A@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [RESEND PATCH 2/3] net: dwc_eth_qos: define
	LOG_CATEGORY
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

On Tue, Jul 20, 2021 at 9:15 PM Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Define LOG_CATEGORY to allow filtering with log command.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
> ---
>
>  drivers/net/dwc_eth_qos.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
> index f048e9d585..3358dc3514 100644
> --- a/drivers/net/dwc_eth_qos.c
> +++ b/drivers/net/dwc_eth_qos.c
> @@ -27,6 +27,8 @@
>   *    all clock and reset signals to the HW block.
>   */
>
> +#define LOG_CATEGORY UCLASS_ETH
> +
>  #include <common.h>
>  #include <clk.h>
>  #include <cpu_func.h>
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

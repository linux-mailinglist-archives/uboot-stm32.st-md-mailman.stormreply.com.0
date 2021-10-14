Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC7C42DDAA
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 Oct 2021 17:10:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30A3EC5C839;
	Thu, 14 Oct 2021 15:10:51 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D5C3C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 15:10:50 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 l7-20020a0568302b0700b0054e40740571so8763169otv.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 08:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0prJdAkqNACucTEtTdUPzBrDDRnp7yvsCUW/gaPm9No=;
 b=T8WfAJTwiSN7+rjLxI9Mxl8p+iANQeEOkbGLcB5p8DonvC29/GQuX85zngOKMKEMag
 8RFULig3qdX5P8YlFlVGriBJ/gZ49NXifm+8y3dPSmxMapQ51KYJ2rpKh7oes4Zn6TPF
 Kg0EO8ndSS1Bzmhlx7WJ76qblcbt3zq0QX3aQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0prJdAkqNACucTEtTdUPzBrDDRnp7yvsCUW/gaPm9No=;
 b=LqYiVVpe/f+86ZVTYFA0Y2Wy63go/JuuyZt515KPjZ/WcgPiL20/5lWdqd/RFMxDgC
 kI+oxZLBa8wDCCN0OF+4+HxQ21OPukNyXDeSF3mDS9w0ldV6Jc5gp4SDQqXMAk301fDX
 xtHo48GiBf2LyrqVzxB/a88Ogy7vsyNkfA3JrUCHjhCaDi3xaeybxZiKH5vntCPWYLrx
 Ok0u/PlTkFfIMjwg0l+HRElSjttMKmVihd3Pf8AnbiubnZ56zvXJRbCLzmo/cES8/Mm5
 bfRjHv75Xr0lwbDcx5/2jTvkonBC1H5V6vNmOP6lZ0uOujf+VunJuoPnixXMzG+x5sCD
 q3kg==
X-Gm-Message-State: AOAM532VDAXFOCmajf2MLX6WTbPEqtoW/d1M4V0xEur6o7bg0k2ek6eo
 3Tx8he5LmpPkcWZDgcCUHueuavQdLBdlYkEm1ki7Lw==
X-Google-Smtp-Source: ABdhPJzqafGbW41fzM4la7Ilg5fPPu1Fkb4GnIzAu5yygd3+KO1mOnNRjxjTJvQpjDsC0Awmu0ZENEByTtDa7G9M92g=
X-Received: by 2002:a05:6830:3093:: with SMTP id
 f19mr3052258ots.97.1634224248771; 
 Thu, 14 Oct 2021 08:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
 <20211004115942.6.Ia3825658ff431b2f6ff143ee01c2d44d24219558@changeid>
In-Reply-To: <20211004115942.6.Ia3825658ff431b2f6ff143ee01c2d44d24219558@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 14 Oct 2021 09:09:42 -0600
Message-ID: <CAPnjgZ1CEK4QUVTEZ9YP7wKs5RrdVLLmyhpkwFz=exvaaMUHKA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Stefan Roese <sr@denx.de>,
 Priyanka Jain <priyanka.jain@nxp.com>
Subject: Re: [Uboot-stm32] [PATCH 6/6] scripts: remove CONFIG_IS_ENABLED in
	config_whitelist.txt
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

Hi Patrick,

On Mon, 4 Oct 2021 at 04:00, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Redefine the macro CONFIG_IS_ENABLED is not allowed,
> so this entry can be removed in whitelist file.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  scripts/config_whitelist.txt | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
> index b3ebd20c57..41a0952c97 100644
> --- a/scripts/config_whitelist.txt
> +++ b/scripts/config_whitelist.txt
> @@ -649,7 +649,6 @@ CONFIG_IRAM_SIZE
>  CONFIG_IRAM_STACK
>  CONFIG_IRAM_TOP
>  CONFIG_IRDA_BASE
> -CONFIG_IS_ENABLED
>  CONFIG_JFFS2_DEV
>  CONFIG_JFFS2_LZO
>  CONFIG_JFFS2_NAND
> --
> 2.25.1
>

For this to work you need to actually remove it from the source tree
(which we can't), otherwise you get:

Error: You must add new CONFIG options using Kconfig
The following new ad-hoc CONFIG options were detected:
CONFIG_IS_ENABLED

I don't think this is worth it though, so I suggest dropping this patch.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

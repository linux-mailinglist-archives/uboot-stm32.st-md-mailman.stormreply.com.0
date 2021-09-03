Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 430B3400189
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Sep 2021 16:51:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F4A8C57B51;
	Fri,  3 Sep 2021 14:51:40 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 631CDC5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Sep 2021 14:51:38 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id w144so6640794oie.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 Sep 2021 07:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F507OMFBdPm2BtsjZwWJ1mI7RccY7oJv1dDLYII4JYE=;
 b=Ig/vVf3O7dobvgKQpZixFv8ADUHQveorw+/EsgZVofGflXFFzfOYlMZY/SZTod0bCy
 UwBWWZAczsuoSI74n4rKMnx4La2uiQDgaMwVESrh7GG4PJrz+ildr86trc/pshzqnaai
 9Q0FZ1elg/LNAkLRtaEpjP8s6mOqYMQgBsr5okgTWd7RdBdwj6PRB1eaHHoftGaimj0T
 Lz+CO9sKf9Dcmx2oeWfL9ZABAO/q0L2RtM3svuRE9T3VEPwma/7HAHuI5cvmskJVX1Jx
 7HyUg21JdQcMw6toMeWbJU0hmNE95Pumrsue4btp4tgkD/g4JBQMSXQPc32OwINTEOmV
 O7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F507OMFBdPm2BtsjZwWJ1mI7RccY7oJv1dDLYII4JYE=;
 b=Y0LVU11oQBgVGQ8Wgj2QJ00eHTWFaHBeRNGLPkg8Z7ZIZoxgRN/HbmoW8ASN8A5NJb
 nA+oYfxR0TofXdDSz9R/9qxkzVzbrMzH1vH+Qogs93BpyI2Cb1KVCdqcViUHoHinHQVb
 B+wn77n50aqzyiZ+tlv4mUYymUxZheQygXMSaeZxym3rz1sbhauTAaV8TtA+hG/a15aD
 9o8/wGX0BSAchDT19swax8skEA5lAWDIyGln2tARSMvS8QobvRl+qW3mek4UgnX4Xzhh
 zIv+CtEXA26w9PnOb5Ze0uXRgx0zHBL7e+5qm4CgbKHNHHWZqCXc4pPlMpqaFNIbgVy/
 kEBw==
X-Gm-Message-State: AOAM530gyoiz6q7qKl3kxr8ohc1+zjaxRbK09lukLhP6mqsqfjU8pIcq
 3xLa9Mfk/C67kDBH+VWGT48=
X-Google-Smtp-Source: ABdhPJwFwO+/XVGd7m2JW8zwKLrgz11y7sx3OKzk9t7vwuC0pYTiJwbfoMUSNEbojT3Dqk6p8jMAwA==
X-Received: by 2002:aca:f108:: with SMTP id p8mr3064394oih.63.1630680697114;
 Fri, 03 Sep 2021 07:51:37 -0700 (PDT)
Received: from nuclearis3.gtech (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id p21sm1008881oip.28.2021.09.03.07.51.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 07:51:36 -0700 (PDT)
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210902120202.1.If7ddbb0eecde3d5db357ef27cb0833abbdacd362@changeid>
 <20210902120202.2.I0352ea8f5786a59f261a33d2008f75f6756e9a9e@changeid>
From: "Alex G." <mr.nuke.me@gmail.com>
Message-ID: <943a723f-38fc-7841-49a3-f57cde35012d@gmail.com>
Date: Fri, 3 Sep 2021 09:51:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210902120202.2.I0352ea8f5786a59f261a33d2008f75f6756e9a9e@changeid>
Content-Language: en-US
Cc: Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, Manuel Reis <mluis.reis@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 dillon min <dillon.minfei@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] board: stm32: Remove the
 bi_boot_params initialization
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>



On 9/2/21 5:02 AM, Patrick Delaunay wrote:
> The stm32 platforms never had to support an ATAGs-based Linux Kernel,
> so remove the bi_boot_params initialization.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Tested-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>

> ---
> 
>   board/dhelectronics/dh_stm32mp1/board.c              | 3 ---
>   board/engicam/stm32mp1/stm32mp1.c                    | 3 ---
>   board/st/stm32f429-discovery/stm32f429-discovery.c   | 2 --
>   board/st/stm32f429-evaluation/stm32f429-evaluation.c | 2 --
>   board/st/stm32f469-discovery/stm32f469-discovery.c   | 2 --
>   board/st/stm32f746-disco/stm32f746-disco.c           | 2 --
>   board/st/stm32h743-disco/stm32h743-disco.c           | 1 -
>   board/st/stm32h743-eval/stm32h743-eval.c             | 1 -
>   board/st/stm32h750-art-pi/stm32h750-art-pi.c         | 1 -
>   board/st/stm32mp1/stm32mp1.c                         | 3 ---
>   10 files changed, 20 deletions(-)
> 
> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
> index d7c1857c16..765b54a4a4 100644
> --- a/board/dhelectronics/dh_stm32mp1/board.c
> +++ b/board/dhelectronics/dh_stm32mp1/board.c
> @@ -590,9 +590,6 @@ static void board_init_fmc2(void)
>   /* board dependent setup after realloc */
>   int board_init(void)
>   {
> -	/* address of boot parameters */
> -	gd->bd->bi_boot_params = STM32_DDR_BASE + 0x100;
> -
>   	if (CONFIG_IS_ENABLED(DM_GPIO_HOG))
>   		gpio_hog_probe_all();
>   
> diff --git a/board/engicam/stm32mp1/stm32mp1.c b/board/engicam/stm32mp1/stm32mp1.c
> index 8bf9c9c67d..20d8603c78 100644
> --- a/board/engicam/stm32mp1/stm32mp1.c
> +++ b/board/engicam/stm32mp1/stm32mp1.c
> @@ -40,9 +40,6 @@ int checkboard(void)
>   /* board dependent setup after realloc */
>   int board_init(void)
>   {
> -	/* address of boot parameters */
> -	gd->bd->bi_boot_params = STM32_DDR_BASE + 0x100;
> -
>   	if (IS_ENABLED(CONFIG_DM_REGULATOR))
>   		regulators_enable_boot_on(_DEBUG);
>   
> diff --git a/board/st/stm32f429-discovery/stm32f429-discovery.c b/board/st/stm32f429-discovery/stm32f429-discovery.c
> index 46fcf907fc..5a50e98dd0 100644
> --- a/board/st/stm32f429-discovery/stm32f429-discovery.c
> +++ b/board/st/stm32f429-discovery/stm32f429-discovery.c
> @@ -53,8 +53,6 @@ u32 get_board_rev(void)
>   
>   int board_init(void)
>   {
> -	gd->bd->bi_boot_params = gd->bd->bi_dram[0].start + 0x100;
> -
>   	return 0;
>   }
>   
> diff --git a/board/st/stm32f429-evaluation/stm32f429-evaluation.c b/board/st/stm32f429-evaluation/stm32f429-evaluation.c
> index 3b6df1f3ab..cf3056163c 100644
> --- a/board/st/stm32f429-evaluation/stm32f429-evaluation.c
> +++ b/board/st/stm32f429-evaluation/stm32f429-evaluation.c
> @@ -47,8 +47,6 @@ u32 get_board_rev(void)
>   
>   int board_init(void)
>   {
> -	gd->bd->bi_boot_params = gd->bd->bi_dram[0].start + 0x100;
> -
>   	return 0;
>   }
>   
> diff --git a/board/st/stm32f469-discovery/stm32f469-discovery.c b/board/st/stm32f469-discovery/stm32f469-discovery.c
> index c5df9b0d9c..056c9dff2a 100644
> --- a/board/st/stm32f469-discovery/stm32f469-discovery.c
> +++ b/board/st/stm32f469-discovery/stm32f469-discovery.c
> @@ -47,8 +47,6 @@ u32 get_board_rev(void)
>   
>   int board_init(void)
>   {
> -	gd->bd->bi_boot_params = gd->bd->bi_dram[0].start + 0x100;
> -
>   	return 0;
>   }
>   
> diff --git a/board/st/stm32f746-disco/stm32f746-disco.c b/board/st/stm32f746-disco/stm32f746-disco.c
> index efa38a0e26..2543e2a5f8 100644
> --- a/board/st/stm32f746-disco/stm32f746-disco.c
> +++ b/board/st/stm32f746-disco/stm32f746-disco.c
> @@ -122,8 +122,6 @@ int board_late_init(void)
>   
>   int board_init(void)
>   {
> -	gd->bd->bi_boot_params = gd->bd->bi_dram[0].start + 0x100;
> -
>   #ifdef CONFIG_ETH_DESIGNWARE
>   	const char *phy_mode;
>   	int node;
> diff --git a/board/st/stm32h743-disco/stm32h743-disco.c b/board/st/stm32h743-disco/stm32h743-disco.c
> index 4091d5f9fd..e493786f11 100644
> --- a/board/st/stm32h743-disco/stm32h743-disco.c
> +++ b/board/st/stm32h743-disco/stm32h743-disco.c
> @@ -43,6 +43,5 @@ u32 get_board_rev(void)
>   
>   int board_init(void)
>   {
> -	gd->bd->bi_boot_params = gd->bd->bi_dram[0].start + 0x100;
>   	return 0;
>   }
> diff --git a/board/st/stm32h743-eval/stm32h743-eval.c b/board/st/stm32h743-eval/stm32h743-eval.c
> index 4091d5f9fd..e493786f11 100644
> --- a/board/st/stm32h743-eval/stm32h743-eval.c
> +++ b/board/st/stm32h743-eval/stm32h743-eval.c
> @@ -43,6 +43,5 @@ u32 get_board_rev(void)
>   
>   int board_init(void)
>   {
> -	gd->bd->bi_boot_params = gd->bd->bi_dram[0].start + 0x100;
>   	return 0;
>   }
> diff --git a/board/st/stm32h750-art-pi/stm32h750-art-pi.c b/board/st/stm32h750-art-pi/stm32h750-art-pi.c
> index 5785b2e575..bec26465d2 100644
> --- a/board/st/stm32h750-art-pi/stm32h750-art-pi.c
> +++ b/board/st/stm32h750-art-pi/stm32h750-art-pi.c
> @@ -53,6 +53,5 @@ int board_late_init(void)
>   
>   int board_init(void)
>   {
> -	gd->bd->bi_boot_params = gd->bd->bi_dram[0].start + 0x100;
>   	return 0;
>   }
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 032f08d795..1bceb41494 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -646,9 +646,6 @@ static void board_ev1_init(void)
>   /* board dependent setup after realloc */
>   int board_init(void)
>   {
> -	/* address of boot parameters */
> -	gd->bd->bi_boot_params = STM32_DDR_BASE + 0x100;
> -
>   	if (CONFIG_IS_ENABLED(DM_GPIO_HOG))
>   		gpio_hog_probe_all();
>   
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

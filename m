Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B054D400024
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Sep 2021 15:06:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63BC9C57B51;
	Fri,  3 Sep 2021 13:06:05 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BA47C5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Sep 2021 13:06:03 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7610883532;
 Fri,  3 Sep 2021 15:06:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1630674362;
 bh=H7SXfZkHH7d22gE0KIYe1QPeTA9B4yCbN6vmqugDVF8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XramlPO+F2A5lCIhrg4WVXxuZ5oA3x6L5On4m6jhDM5FffnS7t2ChtTFNip6bwBlK
 y0DKRP/KpysBEupKqr5uKtJgVLeC3pA+sqZH5Oxre8lrvUj+COzdmqmn4T3Qsw9Cnx
 AtHqs5cuXiUw6hgb0pRh/eeKxtY4DY/bWLr7Ho8pXcoVaIoHowzEnB2yKHOAFQ+Weo
 5Q4E+4qJZrClJhUuQQpEoXruS630tepTLzLaeoZ/dTsBvRyDZy0xKf6y6DqSrrVpdY
 /ZqBlvUKpsITLDA8MKcNxFtY2W0w80Tv1RlVJ9uxKRsHztpTAA+D+BWTJJx+HDBd+r
 KTijIgM1nijvw==
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20210901095143.4143-1-patrice.chotard@foss.st.com>
 <20210901095143.4143-2-patrice.chotard@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <1c71e380-0472-d5d1-aae9-4ac3b31f59f4@denx.de>
Date: Fri, 3 Sep 2021 15:02:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210901095143.4143-2-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 2/2] board: dh_stm32mp1: Remove
 gpio_hog_probe_all() from board
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

On 9/1/21 11:51 AM, Patrice Chotard wrote:
> DM_GPIO_HOG flag has been replaced by GPIO_HOG flag since a while in
> commit 49b10cb49262 ("gpio: fixes for gpio-hog support").
> 
> And furthermore, gpio_hog_probe_all() is already called in board_r.c.
> So gpio_hog_probe() can be removed from stm32mp1.c.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Marek Vasut <marex@denx.de>
> ---
> 
>   board/dhelectronics/dh_stm32mp1/board.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
> index d7c1857c16..725b438d76 100644
> --- a/board/dhelectronics/dh_stm32mp1/board.c
> +++ b/board/dhelectronics/dh_stm32mp1/board.c
> @@ -593,9 +593,6 @@ int board_init(void)
>   	/* address of boot parameters */
>   	gd->bd->bi_boot_params = STM32_DDR_BASE + 0x100;
>   
> -	if (CONFIG_IS_ENABLED(DM_GPIO_HOG))
> -		gpio_hog_probe_all();
> -
>   	board_key_check();

This is likely OK, yes.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

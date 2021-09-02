Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B07873FEE1E
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Sep 2021 14:53:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78F24C57B53;
	Thu,  2 Sep 2021 12:53:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66211C57B51
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Sep 2021 12:53:33 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1828jVpC020413;
 Thu, 2 Sep 2021 14:53:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5RPojt9Li+VkXN5dI3jMcADlvxilotfrmypcW0za4HM=;
 b=HQPuzZdXjV123tr+fcmT4O1o3Moqxwo1EdTN6MbPPSlL8g6UHsKenr0fsPl9gQWVda4B
 Y1cRO5c2CBKnEFVZWcl4euv6zN2TPTJLdHHp+w/UGU0KkIHmsjverDteUlhJuTEBD211
 TCEj+BX4wEgNG4fTAC4+ulo/O3Rm4PygVDVvRh3qYxx5zIu9kCEOcxbGJqJtSkpZvrI3
 vFjAf5C08afmd8IwNOLYsAenA6ipBx+70nUlEqodSfQrWfgdqhSIoJPda3huEwrMpKOi
 gVr4OWWm6EITbYFq4JpFT4Msn4LZXTSMry2JTwj0eZnQMONeC+goq24f515VyqltiNp4 fA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3atucthdx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Sep 2021 14:53:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D076010002A;
 Thu,  2 Sep 2021 14:53:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A253D256425;
 Thu,  2 Sep 2021 14:53:23 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Sep
 2021 14:53:22 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210902120202.1.If7ddbb0eecde3d5db357ef27cb0833abbdacd362@changeid>
 <20210902120202.2.I0352ea8f5786a59f261a33d2008f75f6756e9a9e@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <9bc925d7-f1db-6311-58b4-1dd40cb65e02@foss.st.com>
Date: Thu, 2 Sep 2021 14:53:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210902120202.2.I0352ea8f5786a59f261a33d2008f75f6756e9a9e@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-02_04,2021-09-02_01,2020-04-07_01
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrick

On 9/2/21 12:02 PM, Patrick Delaunay wrote:
> The stm32 platforms never had to support an ATAGs-based Linux Kernel,
> so remove the bi_boot_params initialization.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  board/dhelectronics/dh_stm32mp1/board.c              | 3 ---
>  board/engicam/stm32mp1/stm32mp1.c                    | 3 ---
>  board/st/stm32f429-discovery/stm32f429-discovery.c   | 2 --
>  board/st/stm32f429-evaluation/stm32f429-evaluation.c | 2 --
>  board/st/stm32f469-discovery/stm32f469-discovery.c   | 2 --
>  board/st/stm32f746-disco/stm32f746-disco.c           | 2 --
>  board/st/stm32h743-disco/stm32h743-disco.c           | 1 -
>  board/st/stm32h743-eval/stm32h743-eval.c             | 1 -
>  board/st/stm32h750-art-pi/stm32h750-art-pi.c         | 1 -
>  board/st/stm32mp1/stm32mp1.c                         | 3 ---
>  10 files changed, 20 deletions(-)
> 
> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
> index d7c1857c16..765b54a4a4 100644
> --- a/board/dhelectronics/dh_stm32mp1/board.c
> +++ b/board/dhelectronics/dh_stm32mp1/board.c
> @@ -590,9 +590,6 @@ static void board_init_fmc2(void)
>  /* board dependent setup after realloc */
>  int board_init(void)
>  {
> -	/* address of boot parameters */
> -	gd->bd->bi_boot_params = STM32_DDR_BASE + 0x100;
> -
>  	if (CONFIG_IS_ENABLED(DM_GPIO_HOG))
>  		gpio_hog_probe_all();
>  
> diff --git a/board/engicam/stm32mp1/stm32mp1.c b/board/engicam/stm32mp1/stm32mp1.c
> index 8bf9c9c67d..20d8603c78 100644
> --- a/board/engicam/stm32mp1/stm32mp1.c
> +++ b/board/engicam/stm32mp1/stm32mp1.c
> @@ -40,9 +40,6 @@ int checkboard(void)
>  /* board dependent setup after realloc */
>  int board_init(void)
>  {
> -	/* address of boot parameters */
> -	gd->bd->bi_boot_params = STM32_DDR_BASE + 0x100;
> -
>  	if (IS_ENABLED(CONFIG_DM_REGULATOR))
>  		regulators_enable_boot_on(_DEBUG);
>  
> diff --git a/board/st/stm32f429-discovery/stm32f429-discovery.c b/board/st/stm32f429-discovery/stm32f429-discovery.c
> index 46fcf907fc..5a50e98dd0 100644
> --- a/board/st/stm32f429-discovery/stm32f429-discovery.c
> +++ b/board/st/stm32f429-discovery/stm32f429-discovery.c
> @@ -53,8 +53,6 @@ u32 get_board_rev(void)
>  
>  int board_init(void)
>  {
> -	gd->bd->bi_boot_params = gd->bd->bi_dram[0].start + 0x100;
> -
>  	return 0;
>  }
>  
> diff --git a/board/st/stm32f429-evaluation/stm32f429-evaluation.c b/board/st/stm32f429-evaluation/stm32f429-evaluation.c
> index 3b6df1f3ab..cf3056163c 100644
> --- a/board/st/stm32f429-evaluation/stm32f429-evaluation.c
> +++ b/board/st/stm32f429-evaluation/stm32f429-evaluation.c
> @@ -47,8 +47,6 @@ u32 get_board_rev(void)
>  
>  int board_init(void)
>  {
> -	gd->bd->bi_boot_params = gd->bd->bi_dram[0].start + 0x100;
> -
>  	return 0;
>  }
>  
> diff --git a/board/st/stm32f469-discovery/stm32f469-discovery.c b/board/st/stm32f469-discovery/stm32f469-discovery.c
> index c5df9b0d9c..056c9dff2a 100644
> --- a/board/st/stm32f469-discovery/stm32f469-discovery.c
> +++ b/board/st/stm32f469-discovery/stm32f469-discovery.c
> @@ -47,8 +47,6 @@ u32 get_board_rev(void)
>  
>  int board_init(void)
>  {
> -	gd->bd->bi_boot_params = gd->bd->bi_dram[0].start + 0x100;
> -
>  	return 0;
>  }
>  
> diff --git a/board/st/stm32f746-disco/stm32f746-disco.c b/board/st/stm32f746-disco/stm32f746-disco.c
> index efa38a0e26..2543e2a5f8 100644
> --- a/board/st/stm32f746-disco/stm32f746-disco.c
> +++ b/board/st/stm32f746-disco/stm32f746-disco.c
> @@ -122,8 +122,6 @@ int board_late_init(void)
>  
>  int board_init(void)
>  {
> -	gd->bd->bi_boot_params = gd->bd->bi_dram[0].start + 0x100;
> -
>  #ifdef CONFIG_ETH_DESIGNWARE
>  	const char *phy_mode;
>  	int node;
> diff --git a/board/st/stm32h743-disco/stm32h743-disco.c b/board/st/stm32h743-disco/stm32h743-disco.c
> index 4091d5f9fd..e493786f11 100644
> --- a/board/st/stm32h743-disco/stm32h743-disco.c
> +++ b/board/st/stm32h743-disco/stm32h743-disco.c
> @@ -43,6 +43,5 @@ u32 get_board_rev(void)
>  
>  int board_init(void)
>  {
> -	gd->bd->bi_boot_params = gd->bd->bi_dram[0].start + 0x100;
>  	return 0;
>  }
> diff --git a/board/st/stm32h743-eval/stm32h743-eval.c b/board/st/stm32h743-eval/stm32h743-eval.c
> index 4091d5f9fd..e493786f11 100644
> --- a/board/st/stm32h743-eval/stm32h743-eval.c
> +++ b/board/st/stm32h743-eval/stm32h743-eval.c
> @@ -43,6 +43,5 @@ u32 get_board_rev(void)
>  
>  int board_init(void)
>  {
> -	gd->bd->bi_boot_params = gd->bd->bi_dram[0].start + 0x100;
>  	return 0;
>  }
> diff --git a/board/st/stm32h750-art-pi/stm32h750-art-pi.c b/board/st/stm32h750-art-pi/stm32h750-art-pi.c
> index 5785b2e575..bec26465d2 100644
> --- a/board/st/stm32h750-art-pi/stm32h750-art-pi.c
> +++ b/board/st/stm32h750-art-pi/stm32h750-art-pi.c
> @@ -53,6 +53,5 @@ int board_late_init(void)
>  
>  int board_init(void)
>  {
> -	gd->bd->bi_boot_params = gd->bd->bi_dram[0].start + 0x100;
>  	return 0;
>  }
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 032f08d795..1bceb41494 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -646,9 +646,6 @@ static void board_ev1_init(void)
>  /* board dependent setup after realloc */
>  int board_init(void)
>  {
> -	/* address of boot parameters */
> -	gd->bd->bi_boot_params = STM32_DDR_BASE + 0x100;
> -
>  	if (CONFIG_IS_ENABLED(DM_GPIO_HOG))
>  		gpio_hog_probe_all();
>  
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Tested-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

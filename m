Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD76458AA6
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Nov 2021 09:45:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACAD1C597BE;
	Mon, 22 Nov 2021 08:45:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3914C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Nov 2021 08:45:29 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AM7j9Vo008818;
 Mon, 22 Nov 2021 09:45:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=n55Tb1mvKTWSWY7gzANJkUCN2ODqfrpsMDBEIlIlCQs=;
 b=7TNhizZ4F7TQNreWS7KeTRJ7GXPAyjqg8Shl40WA0U8oOo/k90vqlJ1s+oTH6rchTYn7
 AI592pd/NvXgqFmQQMn8C+awe9WPWLqt2pO9lnalq/w3F/PJFZZP/Oco5EHpXjn0yzk1
 L4M50DVzLkVizudiEdkIk+m5C5c2blzObEC+mPgHD916JjsHBgiPNejGAHM357yyrYjM
 yGuNcIRdAGqNSPB8c3nTQ+FS5P4y1BnX7Tuva82iKdSxWVdpOqVkxqS3y/GOcTHZx5vw
 S5l0SVHjARvVJRFKpd0ytSnXk+Eme4OhdsH4o2xaPuh4Uo3md9V37SJtTXuS9shrx/S0 TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cg73g0c30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 09:45:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E4A5110002A;
 Mon, 22 Nov 2021 09:45:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DCAAF21B51B;
 Mon, 22 Nov 2021 09:45:27 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 22 Nov
 2021 09:45:27 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211011075244.1.Icb805e47dd8102559236013264342b52c187813f@changeid>
 <20211011075244.4.Id047d97a30c68f46ac2bcb57014faa42067dd1ba@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <7812bed6-a215-ea6d-ebd9-093f5f5dc261@foss.st.com>
Date: Mon, 22 Nov 2021 09:45:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211011075244.4.Id047d97a30c68f46ac2bcb57014faa42067dd1ba@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_04,2021-11-22_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>, uboot-stm32@st-md-mailman.stormreply.com,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 4/4] stm32mp15: tidy up #ifdefs in cpu.c
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

On 10/11/21 9:52 AM, Patrick Delaunay wrote:
> We should avoid #ifdef in C modules and the unused functions
> are eliminated by the linker.
> 
> Use the more readable IS_ENABLE() instead.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cpu.c | 34 +++++++++++++++-------------------
>  1 file changed, 15 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index 7421ea42a1..325d710100 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -93,7 +93,6 @@ u8 early_tlb[PGTABLE_SIZE] __section(".data") __aligned(0x4000);
>  
>  struct lmb lmb;
>  
> -#if defined(CONFIG_SPL_BUILD)
>  static void security_init(void)
>  {
>  	/* Disable the backup domain write protection */
> @@ -208,7 +207,6 @@ static void update_bootmode(void)
>  			TAMP_BOOT_MODE_MASK,
>  			boot_mode << TAMP_BOOT_MODE_SHIFT);
>  }
> -#endif /* defined(CONFIG_SPL_BUILD) */
>  
>  u32 get_bootmode(void)
>  {
> @@ -286,28 +284,26 @@ int arch_cpu_init(void)
>  	/* early armv7 timer init: needed for polling */
>  	timer_init();
>  
> -#if defined(CONFIG_SPL_BUILD)
> -	security_init();
> -	update_bootmode();
> -#endif
> +	if (IS_ENABLED(CONFIG_SPL_BUILD)) {
> +		security_init();
> +		update_bootmode();
> +	}
>  /* reset copro state in SPL, when used, or in U-Boot */
> -#if !defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD)
> -	/* Reset Coprocessor state unless it wakes up from Standby power mode */
> -	if (!(readl(PWR_MCUCR) & PWR_MCUCR_SBF)) {
> -		writel(TAMP_COPRO_STATE_OFF, TAMP_COPRO_STATE);
> -		writel(0, TAMP_COPRO_RSC_TBL_ADDRESS);
> +	if (!IS_ENABLED(CONFIG_SPL) || IS_ENABLED(CONFIG_SPL_BUILD)) {
> +		/* Reset Coprocessor state unless it wakes up from Standby power mode */
> +		if (!(readl(PWR_MCUCR) & PWR_MCUCR_SBF)) {
> +			writel(TAMP_COPRO_STATE_OFF, TAMP_COPRO_STATE);
> +			writel(0, TAMP_COPRO_RSC_TBL_ADDRESS);
> +		}
>  	}
> -#endif
>  
>  	boot_mode = get_bootmode();
>  
>  	if (IS_ENABLED(CONFIG_CMD_STM32PROG_SERIAL) &&
>  	    (boot_mode & TAMP_BOOT_DEVICE_MASK) == BOOT_SERIAL_UART)
>  		gd->flags |= GD_FLG_SILENT | GD_FLG_DISABLE_CONSOLE;
> -#if defined(CONFIG_DEBUG_UART) && defined(CONFIG_SPL_BUILD)
> -	else
> +	else if (IS_ENABLED(CONFIG_DEBUG_UART) && IS_ENABLED(CONFIG_SPL_BUILD))
>  		debug_uart_init();
> -#endif
>  
>  	return 0;
>  }
> @@ -461,7 +457,7 @@ void get_soc_name(char name[SOC_NAME_SIZE])
>  		 soc_type[type], soc_pkg[pkg], soc_rev[rev]);
>  }
>  
> -#if defined(CONFIG_DISPLAY_CPUINFO)
> +/* used when CONFIG_DISPLAY_CPUINFO is activated */
>  int print_cpuinfo(void)
>  {
>  	char name[SOC_NAME_SIZE];
> @@ -471,7 +467,6 @@ int print_cpuinfo(void)
>  
>  	return 0;
>  }
> -#endif /* CONFIG_DISPLAY_CPUINFO */
>  
>  static void setup_boot_mode(void)
>  {
> @@ -601,13 +596,15 @@ static void setup_boot_mode(void)
>   */
>  __weak int setup_mac_address(void)
>  {
> -#if defined(CONFIG_NET)
>  	int ret;
>  	int i;
>  	u32 otp[2];
>  	uchar enetaddr[6];
>  	struct udevice *dev;
>  
> +	if (!IS_ENABLED(CONFIG_NET))
> +		return 0;
> +
>  	/* MAC already in environment */
>  	if (eth_env_get_enetaddr("ethaddr", enetaddr))
>  		return 0;
> @@ -634,7 +631,6 @@ __weak int setup_mac_address(void)
>  	ret = eth_env_set_enetaddr("ethaddr", enetaddr);
>  	if (ret)
>  		log_err("Failed to set mac address %pM from OTP: %d\n", enetaddr, ret);
> -#endif
>  
>  	return 0;
>  }
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

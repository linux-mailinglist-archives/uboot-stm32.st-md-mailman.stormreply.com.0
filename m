Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D97458A3D
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Nov 2021 08:58:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F987C5A4FD;
	Mon, 22 Nov 2021 07:58:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62547C597BB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Nov 2021 07:58:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AM74MBb020526;
 Mon, 22 Nov 2021 08:58:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ArrsxnJZWeIa+SPZyiG4Q+7ov6YejpQEdxIv6SD9BT0=;
 b=BO+YD8UkHq4XUmo43QCdWcvbmo3KbRjAFCxEmwzd/iohSQ/YlWKrSEGjvEGHI4AmV7zr
 UGcTEONJQUfgeEzdHLbRwq03aFJAkKpTwL36xX14rNLlFDN5ywZ6ZemanZJDEKPdxPF4
 ZOnJtmwKFfCAQXJUKJGuUFHzKR73RDzHSHHiBIp0lxkv7JN4ey0IL0fA9VL8snYqF2Lv
 lrlD04LKWbKfV1QZ2KiTX1qb5cpUCWKkAy0EEkYHc4J3G5EQnrcZ2ehCtgh/wpRzN9MX
 NJLbAtbVLg7a1bkIaX7KN1nvqMfYQRFs3naGuYjHmWqCQua5iR/OYW+EFoXN/YXy9nNd HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cg6gcga50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 08:58:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 089C510002A;
 Mon, 22 Nov 2021 08:58:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC67221813B;
 Mon, 22 Nov 2021 08:58:22 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 22 Nov
 2021 08:58:22 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211011075244.1.Icb805e47dd8102559236013264342b52c187813f@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <0aa26843-ff09-e81b-538d-5a77f1921338@foss.st.com>
Date: Mon, 22 Nov 2021 08:58:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211011075244.1.Icb805e47dd8102559236013264342b52c187813f@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_03,2021-11-22_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] arm: stm32mp: bsec: Update OTP shadow
 registers in SPL
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
> Currently the upper OTP (after 57) are shadowed in U-Boot proper,
> when TFABOOT is not used.
> 
> This choice cause an issue when U-Boot is not executed after SPL,
> so this BSEC initialization is moved in SPL and no more executed in U-Boot,
> so it is still executed only one time.
> 
> After this patch this BSEC initialization is done in FSBL: SPL or TF-A.
> 
> To force this initialization in all the case, the probe of the BSEC
> driver is forced in SPL in the arch st32mp function: spl_board_init().
> 
> Even if today BSEC driver is already probed in STM32MP15x clock driver
> clk_stm32mp1.c because get_cpu_type() is called in
> stm32mp1_get_max_opp_freq() function.
> 
> Reported-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> It is updated version of proposed Alexandru patch:
> 
> [v2,06/11] arm: stm32mp: bsec: Update OTP shadow registers in SPL
> http://patchwork.ozlabs.org/project/uboot/patch/20210907235933.2798330-7-mr.nuke.me@gmail.com/
> 
> 
>  arch/arm/mach-stm32mp/bsec.c | 5 ++---
>  arch/arm/mach-stm32mp/cpu.c  | 8 ++++++++
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
> index fe39bd80cf..e517acdd01 100644
> --- a/arch/arm/mach-stm32mp/bsec.c
> +++ b/arch/arm/mach-stm32mp/bsec.c
> @@ -503,10 +503,9 @@ static int stm32mp_bsec_probe(struct udevice *dev)
>  
>  	/*
>  	 * update unlocked shadow for OTP cleared by the rom code
> -	 * only executed in U-Boot proper when TF-A is not used
> +	 * only executed in SPL, it is done in TF-A for TFABOOT
>  	 */
> -
> -	if (!IS_ENABLED(CONFIG_TFABOOT) && !IS_ENABLED(CONFIG_SPL_BUILD)) {
> +	if (IS_ENABLED(CONFIG_SPL_BUILD)) {
>  		plat = dev_get_plat(dev);
>  
>  		for (otp = 57; otp <= BSEC_OTP_MAX_VALUE; otp++)
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index eb79f3ffd2..0263ffe96a 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -174,7 +174,15 @@ static void dbgmcu_init(void)
>  
>  void spl_board_init(void)
>  {
> +	struct udevice *dev;
> +	int ret;
> +
>  	dbgmcu_init();
> +
> +	/* force probe of BSEC driver to shadow the upper OTP */
> +	ret = uclass_get_device_by_driver(UCLASS_MISC, DM_DRIVER_GET(stm32mp_bsec), &dev);
> +	if (ret)
> +		log_warning("BSEC probe failed: %d\n", ret);
>  }
>  #endif /* !defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD) */
>  
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

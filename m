Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF993AC529E
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 May 2025 18:03:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B47AFC36B19;
	Tue, 27 May 2025 16:03:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C0BFC36B17
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 16:03:41 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAsMjL011814;
 Tue, 27 May 2025 18:03:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 tcDWqGQM9cODdG5s0ENFv3bT5vQv5svMtPFJ03qLyP4=; b=LRkwhyHEN93Dg5vh
 1BRn2zxRzutLTAGfZuPpxCwlHtV+zDKQ0wZENHmF5vqzjowSZbnRAh2/SJCMV0/D
 1TP30Knny2c9DuYeBl4QTgOliWiQyRK+AiWSAOZzpoDfRWjHpMTVag1PegXgVR/M
 6BNPhy8aeX/JT8puUQ82YD57jjOwlVntT2DmGL3YIRWUOy222FGaUOtjBZhYgtRr
 uJD/g6V0lkKx+Bg+AUCM/i8AzoMv1KLjCiCWaUv/7e8Oy1s1B0IhnY8cS7zXGqM2
 ZGEgInOQAaZCL9CtfqNjEnNdB4lpH0IQyjEG2g6xV+ztU2DLkxO9U7j3lxHu+hJ2
 xnaJpA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u3hk56bb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 May 2025 18:03:16 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DB00E40051;
 Tue, 27 May 2025 18:02:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6B244B2C121;
 Tue, 27 May 2025 18:01:13 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 18:01:12 +0200
Message-ID: <09592145-a8db-4ac0-94fe-5b63e5121475@foss.st.com>
Date: Tue, 27 May 2025 18:01:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250512172149.150214-1-marek.vasut@mailbox.org>
 <20250512172149.150214-2-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250512172149.150214-2-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_08,2025-05-27_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, u-boot@dh-electronics.com,
 Cheick Traore <cheick.traore@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 01/10] ARM: stm32: Add STM32MP13xx SPL
	Kconfig options
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



On 5/12/25 19:21, Marek Vasut wrote:
> Introduce Kconfig options used by SPL on STM32MP13xx and isolate
> the Kconfig options only used in case TFA BL2 is used as a SPL
> behind CONFIG_TFABOOT dependency.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Cheick Traore <cheick.traore@foss.st.com>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Cc: Lionel Debieve <lionel.debieve@foss.st.com>
> Cc: Pascal Zimmermann <pzimmermann@dh-electronics.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Sughosh Ganu <sughosh.ganu@linaro.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/mach-stm32mp/Kconfig     | 7 +++++--
>  arch/arm/mach-stm32mp/Kconfig.13x | 3 ++-
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index 58250901101..3a0ca50e9d6 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -40,16 +40,19 @@ choice
>  config STM32MP13X
>  	bool "Support STMicroelectronics STM32MP13x Soc"
>  	select ARCH_EARLY_INIT_R
> -	select ARM_SMCCC
> +	select ARM_SMCCC if TFABOOT
> +	select ARCH_SUPPORT_PSCI if !TFABOOT
> +	select BINMAN if !TFABOOT
>  	select CPU_V7A
>  	select CPU_V7_HAS_NONSEC
>  	select CPU_V7_HAS_VIRT
> -	select OF_BOARD
> +	select OF_BOARD if TFABOOT
>  	select OF_BOARD_SETUP
>  	select PINCTRL_STM32
>  	select STM32_RCC
>  	select STM32_RESET
>  	select STM32_SERIAL
> +	select SUPPORT_SPL if !TFABOOT
>  	select SYS_ARCH_TIMER
>  	imply CMD_NVEDIT_INFO
>  	imply OF_UPSTREAM
> diff --git a/arch/arm/mach-stm32mp/Kconfig.13x b/arch/arm/mach-stm32mp/Kconfig.13x
> index bc8b3f8cf77..cecf9e3b8c7 100644
> --- a/arch/arm/mach-stm32mp/Kconfig.13x
> +++ b/arch/arm/mach-stm32mp/Kconfig.13x
> @@ -20,7 +20,8 @@ config TARGET_ST_STM32MP13X
>  endchoice
>  
>  config TEXT_BASE
> -	default 0xC0000000
> +	default 0xC0000000 if TFABOOT
> +	default 0xC0100000 if !TFABOOT
>  
>  config PRE_CON_BUF_ADDR
>  	default 0xC0800000

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

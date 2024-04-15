Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F86D8A4BE1
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Apr 2024 11:49:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 170E2C6B444;
	Mon, 15 Apr 2024 09:49:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3EBEC69067
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 09:49:33 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43F7GpiZ028141; Mon, 15 Apr 2024 11:49:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=sykT+1TMX1qERK825VelwYL6Akp5dbtzv6AJFmemsEI=; b=tZ
 zoU69zpq7B6L2hxjffgA1pd3EqhTt5Hz7+49Dz/YsHGqsUrPcK97r3CnWpX/a4aP
 hd3h5pNMdJVAaQgHRh3dGeEzNG5OcKFOLKZ5DnD3hMuaeXQGK/8tNRczcPO5+og8
 Su3aj/sOYUAKl111mmMgRaGrWV3FcrQ/jv/WyegrG4iue/ZmFUPZJ6UwS353FlUt
 WZ7sAAFpUfrmT1HwDUTAsqxmFBviDburYtxfoCkPJjX87ckLRar9BmPwDlZ9FkkK
 yM1hVSEIGgksVIr5bqksUQ9dVC3KA9qb32sR2+xbcSkrljkxczPMrxORm/UzUyce
 jAy7b1oCAn2rGPnw1I8Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xff646twk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Apr 2024 11:49:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 828294002D;
 Mon, 15 Apr 2024 11:49:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CBC142122EC;
 Mon, 15 Apr 2024 11:48:48 +0200 (CEST)
Received: from [10.48.86.98] (10.48.86.98) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Apr
 2024 11:48:48 +0200
Message-ID: <f808ec3d-966c-43e6-87be-18e742f976b3@foss.st.com>
Date: Mon, 15 Apr 2024 11:48:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240414184028.147067-1-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240414184028.147067-1-marex@denx.de>
X-Originating-IP: [10.48.86.98]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_08,2024-04-09_01,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Igor Opaniuk <igor.opaniuk@foundries.io>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Initialize TAMP_SMCR
 BKP..PROT fields on STM32MP15xx
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



On 4/14/24 20:39, Marek Vasut wrote:
> In case of an OTP-CLOSED STM32MP15xx system, the CPU core 1 cannot be
> released from endless loop in BootROM only by populating TAMP BKPxR 4
> and 5 with magic and branch address and sending SGI0 interrupt from
> core 0 to core 1 twice. TAMP_SMCR BKP..PROT fields must be initialized
> as well to release the core 1 from endless loop during the second SGI0
> handling on core 1. Initialize TAMP_SMCR to protect the first 16 backup
> registers, the ones which contain the core 1 magic, branch address and
> boot information.
> 
> This requirement seems to be undocumented, therefore it was necessary
> to trace and analyze the STM32MP15xx BootROM using OpenOCD and objdump.
> Ultimately, it turns out that a certain BootROM function reads out the
> TAMP_SMCR register and tests whether the BKP..PROT fields are non-zero.
> If they are zero, the BootROM code again waits for SGI0 using WFI, else
> the execution moves forward until it reaches handoff to the TAMP BKPxR 5
> branch address.
> 
> This fixes CPU core 1 release using U-Boot PSCI implementation on an
> OTP-CLOSED system, i.e. system with fuse 0 bit 6 set.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Igor Opaniuk <igor.opaniuk@foundries.io>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Simon Glass <sjg@chromium.org
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
> index dd99150fbc2..138a6d6b614 100644
> --- a/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
> +++ b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
> @@ -14,6 +14,7 @@
>  #include <asm/arch/sys_proto.h>
>  #include <dm/device.h>
>  #include <dm/uclass.h>
> +#include <linux/bitfield.h>
>  
>  /* RCC register */
>  #define RCC_TZCR		(STM32_RCC_BASE + 0x00)
> @@ -41,6 +42,9 @@
>  #define TZC_REGION_ID_ACCESS0	(STM32_TZC_BASE + 0x114)
>  
>  #define TAMP_CR1		(STM32_TAMP_BASE + 0x00)
> +#define TAMP_SMCR		(STM32_TAMP_BASE + 0x20)
> +#define TAMP_SMCR_BKPRWDPROT	GENMASK(7, 0)
> +#define TAMP_SMCR_BKPWDPROT	GENMASK(23, 16)
>  
>  #define PWR_CR1			(STM32_PWR_BASE + 0x00)
>  #define PWR_MCUCR		(STM32_PWR_BASE + 0x14)
> @@ -136,6 +140,18 @@ static void security_init(void)
>  	 */
>  	writel(0x0, TAMP_CR1);
>  
> +	/*
> +	 * TAMP: Configure non-zero secure protection settings. This is
> +	 * checked by BootROM function 35ac on OTP-CLOSED device during
> +	 * CPU core 1 release from endless loop. If secure protection
> +	 * fields are zero, the core 1 is not released from endless
> +	 * loop on second SGI0.
> +	 */
> +	clrsetbits_le32(TAMP_SMCR,
> +			TAMP_SMCR_BKPRWDPROT | TAMP_SMCR_BKPRWDPROT,

Hi Marek

there is a typo, you used twice TAMP_SMCR_BKPRWDPROT :

TAMP_SMCR_BKPRWDPROT | TAMP_SMCR_BKPRWDPROT  => TAMP_SMCR_BKPRWDPROT | TAMP_SMCR_BKPWDPROT 
                                    ^~~~~                 

Patrice

> +			FIELD_PREP(TAMP_SMCR_BKPRWDPROT, 0x10) |
> +			FIELD_PREP(TAMP_SMCR_BKPWDPROT, 0x10));
> +
>  	/* GPIOZ: deactivate the security */
>  	writel(BIT(0), RCC_MP_AHB5ENSETR);
>  	writel(0x0, GPIOZ_SECCFGR);
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

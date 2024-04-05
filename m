Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB348997A9
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Apr 2024 10:18:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4AC4C6C83C;
	Fri,  5 Apr 2024 08:18:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B964FC6B444
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Apr 2024 08:18:32 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4351CBxr021122; Fri, 5 Apr 2024 10:18:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=0nQVGUF4CX6bR8C3pNbETg6x5scjpZwkgtB0+Y0suj0=; b=oZ
 1PVuEohg1RGIN487es28I40pL0p1yvAQRoo01wwHvDgX+eqy3G81fHYoPahA/kOs
 hoGLRubDkIT43hYVNCqXX8G+66270+9scz1zNtAFZZmNhi00Npt6Hmtw7Fx6vSc5
 bnKPDYmkc3CERRMiGVGz9ga/mnDrMn7HcDOjt2io5cVmuR9fCJ2FpIp0V2F6oBWa
 jbmiUPgFVt4fRBOC9S0B/GcDoLLiQNgLHu6IcUTKQ9E4sr9X9j4HuRwZUbiQ5BnS
 MQl0OvxFCqCPtrSrm2mamLZyp17NUrRAOA0L4MgCUkhouZO4CSVsbPEyOKUnGrOR
 U/Al262mod85J5Mf0mVw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x9emneeba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Apr 2024 10:18:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E23534002D;
 Fri,  5 Apr 2024 10:18:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 44D5820F54F;
 Fri,  5 Apr 2024 10:18:03 +0200 (CEST)
Received: from [10.252.29.225] (10.252.29.225) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 5 Apr
 2024 10:18:02 +0200
Message-ID: <91111fd9-8c9d-4d4b-8d3b-ce25a57fb29d@foss.st.com>
Date: Fri, 5 Apr 2024 10:18:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240331182202.335923-1-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240331182202.335923-1-marex@denx.de>
X-Originating-IP: [10.252.29.225]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_07,2024-04-04_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Jump to ep on successful
 resume in PSCI suspend code
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



On 3/31/24 20:21, Marek Vasut wrote:
> In case the system has resumed successfully, the PSCI suspend resume
> code has to jump to the 'ep' successful resume entry point code path,
> otherwise the code has to jump to content of the LR register, which
> points to failed resume code path.
> 
> To implement this distinction, rewrite LR register stored on stack
> with 'ep' value in case of a successful resume, which is really in
> every case unless some catastrophic failure occurred during suspend.
> 
> Without this change, Linux counts every resume as failed in
> /sys/power/suspend_stats/fail
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/mach-stm32mp/psci.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/mach-stm32mp/psci.c b/arch/arm/mach-stm32mp/psci.c
> index 8cdeb0ab3f2..4f2379df45f 100644
> --- a/arch/arm/mach-stm32mp/psci.c
> +++ b/arch/arm/mach-stm32mp/psci.c
> @@ -703,6 +703,8 @@ void __secure psci_system_suspend(u32 __always_unused function_id,
>  {
>  	u32 saved_mcudivr, saved_pll3cr, saved_pll4cr, saved_mssckselr;
>  	u32 gicd_addr = stm32mp_get_gicd_base_address();
> +	u32 cpu = psci_get_cpu_id();
> +	u32 sp = (u32)__secure_stack_end - (cpu << ARM_PSCI_STACK_SHIFT);
>  	bool iwdg1_wake = false;
>  	bool iwdg2_wake = false;
>  	bool other_wake = false;
> @@ -805,4 +807,16 @@ void __secure psci_system_suspend(u32 __always_unused function_id,
>  
>  	writel(SYSCFG_CMPENR_MPUEN, STM32_SYSCFG_BASE + SYSCFG_CMPENSETR);
>  	clrbits_le32(STM32_SYSCFG_BASE + SYSCFG_CMPCR, SYSCFG_CMPCR_SW_CTRL);
> +
> +	/*
> +	 * The system has resumed successfully. Rewrite LR register stored
> +	 * on stack with 'ep' value, so that on return from this PSCI call,
> +	 * the code would jump to that 'ep' resume entry point code path
> +	 * instead of the previous 'lr' register content which (e.g. with
> +	 * Linux) points to resume failure code path.
> +	 *
> +	 * See arch/arm/cpu/armv7/psci.S _smc_psci: for the stack layout
> +	 * used here, SP-4 is PC, SP-8 is LR, SP-12 is R7, and so on.
> +	 */
> +	writel(ep, sp - 8);
>  }

Hi Marek

This patch is not based on last next or master branch, psci.c is now located in 
arch/arm/mach-stm32mp/stm32mp1/psci.c 

Nevertheless, you can add my RB on the V2.

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

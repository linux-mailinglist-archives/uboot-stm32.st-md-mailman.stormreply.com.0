Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C2577E292
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Aug 2023 15:30:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 478A5C6B45E;
	Wed, 16 Aug 2023 13:30:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9526C6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 13:30:15 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37GDJ3o5030621; Wed, 16 Aug 2023 15:30:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=m8RN1Cgk9wGqjBAueStRFmEVh+pgIAFYsq3gz5ZJxaU=; b=Sn
 9szpzwG/QTxmuRvvW6ULpyMDlY9hKL5LMK+zvpfP2/fpPGrHaetR4v6UX97+b75x
 qBFm3pznPKkC7VGYuyXq2BtOMOKPwmyFAjiRJO58K9Bo9CHBd+KKIeBn3tv1YkI+
 eXoXiZwI0/HVgH0Y57kvk3lT3UiO/hZRMgAW3QQXROL80voetfDAMTreMJWKvgLt
 IlnCbZ1jBTZDLz6IE4mLm+VFpO5Za3t1usxGjjr88rtUyJg4fGXf62G1CoMiMRRZ
 CPi1LbVIw3JRBqeyxRGyTglwzBu0sM+ilfUVxRlZBNMkvt4BNVA2CzYdAbrqU+9s
 NN3E1hEAyPJeYJWVDGXQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sgpvgu3q4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Aug 2023 15:30:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E410510005D;
 Wed, 16 Aug 2023 15:30:13 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DC10F242ABF;
 Wed, 16 Aug 2023 15:30:13 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 16 Aug
 2023 15:30:13 +0200
Message-ID: <0774d7aa-0cff-1a33-3354-e9a931211598@foss.st.com>
Date: Wed, 16 Aug 2023 15:30:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20230706213227.113369-1-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230706213227.113369-1-marex@denx.de>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_12,2023-08-15_02,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Inhibit PDDS because CSTBYDIS
	is set
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



On 7/6/23 23:32, Marek Vasut wrote:
> The PWR_MPUCR CSTBYDIS bit is set, therefore the CA cores can never
> enter CStandby state and would always end up in CStop state. Clear
> the PDDS bit, which indicates the CA cores can enter CStandby state
> as it makes little sense to keep it set with CSTBYDIS also set.
> 
> This does however fix a problem too. When both PWR_MPUCR and PWR_MCUCR
> PDDS bits are set, then the chip enters CStandby state even though the
> PWR_MCUCR CSTBYDIS is set. Clearing the PWR_MPUCR PDDS prevents that
> from happening.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/mach-stm32mp/psci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-stm32mp/psci.c b/arch/arm/mach-stm32mp/psci.c
> index 50e3fc4ae45..79734b5289b 100644
> --- a/arch/arm/mach-stm32mp/psci.c
> +++ b/arch/arm/mach-stm32mp/psci.c
> @@ -754,7 +754,7 @@ void __secure psci_system_suspend(u32 __always_unused function_id,
>  	setbits_le32(STM32_RCC_BASE + RCC_MP_CIER, RCC_MP_CIFR_WKUPF);
>  
>  	setbits_le32(STM32_PWR_BASE + PWR_MPUCR,
> -		     PWR_MPUCR_CSSF | PWR_MPUCR_CSTDBYDIS | PWR_MPUCR_PDDS);
> +		     PWR_MPUCR_CSSF | PWR_MPUCR_CSTDBYDIS);
>  
>  	saved_mcudivr = readl(STM32_RCC_BASE + RCC_MCUDIVR);
>  	saved_pll3cr = readl(STM32_RCC_BASE + RCC_PLL3CR);


Applied on stm32-master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

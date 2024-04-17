Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E327F8A7D07
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Apr 2024 09:26:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C216C6B444;
	Wed, 17 Apr 2024 07:26:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BFA5C69067
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 07:26:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43GJGONk021303; Wed, 17 Apr 2024 09:26:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=IQDznTMBE3s9mgOGUqjS4bbJXnzz5DDpHbeFBqdRilk=; b=aI
 beWQBooyIlHpgXgb7sSEp+aH57BMVInYn2UETUoWeeyqn/eFwmCLy71QeFlEBZ1X
 YzKcl3fNbCqMgOGmob3d327XvuvAiS/RcNkBQgJHDsA1i5RfwebPJda+w8MBPz3k
 p7LRaG/w/9AUS2FHeqa4qWQ9Mg9AIHFzK3rQCCT4P2Hvw5f4bpWkHgennSHr1qim
 RcX8bQlEdfLJkk7TEiv0SIayPOfeNbI1IDIGtampOdOOknP+X2zXgGxhCDqMeaPS
 dW+WsMvLkg3toRmLLC6P8tgdVRRsmVGrDuqn/uHzrVOf6eLKYOE3+49GueNvMuMK
 qkHJPR8ySJ47l2k5yxtA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xff64g618-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Apr 2024 09:26:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F1E314002D;
 Wed, 17 Apr 2024 09:26:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 68AE820E03E;
 Wed, 17 Apr 2024 09:25:56 +0200 (CEST)
Received: from [10.48.86.112] (10.48.86.112) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 17 Apr
 2024 09:25:55 +0200
Message-ID: <3512e31e-37db-4e03-b133-1914e29fa7ad@foss.st.com>
Date: Wed, 17 Apr 2024 09:25:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20240308101230.2595220-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20240308101230.2595220-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.86.112]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_06,2024-04-16_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: Reserve OPTEE area in EFI memory
	map
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

Hi,

On 3/8/24 11:12, Patrice Chotard wrote:
> Since commit 7b78d6438a2b3 ("efi_loader: Reserve unaccessible memory")
> memory region above ram_top is tagged in EFI memory map as
> EFI_BOOT_SERVICES_DATA.
> In case of STM32MP1 platform, above ram_top, there is one reserved-memory
> region tagged "no-map" dedicated to OP-TEE (addr=de000000 size=2000000).
>
> Before booting kernel, EFI memory map is first built, the OPTEE region is
> tagged as EFI_BOOT_SERVICES_DATA and when reserving LMB, the tag LMB_NONE
> is used.
>
> Then after, the LMB are completed by boot_fdt_add_mem_rsv_regions()
> which try to add again the same OPTEE region (addr=de000000 size=2000000)
> but now with LMB_NOMAP tag which produces the following error message :
>
> "ERROR: reserving fdt memory region failed (addr=de000000 size=2000000 flags=4)"
>
> To avoid this, OPTEE area shouldn't be used by EFI, so we need to mark
> it as reserved.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   arch/arm/mach-stm32mp/dram_init.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/mach-stm32mp/dram_init.c b/arch/arm/mach-stm32mp/dram_init.c
> index fb1208fc5d5..f67f54f2ae0 100644
> --- a/arch/arm/mach-stm32mp/dram_init.c
> +++ b/arch/arm/mach-stm32mp/dram_init.c
> @@ -7,6 +7,7 @@
>   
>   #include <common.h>
>   #include <dm.h>
> +#include <efi_loader.h>
>   #include <image.h>
>   #include <init.h>
>   #include <lmb.h>
> @@ -75,3 +76,14 @@ phys_addr_t board_get_usable_ram_top(phys_size_t total_size)
>   
>   	return reg + size;
>   }
> +
> +void efi_add_known_memory(void)
> +{
> +	if (IS_ENABLED(CONFIG_EFI_LOADER))
> +		/*
> +		 * Memory over ram_top is reserved to OPTEE.
> +		 * Declare to EFI only memory area below ram_top
> +		 */
> +		efi_add_memory_map(gd->ram_base, gd->ram_top - gd->ram_base,
> +				   EFI_CONVENTIONAL_MEMORY);
> +}



Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8659086A6
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jun 2024 10:44:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07D80C6C83A;
	Fri, 14 Jun 2024 08:44:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8F40C69067
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 08:44:07 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E8357k015140;
 Fri, 14 Jun 2024 10:44:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 k4vI0hpV5j8D36ArvxLuBRk6R1jNCnB/SqbfjwuccGg=; b=ry93HFlqjssw57EY
 oCzPVKa2MuDp2GBoli+o0WOzKILdfSj8ikQq1ywPk1KkPEjKvkNS15+Lttr/zbNx
 8KEzVs78HefAy4bg+xkLYcg0FtvClkv7PV+yekC+TQLWNsaP3dBXjMe+/BwL0JQr
 6v9w6+AM99jqbFnBvFpdzXf6vgAlEhhjDjBF/HvzL6saQXTYpCIj7jsQ0Va65v/1
 IEojv2vVDm1UGa6H/tPTMg+UlUeQws/KxwaQEcGELOnKI96h0qidqrsUtJNCOjUE
 jSENpMgp7Qz1qxFJ8+o5UzgMHKiaYSoVUy2BkrsDhsH3gINHpi+p7NxhjJOXDKln
 gQmDfA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp4yu20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jun 2024 10:44:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C54BF4002D;
 Fri, 14 Jun 2024 10:44:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4185520F2AE;
 Fri, 14 Jun 2024 10:43:44 +0200 (CEST)
Received: from [10.48.87.205] (10.48.87.205) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 14 Jun
 2024 10:43:43 +0200
Message-ID: <2db8ee3c-6734-415f-b06c-e4a9a41ec291@foss.st.com>
Date: Fri, 14 Jun 2024 10:43:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20240422150645.1613198-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20240422150645.1613198-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.205]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v2] stm32mp: Reserve OPTEE area in EFI
	memory map
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

On 4/22/24 17:06, Patrice Chotard wrote:
> Since commit 7b78d6438a2b3 ("efi_loader: Reserve unaccessible memory")
> memory region above ram_top is tagged in EFI memory map as
> EFI_BOOT_SERVICES_DATA.
> In case of STM32MP1/STM32MP13 platforms, above ram_top, there is one
> reserved-memory region tagged "no-map" dedicated to OP-TEE :
>   _ addr=de000000 size=2000000 for stm32mp157x-dkx and stm32mp135f-dk
>   _ addr=fe000000 size=2000000 for stm32mp157c-ev1
>
> Before booting kernel, EFI memory map is first built, the OPTEE region is
> tagged as EFI_BOOT_SERVICES_DATA and when reserving LMB, the tag LMB_NONE
> is used.
>
> Then after, the LMB are completed by boot_fdt_add_mem_rsv_regions()
> which try to add again the same OPTEE region (addr=de000000 size=2000000
> in case of stm32mp157x-dkx / stm32mp135f-dk or addr=fe000000 size=2000000
> in case for stm2mp157c-ev1)
> but now with LMB_NOMAP tag which produces the following error message :
>
>   _ for stm32mp157x-dkx / stm32mp135f-dk :
>    "ERROR: reserving fdt memory region failed (addr=de000000 size=2000000 flags=4)"
>
>   _ for stm32mp157c-ev1 :
>    "ERROR: reserving fdt memory region failed (addr=fe000000 size=2000000 flags=4)"
>
> To avoid this, OPTEE area shouldn't be used by EFI, so we need to mark
> it as reserved.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>
> ---
>
> Changes in v2:
>   _ update commit message by adding information about memory area
>     dedicated for OPTEE for various STM32MP1/STM32MP13 boards.
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

It seen like a temporary workaround after commit 7b78d6438a2b3
("efi_loader: Reserve unaccessible memory") to avoid warnings.

And it is working because in the default memory mapping
OP-TEE base address == RAM_TOP and the rest of memory is
used by OP-TEE tagged "no map" (protected by firewall)


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

FYI: workaround because  the memory above ram_top is
      "already occupied by firmware" =
      and it is OP-TEE for STM32MP2 platform.

     For me the LMB type used by EFI in not correct for OP-TEE usage region
     with "no-map" tag in device tree=  see boot_fdt_add_mem_rsv_regions()
     for linux DT parsing

     and we have no way to indicated this LMB tag= LMB_NOMAP with EFI stack
     (with enum efi_memory_type ?)


     EFI_BOOT_SERVICES_DATA => doesn't means NOMAP flag for LMB....
     so something is missing in EFI side like EFI_BOOT_NOMAP  to be used in board
     implementation of efi_add_known_memory() ?


Thanks
Patrick





_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

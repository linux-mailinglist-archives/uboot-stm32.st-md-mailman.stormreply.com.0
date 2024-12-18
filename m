Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C69D99F614F
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2024 10:21:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8288FC7129D;
	Wed, 18 Dec 2024 09:21:33 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1544C5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 09:21:26 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI71cXF021836;
 Wed, 18 Dec 2024 10:21:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 DVzSC9W+rAUScTfo0GfX+wcRAVQCBKiCB1DsWH9p6kM=; b=CtX3zJT7gBnVv6H1
 Y6TFuhXgPhlPXFf2nGBCUP1DdE0LzzP8gO7B78TxFCmqRxhJA3rHGS8QV+/zXT1n
 e1r8Yo2H07B3sn3Uu7SZkb4r64VP6jQgCGCz8BAOI389uuX7kIm7uMp9NKC3iz/x
 WCT91tblWlM/D1LuIYKrv3NhB5QqXo5uD5ah+xov0xFhxF3UD5blI+lXKdtsDszA
 IUO43Rtja5JpcOwQDgF05oMd6z9enpnxVrDfFS/9qSyc9hznG1Kzgqi0+WhC9Bzv
 MRw3pcV1WYSfzaXd9uyDdyMP0pCuRnm14hmoFk2vgGkVF7ojEcXOUIE4yftRxHGI
 CtG/jw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43kfu8a7m7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 10:21:23 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3321440054;
 Wed, 18 Dec 2024 10:20:24 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D841225405C;
 Wed, 18 Dec 2024 10:20:01 +0100 (CET)
Received: from [10.48.86.243] (10.48.86.243) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 10:20:01 +0100
Message-ID: <d396fce3-bfb5-4092-8321-9c7dc48fdc65@foss.st.com>
Date: Wed, 18 Dec 2024 10:20:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20241213132655.670837-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20241213132655.670837-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Igor Opaniuk <igor.opaniuk@foundries.io>,
 Sughosh Ganu <sughosh.ganu@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32mp: Fix dram_bank_mmu_setup()
 for LMB located above ram_top
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

On 12/13/24 14:26, Patrice Chotard wrote:
> Previously, all LMB marked with LMB_NOMAP (above and below ram_top)
> are considered as invalid entry in TLB.
>
> Since commit 1a48b0be93d4 ("lmb: prohibit allocations above ram_top
>   even from same bank") all LMB located above ram_top are now marked
> LMB_NOOVERWRITE and no more LMB_MAP.
>
> This area above ram_top is reserved for OPTEE and must not be cacheable,


minor: OP-TEE


> otherwise this leads to a Panic on some boards (Issue on STM32MP135F-DK).
>
> Restore previous behavior by marking invalid entry all TLB above ram_top.
>
> Fixes: 1a48b0be93d4 ("lmb: prohibit allocations above ram_top even from same bank")
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> cc: Sughosh Ganu <sughosh.ganu@linaro.org>
> ---
>
>   arch/arm/mach-stm32mp/stm32mp1/cpu.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-stm32mp/stm32mp1/cpu.c b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
> index 62cc98910a7..cb1b84c9af9 100644
> --- a/arch/arm/mach-stm32mp/stm32mp1/cpu.c
> +++ b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
> @@ -53,6 +53,7 @@ void dram_bank_mmu_setup(int bank)
>   	struct bd_info *bd = gd->bd;
>   	int	i;
>   	phys_addr_t start;
> +	phys_addr_t addr;
>   	phys_size_t size;
>   	bool use_lmb = false;
>   	enum dcache_option option;
> @@ -77,8 +78,12 @@ void dram_bank_mmu_setup(int bank)
>   	for (i = start >> MMU_SECTION_SHIFT;
>   	     i < (start >> MMU_SECTION_SHIFT) + (size >> MMU_SECTION_SHIFT);
>   	     i++) {
> +		addr = i << MMU_SECTION_SHIFT;
>   		option = DCACHE_DEFAULT_OPTION;
> -		if (use_lmb && lmb_is_reserved_flags(i << MMU_SECTION_SHIFT, LMB_NOMAP))
> +		if (use_lmb &&
> +		    (lmb_is_reserved_flags(i << MMU_SECTION_SHIFT, LMB_NOMAP) ||
> +		    addr >= gd->ram_top)
> +		   )
>   			option = 0; /* INVALID ENTRY in TLB */
>   		set_section_dcache(i, option);
>   	}


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

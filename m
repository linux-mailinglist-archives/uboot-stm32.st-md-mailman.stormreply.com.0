Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 610EE3ECF53
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Aug 2021 09:26:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A376C57B60;
	Mon, 16 Aug 2021 07:26:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA226C57B5F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Aug 2021 07:26:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17G77vAx022255; Mon, 16 Aug 2021 09:26:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=+hE8OoO5r6AUM2BFEJw/vd+Uqd3oR5JwmJxOSnW17K8=;
 b=eOcVdY1EO5LFUgO6UJx+9F+yA+K4hwlqLZ3kg8M23KcNuopfZIG8i+u4eMe4095Z9Mxk
 p+70RBxRqlP5YAe86tjklHHzAGp1fZEnUYMUdTD8dIsYtGBijEYHUwzZ2ZhMnbCXtsye
 khySSaMkK7yiiys5ATTlfDYX2jA2229P484z0P6uqaCCg4IN/jt7gdWLtMu+BCWt58r3
 5J6D6kyGXlgGKlfVVQlqThcaxw4juI4K5NanPxDvZieC7Hyqwn9Fn3FwoHbKgXgfeAIZ
 VkZNSaLhLy0hvKSTCGaZyxusXr0GBuLLkOoMgfljHcRTYau9szAM6517mH2s9qVJrpNH tQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3afcd1sv99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 09:26:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2A7A410002A;
 Mon, 16 Aug 2021 09:26:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E5D3E21CA9D;
 Mon, 16 Aug 2021 09:26:30 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Aug
 2021 09:26:30 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210726115518.1.I199b974cdcfac6b770c164eef50f53ea8ad02bc5@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <70dc2611-5591-f2ba-043b-00b49e65e8e3@foss.st.com>
Date: Mon, 16 Aug 2021 09:26:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726115518.1.I199b974cdcfac6b770c164eef50f53ea8ad02bc5@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-16_02:2021-08-13,
 2021-08-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Alexander Graf <agraf@csgraf.de>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: correctly handle
	board_get_usable_ram_top(0)
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

On 7/26/21 11:55 AM, Patrick Delaunay wrote:
> The function board_get_usable_ram_top can to called after relocation
> with total_size = 0 to get the uppermost pointer that is valid to access
> in U-Boot.
> 
> When total_size = 0, the reserved memory should be not take in account
> with lmb library and 'gd->ram_base + gd->ram_size' can be used.
> 
> It is the case today in lib/efi_loader/efi_memory.c:efi_add_known_memory()
> and this patch avoids that the reserved memory for OP-TEE is not part of
> the EFI available memory regions.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> Patch to correct the UEFI support for STM32MP platform
> after Heinrich's remark on patch [1].
> 
> [1] efi_loader: replace board_get_usable_ram_top by gd->ram_top
> http://patchwork.ozlabs.org/project/uboot/patch/20210709124630.1.I212e7cd96724368b8272300c59c2a1c1f227ed67@changeid/
> 
>  arch/arm/mach-stm32mp/dram_init.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/mach-stm32mp/dram_init.c b/arch/arm/mach-stm32mp/dram_init.c
> index 3c097029bd..94f25f34e0 100644
> --- a/arch/arm/mach-stm32mp/dram_init.c
> +++ b/arch/arm/mach-stm32mp/dram_init.c
> @@ -46,6 +46,9 @@ ulong board_get_usable_ram_top(ulong total_size)
>  	phys_addr_t reg;
>  	struct lmb lmb;
>  
> +	if (!total_size)
> +		return gd->ram_base + gd->ram_size;
> +
>  	/* found enough not-reserved memory to relocated U-Boot */
>  	lmb_init(&lmb);
>  	lmb_add(&lmb, gd->ram_base, gd->ram_size);
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

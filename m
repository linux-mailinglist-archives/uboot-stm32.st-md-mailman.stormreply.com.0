Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9782A9624E
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Apr 2025 10:45:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80144C78F68;
	Tue, 22 Apr 2025 08:45:06 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3325BC78F67
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 08:45:05 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7UnYL021300;
 Tue, 22 Apr 2025 10:45:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 AE93WKJQF5hS31NMGl4GgmCEJGTfv7msG+sxIeMAacM=; b=fNL+vx4fLFqKNCZ+
 Ga9KeICbzes8Kdohgxq70iFYJsJYYGbX3nUpH1xNjExfZkIsUgqqKUZeIKRaYbZL
 K15I5tNkHv3oAoM8XLhzpZXQH7caNv2w76h4/2HoFMhiAhvfwRRL8bGZy0evp7f9
 5+dXlQ6reGMgSr/lC6C3uIZQWorglwj99zVoUUYL6/xQUlRbBOmIO4Px+5qYEqG0
 zKP47I/am6cbJNATwYe98aupagqIkXfFOh8Yl7t37EtaOrgVzWzm5F/PnTOg673y
 swtHUVHqVozh7w1Dv2B6qYKcyBvc6VCUA5loeusTi8AgpBkDNMdDWPQXn1bNpCdP
 GmQUEA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 464psp6rnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Apr 2025 10:45:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 22D3440053;
 Tue, 22 Apr 2025 10:44:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C30D9D995F;
 Tue, 22 Apr 2025 10:44:07 +0200 (CEST)
Received: from [10.48.87.126] (10.48.87.126) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 10:44:07 +0200
Message-ID: <d762c10f-e977-4972-88cd-a244502190bd@foss.st.com>
Date: Tue, 22 Apr 2025 10:44:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20250401131413.387139-1-patrice.chotard@foss.st.com>
 <20250401131413.387139-14-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250401131413.387139-14-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.126]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 13/13] ARM: stm32mp: add RIFSC system bus
 driver for STM32MP25
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

On 4/1/25 15:14, Patrice Chotard wrote:
> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
>
> This driver is checking the access rights of the different
> peripherals connected to the RIFSC bus. If access is denied,
> the associated device is not binded.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>
> ---
>
>   arch/arm/mach-stm32mp/include/mach/rif.h |  26 ++
>   arch/arm/mach-stm32mp/stm32mp2/Makefile  |   1 +
>   arch/arm/mach-stm32mp/stm32mp2/rifsc.c   | 364 +++++++++++++++++++++++
>   3 files changed, 391 insertions(+)
>   create mode 100644 arch/arm/mach-stm32mp/include/mach/rif.h
>   create mode 100644 arch/arm/mach-stm32mp/stm32mp2/rifsc.c
>
> diff --git a/arch/arm/mach-stm32mp/include/mach/rif.h b/arch/arm/mach-stm32mp/include/mach/rif.h
> new file mode 100644
> index 00000000000..10b22108120
> --- /dev/null
> +++ b/arch/arm/mach-stm32mp/include/mach/rif.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause */
> +/*
> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
> + */
> +
> +#ifndef MACH_RIF_H
> +#define MACH_RIF_H
> +
> +#include <linux/types.h>
> +
> +/**
> + * stm32_rifsc_check_access - Check RIF accesses for given device node
> + *
> + * @device_node		Node of the device for which the accesses are checked
> + */
> +int stm32_rifsc_check_access(ofnode device_node);
> +
> +/**
> + * stm32_rifsc_check_access - Check RIF accesses for given id
> + *
> + * @device_node		Node of the device to get a reference on RIFSC
> + * @id			ID of the resource to check
> + */
> +int stm32_rifsc_check_access_by_id(ofnode device_node, u32 id);
> +
> +#endif /* MACH_RIF_H*/
> diff --git a/arch/arm/mach-stm32mp/stm32mp2/Makefile b/arch/arm/mach-stm32mp/stm32mp2/Makefile
> index b579ce5a800..5dbf75daa76 100644
> --- a/arch/arm/mach-stm32mp/stm32mp2/Makefile
> +++ b/arch/arm/mach-stm32mp/stm32mp2/Makefile
> @@ -5,5 +5,6 @@
>   
>   obj-y += cpu.o
>   obj-y += arm64-mmu.o
> +obj-y += rifsc.o
>   obj-$(CONFIG_OF_SYSTEM_SETUP) += fdt.o
>   obj-$(CONFIG_STM32MP25X) += stm32mp25x.o
> diff --git a/arch/arm/mach-stm32mp/stm32mp2/rifsc.c b/arch/arm/mach-stm32mp/stm32mp2/rifsc.c
> new file mode 100644
> index 00000000000..48f65365376
> --- /dev/null
> +++ b/arch/arm/mach-stm32mp/stm32mp2/rifsc.c
> @@ -0,0 +1,364 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
> +/*
> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
> + */
> +
> +#define LOG_CATEGORY UCLASS_SIMPLE_BUS
> +


minor:

#define LOG_CATEGORY UCLASS_NOP


to be coherent with driver

....

> +
> +U_BOOT_DRIVER(stm32_rifsc) = {
> +	.name = "stm32_rifsc",
> +	.id = UCLASS_NOP,
> +	.of_match = stm32_rifsc_ids,
> +	.bind = stm32_rifsc_bind,
> +	.remove = stm32_rifsc_remove,
> +	.child_post_bind = stm32_rifsc_child_post_bind,
> +	.child_pre_probe = stm32_rifsc_child_pre_probe,
> +	.child_post_remove = stm32_rifsc_child_post_remove,
> +	.plat_auto = sizeof(struct stm32_rifsc_plat),
> +	.per_child_plat_auto = sizeof(struct stm32_rifsc_child_plat),
> +	.flags = DM_FLAG_OS_PREPARE,
> +};


Anyway


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

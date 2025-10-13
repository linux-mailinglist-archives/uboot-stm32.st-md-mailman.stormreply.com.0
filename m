Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C04AFBD5A8D
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Oct 2025 20:11:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16D5FC32EB0;
	Mon, 13 Oct 2025 18:11:54 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C095C349C5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Oct 2025 18:11:52 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59DIBYXw1401820;
 Mon, 13 Oct 2025 13:11:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1760379094;
 bh=Jvf6UcX2kV9lNR7zMCYsv2INRwGvHCaVIWefhAOeSOo=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=bl16bhbUPvOhaDC8NDM54/uNZ7SC+PtzRDP5j42QGkbH8kpGIq6zVNnun3MOhQoQ7
 jqwli2YKsUo0lHr5gtyqLI3zcGA1EWwvzcX8R4gFOYOoRNi89up5ZNXBFaaHsxrPzE
 sHBb4lVoRrekf9p+SLLcndBTdWpwVmQEi5K/W9ko=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59DIBXhQ3362273
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 13 Oct 2025 13:11:33 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 13
 Oct 2025 13:11:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Oct 2025 13:11:33 -0500
Received: from [10.250.148.111] ([10.250.148.111])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59DIBQrR2487479;
 Mon, 13 Oct 2025 13:11:27 -0500
Message-ID: <eac85809-2d75-434b-a107-3bbcf1807710@ti.com>
Date: Mon, 13 Oct 2025 23:41:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, <u-boot@lists.denx.de>,
 <uboot-stm32@st-md-mailman.stormreply.com>, "NXP i.MX U-Boot Team"
 <uboot-imx@nxp.com>, Fabio Estevam <festevam@gmail.com>, Stefano Babic
 <sbabic@nabladev.com>
References: <20251013-imx-rproc-v1-0-fb43a3fafcd0@nxp.com>
 <20251013-imx-rproc-v1-1-fb43a3fafcd0@nxp.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20251013-imx-rproc-v1-1-fb43a3fafcd0@nxp.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, u-kumar1@ti.com,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Andrew Davis <afd@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Ryan Eatmon <reatmon@ti.com>,
 Hari Nagalla <hnagalla@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 01/11] lib: Import iomem_copy from Linux
	Kernel
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


On 10/13/2025 8:19 AM, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> memcpy_{from,to}io and memset_io is needed for i.MX8M to write
> TCM area. So import the APIs from Linux Kernel 6.17.
>
> Reviewed-by: Ye Li <ye.li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   include/asm-generic/io.h |  37 +++++++++++++
>   lib/Makefile             |   1 +
>   lib/iomem_copy.c         | 136 +++++++++++++++++++++++++++++++++++++++++++++++

>   3 files changed, 174 insertions(+)
>
> diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
> index 13d99cfb5973399209c00adee0080ff83414c064..cf981ad3501f935c714b7580536540e7aba249c1 100644
> --- a/include/asm-generic/io.h
> +++ b/include/asm-generic/io.h
> @@ -3,6 +3,7 @@
>    * Generic I/O functions.
>    *
>    * Copyright (c) 2016 Imagination Technologies Ltd.
> + * Copyright 2025 NXP
>    */
>   
>   #ifndef __ASM_GENERIC_IO_H__
> @@ -453,5 +454,41 @@ static inline void iowrite64_rep(volatile void __iomem *addr,
>   #endif
>   #endif /* CONFIG_64BIT */
>   
> +#ifndef memset_io

If you are on arm, then

arch/arm/include/asm/io.h defines these io functions, for ARM64 and 
non-ARM64 platform,

In your SOC, how this works.

> +/**
> + * memset_io -	Set a range of I/O memory to a constant value
> + * @addr:	The beginning of the I/O-memory range to set
> + * @val:	The value to set the memory to
> + * @count:	The number of bytes to set
> + *
> + * Set a range of I/O memory to a given value.
> + */
> +void memset_io(volatile void __iomem *addr, int val, size_t count);
> +#endif
> +
> +#ifndef memcpy_fromio
> +/**
> [..]

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

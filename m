Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 568EE90857A
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jun 2024 09:59:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07422C6C83A;
	Fri, 14 Jun 2024 07:59:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 828A3C5E2CD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 07:59:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E6Oor2009961;
 Fri, 14 Jun 2024 09:59:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 YQ/uUrXQBve46JteH0jzmikeqPEA5+TgmM4smkDpFkI=; b=zcdy9fP9mnhFH9SP
 29kN87MD0of4i9hLAzUrqbToGivJGLA2hQPeJC1zGnUZzixZOZ9sbaxWNqdMAA66
 9Yy4HOyzR3gVwJy7BuG69efkJ79+o5YD4z/8TDVOGPgTraXdbyOAX1tV6jaaDoI1
 CK+SCf8yNFfHMqlrzslUWncZA7bJQrFC0y0A+uZBOMpmsaO02DEEgGDErBVsIY3z
 oorxjs9QekmX+XnavrqfVxohtkXAf2Je/GMvNObnhFGcVYdahs7sFwk26lF9Jwcj
 FOcqDgEiqp8dCN2gFe9P2/w8wtME4Wx3BNnJfgsdni2xZIHvQNQtl8zeeIpqY/sK
 if5NFQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp4fbfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jun 2024 09:59:23 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 275EB4002D;
 Fri, 14 Jun 2024 09:59:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2ECAE20E1E9;
 Fri, 14 Jun 2024 09:59:05 +0200 (CEST)
Received: from [10.48.87.205] (10.48.87.205) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 14 Jun
 2024 09:59:04 +0200
Message-ID: <a19faecc-1d0a-4369-b51e-428ffaf00451@foss.st.com>
Date: Fri, 14 Jun 2024 09:59:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20240611095239.16026-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20240611095239.16026-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.205]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] stm32mp1: spl: Fix compilation
	warnings
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

Hi Patrice,

On 6/11/24 11:52, Patrice Chotard wrote:
> Fix the following compilation warnings :
>
> ../arch/arm/mach-stm32mp/stm32mp1/spl.c: In function 'stm32_init_tzc_for_optee':
> ../arch/arm/mach-stm32mp/stm32mp1/spl.c:148:37: warning: 'optee_size' may be used uninitialized [-Wmaybe-uninitialized]
>    148 |         tee_shmem_base = optee_base + optee_size - CFG_SHMEM_SIZE;
>        |                          ~~~~~~~~~~~^~~~~~~~~~~~
> ../arch/arm/mach-stm32mp/stm32mp1/spl.c:137:30: note: 'optee_size' was declared here
>    137 |         uint32_t optee_base, optee_size, tee_shmem_base;
>        |                              ^~~~~~~~~~
> ../arch/arm/mach-stm32mp/stm32mp1/spl.c:148:37: warning: 'optee_base' may be used
> uninitialized [-Wmaybe-uninitialized]
>    148 |         tee_shmem_base = optee_base + optee_size - CFG_SHMEM_SIZE;
>        |                          ~~~~~~~~~~~^~~~~~~~~~~~
> ../arch/arm/mach-stm32mp/stm32mp1/spl.c:137:18: note: 'optee_base' was declared here
>    137 |         uint32_t optee_base, optee_size, tee_shmem_base;
>        |                  ^~~~~~~~~~
>
> Fix also the following checkpatch "check" :
>
> CHECK: Prefer kernel type 'u32' over 'uint32_t'
> 37: FILE: arch/arm/mach-stm32mp/stm32mp1/spl.c:137:
> +	uint32_t optee_base = 0, optee_size = 0, tee_shmem_base;
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   arch/arm/mach-stm32mp/stm32mp1/spl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-stm32mp/stm32mp1/spl.c b/arch/arm/mach-stm32mp/stm32mp1/spl.c
> index 6c79259b2c8..10abbed87f0 100644
> --- a/arch/arm/mach-stm32mp/stm32mp1/spl.c
> +++ b/arch/arm/mach-stm32mp/stm32mp1/spl.c
> @@ -134,7 +134,7 @@ void stm32_init_tzc_for_optee(void)
>   {
>   	const uint32_t dram_size = stm32mp_get_dram_size();
>   	const uintptr_t dram_top = STM32_DDR_BASE + (dram_size - 1);
> -	uint32_t optee_base, optee_size, tee_shmem_base;
> +	u32 optee_base = 0, optee_size = 0, tee_shmem_base;
>   	const uintptr_t tzc = STM32_TZC_BASE;
>   	int ret;
>   

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

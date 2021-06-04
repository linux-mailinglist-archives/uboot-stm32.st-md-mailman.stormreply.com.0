Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 278B639BE16
	for <lists+uboot-stm32@lfdr.de>; Fri,  4 Jun 2021 19:08:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC08EC57B69;
	Fri,  4 Jun 2021 17:08:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2681C57B55
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jun 2021 17:08:11 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 154H7ODO016654; Fri, 4 Jun 2021 19:08:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=kBOZi0IsS1iBo7L6Z6QTV+qHeA1FKr4qkWurD3dOsgw=;
 b=l+yT/7GuhUZgYCmQtUADtnrgE0Q5rFiXB35//Po+aayeOr167luHmrqz7qyjGcQBhYZ/
 v0y5y9Uthr4PKNbqiSFO9D2FJ9463fAh1B4vuqVb3P1yD2rodwWqhzEueMd5cekr9aVh
 rmP2GxMYkQHyicDpCImSHQhXI6iToz6J5rGqqxHV9uznpx+GXis0uLsdvyegheGtyarS
 iSQDRFIMy6MVkdqkqRd7gMdzmRUyE1g67SNyq1WNAnJt0XLZLKyNg/vmJQJ4d/dGOkUR
 LcgqX/RzKruXC3pZmoWTU0up/uIbAqZ81V6k4ESfKMGikEimDiRKBkEmJWodvSvyhbGD Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38yea1kn8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 19:08:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7184510002A;
 Fri,  4 Jun 2021 19:07:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C6BE25D006;
 Fri,  4 Jun 2021 19:07:58 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Jun
 2021 19:07:57 +0200
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20210226124451.3799-1-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <300ce75e-d59d-8270-f869-c7fa62e3b8cc@foss.st.com>
Date: Fri, 4 Jun 2021 19:07:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210226124451.3799-1-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-04_11:2021-06-04,
 2021-06-04 signatures=0
Cc: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Simon Glass <sjg@chromium.org>, Suneel Garapati <sgarapati@marvell.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 mark.kettenis@xs4all.nl
Subject: Re: [Uboot-stm32] [PATCH] arm64: Update memcpy_{from,
	to}io() helpers
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

On 2/26/21 1:44 PM, Patrice Chotard wrote:
> At early U-Boot stage, before relocation, MMU is not yet configured
> and disabled. DDR may not be configured with the correct memory
> attributes (can be configured in MT_DEVICE instead of MT_MEMORY).
>
> In this case, usage of memcpy_{from, to}io() may leads to synchronous
> abort in AARCH64 in case the normal memory address is not 64Bits aligned.
>
> To avoid such situation, forbid usage of normal memory cast to (u64 *) in
> case MMU is not enabled.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: mark.kettenis@xs4all.nl
> ---
>
>   arch/arm/cpu/armv8/cache_v8.c | 10 ++++++++++
>   arch/arm/include/asm/io.h     | 25 +++++++++++++++----------
>   include/cpu_func.h            |  1 +
>   3 files changed, 26 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/cpu/armv8/cache_v8.c b/arch/arm/cpu/armv8/cache_v8.c
> index 15cecb5e0b..3de18c7675 100644
> --- a/arch/arm/cpu/armv8/cache_v8.c
> +++ b/arch/arm/cpu/armv8/cache_v8.c
> @@ -719,6 +719,11 @@ int icache_status(void)
>   	return (get_sctlr() & CR_I) != 0;
>   }
>   
> +int mmu_status(void)
> +{
> +	return (get_sctlr() & CR_M) != 0;
> +}
> +
>   void invalidate_icache_all(void)
>   {
>   	__asm_invalidate_icache_all();
> @@ -740,6 +745,11 @@ int icache_status(void)
>   	return 0;
>   }
>   
> +int mmu_status(void)
> +{
> +	return 0;
> +}
> +
>   void invalidate_icache_all(void)
>   {
>   }
> diff --git a/arch/arm/include/asm/io.h b/arch/arm/include/asm/io.h
> index df264a170b..36b840378a 100644
> --- a/arch/arm/include/asm/io.h
> +++ b/arch/arm/include/asm/io.h
> @@ -338,6 +338,7 @@ extern void __readwrite_bug(const char *fn);
>   
>   /* Optimized copy functions to read from/write to IO sapce */
>   #ifdef CONFIG_ARM64
> +#include <cpu_func.h>
>   /*
>    * Copy data from IO memory space to "real" memory space.
>    */
> @@ -351,11 +352,13 @@ void __memcpy_fromio(void *to, const volatile void __iomem *from, size_t count)
>   		count--;
>   	}
>   
> -	while (count >= 8) {
> -		*(u64 *)to = __raw_readq(from);
> -		from += 8;
> -		to += 8;
> -		count -= 8;
> +	if (mmu_status()) {
> +		while (count >= 8) {
> +			*(u64 *)to = __raw_readq(from);
> +			from += 8;
> +			to += 8;
> +			count -= 8;
> +		}
>   	}
>   
>   	while (count) {
> @@ -379,11 +382,13 @@ void __memcpy_toio(volatile void __iomem *to, const void *from, size_t count)
>   		count--;
>   	}
>   
> -	while (count >= 8) {
> -		__raw_writeq(*(u64 *)from, to);
> -		from += 8;
> -		to += 8;
> -		count -= 8;
> +	if (mmu_status()) {
> +		while (count >= 8) {
> +			__raw_writeq(*(u64 *)from, to);
> +			from += 8;
> +			to += 8;
> +			count -= 8;
> +		}
>   	}
>   
>   	while (count) {
> diff --git a/include/cpu_func.h b/include/cpu_func.h
> index 8aa825daa4..a8806dd295 100644
> --- a/include/cpu_func.h
> +++ b/include/cpu_func.h
> @@ -59,6 +59,7 @@ int dcache_status(void);
>   void dcache_enable(void);
>   void dcache_disable(void);
>   void mmu_disable(void);
> +int mmu_status(void);
>   
>   /* arch/$(ARCH)/lib/cache.c */
>   void enable_caches(void);


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

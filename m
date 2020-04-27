Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBA81B983D
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Apr 2020 09:20:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14487C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Apr 2020 07:20:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17B77C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2020 07:20:15 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03R7IU3f018094; Mon, 27 Apr 2020 09:20:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=G7oAwVZhpoCINPX6t8x7QFhFFUHIvwu535DDSPiZlW0=;
 b=vnyU4U8842FXwPgj3d8a2TMGixsiN7Prs8pNh53iNPAibqfhyARygqMDg9v8gcbwsRWr
 zzUgaAIlla2xFsiP1CXTDjfQ87i51n2epIVWRCuHRnopQguBFQKle+JIgTLluXSI3k5Y
 sUqI9EombKUe0IJ4sDkhWUeMPgvKsyfnFYtg9lON0ElAZm3RDeyeTXNDZS4X9x0kqJWq
 u4FanyqoNxlRYNaZlesmyXkDsGUH0i1XM7r7USsDXZsxN6Bgtnhz5TmQcMIZEgU0WkO7
 R3rZZ9PTLOl0zr3no9qJp/RigWCyS5A6qSwy4PYn+9118elR0s+0hD5Njk0DRVJia+IR FA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhcbr5a2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 09:20:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BA9A810002A;
 Mon, 27 Apr 2020 09:20:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF8D7220F5D;
 Mon, 27 Apr 2020 09:20:09 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Apr
 2020 09:20:09 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 27 Apr 2020 09:20:09 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v3 2/2] arm: stm32mp: activate data cache on DDR in SPL
Thread-Index: AQHWGmWQ1pEaQGf1m0yqHwa/HVXIeKiMcj0A
Date: Mon, 27 Apr 2020 07:20:09 +0000
Message-ID: <22c93656-68ad-ebdc-6d6d-aba44d7316da@st.com>
References: <20200424182413.12685-1-patrick.delaunay@st.com>
 <20200424202335.v3.2.Ib571c64a8c50fcbe386e728e38bbd320427e4efb@changeid>
In-Reply-To: <20200424202335.v3.2.Ib571c64a8c50fcbe386e728e38bbd320427e4efb@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <3DD20CECDEB6AA45A7363037112702A8@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_03:2020-04-24,
 2020-04-27 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v3 2/2] arm: stm32mp: activate data cache
	on DDR in SPL
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

Hi

One typo below

On 4/24/20 8:24 PM, Patrick Delaunay wrote:
> Activate cache on DDR to improves the accesses to DDR used by SPL:
s/improves/improve
> - CONFIG_SPL_BSS_START_ADDR
> - CONFIG_SYS_SPL_MALLOC_START
>
> Cache is configured only when DDR is fully initialized,
> to avoid speculative access and issue in get_ram_size().
> Data cache is deactivated at the end of SPL, to flush the data cache
> and the TLB.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v3:
> - remove debug message "bye"
>
> Changes in v2:
> - new
>
>  arch/arm/mach-stm32mp/spl.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
> index f85391c6af..e50a21c3b7 100644
> --- a/arch/arm/mach-stm32mp/spl.c
> +++ b/arch/arm/mach-stm32mp/spl.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <common.h>
> +#include <cpu_func.h>
>  #include <dm.h>
>  #include <hang.h>
>  #include <spl.h>
> @@ -115,4 +116,22 @@ void board_init_f(ulong dummy)
>  		printf("DRAM init failed: %d\n", ret);
>  		hang();
>  	}
> +
> +	/*
> +	 * activate cache on DDR only when DDR is fully initialized
> +	 * to avoid speculative access and issue in get_ram_size()
> +	 */
> +	if (!CONFIG_IS_ENABLED(SYS_DCACHE_OFF))
> +		mmu_set_region_dcache_behaviour(STM32_DDR_BASE, STM32_DDR_SIZE,
> +						DCACHE_DEFAULT_OPTION);
> +}
> +
> +void spl_board_prepare_for_boot(void)
> +{
> +	dcache_disable();
> +}
> +
> +void spl_board_prepare_for_boot_linux(void)
> +{
> +	dcache_disable();
>  }

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

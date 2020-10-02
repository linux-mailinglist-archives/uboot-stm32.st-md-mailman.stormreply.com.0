Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18737281141
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Oct 2020 13:32:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D33A0C424AF;
	Fri,  2 Oct 2020 11:32:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE23EC3FAFF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 11:32:15 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 092BQjcF019749; Fri, 2 Oct 2020 13:32:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=CceMLFs0IpyY2Yu+g9871y9CwOYC/OttDrLitme2DmY=;
 b=UWzRdUIpBtx98XIPAJj+XtdraKWuiQTgqJkWiZIt5PWzoWGtmHkLbFPhVifoqAWdzY2M
 xlouzWanCGLplGyxIYHHiP5VTzoirIwsQVFAdhO+psAJ5IG2af3QybrQIWBhJaKGgBZa
 jS8rHOUmxVj7I4Pqk+5j2Vgk+oSg3hSS1P3JZcdObCGYlUU1CrgCy2CW3wYRNdVJuiBh
 PlcwJdwYb7Fun9Uh6fNlMoVZfRDkIBkpW8e1viEPuD+RMZ2lRmuPqLzJXeihMNLR4Tmy
 ZFJkHNFI8NwYPZ9dt0FltAX113KByDJii4QqnqbI0nqGSWkrQqQsmJ0KIU8SHFnM2HAk Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33sts8bc8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Oct 2020 13:32:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CA6DD10002A;
 Fri,  2 Oct 2020 13:32:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C04B72B8A14;
 Fri,  2 Oct 2020 13:32:14 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 13:32:14 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 2 Oct 2020 13:32:14 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] stm32mp: limit size of cacheable DDR in pre-reloc stage
Thread-Index: AQHWgqnn0U8ilZs6X0CoKrA2gMWosamEOHwA
Date: Fri, 2 Oct 2020 11:32:14 +0000
Message-ID: <e5f2d640-6835-c58c-a534-d6a66ad7072e@st.com>
References: <20200904125517.1.I23889bc9bd065ae7ac2b17faf2436522848e0568@changeid>
In-Reply-To: <20200904125517.1.I23889bc9bd065ae7ac2b17faf2436522848e0568@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <5E6776FFFBFD0744B9FF1980E1ABF88B@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-02_06:2020-10-02,
 2020-10-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: limit size of cacheable DDR in
	pre-reloc stage
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

On 9/4/20 12:55 PM, Patrick Delaunay wrote:
> In pre-reloc stage, U-Boot marks cacheable the DDR limited by
> the new config CONFIG_DDR_CACHEABLE_SIZE.
>
> This patch allows to avoid any speculative access to DDR protected by
> firewall and used by OP-TEE; the "no-map" reserved memory
> node in DT are assumed after this limit:
> STM32_DDR_BASE + DDR_CACHEABLE_SIZE.
>
> Without security, in basic boot, the value is equal to STM32_DDR_SIZE.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/Kconfig | 13 +++++++++++++
>  arch/arm/mach-stm32mp/cpu.c   |  3 ++-
>  arch/arm/mach-stm32mp/spl.c   |  3 ++-
>  3 files changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index 478fd2f17d..f538d7cb83 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -93,6 +93,19 @@ config SYS_TEXT_BASE
>  config NR_DRAM_BANKS
>  	default 1
>  
> +config DDR_CACHEABLE_SIZE
> +	hex "Size of the DDR marked cacheable in pre-reloc stage"
> +	default 0x10000000 if TFABOOT
> +	default 0x40000000
> +	help
> +		Define the size of the DDR marked as cacheable in U-Boot
> +		pre-reloc stage.
> +		This option can be useful to avoid speculatif access
> +		to secured area of DDR used by TF-A or OP-TEE before U-Boot
> +		initialization.
> +		The areas marked "no-map" in device tree should be located
> +		before this limit: STM32_DDR_BASE + DDR_CACHEABLE_SIZE.
> +
>  config SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION_MMC2
>  	hex "Partition on MMC2 to use to load U-Boot from"
>  	depends on SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index b7fcee2b36..dc170dd6fa 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -230,7 +230,8 @@ static void early_enable_caches(void)
>  			round_up(STM32_SYSRAM_SIZE, MMU_SECTION_SIZE),
>  			DCACHE_DEFAULT_OPTION);
>  	else
> -		mmu_set_region_dcache_behaviour(STM32_DDR_BASE, STM32_DDR_SIZE,
> +		mmu_set_region_dcache_behaviour(STM32_DDR_BASE,
> +						CONFIG_DDR_CACHEABLE_SIZE,
>  						DCACHE_DEFAULT_OPTION);
>  }
>  
> diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
> index e84bdad7bf..b679b0a645 100644
> --- a/arch/arm/mach-stm32mp/spl.c
> +++ b/arch/arm/mach-stm32mp/spl.c
> @@ -138,7 +138,8 @@ void board_init_f(ulong dummy)
>  	 * to avoid speculative access and issue in get_ram_size()
>  	 */
>  	if (!CONFIG_IS_ENABLED(SYS_DCACHE_OFF))
> -		mmu_set_region_dcache_behaviour(STM32_DDR_BASE, STM32_DDR_SIZE,
> +		mmu_set_region_dcache_behaviour(STM32_DDR_BASE,
> +						CONFIG_DDR_CACHEABLE_SIZE,
>  						DCACHE_DEFAULT_OPTION);
>  }
>  

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thnaks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

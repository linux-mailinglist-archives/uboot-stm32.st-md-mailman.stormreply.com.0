Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 976B319D1A2
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Apr 2020 10:04:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A4F6C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Apr 2020 08:04:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D26A7C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Apr 2020 08:03:58 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03383HWq025068; Fri, 3 Apr 2020 10:03:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=5W7dtpgQWJnh01IxlD6VjM5yDvcX4XxFSKAQAGv7ZW4=;
 b=U8HCUl8Bp/XZCmnd8UVk6dp4wFU8RSDAl1wXWe82zuoO0+n+cenmrOayXRxJqHev8Oft
 e4JM2b+FG10opTnNeVfL2l2MyB+4RSV6JWSTqpm6SNWgJRv7CJ3Ga4Zgv+Lkuxl1VDfI
 Z+3HaRmkWxe16+h8BP9mGaMs+Tve5Ao73uuKJMnpURouEZ3/LcQpOMeHcKFo4EG1JtTF
 p4MeKDAueweWEEQR9vrbu7yDHRv27J9Wz/bp2f1oOOqsYYUDzaZg4aQpZJrWebyGat8O
 ELyFGrI+GsYI02wQbvmSpkgT+gGdCzJ7qLGCdcXgSyYrpGc70KqFmcQQDTmD3pudGM3T 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 302y54a02d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Apr 2020 10:03:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2D7DD10002A;
 Fri,  3 Apr 2020 10:03:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C131921D6D5;
 Fri,  3 Apr 2020 10:03:48 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 3 Apr
 2020 10:03:48 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 3 Apr 2020 10:03:48 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] arm: stm32mp1: activate data cache in SPL and before
 relocation
Thread-Index: AQHWBmdSO6oWcaW6PEiqwzqWJWVPdKhgxLEAgABF/nD///8WgIADSjGQ
Date: Fri, 3 Apr 2020 08:03:48 +0000
Message-ID: <a933431e01de4a1b9973ad1b5f6d9ddb@SFHDAG6NODE3.st.com>
References: <20200330094610.1.I2ff601b652f4995a3401dc67c2369a4187046ed8@changeid>
 <15a7a5fc-35f0-844a-8bdb-aefcbc001243@denx.de>
 <85b6dd3be8a9460984dd958592a4d476@SFHDAG6NODE3.st.com>
 <2b7f0474-7e8e-0908-1971-3cc688a221ac@denx.de>
In-Reply-To: <2b7f0474-7e8e-0908-1971-3cc688a221ac@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-03_05:2020-04-02,
 2020-04-03 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: stm32mp1: activate data cache in SPL
 and before relocation
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

Hi Marek,

> From: Marek Vasut <marex@denx.de>
> Sent: lundi 30 mars 2020 16:04
> 
> On 3/30/20 3:49 PM, Patrick DELAUNAY wrote:
> > Hi Marek,
> 
> Hi,
> 
> [...]
> 
> >>> -	/* Enable D-cache. I-cache is already enabled in start.S */
> >>> +	/* I-cache is already enabled in start.S */
> >
> > Not needed for arm V7 (I copy this function from other platfrom ... I
> > don't remember which one)
> 
> Maybe this needs to be de-duplicated if it's a copy ?

I don't remember.... 
As I mixed several references

But I found the same content in many arm arch;

arch/arm/mach-imx/mx5/soc.c:67
arch/arm/mach-rockchip/board.c:47
arch/arm/mach-tegra/board.c:271
arch/arm/mach-sunxi/board.c:347
arch/arm/mach-exynos/soc.c:30:
arch/arm/mach-zynq/cpu.c:88:
arch/arm/cpu/armv7/iproc-common/hwinit-common.c:1
arch/arm/mach-u8500/cache.c:14
arch/arm/mach-keystone/init.c:206

And different implementation in 
arch/arm/mach-socfpga/misc.c:55

mach-omap2/omap-cache.c:49
void enable_caches(void)
{

	/* Enable I cache if not enabled */
	if (!icache_status())
		icache_enable();

	dcache_enable();
}

the issue the weak function empty, so it is mandatory to
redefine the real implementation for each platform.

arch/arm/lib/cache.c:35
/*
 * Default implementation of enable_caches()
 * Real implementation should be in platform code
 */
__weak void enable_caches(void)
{
	puts("WARNING: Caches not enabled\n");
}

[...]

> >>>
> >>> +static void set_mmu_dcache(u32 addr, u32 size) {
> >>> +	int	i;
> >>> +	u32 start, end;
> >>> +
> >>> +	start = addr >> MMU_SECTION_SHIFT;
> >>> +	end = ((u64)addr + (u64)size) >> MMU_SECTION_SHIFT;
> >>
> >> Is this a copy of dram_bank_mmu_setup() in arch/arm/lib/cache-cp15.c ?
> >> Why ?
> >
> > It is not just a copy...
> >
> > set__mmu_dache is only a static helper for  function
> > dram_bank_mmu_setup()
> >
> > I override the default implementation of the weak functon
> > dram_bank_mmu_setup()
> 
> Can you instead augment the original implementation to cater for this usecase or
> would that be too difficult ?

Have a generic behavior...

I will propose to protect the access to bd->bi_dram[bank] in dram_bank_mmu_setup

[....]

> >>
> >>> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
> >>> index c34a720e0c..5203fc93ad 100644
> >>> --- a/include/configs/stm32mp1.h
> >>> +++ b/include/configs/stm32mp1.h
> >>> @@ -58,8 +58,8 @@
> >>>
> >>>  /* limit SYSRAM usage to first 128 KB */
> >>>  #define CONFIG_SPL_MAX_SIZE		0x00020000
> >>> -#define CONFIG_SPL_STACK		(STM32_SYSRAM_BASE + \
> >>> -					 STM32_SYSRAM_SIZE)
> >>> +/* stack at STM32_SYSRAM_BASE + STM32_SYSRAM_SIZE -
> >> PGTABLE_SIZE (=16kB) */
> >>> +#define CONFIG_SPL_STACK		0x2FFFC000
> >>
> >> Can't you memalign() the pagetable area instead of this hacking around?
> >> Or use something around board_init_f_alloc_reserve().
> >
> > It was my first idea: use malloc
> >
> > But as I try to activate the data cache as soon as possible.
> > So before spl_early_init call (for spl in board_init_f) and malloc is not yet
> accessible.
> >
> > And board_init_f_alloc_reserve  is only called in U-Boot board-f.c.....
> > after the MMU configuration for pre-relocation / not called in SPL.
> >
> > I don't see this address as hack but a memory configuration of SYSRAM:
> >
> > SYRAM content (board_f)
> > - SPL code
> > - SPL data
> > - SPL stack (reversed order)
> > - TTB
> >
> > But I can move it in BSS as global apl variable, I need to think about it....
> > It is probably more clean.
> 
> Please do :)

I willl move it in ".data" section in V2 for SPL and U-Boot.

Even in binary size increase and the SPL load time
by ROM code is increase by 30ms.

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

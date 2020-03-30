Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E0E197D7F
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Mar 2020 15:49:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A3AFC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Mar 2020 13:49:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24859C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 13:49:40 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02UDk1k3017561; Mon, 30 Mar 2020 15:49:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=m8SoL2T39s03UNeYXcHwiA2+SJpggShYhSB06o1iVoo=;
 b=lcDj0eNN01oi3nvw2uABE86qaRnXFSeQ28VFe6en/65mdwQmS91hA8DrjZkDU/LHHm96
 doxN4JbLrWVLNnw3Bdw0V2337HZfePWMXvzJjH4n3tDiAfLyQ3nIcEvnLBJRjuilp6rR
 nBV8UV8bBNw/yylqHEx0vPTwXusS8J6IcrVwLrz7zIvjELXiVossK3v+hV7S3saALYJ/
 sSKbTwiJTBFyxlQbM0eCDZs5CaOufrJfEOBdo4UpG2ecYMTieS8lBkm1JCZkxH4l+vSv
 oHSaunipU47rOOcbDuQXRXKXVluVvnsr7hX38Bqr13Nhu0z4/FL9bqMqweNR7FGsJA+3 JQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301w80ssg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Mar 2020 15:49:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F1D3510002A;
 Mon, 30 Mar 2020 15:49:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E41AB2BC7C6;
 Mon, 30 Mar 2020 15:49:33 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 30 Mar
 2020 15:49:33 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 30 Mar 2020 15:49:33 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] arm: stm32mp1: activate data cache in SPL and before
 relocation
Thread-Index: AQHWBmdSO6oWcaW6PEiqwzqWJWVPdKhgxLEAgABF/nA=
Date: Mon, 30 Mar 2020 13:49:33 +0000
Message-ID: <85b6dd3be8a9460984dd958592a4d476@SFHDAG6NODE3.st.com>
References: <20200330094610.1.I2ff601b652f4995a3401dc67c2369a4187046ed8@changeid>
 <15a7a5fc-35f0-844a-8bdb-aefcbc001243@denx.de>
In-Reply-To: <15a7a5fc-35f0-844a-8bdb-aefcbc001243@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-30_01:2020-03-30,
 2020-03-30 signatures=0
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
> Sent: lundi 30 mars 2020 11:57
> 
> On 3/30/20 9:46 AM, Patrick Delaunay wrote:
> [...]
> 
> > 2/ And for the basic boot chain with SPL
> >
> > a) Before the patch:
> >
> >     STM32MP> bootstage report
> >     Timer summary in microseconds (12 records):
> >            Mark    Elapsed  Stage
> >               0          0  reset
> >         195,613    195,613  SPL
> >         837,867    642,254  end SPL
> >         840,117      2,250  board_init_f
> >       2,739,639  1,899,522  board_init_r
> >       3,066,815    327,176  id=64
> >       3,103,377     36,562  id=65
> >       3,104,078        701  main_loop
> >       3,142,171     38,093  id=175
> >
> >     Accumulated time:
> >                     38,124  dm_spl
> >                     41,956  dm_r
> >                    648,861  dm_f
> >
> > b) After the patch
> >
> >     STM32MP> bootstage report
> >     Timer summary in microseconds (12 records):
> >            Mark    Elapsed  Stage
> >               0          0  reset
> >         195,859    195,859  SPL
> >         330,190    134,331  end SPL
> >         332,408      2,218  board_init_f
> >         482,688    150,280  board_init_r
> >         808,694    326,006  id=64
> >         845,029     36,335  id=65
> >         845,730        701  main_loop
> >       3,281,876  2,436,146  id=175
> >
> >     Accumulated time:
> >                      3,169  dm_spl
> >                     36,041  dm_f
> >                     41,701  dm_r
> 
> Nice.
> 
> [...]
> 
> > diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> > index 36a9205819..579468a1a0 100644
> > --- a/arch/arm/mach-stm32mp/cpu.c
> > +++ b/arch/arm/mach-stm32mp/cpu.c
> > @@ -193,6 +193,26 @@ int arch_cpu_init(void)  {
> >  	u32 boot_mode;
> >
> > +	/*
> > +	 * initialialize the MMU and activate data cache
> > +	 * in SPL or in U- Boot pre-reloc stage
> > +	 */
> > +	gd->arch.tlb_size = PGTABLE_SIZE;
> > +#if defined(CONFIG_SPL_BUILD)
> > +#if (STM32_SYSRAM_BASE + STM32_SYSRAM_SIZE -
> CONFIG_SPL_STACK <
> > +PGTABLE_SIZE) #error "The reserved memory for SPL PGTABLE is not
> enough."
> > +#endif
> 
> Move this check to the beginning of the file, out of the code.

Ok

> > +	gd->arch.tlb_addr = CONFIG_SPL_STACK;
> 
> if (IS_ENABLED(SPL_BUILD))
>  gd->....
> else
>  gd->....

Yes with

IS_ENABLED(CONFIG_SPL_BUILD)

> > +#else
> > +	/* TLB is located after U-Boot, assumed 2MB as max size */
> > +	gd->arch.tlb_addr = CONFIG_SYS_TEXT_BASE + SZ_2M; #endif
> 
> I think you also need to set arch.tlb_size . Also, this should be a separate function.

It is done before the test / common for SPL or U-Boot case.

	gd->arch.tlb_size = PGTABLE_SIZE;

but I will create a function early_early_caches()

> > +	dcache_enable();
> 
> What about icache, shouldn't that one be enabled too ?

It is not needed... 
I-cache is already activated in start.S::cpu_init_cp15 for arm V7

But I will add a comment.

 
> > +	/*
> > +	 * MMU/TLB is updated in enable_caches() for U-Boot after relocation
> > +	 * or is deactivated in U-Boot start.S::cpu_init_cp15 for SPL
> > +	 */
> > +
> >  	/* early armv7 timer init: needed for polling */
> >  	timer_init();
> >
> > @@ -225,7 +245,13 @@ int arch_cpu_init(void)
> >
> >  void enable_caches(void)
> >  {
> 
> Icache should be enabled here too. You don't know what e.g. a debugger did to
> caches.
> 
> > -	/* Enable D-cache. I-cache is already enabled in start.S */
> > +	/* I-cache is already enabled in start.S */

Not needed for arm V7 (I copy this function from other platfrom ... I don't remember which one)

I-cache is already activated in start.S::cpu_init_cp15 as indicated in this comment

> > +	/* deactivate the data cache, early enabled in arch_cpu_init() */
> > +	dcache_disable();
> > +	/*
> > +	 * update MMU after relocation, the TLB location was udpated in
> > +	 * board_f.c::reserve_mmu, and enable the data cache
> > +	 */
> >  	dcache_enable();
> >  }
> >
> > diff --git a/arch/arm/mach-stm32mp/dram_init.c
> > b/arch/arm/mach-stm32mp/dram_init.c
> > index 3233415eff..15b39ecc03 100644
> > --- a/arch/arm/mach-stm32mp/dram_init.c
> > +++ b/arch/arm/mach-stm32mp/dram_init.c
> > @@ -7,9 +7,29 @@
> >  #include <dm.h>
> >  #include <lmb.h>
> >  #include <ram.h>
> > +#include <asm/cache.h>
> >
> >  DECLARE_GLOBAL_DATA_PTR;
> >
> > +static void set_mmu_dcache(u32 addr, u32 size) {
> > +	int	i;
> > +	u32 start, end;
> > +
> > +	start = addr >> MMU_SECTION_SHIFT;
> > +	end = ((u64)addr + (u64)size) >> MMU_SECTION_SHIFT;
> 
> Is this a copy of dram_bank_mmu_setup() in arch/arm/lib/cache-cp15.c ?
> Why ?

It is not just a copy...

set__mmu_dache is only a static helper for  function dram_bank_mmu_setup()

I override the default implementation of the weak functon dram_bank_mmu_setup()

1/ mark  SYSRAM cacheable in SPL (embedded RAM used by SPL)

2/ mark beginning of DDR cacheable in U-Boot pre-reloc (today all the DDR)
    => I prepare a possible TF-A limitation: when TF-A is running in DDR,
         a part of DDR is securized and can't be mapped to avoid speculative access 

3/ after relocation, DDR init is performed.... 
    use the default implementation to map all the DDR (gd->bd->bi_dram[0])

   PS: in future patches, I will only limit this case for reserved memory part,
           with "no-map" tag (also for TF-A requirement)

Now after my explcation I found a issue in my patch...
SPL also use DDR (at least for CONFIG_SYS_SPL_MALLOC_START	0xC0300000) ,
 so I need to marked DDR as cacheache also for SPL

> > +	for (i = start; i < end; i++) {
> > +#if defined(CONFIG_SYS_ARM_CACHE_WRITETHROUGH)
> > +		set_section_dcache(i, DCACHE_WRITETHROUGH); #elif
> > +defined(CONFIG_SYS_ARM_CACHE_WRITEALLOC)
> > +		set_section_dcache(i, DCACHE_WRITEALLOC); #else
> > +		set_section_dcache(i, DCACHE_WRITEBACK); #endif
> > +	}
> > +}
> 
> [...]
> 
> > diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
> > index c34a720e0c..5203fc93ad 100644
> > --- a/include/configs/stm32mp1.h
> > +++ b/include/configs/stm32mp1.h
> > @@ -58,8 +58,8 @@
> >
> >  /* limit SYSRAM usage to first 128 KB */
> >  #define CONFIG_SPL_MAX_SIZE		0x00020000
> > -#define CONFIG_SPL_STACK		(STM32_SYSRAM_BASE + \
> > -					 STM32_SYSRAM_SIZE)
> > +/* stack at STM32_SYSRAM_BASE + STM32_SYSRAM_SIZE -
> PGTABLE_SIZE (=16kB) */
> > +#define CONFIG_SPL_STACK		0x2FFFC000
> 
> Can't you memalign() the pagetable area instead of this hacking around?
> Or use something around board_init_f_alloc_reserve().

It was my first idea: use malloc

But as I try to activate the data cache as soon as possible.
So before spl_early_init call (for spl in board_init_f) and malloc is not yet accessible.

And board_init_f_alloc_reserve  is only called in U-Boot board-f.c..... 
after the MMU configuration for pre-relocation / not called in SPL.

I don't see this address as hack but a memory configuration of SYSRAM:

SYRAM content (board_f)
- SPL code
- SPL data
- SPL stack (reversed order)
- TTB 

But I can move it in BSS as global apl variable, I need to think about it....
It is probably more clean.

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

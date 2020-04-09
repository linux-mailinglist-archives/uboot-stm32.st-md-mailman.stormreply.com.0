Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 794401A39E3
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Apr 2020 20:40:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2461BC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Apr 2020 18:40:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99485C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Apr 2020 18:40:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 039IWaBl024342; Thu, 9 Apr 2020 20:40:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=BjJfT2r3iZqMO56eBUgzsR5FlrCnQWgrFllcm8ts7+Q=;
 b=xz754xJSKvZ8ejRyr5wBdfu2C6wcI8cRfWqTYpjTy6gn8YXPcI9TKi9mRqkfLyXGMK/z
 XVPPTWjOCYbj+j/Pk0ZDDkeuBEAjOa4AN2BS1wlPv5t78xpSQn7r2XHUhKP7Q0Ujk5aZ
 qF6sJ7wmJKn5AsXGaoUFutHd6TSrQaDjYQcnRLM6gjY7BqUh/hJ8H9z0/Jfn/Mqpb7/m
 GZeL3/YCOxSjMnpZD2+n5kkclnVwx7Ll/NqIBEOmtv3b8XuIoW34IiHsKmFupE7KL9O+
 pXXvCboyou7+Idyy8LgFaABlOFUbFHHKk9oe5cVfIT203/ji0WmvxFfwTzvx5fTgCCYX yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3091mavb29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Apr 2020 20:40:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DA8A410002A;
 Thu,  9 Apr 2020 20:32:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CDFF02BEC52;
 Thu,  9 Apr 2020 20:32:29 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Apr
 2020 20:32:29 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 9 Apr 2020 20:32:29 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 1/2] arm: stm32mp: activate data cache in SPL and
 before relocation
Thread-Index: AQHWCZncYP8CyZmWB0CxiXGgfYVFOKhnydiAgAlXLZA=
Date: Thu, 9 Apr 2020 18:32:29 +0000
Message-ID: <5d207feb8ae3445ba520dd206d37a54a@SFHDAG6NODE3.st.com>
References: <20200403092537.19961-1-patrick.delaunay@st.com>
 <20200403105644.v2.1.I2ff601b652f4995a3401dc67c2369a4187046ed8@changeid>
 <3398ff5a-73d0-d6ab-9573-d8ed649f7537@denx.de>
In-Reply-To: <3398ff5a-73d0-d6ab-9573-d8ed649f7537@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-09_06:2020-04-07,
 2020-04-09 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/2] arm: stm32mp: activate data cache
 in SPL and before relocation
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

Dear Marek,

> From: Marek Vasut <marex@denx.de>
> Sent: vendredi 3 avril 2020 23:32
> 
> On 4/3/20 11:25 AM, Patrick Delaunay wrote:
> [...]
> > diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> > index 36a9205819..c22c1a9bbc 100644
> > --- a/arch/arm/mach-stm32mp/cpu.c
> > +++ b/arch/arm/mach-stm32mp/cpu.c
> > @@ -75,6 +75,12 @@
> >  #define PKG_SHIFT	27
> >  #define PKG_MASK	GENMASK(2, 0)
> >
> > +/*
> > + * early TLB into the .data section so that it not get cleared
> > + * with 16kB allignment (see TTBR0_BASE_ADDR_MASK)  */
> > +u8 early_tlb[PGTABLE_SIZE] __section(".data") __aligned(0x4000);
> 
> Can you early-malloc this one ?

I try to early maloc and it is failing because my code in arch_cpu_init() is executed before 
the early poll initialization done in spl_common_init () called by spl_early_init()
So it too late for my use case....

And if I initialise the MMU and the cache after this function it is too late, as
dm_init_and_scan and fdt parsin is also called in spl_common_init()

> (why do you need this in __section("data") ?)

I try to use .bss and it is failing because the bss is resetted to 0 in SPL 
after board_init_f, and the MMU is cleared without notice.

In fact BBS is not available, board_init_f() can use only stack variables
and global_data (see README:258).

When I investigate the issue, I found CONFIG_SPL_EARLY_BSS
that explain this point :

config SPL_EARLY_BSS
	depends on ARM && !ARM64
	bool "Allows initializing BSS early before entering board_init_f"
	help
	  On some platform we have sufficient memory available early on to
	  allow setting up and using a basic BSS prior to entering
	  board_init_f. Activating this option will also de-activate the
	  clearing of BSS during the SPL relocation process, thus allowing
	  to carry state from board_init_f to board_init_r by way of BSS.

So it is s compromise between harcoded addred (end of SYSRAM)
or glabal variable in .data section

V2 patch with .data seems more elegant for me (it avoid assumption on
U-Boot size for preloc case).

And if you have size issue for SPL you can deactivate cache for SPL only
(CONFIG_SPL_SYS_DCACHE_OFF).

> [...]

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

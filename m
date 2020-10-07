Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BB0285EDF
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Oct 2020 14:15:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 212A8C32EA7;
	Wed,  7 Oct 2020 12:15:39 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19192C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 11:52:59 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kQ7zw-0000Pz-SB; Wed, 07 Oct 2020 13:52:44 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Ard Biesheuvel <ardb@kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>
References: <20201006163602.21687-1-patrick.delaunay@st.com>
 <CAMj1kXET8=ERg7gGqWa-FwLZzAuztBsVMhyTGmYEMAxzb63_sw@mail.gmail.com>
 <190d019a-7e18-b4bc-9276-e14bbe4c2855@pengutronix.de>
Message-ID: <258ba4fa-8d1e-56be-e0de-2d6c09812c13@pengutronix.de>
Date: Wed, 7 Oct 2020 13:52:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <190d019a-7e18-b4bc-9276-e14bbe4c2855@pengutronix.de>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Wed, 07 Oct 2020 12:15:34 +0000
Cc: chenshuo <chenshuo@eswin.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 marek.bykowski@gmail.com, Stefan Roese <sr@denx.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>,
 Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Rajesh Ravi <rajesh.ravi@broadcom.com>,
 Thirupathaiah Annapureddy <thiruan@linux.microsoft.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>,
 Tero Kristo <t-kristo@ti.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH 0/7] arm: cache: cp15: don't map reserved
 region with no-map property
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

Hello,

On 10/7/20 1:23 PM, Ahmad Fatoum wrote:
> My findings[1] back then were that U-Boot did set the eXecute Never bit only on
> OMAP, but not for other platforms.  So I could imagine this being the root cause
> of Patrick's issues as well:

Rereading my own link, my memory is a little less fuzzy: eXecute Never was being
set, but was without effect due Manager mode being set in the DACR:

> The ARM Architecture Reference Manual notes[1]:
> > When using the Short-descriptor translation table format, the XN     
> > attribute is not checked for domains marked as Manager.
> > Therefore, the system must not include read-sensitive memory in
> > domains marked as Manager, because the XN bit does not prevent  
> > speculative fetches from a Manager domain.
 
> To avoid speculative access to read-sensitive memory-mapped peripherals
> on ARMv7, we'll need U-Boot to use client domain permissions, so the XN
> bit can function.
 
> This issue has come up before and was fixed in de63ac278
> ("ARM: mmu: Set domain permissions to client access") for OMAP2 only.
> It's equally applicable to all ARMv7-A platforms where caches are    
> enabled.
> [1]: B3.7.2 - Execute-never restrictions on instruction fetching

Hope this helps,
Ahmad

> The CPU is speculatively executing from the region that the firewalled DRAM
> is mapped at.
> 
> barebox now configures XN for non-RAM before it turns on the MMU. You should
> do that as well (in ARM arch code, not only for stm32mp1). Additionally,
> you will want to XN map the region where your OP-TEE sits at.
> 
> [1]: https://community.nxp.com/thread/511925
> 
> Cheers
> Ahmad
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

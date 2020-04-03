Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7072A19E06A
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Apr 2020 23:37:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC307C36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Apr 2020 21:37:54 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39D2FC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Apr 2020 21:37:51 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48vCvy6gb6z1qrGJ;
 Fri,  3 Apr 2020 23:37:50 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48vCvy5f0pz1qv4r;
 Fri,  3 Apr 2020 23:37:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id l39CXRk14k5Z; Fri,  3 Apr 2020 23:37:49 +0200 (CEST)
X-Auth-Info: kkEBPnG4y/egw51SRUVmUowEq6f3/oPUJ7s6D/X56Ew=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri,  3 Apr 2020 23:37:49 +0200 (CEST)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20200403102815.1.I64599059b66bacb531db38c67273754a145dbad8@changeid>
 <20200403102815.3.Ic2c7c6923035711a4c653d52ae7c0f57ca6f9210@changeid>
From: Marek Vasut <marex@denx.de>
Message-ID: <9e48b552-38a0-53f9-349c-68f5542b18bd@denx.de>
Date: Fri, 3 Apr 2020 23:30:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200403102815.3.Ic2c7c6923035711a4c653d52ae7c0f57ca6f9210@changeid>
Content-Language: en-US
Cc: Tom Rini <trini@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Simon Glass <sjg@chromium.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 Trevor Woerner <trevor@toganlabs.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] arm: caches: manage phys_addr_t
 overflow in mmu_set_region_dcache_behaviour
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

On 4/3/20 10:28 AM, Patrick Delaunay wrote:
> Detect and solve the overflow on phys_addr_t type for start + size in
> mmu_set_region_dcache_behaviour() function.
> 
> This issue occurs for example with ARM32, start = 0xC0000000 and
> size = 0x40000000: start + size = 0x100000000 and end = 0x0.
> 
> Overflow is detected when end < start.
> In normal case the previous behavior is still used: when start is not
> aligned on MMU section, the end address is only aligned after the sum
> start + size.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  arch/arm/lib/cache-cp15.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/lib/cache-cp15.c b/arch/arm/lib/cache-cp15.c
> index d15144188b..e5a7fd0ef4 100644
> --- a/arch/arm/lib/cache-cp15.c
> +++ b/arch/arm/lib/cache-cp15.c
> @@ -63,6 +63,11 @@ void mmu_set_region_dcache_behaviour(phys_addr_t start, size_t size,
>  
>  	end = ALIGN(start + size, MMU_SECTION_SIZE) >> MMU_SECTION_SHIFT;
>  	start = start >> MMU_SECTION_SHIFT;
> +
> +	/* phys_addr_t overflow detected */
> +	if (end < start)
> +		end = (~(phys_addr_t)0x0 >> MMU_SECTION_SHIFT) + 1;
> +

Or, you can divide $start and $size separately by MMU_SECTION_SIZE and
then add them up .
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

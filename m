Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C9919E069
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Apr 2020 23:37:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B6E2C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Apr 2020 21:37:52 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1339C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Apr 2020 21:37:49 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48vCvv32Thz1rnJW;
 Fri,  3 Apr 2020 23:37:47 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48vCvv23x7z1qv4r;
 Fri,  3 Apr 2020 23:37:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 5LFogg36Fx6g; Fri,  3 Apr 2020 23:37:46 +0200 (CEST)
X-Auth-Info: v8NNKwkTaN2a0cdIrweNVXehPaM34PxG2nRg0Pc+jyE=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri,  3 Apr 2020 23:37:46 +0200 (CEST)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20200403102815.1.I64599059b66bacb531db38c67273754a145dbad8@changeid>
From: Marek Vasut <marex@denx.de>
Message-ID: <714177fe-ba0e-cc2a-dcb4-0a5e4c036aa0@denx.de>
Date: Fri, 3 Apr 2020 23:27:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200403102815.1.I64599059b66bacb531db38c67273754a145dbad8@changeid>
Content-Language: en-US
Cc: Tom Rini <trini@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Simon Glass <sjg@chromium.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 Trevor Woerner <trevor@toganlabs.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] arm: caches: protect
 dram_bank_mmu_setup access to bi_dram
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
> Add protection in dram_bank_mmu_setup() to avoid access to bd->bi_dram
> before relocation.
> 
> This patch allow to use the generic weak function dram_bank_mmu_setup
> to activate the MMU and the data cache in SPL or in U-Boot before
> relocation, when bd->bi_dram is not yet initialized.
> 
> In this cases, the MMU must be initialized explicitly with
> mmu_set_region_dcache_behaviour function.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  arch/arm/lib/cache-cp15.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/lib/cache-cp15.c b/arch/arm/lib/cache-cp15.c
> index f8d20960da..54509f11c3 100644
> --- a/arch/arm/lib/cache-cp15.c
> +++ b/arch/arm/lib/cache-cp15.c
> @@ -91,6 +91,10 @@ __weak void dram_bank_mmu_setup(int bank)
>  	bd_t *bd = gd->bd;
>  	int	i;
>  
> +	/* bd->bi_dram is available only after relocation */
> +	if ((gd->flags & GD_FLG_RELOC) == 0)
> +		return;

Why not just set the bd->bi_dram correctly before this is called ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

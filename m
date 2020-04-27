Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 553341BA101
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Apr 2020 12:22:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06E48C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Apr 2020 10:22:45 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 425C0C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2020 10:22:43 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 499gns30Pbz1r76t;
 Mon, 27 Apr 2020 12:22:41 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 499gns0NVHz1qtws;
 Mon, 27 Apr 2020 12:22:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id sr0haH2_u36Y; Mon, 27 Apr 2020 12:22:39 +0200 (CEST)
X-Auth-Info: FGGV5T29HSBXqFBo45zAMvzgrYIc49DNFuGN0N0CsyM=
Received: from [127.0.0.1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 27 Apr 2020 12:22:39 +0200 (CEST)
To: Patrice Chotard <patrice.chotard@st.com>, u-boot@lists.denx.de
References: <20200423160155.9258-1-patrice.chotard@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <53bd84ea-22ec-4555-319a-73c9d0dd44fe@denx.de>
Date: Mon, 27 Apr 2020 12:22:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200423160155.9258-1-patrice.chotard@st.com>
Content-Language: en-US
Cc: Stephen Warren <swarren@nvidia.com>,
 Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Rajesh Ravi <rajesh.ravi@broadcom.com>, Simon Glass <sjg@chromium.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Eric Perie <eric.perie@yahoo.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Trevor Woerner <trevor@toganlabs.com>, Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] cmd: cache: Fix non-cached memory
	cachability
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

On 4/23/20 6:01 PM, Patrice Chotard wrote:

[...]

> diff --git a/arch/arm/lib/cache.c b/arch/arm/lib/cache.c
> index 007d4ebc49..7f3cfb407c 100644
> --- a/arch/arm/lib/cache.c
> +++ b/arch/arm/lib/cache.c
> @@ -73,6 +73,15 @@ static unsigned long noncached_start;
>  static unsigned long noncached_end;
>  static unsigned long noncached_next;
>  
> +void noncached_set_region(void)
> +{

Make this a __weak function and let architectures override it.

> +#if !CONFIG_IS_ENABLED(SYS_DCACHE_OFF)
> +	mmu_set_region_dcache_behaviour(noncached_start,
> +					noncached_end - noncached_start,
> +					DCACHE_OFF);
> +#endif
> +}
> +
>  void noncached_init(void)
>  {
>  	phys_addr_t start, end;
> @@ -89,9 +98,7 @@ void noncached_init(void)
>  	noncached_end = end;
>  	noncached_next = start;
>  
> -#if !CONFIG_IS_ENABLED(SYS_DCACHE_OFF)
> -	mmu_set_region_dcache_behaviour(noncached_start, size, DCACHE_OFF);
> -#endif
> +	noncached_set_region();
>  }
>  
>  phys_addr_t noncached_alloc(size_t size, size_t align)
> diff --git a/cmd/cache.c b/cmd/cache.c
> index 27dcec0931..86fbaf8dd6 100644
> --- a/cmd/cache.c
> +++ b/cmd/cache.c
> @@ -64,6 +64,9 @@ static int do_dcache(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
>  			break;
>  		case 1:
>  			dcache_enable();
> +#ifdef CONFIG_SYS_NONCACHED_MEMORY

See above, then you won't need this ifdeffery.

> +			noncached_set_region();
> +#endif
>  			break;
>  		case 2:
>  			flush_dcache_all();
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

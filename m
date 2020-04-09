Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2289E1A32CB
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Apr 2020 12:46:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3476C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Apr 2020 10:46:46 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 728C9C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Apr 2020 10:46:44 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48yd9r2wVkz1rwb1;
 Thu,  9 Apr 2020 12:46:40 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48yd9q6qvgz1qv47;
 Thu,  9 Apr 2020 12:46:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id GkcncSlMV711; Thu,  9 Apr 2020 12:46:38 +0200 (CEST)
X-Auth-Info: qpLBXsIl+YvKipraI1FlJkdseVUg96BWf4FR1lgNYUc=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  9 Apr 2020 12:46:38 +0200 (CEST)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20200409124131.1.Ib3bfddef91204749326b4bdd0a089ed0bfcac33e@changeid>
From: Marek Vasut <marex@denx.de>
Message-ID: <6aceec88-f20b-8fd4-3622-87d7be716b6d@denx.de>
Date: Thu, 9 Apr 2020 12:46:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200409124131.1.Ib3bfddef91204749326b4bdd0a089ed0bfcac33e@changeid>
Content-Language: en-US
Cc: Pascal Linder <pascal.linder@edu.hefr.ch>, Simon Glass <sjg@chromium.org>,
 Kever Yang <kever.yang@rock-chips.com>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Holger Brunck <holger.brunck@ch.abb.com>, Mario Six <mario.six@gdsys.cc>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: migrate CONFIG_SYS_ARM_CACHE_*
	in Kconfig
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

On 4/9/20 12:42 PM, Patrick Delaunay wrote:

[...]

> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index bbb1e2738b..4845a23993 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -340,6 +340,33 @@ config SYS_CACHELINE_SIZE
>  	default 64 if SYS_CACHE_SHIFT_6
>  	default 32 if SYS_CACHE_SHIFT_5
>  
> +choice
> +	prompt "Select the ARM data write cache policy"
> +	default SYS_ARM_CACHE_WRITETHROUGH if TARGET_BCMCYGNUS || TARGET_BCMNSP

|| TARGET is PXA || TARGET is renesas RZA1 , and then you don't need the
defconfig hacks below :)

Look good otherwise, thanks.

[...]
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

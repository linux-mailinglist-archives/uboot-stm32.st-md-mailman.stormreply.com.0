Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F29986548
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Sep 2024 19:05:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C69AEC78006;
	Wed, 25 Sep 2024 17:05:18 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B54CC6C841
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 17:05:12 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 644DF88216;
 Wed, 25 Sep 2024 19:05:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727283911;
 bh=ofNyExE8wol+kLc8Go9ZHb5OOSjsGpp6Dc3F1ls4nBI=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=i04lrvrT9NgP/Ny1y2kdVEvlwGVSfj7qfMyh5L0SphPCU15lm0JFM+UnwK3qtkhUJ
 RsTVFb+ISAyilQGpGx2ce7X/jWlZ79FBks6Tjlf9tm2lMrgi1tvPHPsI9MAkbgmvND
 jKfoDtUZyNMKOwXqBW473+nxS0uA6AT2d7o0tD3RNRnqOZLISdao07sU0492M72aFk
 sQ1GI6lOaCTguC1yBtQz71CoQ88ABU/hZuygwS9f9bRMEODWX4+dq0JskxorY9tTyF
 TTSltXnPxEdzZwpJWLOP+nFKyx2+58wavrJ7X34Q4ujEA8I8BTYqGHqzW3lo97NaZF
 jtSE4Xkid7TfA==
Message-ID: <05eaecb5-4c5b-4220-b1d1-51c938b6705b@denx.de>
Date: Wed, 25 Sep 2024 19:04:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
References: <20240708114344.18354-1-marex@denx.de>
Content-Language: en-US
In-Reply-To: <20240708114344.18354-1-marex@denx.de>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Fix secure_waitbits() mask
	check
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 7/8/24 1:43 PM, Marek Vasut wrote:
> Do not apply bitwise AND to register value and expected value, only
> apply bitwise AND to register value and mask, and only then compare
> the result with expected value that the function polls for.
> 
> Fixes: b49105320a5b ("stm32mp: psci: Implement PSCI system suspend and DRAM SSR")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>   arch/arm/mach-stm32mp/stm32mp1/psci.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/stm32mp1/psci.c b/arch/arm/mach-stm32mp/stm32mp1/psci.c
> index e99103910d9..ffdafea464d 100644
> --- a/arch/arm/mach-stm32mp/stm32mp1/psci.c
> +++ b/arch/arm/mach-stm32mp/stm32mp1/psci.c
> @@ -393,8 +393,7 @@ static int __secure secure_waitbits(u32 reg, u32 mask, u32 val)
>   	asm volatile("mrrc p15, 0, %Q0, %R0, c14" : "=r" (start));
>   	for (;;) {
>   		tmp = readl(reg);
> -		tmp &= mask;
> -		if ((tmp & val) == val)
> +		if ((tmp & mask) == val)
>   			return 0;
>   		asm volatile("mrrc p15, 0, %Q0, %R0, c14" : "=r" (end));
>   		if ((end - start) > delay)

I hope this bugfix will make it into 2024.10 , can you prepare a bugfix 
PR for 2024.10 ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

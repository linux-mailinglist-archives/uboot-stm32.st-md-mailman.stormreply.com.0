Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DDA641F02
	for <lists+uboot-stm32@lfdr.de>; Sun,  4 Dec 2022 19:55:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AED7C65067;
	Sun,  4 Dec 2022 18:55:30 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA659C64112
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Dec 2022 18:55:28 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D44C585546;
 Sun,  4 Dec 2022 19:55:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1670180128;
 bh=rBuny85VO8x/eWNfFMac58kzBB9Bm8rFGlTVi+bHYMU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RF7yx8wvuWG+seDhJqQuGbWWl9+tPnTUthyWdmhjAxSMOoOK0Y/MU6Xe1Fq9f1xjp
 BqRyLMXzlgErrCCkDiPe1pb4cgww80xSX5Lr5pDCKPG/VqLb9MJFdQH2QS6vfzAnb7
 IhCCboa6zF6TdrXq2C/fCokSpZeR7sQXS/Mh6MuLHbMLXtaHhtrEDKaoI+h/A1r6BM
 41mYcj5qBlMQ77ZrYu7itnkxiPt1ZGCHDz09xQVzrwnOdhXsytWBYr5fZ0FBpFSbbR
 csd22GNijkFtTbSNqU8zzpOUZvCuo4L2JjHW5liai2zOVVgXgsr7F05c8DSFtTfyza
 tORZvxAjhqnAA==
Message-ID: <0a41cbe2-8f9f-4ba9-5ffc-e1047d0e37c8@denx.de>
Date: Sun, 4 Dec 2022 19:55:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20221130114146.1.I1944fc560e894329a83e9cf8f50cab3610f4f334@changeid>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221130114146.1.I1944fc560e894329a83e9cf8f50cab3610f4f334@changeid>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] dfu: Make DFU virtual backend SPL friendly
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

On 11/30/22 11:42, Patrick Delaunay wrote:
> Define stub for dfu_*_virt function in SPL, because
> CONFIG_SPL_DFU_VIRT is not defined.
> 
> This patch avoids compilation issue in dfu_fill_entity() when
> CONFIG_SPL_DFU is activated because the dfu_fill_entity_virt()
> function is not available.
> 
> Fixes: ec44cace4b8d2 ("dfu: add DFU virtual backend")
> Reported-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> See initial patch proposal:
> http://patchwork.ozlabs.org/project/uboot/patch/20221128193917.236188-1-marex@denx.de/
> 
>   include/dfu.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/dfu.h b/include/dfu.h
> index dcb9cd9d799a..07922224ef19 100644
> --- a/include/dfu.h
> +++ b/include/dfu.h
> @@ -495,7 +495,7 @@ static inline int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr,
>   }
>   #endif
>   
> -#ifdef CONFIG_DFU_VIRT
> +#if CONFIG_IS_ENABLED(DFU_VIRT)
>   int dfu_fill_entity_virt(struct dfu_entity *dfu, char *devstr,
>   			 char **argv, int argc);
>   int dfu_write_medium_virt(struct dfu_entity *dfu, u64 offset,

Reviewed-by: Marek Vasut <marex@denx.de>
Tested-by: Marek Vasut <marex@denx.de>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

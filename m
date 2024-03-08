Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4113877BBE
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Mar 2024 09:36:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DAB9C6DD9C;
	Mon, 11 Mar 2024 08:36:58 +0000 (UTC)
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81EF8C6B46B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Mar 2024 14:41:25 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1709908884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QRtsBIbmv5Mxv+A+uZmrKN29hx1T4vLOx4w7sxO0VRs=;
 b=XjQH55T6rRhOTSUrWbKfQN+H+x1q1qxVJEj/LqyR4HwmN8iASvwWwwekdcbHJvTxlSJ97Y
 Qm0+VX3doTy0LgeCFFipRZPyRU97C6u0dO0HXiiFKo52XOSbfDSOVdVha/EPFmSQjAWYT9
 97/p93sF5fha3zAFYD8jqk0yU6XeVuMxFBqFAx4eJqIDJYJpIn2kDfoTjQa6ptnqEK++yP
 0T8jKxM92p9Bi8322/aH3YQGx+Yso0xPraJJEhvlFkwCCLaE+VhWFdJiUad5ql+uBQamo8
 C+hQVwIz152xXZK3znI9Bw+ky+FtU3zuCu7IniTngvM4T6alIIqX3br2LaC7ag==
Date: Fri, 08 Mar 2024 15:41:23 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
In-Reply-To: <20240308133404.2619848-1-patrice.chotard@foss.st.com>
References: <20240308133404.2619848-1-patrice.chotard@foss.st.com>
Message-ID: <edbc4869d0244a81e92336e0b5f6b0e0@manjaro.org>
X-Sender: dsimic@manjaro.org
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-Mailman-Approved-At: Mon, 11 Mar 2024 08:36:57 +0000
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] fdt_support: fix
	fdt_copy_fixed_partitions function()
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

Hello Patrice,

Please, see my comment below.

On 2024-03-08 14:34, Patrice Chotard wrote:
> Move variable declaration at the beginning of the function.
> 
> Fixes: 163c5f60ebb4 ("fdt_support: add fdt_copy_fixed_partitions 
> function")
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>  boot/fdt_support.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/boot/fdt_support.c b/boot/fdt_support.c
> index 090d82ee80a..f948cf8cd42 100644
> --- a/boot/fdt_support.c
> +++ b/boot/fdt_support.c
> @@ -1053,9 +1053,10 @@ void fdt_fixup_mtdparts(void *blob, const
> struct node_info *node_info,
>  int fdt_copy_fixed_partitions(void *blob)
>  {
>  	ofnode node, subnode;
> +	const u32 *reg;
>  	int off, suboff, res;
>  	char path[256];
> -	int address_cells, size_cells;
> +	int address_cells, size_cells, len;
>  	u8 i, j, child_count;
> 
>  	node = ofnode_by_compatible(ofnode_null(), "fixed-partitions");
> @@ -1101,9 +1102,6 @@ int fdt_copy_fixed_partitions(void *blob)
>  			if (!ofnode_valid(subnode))
>  				break;
> 
> -			const u32 *reg;
> -			int len;
> -

Perhaps it would be better to keep these two variables local
to the block they're used in.  I mean, in this case it isn't
a big deal anyway, but results in a bit cleaner code.

>  			suboff = fdt_find_or_add_subnode(blob, off, 
> ofnode_get_name(subnode));
>  			res = fdt_setprop_string(blob, suboff, "label",
>  						 ofnode_read_string(subnode, "label"));
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

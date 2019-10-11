Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6BDD5BBB
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 08:56:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E87BC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 06:56:17 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3253C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 19:35:40 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9BJZZ7M046183;
 Fri, 11 Oct 2019 14:35:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1570822535;
 bh=uqIScUO5byJFx2njpXEU1M3QPvl1zkEMq69n3LBBTjg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=I6yqiAWfEci6YoMTg3PaPpDdEtP2ppqXs+itUeyJ2ithDUZ5F8W1MskNW5txBJ566
 lv65S/aAInYBk0YX6nAyeCGybg4MYGhbFTlJsbcJlq2T3tk/qe/+LFjVq/tPSWxEMr
 3hBnzrgRn3Tjeogc0JDLjy0qU0YlbHJV7jQ+JF7o=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9BJZZJQ013495;
 Fri, 11 Oct 2019 14:35:35 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 11
 Oct 2019 14:35:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 11 Oct 2019 14:35:35 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9BJZZF8020826;
 Fri, 11 Oct 2019 14:35:35 -0500
To: Fabien Dessenne <fabien.dessenne@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>, "Vutla, Lokesh" <lokeshvutla@ti.com>, Loic Pallardy
 <loic.pallardy@st.com>
References: <1567583602-17022-1-git-send-email-fabien.dessenne@st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <7396d164-84ec-3757-bb1d-786267a07cf1@ti.com>
Date: Fri, 11 Oct 2019 14:35:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1567583602-17022-1-git-send-email-fabien.dessenne@st.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Mon, 14 Oct 2019 06:56:16 +0000
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH] remoteproc: elf_loader: fix
 program header parsing
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

On 9/4/19 2:53 AM, Fabien Dessenne wrote:
> Fix an issue where some sections are never loaded : if p_type is
> different from PT_LOAD the phdr pointer must be incremented.
> 

Good catch Fabien.


Fixes: 7a7c4cb0f044 ("remoteproc: add elf file load support")
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>

Acked-by: Suman Anna <s-anna@ti.com>

regards
Suman

> ---
>  drivers/remoteproc/rproc-elf-loader.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/rproc-elf-loader.c b/drivers/remoteproc/rproc-elf-loader.c
> index 67937a7..23d502d 100644
> --- a/drivers/remoteproc/rproc-elf-loader.c
> +++ b/drivers/remoteproc/rproc-elf-loader.c
> @@ -78,7 +78,7 @@ int rproc_elf32_load_image(struct udevice *dev, unsigned long addr)
>  	ops = rproc_get_ops(dev);
>  
>  	/* Load each program header */
> -	for (i = 0; i < ehdr->e_phnum; ++i) {
> +	for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
>  		void *dst = (void *)(uintptr_t)phdr->p_paddr;
>  		void *src = (void *)addr + phdr->p_offset;
>  
> @@ -99,7 +99,6 @@ int rproc_elf32_load_image(struct udevice *dev, unsigned long addr)
>  			    roundup((unsigned long)dst + phdr->p_filesz,
>  				    ARCH_DMA_MINALIGN) -
>  			    rounddown((unsigned long)dst, ARCH_DMA_MINALIGN));
> -		++phdr;
>  	}
>  
>  	return 0;
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

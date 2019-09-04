Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 133A9A7D36
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Sep 2019 09:58:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2531C36B3F
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Sep 2019 07:58:36 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B001C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2019 07:58:35 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x847wRCJ053976;
 Wed, 4 Sep 2019 02:58:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1567583907;
 bh=Bi6tHHHf00TChAzEE74ISyqJzlEvhiF3mmXLrSc6VkQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ZOJoKuasiSWbk9YFQ8Lm51RNmRTkIus9VmxeZLdEv/UpQ2Q4z6qmaoqSHEmoVCLzb
 SdAHBeYOpxgNCLCje32EcEye01s86W0qpiEw373xhNcQwS8Hji/GbspnRQ629Y+/PK
 Ol9x3Tl0+i66GjuYQ03O6BJtq/PfP+pDEkjht2Ps=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x847wRLA092571;
 Wed, 4 Sep 2019 02:58:27 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 4 Sep
 2019 02:58:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 4 Sep 2019 02:58:27 -0500
Received: from [172.24.190.117] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x847wP5s017417;
 Wed, 4 Sep 2019 02:58:26 -0500
To: Fabien Dessenne <fabien.dessenne@st.com>, <u-boot@lists.denx.de>, Loic
 Pallardy <loic.pallardy@st.com>
References: <1567583602-17022-1-git-send-email-fabien.dessenne@st.com>
From: Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <bba9f02c-f4a8-04d9-4159-a96dc9921e25@ti.com>
Date: Wed, 4 Sep 2019 13:27:43 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1567583602-17022-1-git-send-email-fabien.dessenne@st.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] remoteproc: elf_loader: fix program
	header parsing
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



On 04/09/19 1:23 PM, Fabien Dessenne wrote:
> Fix an issue where some sections are never loaded : if p_type is
> different from PT_LOAD the phdr pointer must be incremented.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>

Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>

Thanks and regards,
Lokesh

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

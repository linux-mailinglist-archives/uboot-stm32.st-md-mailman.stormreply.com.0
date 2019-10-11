Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFEED5BBA
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 08:56:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 588B5C36B0C
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 06:56:17 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18A26C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 19:57:19 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9BJvESQ053646;
 Fri, 11 Oct 2019 14:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1570823834;
 bh=q8a8C/MBfNjgohSWX0dZr+jIa/CoZoanPTf2oivU9Uo=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ZVvUWqKdTOofZq/ZlHw8nMBY8oLLzA+uabCDs0tXqzJqyWldA5Vg51wSCPdJ7jS2L
 9ZS8gqy8l16E8TgJG2E4+0vAvnhd34cp/QMrNH52gO76uC/giSPHCndi3w55Vj5E8j
 nIHpLCxScAvi/81VSaQoZlScYdajdhextqoe4oa4=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9BJvEPt062947
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Oct 2019 14:57:14 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 11
 Oct 2019 14:57:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 11 Oct 2019 14:57:09 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9BJvDVB068451;
 Fri, 11 Oct 2019 14:57:13 -0500
To: Fabien Dessenne <fabien.dessenne@st.com>, Simon Glass <sjg@chromium.org>, 
 Patrick Delaunay <patrick.delaunay@st.com>, Christophe Kerello
 <christophe.kerello@st.com>, Patrice Chotard <patrice.chotard@st.com>,
 "Vutla, Lokesh" <lokeshvutla@ti.com>
References: <1570635389-8445-1-git-send-email-fabien.dessenne@st.com>
 <1570635389-8445-5-git-send-email-fabien.dessenne@st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <b8dc293b-8b72-71a0-3468-da89e920a345@ti.com>
Date: Fri, 11 Oct 2019 14:57:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1570635389-8445-5-git-send-email-fabien.dessenne@st.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Mon, 14 Oct 2019 06:56:16 +0000
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH 4/5] stm32mp1: Fixup the Linux
 DeviceTree with coprocessor information
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

Hi Fabien,

On 10/9/19 10:36 AM, Fabien Dessenne wrote:
> When the coprocessor has been started, provide the context to Linux
> kernel so it can handle it:
> - update the coprocessor node of kernel DeviceTree with the
>   "early-booted" property.

Has this property been acked by DT maintainers at the kernel-level?
We have used something similar but moving away from it and instead just
relying on reading the hardware reset status in the kernel remoteproc
driver, and configuring the driver accordingly.

> - write the resource table address in a dedicated backup register.

Is this an actual register on the SoC or some block of memory dedicated
for sharing information from U-Boot to kernel?

We have the same problem and I am currently going with a
design-by-contract approach for early-booted usecases where I am
expecting the resource table to be placed at a specific location in
memory regions given to remoteproc.

regards
Suman

> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  board/st/stm32mp1/stm32mp1.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 18f9b84..8c669d0 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -891,6 +891,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
>  #if defined(CONFIG_OF_BOARD_SETUP)
>  int ft_board_setup(void *blob, bd_t *bd)
>  {
> +	int off, id = 0; /* Copro id fixed to 0 as only one coproc on mp1 */
>  #ifdef CONFIG_FDT_FIXUP_PARTITIONS
>  	struct node_info nodes[] = {
>  		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_NOR,  },
> @@ -899,6 +900,17 @@ int ft_board_setup(void *blob, bd_t *bd)
>  	fdt_fixup_mtdparts(blob, nodes, ARRAY_SIZE(nodes));
>  #endif
>  
> +	/* Update DT if coprocessor started */
> +	off = fdt_path_offset(blob, "/mlahb/m4@10000000");
> +	if (off > 0) {
> +		if (!rproc_is_running(id)) {
> +			fdt_setprop_empty(blob, off, "early-booted");
> +		} else {
> +			fdt_delprop(blob, off, "early-booted");
> +			writel(0, TAMP_COPRO_RSC_TBL_ADDRESS);
> +		}
> +	}
> +
>  	return 0;
>  }
>  #endif
> @@ -918,10 +930,8 @@ static void board_copro_image_process(ulong fw_image, size_t fw_size)
>  	printf("Load Remote Processor %d with data@addr=0x%08lx %u bytes:%s\n",
>  	       id, fw_image, fw_size, ret ? " Failed!" : " Success!");
>  
> -	if (!ret) {
> +	if (!ret)
>  		rproc_start(id);
> -		env_set("copro_state", "booted");
> -	}
>  }
>  
>  U_BOOT_FIT_LOADABLE_HANDLER(IH_TYPE_COPRO, board_copro_image_process);
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

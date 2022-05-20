Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD3952E500
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 08:30:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5A15C03FEB;
	Fri, 20 May 2022 06:30:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94C66C03FCD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 06:30:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K36qgm024416;
 Fri, 20 May 2022 08:30:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ODDxzEYvfSghYbCy0lwhLqKj/H4MP8Se5BdG/yj+t5Y=;
 b=glELH2Z9k6oOHliOpRhoyToYps6AqLe20uCRc0YGjmlvw4nmTMH3eRNVSHIohB6KHqmb
 cvTsk/yoT9Ee4e3OFN/U4fKi1TW2aOM8ci59+IcMfg+VoAzIG+XiHmp8BsA0mzMwultj
 ecJl/ZoUvXz1jzTrgJVK/NF3x5F9OLKO6X9uGfgWyazNVYYB6CgM2+sQPGlBckFx/L9b
 XZxugBeBdtaLJZ+HObIXuzksE/80MaryMZcTN/BncCFijmsoTxHM5Bkrx5nkOnexdPYD
 SS75z1uSLYVqcveZrzFxOsb85sYNvvscRW14CxhH68SOFstKz4p+GD685HDgUGwgFlew bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23aj64q7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 08:30:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 35CA910002A;
 Fri, 20 May 2022 08:30:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A709210F9E;
 Fri, 20 May 2022 08:30:05 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.50) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 08:30:04 +0200
Message-ID: <6bc027ea-b7c5-0d26-e61e-f07d3138136a@foss.st.com>
Date: Fri, 20 May 2022 08:30:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220519090726.1.I90e5b703cfebfe4c411fc13420155b9f9cfb0380@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220519090726.1.I90e5b703cfebfe4c411fc13420155b9f9cfb0380@changeid>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_02,2022-05-19_03,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] board: stm32mp1: convert to livetree
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

Hi Patrick

On 5/19/22 09:07, Patrick Delaunay wrote:
> Replace gd->fdt_blob access with fdt_getprop() function to the
> function ofnode_get_property() to support a live tree.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  board/st/stm32mp1/stm32mp1.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 07b1a63db7..700ff9ca07 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -82,11 +82,6 @@
>  #define SYSCFG_PMCSETR_ETH_SEL_RGMII	BIT(21)
>  #define SYSCFG_PMCSETR_ETH_SEL_RMII	BIT(23)
>  
> -/*
> - * Get a global data pointer
> - */
> -DECLARE_GLOBAL_DATA_PTR;
> -
>  #define USB_LOW_THRESHOLD_UV		200000
>  #define USB_WARNING_LOW_THRESHOLD_UV	660000
>  #define USB_START_LOW_THRESHOLD_UV	1230000
> @@ -116,8 +111,8 @@ int checkboard(void)
>  		mode = "basic";
>  	}
>  
> -	fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
> -				 &fdt_compat_len);
> +	fdt_compat = ofnode_get_property(ofnode_root(), "compatible",
> +					 &fdt_compat_len);
>  
>  	log_info("Board: stm32mp1 in %s mode (%s)\n", mode,
>  		 fdt_compat && fdt_compat_len ? fdt_compat : "");
> @@ -690,8 +685,8 @@ int board_late_init(void)
>  	int buf_len;
>  
>  	if (IS_ENABLED(CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG)) {
> -		fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
> -					 &fdt_compat_len);
> +		fdt_compat = ofnode_get_property(ofnode_root(), "compatible",
> +						 &fdt_compat_len);
>  		if (fdt_compat && fdt_compat_len) {
>  			if (strncmp(fdt_compat, "st,", 3) != 0) {
>  				env_set("board_name", fdt_compat);
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

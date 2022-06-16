Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B81C154DB26
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 Jun 2022 08:59:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 723F1C035BF;
	Thu, 16 Jun 2022 06:59:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FFEDC32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 06:59:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25G5B2mN025343;
 Thu, 16 Jun 2022 08:59:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=agX/6Wl9OzJnk6xzccfZ+hHlFGLcIkUmvHX5kpBj4/c=;
 b=Eyd4hmBNiakY531tJvz7hI74bJhNmlhPxuDdObAG5tMc/Ydm8ACYAyj1qzVkRuGeD+T4
 JkBNXhF00uDL7PArO36AZLlS1LV+hIrENSwWD5eh0ebeKauIygMfcdKH5GvE1lfoCL53
 4Jdpwchx3m3U0e6909EQBPBca81aWVfVTZu+7vMXGLU/QZY2xTbwwbqF0Wh2w0Aym2bU
 gC/Ru6qZ5WFfGFozWIMqJeyJOyYZu6dxn6iZD/4QnJ4OvixY9E3Xd2H8/e8Lwl8sgGDn
 4SIiINSlVdOgxKXO5VLof33b3l+1PXM/ulGrKnpDn3j/ru4kJcyJR1yOAKCpTO/mCCGc 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gp2tywjke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jun 2022 08:59:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E6DC410002A;
 Thu, 16 Jun 2022 08:59:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A18BF20F6C5;
 Thu, 16 Jun 2022 08:59:07 +0200 (CEST)
Received: from [10.201.20.162] (10.201.20.162) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 16 Jun
 2022 08:59:06 +0200
Message-ID: <8456e36e-836c-a414-1280-83f97cf23fde@foss.st.com>
Date: Thu, 16 Jun 2022 08:59:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220615194135.v2.1.I9cc1b8d493af70f2d448bea518372ab7c29afc50@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220615194135.v2.1.I9cc1b8d493af70f2d448bea518372ab7c29afc50@changeid>
X-Originating-IP: [10.201.20.162]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-16_02,2022-06-15_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2] configs: stm32mp: cleanup the
	stm32mp15 file
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

On 6/15/22 19:41, Patrick Delaunay wrote:
> Remove STM32_SYSRAM_END and clean the comments in stm32mp15_common.h file
> after moving some CONFIG to Kconfig: CONFIG_SYS_CBSIZE,
> CONFIG_SPL_MAX_FOOTPRINT, CONFIG_SYS_SPL_MALLOC_START and
> CONFIG_SYS_SPL_MALLOC_SIZE.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> Changes in v2:
> - remove the define STM32_SYSRAM_END, no more used
> 
>  include/configs/stm32mp15_common.h | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/include/configs/stm32mp15_common.h b/include/configs/stm32mp15_common.h
> index 08a72483bf..fc636beb3f 100644
> --- a/include/configs/stm32mp15_common.h
> +++ b/include/configs/stm32mp15_common.h
> @@ -15,10 +15,6 @@
>   */
>  #define CONFIG_SYS_SDRAM_BASE			STM32_DDR_BASE
>  
> -/*
> - * Console I/O buffer size
> - */
> -
>  /*
>   * For booting Linux, use the first 256 MB of memory, since this is
>   * the maximum mapped by the Linux kernel during initialization.
> @@ -28,13 +24,6 @@
>  /* Extend size of kernel image for uncompression */
>  #define CONFIG_SYS_BOOTM_LEN		SZ_32M
>  
> -/* SPL support */
> -#ifdef CONFIG_SPL
> -/* SPL use DDR */
> -
> -/* Restrict SPL to fit within SYSRAM */
> -#define STM32_SYSRAM_END		(STM32_SYSRAM_BASE + STM32_SYSRAM_SIZE)
> -#endif /* #ifdef CONFIG_SPL */
>  /*MMC SD*/
>  #define CONFIG_SYS_MMC_MAX_DEVICE	3
>  
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks 
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

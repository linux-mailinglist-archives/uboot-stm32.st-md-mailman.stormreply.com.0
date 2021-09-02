Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B950E3FEE1B
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Sep 2021 14:52:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64E06C57B53;
	Thu,  2 Sep 2021 12:52:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA5B3C57B51
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Sep 2021 12:52:43 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1828wQJU032494;
 Thu, 2 Sep 2021 14:52:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=cPULdEioJbX3TCVTt9WpWmLerrsKTxo3xL2RQLQLbs4=;
 b=D5wrUmYd4WSdoSskO6RgRR5l8mlN/r6r1VX9kiqQ0t0u4kOKdD2aPgQZD3lfxseBvprv
 dzbVARP9wZz4nDSWn30UbfwD9Xtt5KKQvSq/5jxeHLxhX3VllxOX5/b97B5I2xu5ZA1n
 wX2Cy/AxQNEyH5w6i4BGiiO3MVkGkSnN7nRCWbPIlZWcp1qWPZ1pxTveMlpEGtZVU4AT
 33Mx5NlDCzi9udzXX5UluctnHl/dDMf/2DqOv6sFnwRC/ga8sYIuDLobj30FzzpDkQh/
 V/5aaAfANtezg7Pd9NyUDz6QtR5U3L9ESXVhREE2KwtRImgvGZCSNq1XWbfm1p7Wlu3q +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3atujr1b0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Sep 2021 14:52:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 49CEE10002A;
 Thu,  2 Sep 2021 14:52:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 38BA425643C;
 Thu,  2 Sep 2021 14:52:38 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Sep
 2021 14:52:37 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210902120202.1.If7ddbb0eecde3d5db357ef27cb0833abbdacd362@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <98ab4a6e-2448-4376-6d92-7b525810e2fd@foss.st.com>
Date: Thu, 2 Sep 2021 14:52:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210902120202.1.If7ddbb0eecde3d5db357ef27cb0833abbdacd362@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-02_04,2021-09-02_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Jean-Philippe ROMAIN <jean-philippe.romain@st.com>,
 Simon Glass <sjg@chromium.org>, Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 dillon min <dillon.minfei@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] arm: stm32: Disable ATAGs support
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

On 9/2/21 12:02 PM, Patrick Delaunay wrote:
> These platforms never had to support an ATAGs-based Linux Kernel, so
> remove the options.
> 
> Cc: Marek Vasut <marex@denx.de>
> Signed-off-by: Tom Rini <trini@konsulko.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> Hi,
> 
> this patch is a rebased version of the STM32 part [1] of Tom's patchset [2].
> 
> I also update the new file include/configs/stm32h750-art-pi.h
> 
> [1] [13/13] arm: stm32: Disable ATAGs support
> https://patchwork.ozlabs.org/project/uboot/patch/20210204022415.20589-13-trini@konsulko.com/
> 
> [2] arm: nanopi2: Remove unused code
>     https://patchwork.ozlabs.org/project/uboot/list/?series=227910&state=*
> 
> Patrick
> 
> 
>  include/configs/stm32f429-discovery.h  | 5 -----
>  include/configs/stm32f429-evaluation.h | 5 -----
>  include/configs/stm32f469-discovery.h  | 5 -----
>  include/configs/stm32f746-disco.h      | 5 -----
>  include/configs/stm32h743-disco.h      | 5 -----
>  include/configs/stm32h743-eval.h       | 5 -----
>  include/configs/stm32h750-art-pi.h     | 5 -----
>  include/configs/stm32mp1.h             | 5 -----
>  8 files changed, 40 deletions(-)
> 
> diff --git a/include/configs/stm32f429-discovery.h b/include/configs/stm32f429-discovery.h
> index 9d029fbcc6..dbbce49475 100644
> --- a/include/configs/stm32f429-discovery.h
> +++ b/include/configs/stm32f429-discovery.h
> @@ -27,11 +27,6 @@
>  
>  #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
>  
> -#define CONFIG_CMDLINE_TAG
> -#define CONFIG_SETUP_MEMORY_TAGS
> -#define CONFIG_INITRD_TAG
> -#define CONFIG_REVISION_TAG
> -
>  #define CONFIG_SYS_CBSIZE		1024
>  
>  #define CONFIG_SYS_MALLOC_LEN		(2 << 20)
> diff --git a/include/configs/stm32f429-evaluation.h b/include/configs/stm32f429-evaluation.h
> index fefdb2dd15..29a41e8067 100644
> --- a/include/configs/stm32f429-evaluation.h
> +++ b/include/configs/stm32f429-evaluation.h
> @@ -29,11 +29,6 @@
>  
>  #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
>  
> -#define CONFIG_CMDLINE_TAG
> -#define CONFIG_SETUP_MEMORY_TAGS
> -#define CONFIG_INITRD_TAG
> -#define CONFIG_REVISION_TAG
> -
>  #define CONFIG_SYS_CBSIZE		1024
>  
>  #define CONFIG_SYS_MALLOC_LEN		(1 * 1024 * 1024)
> diff --git a/include/configs/stm32f469-discovery.h b/include/configs/stm32f469-discovery.h
> index ba9f05a61b..b9b932c651 100644
> --- a/include/configs/stm32f469-discovery.h
> +++ b/include/configs/stm32f469-discovery.h
> @@ -29,11 +29,6 @@
>  
>  #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
>  
> -#define CONFIG_CMDLINE_TAG
> -#define CONFIG_SETUP_MEMORY_TAGS
> -#define CONFIG_INITRD_TAG
> -#define CONFIG_REVISION_TAG
> -
>  #define CONFIG_SYS_CBSIZE		1024
>  
>  #define CONFIG_SYS_MALLOC_LEN		(1 * 1024 * 1024)
> diff --git a/include/configs/stm32f746-disco.h b/include/configs/stm32f746-disco.h
> index 08d050adfa..b72b989c2c 100644
> --- a/include/configs/stm32f746-disco.h
> +++ b/include/configs/stm32f746-disco.h
> @@ -36,11 +36,6 @@
>  
>  #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
>  
> -#define CONFIG_CMDLINE_TAG
> -#define CONFIG_SETUP_MEMORY_TAGS
> -#define CONFIG_INITRD_TAG
> -#define CONFIG_REVISION_TAG
> -
>  #define CONFIG_SYS_CBSIZE		1024
>  
>  #define CONFIG_SYS_MALLOC_LEN		(1 * 1024 * 1024)
> diff --git a/include/configs/stm32h743-disco.h b/include/configs/stm32h743-disco.h
> index 6e10dbdfe9..e5bb08eec7 100644
> --- a/include/configs/stm32h743-disco.h
> +++ b/include/configs/stm32h743-disco.h
> @@ -24,11 +24,6 @@
>  
>  #define CONFIG_SYS_HZ_CLOCK		1000000
>  
> -#define CONFIG_CMDLINE_TAG
> -#define CONFIG_SETUP_MEMORY_TAGS
> -#define CONFIG_INITRD_TAG
> -#define CONFIG_REVISION_TAG
> -
>  #define CONFIG_SYS_MAXARGS		16
>  #define CONFIG_SYS_MALLOC_LEN		(1 * 1024 * 1024)
>  
> diff --git a/include/configs/stm32h743-eval.h b/include/configs/stm32h743-eval.h
> index 268d39c7ad..89169f85d5 100644
> --- a/include/configs/stm32h743-eval.h
> +++ b/include/configs/stm32h743-eval.h
> @@ -24,11 +24,6 @@
>  
>  #define CONFIG_SYS_HZ_CLOCK		1000000
>  
> -#define CONFIG_CMDLINE_TAG
> -#define CONFIG_SETUP_MEMORY_TAGS
> -#define CONFIG_INITRD_TAG
> -#define CONFIG_REVISION_TAG
> -
>  #define CONFIG_SYS_MAXARGS		16
>  #define CONFIG_SYS_MALLOC_LEN		(1 * 1024 * 1024)
>  
> diff --git a/include/configs/stm32h750-art-pi.h b/include/configs/stm32h750-art-pi.h
> index 3fd5461167..a9006e224a 100644
> --- a/include/configs/stm32h750-art-pi.h
> +++ b/include/configs/stm32h750-art-pi.h
> @@ -24,11 +24,6 @@
>  
>  #define CONFIG_SYS_HZ_CLOCK		1000000
>  
> -#define CONFIG_CMDLINE_TAG
> -#define CONFIG_SETUP_MEMORY_TAGS
> -#define CONFIG_INITRD_TAG
> -#define CONFIG_REVISION_TAG
> -
>  #define CONFIG_SYS_MAXARGS		16
>  #define CONFIG_SYS_MALLOC_LEN		(1 * 1024 * 1024)
>  
> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
> index b372838be8..fb4e4fb0bc 100644
> --- a/include/configs/stm32mp1.h
> +++ b/include/configs/stm32mp1.h
> @@ -33,11 +33,6 @@
>  #define CONFIG_LOADADDR			0xc2000000
>  #define CONFIG_SYS_LOAD_ADDR		CONFIG_LOADADDR
>  
> -/* ATAGs */
> -#define CONFIG_CMDLINE_TAG
> -#define CONFIG_SETUP_MEMORY_TAGS
> -#define CONFIG_INITRD_TAG
> -
>  /*
>   * For booting Linux, use the first 256 MB of memory, since this is
>   * the maximum mapped by the Linux kernel during initialization.
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Tested-by: Patrice Chotard <patrice.chotard@foss.st.com> 

Thanks
Patrice+

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

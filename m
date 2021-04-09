Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F3C359AC8
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 12:03:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F017DC5718B;
	Fri,  9 Apr 2021 10:03:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3D84C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 10:03:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 139A2jxe022197; Fri, 9 Apr 2021 12:03:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=mr1j0ge1QYcP7qzuNFGQRsP2sc8qbqLJjrcIwAOB80g=;
 b=Jabvp51E/T4iaiSVbjjlkOffdaaW0nnRGK2cKlTaBMBo2Wh1AXHpt1iOp6X1mnHsu99I
 kDKaAqnZVp06l+VElpE6omeOGMgfHCtsSjEzIKvZ2UDmqCncM0agDLJDXqB/X6jm4bIL
 OHgAzSyRbg4TS4/T9NkrtUg5mAmE15Lw2gJ4XFkB0+s1jCUUAjgBA9xdxJLS/2H6TMyk
 3tXAAXxrSUmrqpHFg+bZ2m6FDxNHU2RJTx5s/1sNiJfWIlgQNxoVBb9OSvGRp5Mq4E29
 0BKrpf36noZ1170AifcjESKt5P86N5CyX0u7pmvD0PNRDS5SMJcrZ6Q1fCO5Y/4tP2YT kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37tj4d96b8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 12:03:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E963B10002A;
 Fri,  9 Apr 2021 12:03:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD8B2229A3A;
 Fri,  9 Apr 2021 12:03:14 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Apr
 2021 12:03:14 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210406092731.1.Iad88039569017850ed77dfae267b261f8efc8ad7@changeid>
 <20210406092731.2.I5436203a1417ef602cffce8d3e56f84c5f92c539@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <775201c6-3ca8-925b-bc4b-2dbefbcb3118@foss.st.com>
Date: Fri, 9 Apr 2021 12:03:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210406092731.2.I5436203a1417ef602cffce8d3e56f84c5f92c539@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_05:2021-04-09,
 2021-04-09 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] stm32mp: replace printf by log macro
 in setup_boot_mode
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

On 4/6/21 9:27 AM, Patrick Delaunay wrote:
> Replace the remaining printf in setup_boot_mode() by log macro
> to handle filtering for log features.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cpu.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index 2f05c5e91b..621a6b7c89 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -502,8 +502,8 @@ static void setup_boot_mode(void)
>  			if (IS_ENABLED(CONFIG_CMD_STM32PROG_SERIAL))
>  				gd->flags &= ~(GD_FLG_SILENT |
>  					       GD_FLG_DISABLE_CONSOLE);
> -			printf("uart%d = %s not found in device tree!\n",
> -			       instance + 1, cmd);
> +			log_err("uart%d = %s not found in device tree!\n",
> +				instance + 1, cmd);
>  			break;
>  		}
>  		sprintf(cmd, "%d", dev_seq(dev));
> @@ -514,7 +514,7 @@ static void setup_boot_mode(void)
>  		if (IS_ENABLED(CONFIG_CMD_STM32PROG_SERIAL) && gd->cur_serial_dev != dev) {
>  			gd->flags &= ~(GD_FLG_SILENT |
>  				       GD_FLG_DISABLE_CONSOLE);
> -			printf("serial boot with console enabled!\n");
> +			log_info("serial boot with console enabled!\n");
>  		}
>  		break;
>  	case BOOT_SERIAL_USB:
> @@ -546,7 +546,7 @@ static void setup_boot_mode(void)
>  
>  	switch (forced_mode) {
>  	case BOOT_FASTBOOT:
> -		printf("Enter fastboot!\n");
> +		log_info("Enter fastboot!\n");
>  		env_set("preboot", "env set preboot; fastboot 0");
>  		break;
>  	case BOOT_STM32PROG:
> @@ -556,7 +556,7 @@ static void setup_boot_mode(void)
>  	case BOOT_UMS_MMC0:
>  	case BOOT_UMS_MMC1:
>  	case BOOT_UMS_MMC2:
> -		printf("Enter UMS!\n");
> +		log_info("Enter UMS!\n");
>  		instance = forced_mode - BOOT_UMS_MMC0;
>  		sprintf(cmd, "env set preboot; ums 0 mmc %d", instance);
>  		env_set("preboot", cmd);
> 
Applied to u-boot-stm/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

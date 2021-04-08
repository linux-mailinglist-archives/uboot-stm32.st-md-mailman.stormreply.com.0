Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FD735855F
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Apr 2021 15:57:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9858DC5719D;
	Thu,  8 Apr 2021 13:57:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D6D9C5718B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Apr 2021 13:57:12 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 138DlUEf015402; Thu, 8 Apr 2021 15:57:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=aCoU0nHbDK2Jrcc9pBs7jHOL/mnaNhhGfbzPX0iB8bU=;
 b=ea/h0Tf9EEKEKZJ3F1jBXZNkuE5th34GE2Ew/nZ6tWZTxSeYoGXjq7/j1hUfVUc41ZKe
 SrcfUgzWk2/yQTxIC4PnCAEj4SBMrvzMq7J9/9av4y32q2FOihekUbLkmQw7DYMYOxpN
 AR+ChNsHg9P0Lgcgd12NpFfCOVF+1KK3NABe+Fezahe+/C0EfC7NwaRcSzWvHFNliH93
 1AznrWZd8r8+AQLpbR3rTfveYAMzjdmxixgXfHfnfzLKcOgfUJffjAOaa0I7coFY/j/T
 FkTGeFv414Tev6L7Zn8ehQTRkxU5HT8pq24++9uuTuu2DbqLebvAThfTUhiRWzMXRW3B 9A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37sw5ytag0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 15:57:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C9E03100034;
 Thu,  8 Apr 2021 15:57:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BF9FF23AABA;
 Thu,  8 Apr 2021 15:57:10 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 8 Apr
 2021 15:57:10 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210406092731.1.Iad88039569017850ed77dfae267b261f8efc8ad7@changeid>
 <20210406092731.2.I5436203a1417ef602cffce8d3e56f84c5f92c539@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <6bf125e7-a8bf-fb3b-0756-b55884c9439b@foss.st.com>
Date: Thu, 8 Apr 2021 15:57:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210406092731.2.I5436203a1417ef602cffce8d3e56f84c5f92c539@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-08_03:2021-04-08,
 2021-04-08 signatures=0
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

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 320783599EF
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 11:54:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0627C5719D;
	Fri,  9 Apr 2021 09:54:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49589C5718B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 09:54:41 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1399lZYS010990; Fri, 9 Apr 2021 11:54:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=NlGsg9cDIl2IbD7lrfTEmGW5wY2BTG/92ysSAuWb4Bg=;
 b=q4tqhiPECkinXUskJLHwVO/+Sjci0WOfNfy1TFKihJNmI/PE+c06buxszYyBU2V25pIM
 G2783p26/G1UmQQzdzoA0dxp0gcwyYz0E8gDs1pcAAW2KlSZsK/pat2ZGS/m0Kggn7Tj
 lefoBJnem4B8P1lRUlCDLzEPa7kxnHUIg20/6mZ66AQ+mb9eQjbxhWKpenVQc6agWiIG
 UQkyyL/bCZpFkgOGstmd30M17Uspc+gjjQVqD8NFlgGJJ6Ba4PIV2rygKvRaMYj5bQP/
 iQ0sW79drrEONkfLyP+9M6a3yaPMvKkxIGSl6EZXCjxu7RAHPqT5OeXZcqv+AvyUyNMp Mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37tke8ghp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 11:54:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 548A810002A;
 Fri,  9 Apr 2021 11:54:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 447D5228A0D;
 Fri,  9 Apr 2021 11:54:39 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Apr
 2021 11:54:38 +0200
To: Jagan Teki <jagan@amarulasolutions.com>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, Matteo Lisi <matteo.lisi@engicam.com>
References: <20210316162207.35641-1-jagan@amarulasolutions.com>
 <20210316162207.35641-4-jagan@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <2929736b-3d22-3660-f05e-2b352e3ec93d@foss.st.com>
Date: Fri, 9 Apr 2021 11:54:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210316162207.35641-4-jagan@amarulasolutions.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_05:2021-04-09,
 2021-04-09 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH v3 3/8] ARM: stm32: Imply SPL_SPI_LOAD
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

Hi Jagan

On 3/16/21 5:22 PM, Jagan Teki wrote:
> SPI Load isn't mandatory for STM32 builds.
> 
> Let's imply instead of select it to get rid of build
> issues for non-SPI defconfigs.
> 
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v3:
> - add if SPL_SPI_SUPPORT
> - collect Patrice r-b
> Changes for v2:
> - collect Patrice r-b
> 
>  arch/arm/mach-stm32mp/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index f538d7cb83..c61eb424c1 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -16,13 +16,13 @@ config SPL
>  	select SPL_REGMAP
>  	select SPL_DM_RESET
>  	select SPL_SERIAL_SUPPORT
> -	select SPL_SPI_LOAD
>  	select SPL_SYSCON
>  	select SPL_WATCHDOG_SUPPORT if WATCHDOG
>  	imply BOOTSTAGE_STASH if SPL_BOOTSTAGE
>  	imply SPL_BOOTSTAGE if BOOTSTAGE
>  	imply SPL_DISPLAY_PRINT
>  	imply SPL_LIBDISK_SUPPORT
> +	imply SPL_SPI_LOAD if SPL_SPI_SUPPORT
>  
>  config SYS_SOC
>  	default "stm32mp"
> 
Applied to u-boot-stm/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55154424D29
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Oct 2021 08:18:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08A1CC597B2;
	Thu,  7 Oct 2021 06:18:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD93CC32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Oct 2021 06:18:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 196NaDSW008767; 
 Thu, 7 Oct 2021 08:18:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=GmBkBLWAWrGjqLV6JMk7yGWxZt3QdpIDoY2EeeJONZ8=;
 b=jqZ2PfIGOwYwPCKksDlU9Hb0ljwdGaw6ONNoz8CAB6Iney63MbRQkCDa8jyDUOGXCQ/C
 iBsiFOAp42wubvR9b25zMdXnvEjDpBBPhIsQlOUZXI1GAY/aQVicEAG3p4H3sLo+35m6
 QyxHzHe9w9IX0uAF7MAcGPwUrhGOQiXWVDTy69nvn68wkS0zPcLiVsHF3orXE9QcNI0f
 q2kdurIfp42htTqOQeoC2jBuB/kNYXPc6xnZHA0vQhKWYMWWkK8rfCPIb/YsNAiE+yQ/
 4RAYkPSPCrgajw8TCvA7MFlXNDU33829BnVfyQTgpoJL+G+y7HA5uIl1O1GzaoCVBq1+ 4w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bhnm9htff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 08:18:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 773D910002A;
 Thu,  7 Oct 2021 08:18:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2831C2128CD;
 Thu,  7 Oct 2021 08:18:28 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 7 Oct
 2021 08:18:27 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211006171607.1.Ifd4a8d41835a2a90cc00f00a5862d97f60e23c6f@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <cee7d03c-0c25-f5be-cc94-dd2c4d021cf8@foss.st.com>
Date: Thu, 7 Oct 2021 08:18:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006171607.1.Ifd4a8d41835a2a90cc00f00a5862d97f60e23c6f@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-06_04,2021-10-07_01,2020-04-07_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, Rick Chen <rick@andestech.com>,
 Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32f429: move CONFIG_BOOTCOMMAND in
	defconfig
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

On 10/6/21 5:16 PM, Patrick Delaunay wrote:
> Move CONFIG_BOOTCOMMAND defined in Kconfig in the board defconfig.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  configs/stm32f429-discovery_defconfig | 1 +
>  include/configs/stm32f429-discovery.h | 3 ---
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/configs/stm32f429-discovery_defconfig b/configs/stm32f429-discovery_defconfig
> index b6388cf00a..2b0f93fd65 100644
> --- a/configs/stm32f429-discovery_defconfig
> +++ b/configs/stm32f429-discovery_defconfig
> @@ -12,6 +12,7 @@ CONFIG_TARGET_STM32F429_DISCOVERY=y
>  CONFIG_ENV_VARS_UBOOT_CONFIG=y
>  CONFIG_SYS_LOAD_ADDR=0x90400000
>  CONFIG_BOOTDELAY=3
> +CONFIG_BOOTCOMMAND="run bootcmd_romfs"
>  CONFIG_USE_BOOTARGS=y
>  CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
>  # CONFIG_DISPLAY_CPUINFO is not set
> diff --git a/include/configs/stm32f429-discovery.h b/include/configs/stm32f429-discovery.h
> index 525a5277d8..162001d457 100644
> --- a/include/configs/stm32f429-discovery.h
> +++ b/include/configs/stm32f429-discovery.h
> @@ -27,9 +27,6 @@
>  
>  #define CONFIG_SYS_CBSIZE		1024
>  
> -#define CONFIG_BOOTCOMMAND						\
> -	"run bootcmd_romfs"
> -
>  #define CONFIG_EXTRA_ENV_SETTINGS \
>  	"bootargs_romfs=uclinux.physaddr=0x08180000 root=/dev/mtdblock0\0" \
>  	"bootcmd_romfs=setenv bootargs ${bootargs} ${bootargs_romfs};" \
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

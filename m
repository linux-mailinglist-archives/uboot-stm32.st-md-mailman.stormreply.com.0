Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C451A82D96F
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jan 2024 14:07:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85517C6B476;
	Mon, 15 Jan 2024 13:07:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A567AC6B457
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 13:07:18 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40F8tekj001615; Mon, 15 Jan 2024 14:07:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=4MyK74+m4WH6pxjrxHNnsWzYmKovMvmICuJ8Qqv66Y8=; b=eV
 oDeJwzDu5BApRCR+OGUEG+NpJcMxAQp3BkQca0MeqkZch92Xsc2fOiqm/U1XgSLs
 gUFMXlvrz29SZCE/6dPb0g+jTkxmmneRGf5qZWLCyEku1eJbtcAm+/3AaZrtBJrW
 Ru1UPKIUOi8FM5yXVCo3NpkojTLB6zY57h4cU9uh6Jk2OXUntABBdX+bSle8IcY/
 UE6707M0R8NnFqarXVJBFFs9a9ULcj/IwMAUPWwNZADMn3N0pWZRUx2euX1+q0B0
 dC/zuNxnLRdsgzeOO7P/0+rYUbTPny/cnIdRiQDE+rwmlg7k1y5d1YzWoobZH5Ki
 ajUdsxjTRNZyz153ISrw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vm4y4pcg3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jan 2024 14:07:14 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F2DA510002A;
 Mon, 15 Jan 2024 14:07:13 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E7A302815E7;
 Mon, 15 Jan 2024 14:07:13 +0100 (CET)
Received: from [10.201.20.205] (10.201.20.205) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Jan
 2024 14:07:13 +0100
Message-ID: <e9751242-623c-444a-88fe-e5d697d65813@foss.st.com>
Date: Mon, 15 Jan 2024 14:07:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240115124657.39109-1-patrick.delaunay@foss.st.com>
 <20240115134642.7.I122ede30eb83184b996b7d3e1c480418b29ffbe1@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240115134642.7.I122ede30eb83184b996b7d3e1c480418b29ffbe1@changeid>
X-Originating-IP: [10.201.20.205]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Igor Opaniuk <igor.opaniuk@foundries.io>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>
Subject: Re: [Uboot-stm32] [PATCH 07/12] stm32mp: add setup_serial_number
	for stm32mp25
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



On 1/15/24 13:46, Patrick Delaunay wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Add support of serial number for stm32mp25, gets from OTP with BSEC driver.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  .../arm/mach-stm32mp/include/mach/sys_proto.h |  1 +
>  arch/arm/mach-stm32mp/soc.c                   | 31 +++++++++++++++++++
>  arch/arm/mach-stm32mp/stm32mp1/cpu.c          | 27 ----------------
>  arch/arm/mach-stm32mp/stm32mp2/cpu.c          |  2 ++
>  4 files changed, 34 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> index 83388fdb7371..2a65efc0a50a 100644
> --- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> +++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> @@ -97,6 +97,7 @@ u32 get_bootauth(void);
>  
>  int get_eth_nb(void);
>  int setup_mac_address(void);
> +int setup_serial_number(void);
>  
>  /* board power management : configure vddcore according OPP */
>  void board_vddcore_init(u32 voltage_mv);
> diff --git a/arch/arm/mach-stm32mp/soc.c b/arch/arm/mach-stm32mp/soc.c
> index 8d5fa474ccaf..ff70ebe97464 100644
> --- a/arch/arm/mach-stm32mp/soc.c
> +++ b/arch/arm/mach-stm32mp/soc.c
> @@ -3,7 +3,11 @@
>   * Copyright (C) 2024, STMicroelectronics - All Rights Reserved
>   */
>  
> +#include <env.h>
> +#include <misc.h>
>  #include <asm/arch/sys_proto.h>
> +#include <dm/device.h>
> +#include <dm/uclass.h>
>  
>  /* used when CONFIG_DISPLAY_CPUINFO is activated */
>  int print_cpuinfo(void)
> @@ -15,3 +19,30 @@ int print_cpuinfo(void)
>  
>  	return 0;
>  }
> +
> +int setup_serial_number(void)
> +{
> +	char serial_string[25];
> +	u32 otp[3] = {0, 0, 0 };
> +	struct udevice *dev;
> +	int ret;
> +
> +	if (env_get("serial#"))
> +		return 0;
> +
> +	ret = uclass_get_device_by_driver(UCLASS_MISC,
> +					  DM_DRIVER_GET(stm32mp_bsec),
> +					  &dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_SERIAL),
> +			otp, sizeof(otp));
> +	if (ret < 0)
> +		return ret;
> +
> +	sprintf(serial_string, "%08X%08X%08X", otp[0], otp[1], otp[2]);
> +	env_set("serial#", serial_string);
> +
> +	return 0;
> +}
> diff --git a/arch/arm/mach-stm32mp/stm32mp1/cpu.c b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
> index 00fea7929b2f..f84cb26fa565 100644
> --- a/arch/arm/mach-stm32mp/stm32mp1/cpu.c
> +++ b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
> @@ -336,33 +336,6 @@ __weak int setup_mac_address(void)
>  	return 0;
>  }
>  
> -static int setup_serial_number(void)
> -{
> -	char serial_string[25];
> -	u32 otp[3] = {0, 0, 0 };
> -	struct udevice *dev;
> -	int ret;
> -
> -	if (env_get("serial#"))
> -		return 0;
> -
> -	ret = uclass_get_device_by_driver(UCLASS_MISC,
> -					  DM_DRIVER_GET(stm32mp_bsec),
> -					  &dev);
> -	if (ret)
> -		return ret;
> -
> -	ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_SERIAL),
> -			otp, sizeof(otp));
> -	if (ret < 0)
> -		return ret;
> -
> -	sprintf(serial_string, "%08X%08X%08X", otp[0], otp[1], otp[2]);
> -	env_set("serial#", serial_string);
> -
> -	return 0;
> -}
> -
>  __weak void stm32mp_misc_init(void)
>  {
>  }
> diff --git a/arch/arm/mach-stm32mp/stm32mp2/cpu.c b/arch/arm/mach-stm32mp/stm32mp2/cpu.c
> index c0f6519e8d7c..301e365cf4f4 100644
> --- a/arch/arm/mach-stm32mp/stm32mp2/cpu.c
> +++ b/arch/arm/mach-stm32mp/stm32mp2/cpu.c
> @@ -69,6 +69,8 @@ void enable_caches(void)
>  
>  int arch_misc_init(void)
>  {
> +	setup_serial_number();
> +
>  	return 0;
>  }
>  
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

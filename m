Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFFB832A6F
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jan 2024 14:27:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2155C6DD74;
	Fri, 19 Jan 2024 13:27:48 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1485CC6DD73
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 13:27:47 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40JAn9JT027228; Fri, 19 Jan 2024 14:27:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=IEqc699oWTFkvRkW5177yKCixhvuedzggkZI7TUuQL0=; b=m2
 0W8UU/9Tk2K6jhThWQze7B6XBmXm496tpgJgdC7U9dq4sQ14/2HHwuqGslRv+Vnu
 HODHRBprxvBfcv+XqCKl/JqWZfvyGW2SveND5fSkuskkv1/wDQxU4AIJOuAt3Jxp
 w60pCrYTy7XBvwZ07LieJC0bq5dEWHJySxTJxUBWi2+zbLeXpjOENn/2tyWL7f8Z
 LASyV4QHVPZfQke/CqExEzc4r0QcjXPoVXWhAJ8+7ZVVmyEKIDv3kkEaw4O2i6SU
 hwozvc4QQDTVFJ9FrygcvcNS8HwNdxgLr5TEJ9lQvp7hUq+q4lN1iUWlawEmeIGT
 DNi+P/+NFu+JZ9123hVw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vnbqckdjj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jan 2024 14:27:46 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 69ACC100081;
 Fri, 19 Jan 2024 14:27:45 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6250224B89A;
 Fri, 19 Jan 2024 14:27:45 +0100 (CET)
Received: from [10.252.4.250] (10.252.4.250) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Jan
 2024 14:27:44 +0100
Message-ID: <e3cf19f1-0e69-400b-8fdd-a8b2843834d1@foss.st.com>
Date: Fri, 19 Jan 2024 14:27:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240115140557.57448-1-patrick.delaunay@foss.st.com>
 <20240115150451.v2.12.I23dadcfeb0941c41ad9d8dabeb6c70a0bb9a7b56@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240115150451.v2.12.I23dadcfeb0941c41ad9d8dabeb6c70a0bb9a7b56@changeid>
X-Originating-IP: [10.252.4.250]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_08,2024-01-19_02,2023-05-22_02
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2 12/14] board: st: stm32mp2: display the
 board identification
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



On 1/15/24 15:05, Patrick Delaunay wrote:
> Add the display of the STMicroelectronics board identification saved in OTP
> in stm32mp2 checkboard function.
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  board/st/stm32mp2/stm32mp2.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/board/st/stm32mp2/stm32mp2.c b/board/st/stm32mp2/stm32mp2.c
> index 9a881583d904..aa7dd31996ea 100644
> --- a/board/st/stm32mp2/stm32mp2.c
> +++ b/board/st/stm32mp2/stm32mp2.c
> @@ -9,9 +9,12 @@
>  #include <env.h>
>  #include <fdt_support.h>
>  #include <log.h>
> +#include <misc.h>
>  #include <asm/global_data.h>
>  #include <asm/arch/sys_proto.h>
> +#include <dm/device.h>
>  #include <dm/ofnode.h>
> +#include <dm/uclass.h>
>  
>  /*
>   * Get a global data pointer
> @@ -20,6 +23,9 @@ DECLARE_GLOBAL_DATA_PTR;
>  
>  int checkboard(void)
>  {
> +	int ret;
> +	u32 otp;
> +	struct udevice *dev;
>  	const char *fdt_compat;
>  	int fdt_compat_len;
>  
> @@ -27,6 +33,23 @@ int checkboard(void)
>  
>  	log_info("Board: stm32mp2 (%s)\n", fdt_compat && fdt_compat_len ? fdt_compat : "");
>  
> +	/* display the STMicroelectronics board identification */
> +	if (CONFIG_IS_ENABLED(CMD_STBOARD)) {
> +		ret = uclass_get_device_by_driver(UCLASS_MISC,
> +						  DM_DRIVER_GET(stm32mp_bsec),
> +						  &dev);
> +		if (!ret)
> +			ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_BOARD),
> +					&otp, sizeof(otp));
> +		if (ret > 0 && otp)
> +			log_info("Board: MB%04x Var%d.%d Rev.%c-%02d\n",
> +				 otp >> 16,
> +				 (otp >> 12) & 0xF,
> +				 (otp >> 4) & 0xF,
> +				 ((otp >> 8) & 0xF) - 1 + 'A',
> +				 otp & 0xF);
> +	}
> +
>  	return 0;
>  }
>  
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

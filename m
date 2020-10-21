Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C72E294C28
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 14:02:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC672C3FAE0;
	Wed, 21 Oct 2020 12:02:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 195CCC3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 12:02:02 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LBw3Jk019943; Wed, 21 Oct 2020 14:02:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=qcCGz4R8L2uDTJ6xg5oyKURl0u8As68Am+sVojLk+xo=;
 b=du169BIpwfGyteceFfRU8sKG8imXhfnPtrsVp693ys25nF7db1+8vwg02lF/iXoHhCoW
 ILb2UAO2/GBLEtQvdH3/pHg2GUQ3yEF9Lfj4Abvv5UVr4hfx0Rv6Q9piyAbJluJqQvb+
 Gc3TMNxYaMGdlk+rrFEzEh10YgYnxuqjoJr/D+vQ1yGdhs2fuZloR/IeJaVN6nOHo7IZ
 0EtY5la0v1U70vfLwyhzL6DuzGXDzUN7ZeWyaEf20LNvqXFaWmQJGYMFVEoT2J7PoqK8
 qQZZMGInzLua1f4fePBx+lzpEpDCgQDN/IyBIyYA/4OEbtkLLYKKoTn+zfW4UJsixD6T sA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347p30swvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 14:02:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 23EA1100038;
 Wed, 21 Oct 2020 14:01:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1AB642E67C2;
 Wed, 21 Oct 2020 14:01:59 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 14:01:58 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 14:01:58 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 03/33] arm: stm32mp: bsec: migrate trace to log macro
Thread-Index: AQHWogrAlfqqwHuGcUu8vUT2iHP7camh3lUA
Date: Wed, 21 Oct 2020 12:01:58 +0000
Message-ID: <f72a1baf-a8be-8520-65d6-794e56e2e3c7@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <20201014091646.4233-4-patrick.delaunay@st.com>
In-Reply-To: <20201014091646.4233-4-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <FFE5085C0E3FCA469CD6ADF7C2D16169@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 03/33] arm: stm32mp: bsec: migrate trace
	to log macro
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


On 10/14/20 11:16 AM, Patrick Delaunay wrote:
> Define LOG_CATEGORY, change pr_debug to dev_dbg and remove "bsec:"
> header as it is managed by log macro (dev->name is displayed)
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/bsec.c | 38 ++++++++++++++++++++----------------
>  1 file changed, 21 insertions(+), 17 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
> index a9b9bd0902..70650cfbf7 100644
> --- a/arch/arm/mach-stm32mp/bsec.c
> +++ b/arch/arm/mach-stm32mp/bsec.c
> @@ -3,6 +3,8 @@
>   * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
>   */
>  
> +#define LOG_CATEGORY UCLASS_MISC
> +
>  #include <common.h>
>  #include <dm.h>
>  #include <log.h>
> @@ -11,6 +13,7 @@
>  #include <asm/arch/bsec.h>
>  #include <asm/arch/stm32mp1_smc.h>
>  #include <linux/arm-smccc.h>
> +#include <linux/compat.h>
>  #include <linux/iopoll.h>
>  
>  #define BSEC_OTP_MAX_VALUE		95
> @@ -160,7 +163,7 @@ static int bsec_power_safmem(u32 base, bool power)
>   * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
>   * Return: 0 if no error
>   */
> -static int bsec_shadow_register(u32 base, u32 otp)
> +static int bsec_shadow_register(struct udevice *dev, u32 base, u32 otp)
>  {
>  	u32 val;
>  	int ret;
> @@ -168,7 +171,8 @@ static int bsec_shadow_register(u32 base, u32 otp)
>  
>  	/* check if shadowing of otp is locked */
>  	if (bsec_read_SR_lock(base, otp))
> -		pr_debug("bsec : OTP %d is locked and refreshed with 0\n", otp);
> +		dev_dbg(dev, "OTP %d is locked and refreshed with 0\n",
> +			otp);
>  
>  	/* check if safemem is power up */
>  	val = readl(base + BSEC_OTP_STATUS_OFF);
> @@ -203,7 +207,7 @@ static int bsec_shadow_register(u32 base, u32 otp)
>   * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
>   * Return: 0 if no error
>   */
> -static int bsec_read_shadow(u32 base, u32 *val, u32 otp)
> +static int bsec_read_shadow(struct udevice *dev, u32 base, u32 *val, u32 otp)
>  {
>  	*val = readl(base + BSEC_OTP_DATA_OFF + otp * sizeof(u32));
>  
> @@ -217,11 +221,11 @@ static int bsec_read_shadow(u32 base, u32 *val, u32 otp)
>   * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
>   * Return: 0 if no error
>   */
> -static int bsec_write_shadow(u32 base, u32 val, u32 otp)
> +static int bsec_write_shadow(struct udevice *dev, u32 base, u32 val, u32 otp)
>  {
>  	/* check if programming of otp is locked */
>  	if (bsec_read_SW_lock(base, otp))
> -		pr_debug("bsec : OTP %d is lock, write will be ignore\n", otp);
> +		dev_dbg(dev, "OTP %d is lock, write will be ignore\n", otp);
>  
>  	writel(val, base + BSEC_OTP_DATA_OFF + otp * sizeof(u32));
>  
> @@ -236,16 +240,16 @@ static int bsec_write_shadow(u32 base, u32 val, u32 otp)
>   * after the function the otp data is not refreshed in shadow
>   * Return: 0 if no error
>   */
> -static int bsec_program_otp(long base, u32 val, u32 otp)
> +static int bsec_program_otp(struct udevice *dev, long base, u32 val, u32 otp)
>  {
>  	u32 ret;
>  	bool power_up = false;
>  
>  	if (bsec_read_SP_lock(base, otp))
> -		pr_debug("bsec : OTP %d locked, prog will be ignore\n", otp);
> +		dev_dbg(dev, "OTP %d locked, prog will be ignore\n", otp);
>  
>  	if (readl(base + BSEC_OTP_LOCK_OFF) & (1 << BSEC_LOCK_PROGRAM))
> -		pr_debug("bsec : Global lock, prog will be ignore\n");
> +		dev_dbg(dev, "Global lock, prog will be ignore\n");
>  
>  	/* check if safemem is power up */
>  	if (!(readl(base + BSEC_OTP_STATUS_OFF) & BSEC_MODE_PWR_MASK)) {
> @@ -298,21 +302,21 @@ static int stm32mp_bsec_read_otp(struct udevice *dev, u32 *val, u32 otp)
>  	plat = dev_get_platdata(dev);
>  
>  	/* read current shadow value */
> -	ret = bsec_read_shadow(plat->base, &tmp_data, otp);
> +	ret = bsec_read_shadow(dev, plat->base, &tmp_data, otp);
>  	if (ret)
>  		return ret;
>  
>  	/* copy otp in shadow */
> -	ret = bsec_shadow_register(plat->base, otp);
> +	ret = bsec_shadow_register(dev, plat->base, otp);
>  	if (ret)
>  		return ret;
>  
> -	ret = bsec_read_shadow(plat->base, val, otp);
> +	ret = bsec_read_shadow(dev, plat->base, val, otp);
>  	if (ret)
>  		return ret;
>  
>  	/* restore shadow value */
> -	ret = bsec_write_shadow(plat->base, tmp_data, otp);
> +	ret = bsec_write_shadow(dev, plat->base, tmp_data, otp);
>  
>  	return ret;
>  }
> @@ -328,7 +332,7 @@ static int stm32mp_bsec_read_shadow(struct udevice *dev, u32 *val, u32 otp)
>  
>  	plat = dev_get_platdata(dev);
>  
> -	return bsec_read_shadow(plat->base, val, otp);
> +	return bsec_read_shadow(dev, plat->base, val, otp);
>  }
>  
>  static int stm32mp_bsec_read_lock(struct udevice *dev, u32 *val, u32 otp)
> @@ -352,7 +356,7 @@ static int stm32mp_bsec_write_otp(struct udevice *dev, u32 val, u32 otp)
>  
>  	plat = dev_get_platdata(dev);
>  
> -	return bsec_program_otp(plat->base, val, otp);
> +	return bsec_program_otp(dev, plat->base, val, otp);
>  
>  }
>  
> @@ -367,7 +371,7 @@ static int stm32mp_bsec_write_shadow(struct udevice *dev, u32 val, u32 otp)
>  
>  	plat = dev_get_platdata(dev);
>  
> -	return bsec_write_shadow(plat->base, val, otp);
> +	return bsec_write_shadow(dev, plat->base, val, otp);
>  }
>  
>  static int stm32mp_bsec_write_lock(struct udevice *dev, u32 val, u32 otp)
> @@ -497,7 +501,7 @@ static int stm32mp_bsec_probe(struct udevice *dev)
>  
>  		for (otp = 57; otp <= BSEC_OTP_MAX_VALUE; otp++)
>  			if (!bsec_read_SR_lock(plat->base, otp))
> -				bsec_shadow_register(plat->base, otp);
> +				bsec_shadow_register(dev, plat->base, otp);
>  	}
>  
>  	return 0;
> @@ -527,7 +531,7 @@ bool bsec_dbgswenable(void)
>  	ret = uclass_get_device_by_driver(UCLASS_MISC,
>  					  DM_GET_DRIVER(stm32mp_bsec), &dev);
>  	if (ret || !dev) {
> -		pr_debug("bsec driver not available\n");
> +		log_debug("bsec driver not available\n");
>  		return false;
>  	}
>  

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

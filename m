Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6118B243807
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 11:54:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2975CC36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 09:54:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E3D2C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 09:54:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D9q1OZ005647; Thu, 13 Aug 2020 11:54:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=epDMOq2ErmCshuPTaUD7N5aiF13B2kHHclLlLlJOqHY=;
 b=V3QK0vsRdiO0zZd8kb/PXsSJfV5uIagtzt2TKr0NxOCEqqFCNJk5U77eBxqyacW029cm
 32NvktuvSSyn7yb1iue86SNzDITvFl0PFOAUpze1Cvbc38Qf9xouEFZK7N7zebxAx2cc
 lGtFeApusY/w8KnC+GVsaZVlvuYaDYyoMX8LhypN1lDEK9VBK3L3dQR+6bSB8K9YUdPp
 SX9FxN1ASc8G7B2aflSlW5sG2AXhgI04YMocKtg/0IoERjURy96+2noj3KJlTPEzFZcm
 Maxal/9CFEsmNFabWzb4hxGP8G+KyTpqHydQywWDfzOrisQQiz2/+cWUnRxz/92eeHxS yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32sm9rnydy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 11:54:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 799AF100034;
 Thu, 13 Aug 2020 11:54:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5D8E52AB700;
 Thu, 13 Aug 2020 11:54:40 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 11:54:39 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Aug 2020 11:54:39 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 10/11] arm: stm32mp: bsec: use IS_ENABLED
 to prevent ifdef
Thread-Index: AQHWZ0dc6vN6TYhEJkCTe1UtPBnmrKk1lZ2AgAAp0YA=
Date: Thu, 13 Aug 2020 09:54:39 +0000
Message-ID: <39a26450-bd7c-7c6e-772d-4f03cdecc425@st.com>
References: <20200731143152.8812-1-patrick.delaunay@st.com>
 <20200731143152.8812-10-patrick.delaunay@st.com>
 <b2ce5ceb-d532-890b-5844-69cc0ec63d3a@st.com>
In-Reply-To: <b2ce5ceb-d532-890b-5844-69cc0ec63d3a@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <A38004EC86029D4E83F562F04453CB96@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_06:2020-08-13,
 2020-08-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 10/11] arm: stm32mp: bsec: use IS_ENABLED
 to prevent ifdef
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


On 8/13/20 9:24 AM, Patrice CHOTARD wrote:
> Hi Patrick
>
> On 7/31/20 4:31 PM, Patrick Delaunay wrote:
>> Use IS_ENABLED to prevent ifdef in bsec driver.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>  arch/arm/mach-stm32mp/bsec.c | 86 +++++++++++++++++++-----------------
>>  1 file changed, 46 insertions(+), 40 deletions(-)


Applied on u-boot-stm/master

Thanks

>>
>> diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
>> index 0c56b440f5..a9b9bd0902 100644
>> --- a/arch/arm/mach-stm32mp/bsec.c
>> +++ b/arch/arm/mach-stm32mp/bsec.c
>> @@ -74,7 +74,6 @@ static bool bsec_read_lock(u32 address, u32 otp)
>>  	return !!(readl(address + bank) & bit);
>>  }
>>  
>> -#ifndef CONFIG_TFABOOT
>>  /**
>>   * bsec_check_error() - Check status of one otp
>>   * @base: base address of bsec IP
>> @@ -279,7 +278,6 @@ static int bsec_program_otp(long base, u32 val, u32 otp)
>>  
>>  	return ret;
>>  }
>> -#endif /* CONFIG_TFABOOT */
>>  
>>  /* BSEC MISC driver *******************************************************/
>>  struct stm32mp_bsec_platdata {
>> @@ -288,15 +286,17 @@ struct stm32mp_bsec_platdata {
>>  
>>  static int stm32mp_bsec_read_otp(struct udevice *dev, u32 *val, u32 otp)
>>  {
>> -#ifdef CONFIG_TFABOOT
>> -	return stm32_smc(STM32_SMC_BSEC,
>> -			 STM32_SMC_READ_OTP,
>> -			 otp, 0, val);
>> -#else
>> -	struct stm32mp_bsec_platdata *plat = dev_get_platdata(dev);
>> +	struct stm32mp_bsec_platdata *plat;
>>  	u32 tmp_data = 0;
>>  	int ret;
>>  
>> +	if (IS_ENABLED(CONFIG_TFABOOT))
>> +		return stm32_smc(STM32_SMC_BSEC,
>> +				 STM32_SMC_READ_OTP,
>> +				 otp, 0, val);
>> +
>> +	plat = dev_get_platdata(dev);
>> +
>>  	/* read current shadow value */
>>  	ret = bsec_read_shadow(plat->base, &tmp_data, otp);
>>  	if (ret)
>> @@ -313,21 +313,22 @@ static int stm32mp_bsec_read_otp(struct udevice *dev, u32 *val, u32 otp)
>>  
>>  	/* restore shadow value */
>>  	ret = bsec_write_shadow(plat->base, tmp_data, otp);
>> +
>>  	return ret;
>> -#endif
>>  }
>>  
>>  static int stm32mp_bsec_read_shadow(struct udevice *dev, u32 *val, u32 otp)
>>  {
>> -#ifdef CONFIG_TFABOOT
>> -	return stm32_smc(STM32_SMC_BSEC,
>> -			 STM32_SMC_READ_SHADOW,
>> -			 otp, 0, val);
>> -#else
>> -	struct stm32mp_bsec_platdata *plat = dev_get_platdata(dev);
>> +	struct stm32mp_bsec_platdata *plat;
>> +
>> +	if (IS_ENABLED(CONFIG_TFABOOT))
>> +		return stm32_smc(STM32_SMC_BSEC,
>> +				 STM32_SMC_READ_SHADOW,
>> +				 otp, 0, val);
>> +
>> +	plat = dev_get_platdata(dev);
>>  
>>  	return bsec_read_shadow(plat->base, val, otp);
>> -#endif
>>  }
>>  
>>  static int stm32mp_bsec_read_lock(struct udevice *dev, u32 *val, u32 otp)
>> @@ -342,33 +343,38 @@ static int stm32mp_bsec_read_lock(struct udevice *dev, u32 *val, u32 otp)
>>  
>>  static int stm32mp_bsec_write_otp(struct udevice *dev, u32 val, u32 otp)
>>  {
>> -#ifdef CONFIG_TFABOOT
>> -	return stm32_smc_exec(STM32_SMC_BSEC,
>> -			      STM32_SMC_PROG_OTP,
>> -			      otp, val);
>> -#else
>> -	struct stm32mp_bsec_platdata *plat = dev_get_platdata(dev);
>> +	struct stm32mp_bsec_platdata *plat;
>> +
>> +	if (IS_ENABLED(CONFIG_TFABOOT))
>> +		return stm32_smc_exec(STM32_SMC_BSEC,
>> +				      STM32_SMC_PROG_OTP,
>> +				      otp, val);
>> +
>> +	plat = dev_get_platdata(dev);
>>  
>>  	return bsec_program_otp(plat->base, val, otp);
>> -#endif
>> +
>>  }
>>  
>>  static int stm32mp_bsec_write_shadow(struct udevice *dev, u32 val, u32 otp)
>>  {
>> -#ifdef CONFIG_TFABOOT
>> -	return stm32_smc_exec(STM32_SMC_BSEC,
>> -			      STM32_SMC_WRITE_SHADOW,
>> -			      otp, val);
>> -#else
>> -	struct stm32mp_bsec_platdata *plat = dev_get_platdata(dev);
>> +	struct stm32mp_bsec_platdata *plat;
>> +
>> +	if (IS_ENABLED(CONFIG_TFABOOT))
>> +		return stm32_smc_exec(STM32_SMC_BSEC,
>> +				      STM32_SMC_WRITE_SHADOW,
>> +				      otp, val);
>> +
>> +	plat = dev_get_platdata(dev);
>>  
>>  	return bsec_write_shadow(plat->base, val, otp);
>> -#endif
>>  }
>>  
>>  static int stm32mp_bsec_write_lock(struct udevice *dev, u32 val, u32 otp)
>>  {
>> -#ifdef CONFIG_TFABOOT
>> +	if (!IS_ENABLED(CONFIG_TFABOOT))
>> +		return -ENOTSUPP;
>> +
>>  	if (val == 1)
>>  		return stm32_smc_exec(STM32_SMC_BSEC,
>>  				      STM32_SMC_WRLOCK_OTP,
>> @@ -377,9 +383,6 @@ static int stm32mp_bsec_write_lock(struct udevice *dev, u32 val, u32 otp)
>>  		return 0; /* nothing to do */
>>  
>>  	return -EINVAL;
>> -#else
>> -	return -ENOTSUPP;
>> -#endif
>>  }
>>  
>>  static int stm32mp_bsec_read(struct udevice *dev, int offset,
>> @@ -481,18 +484,21 @@ static int stm32mp_bsec_ofdata_to_platdata(struct udevice *dev)
>>  
>>  static int stm32mp_bsec_probe(struct udevice *dev)
>>  {
>> -#if !defined(CONFIG_TFABOOT) && !defined(CONFIG_SPL_BUILD)
>>  	int otp;
>> -	struct stm32mp_bsec_platdata *plat = dev_get_platdata(dev);
>> +	struct stm32mp_bsec_platdata *plat;
>>  
>>  	/*
>>  	 * update unlocked shadow for OTP cleared by the rom code
>>  	 * only executed in U-Boot proper when TF-A is not used
>>  	 */
>> -	for (otp = 57; otp <= BSEC_OTP_MAX_VALUE; otp++)
>> -		if (!bsec_read_SR_lock(plat->base, otp))
>> -			bsec_shadow_register(plat->base, otp);
>> -#endif
>> +
>> +	if (!IS_ENABLED(CONFIG_TFABOOT) && !IS_ENABLED(CONFIG_SPL_BUILD)) {
>> +		plat = dev_get_platdata(dev);
>> +
>> +		for (otp = 57; otp <= BSEC_OTP_MAX_VALUE; otp++)
>> +			if (!bsec_read_SR_lock(plat->base, otp))
>> +				bsec_shadow_register(plat->base, otp);
>> +	}
>>  
>>  	return 0;
>>  }
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
>
> Thanks
>
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

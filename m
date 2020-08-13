Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 147912437F5
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 11:50:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D34FDC36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 09:50:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A86BEC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 09:50:27 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D9mNWL027024; Thu, 13 Aug 2020 11:50:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=hPfOXYLjD9pxXUVVePRTeqsQ0CsCIluBMOOtlQInirw=;
 b=dQ/k4HWvPNY9ulyw+gRADi6+n3/1OtDKHBvsQIPGimStCC5GG6ZaiWDBW631ZVilbDPw
 iBclZ3RZmdx31z2Ol5ON9S/pr2ooIi3wkoM2N1Ls5decQfpwlD+FU/eoztYqeenPGu8t
 BQ5rXN3eKdNpzTfOXeZ+bJKcivo5eQ4PAgmwkQHk4rd5UXxw1AaBNVIouzej95pMogat
 o6T3Iu7l3Fnl79a9nxlCD3kbRXt7xwgiqwT5vCLqIGApw6E0er+ielJXi8Cbx4CBE3wz
 tkDjWmOhntFt4zXe6iNNuoB2qjJiaW0kW1Bv6xfONT86i7+XZEd0lBxfNU34hfWXmlXP IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32smf9n1yb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 11:50:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 39FA310002A;
 Thu, 13 Aug 2020 11:50:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 301262AAC1A;
 Thu, 13 Aug 2020 11:50:26 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 11:50:25 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Aug 2020 11:50:25 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 04/11] board: stm32mp1: use IS_ENABLED to
 prevent ifdef in sysconf_init
Thread-Index: AQHWcUKU+fOAu6UB70uubTr/AI1lCqk1qkgA
Date: Thu, 13 Aug 2020 09:50:25 +0000
Message-ID: <1041620f-5030-0ba9-bdaf-7609eb6a008f@st.com>
References: <20200731143152.8812-1-patrick.delaunay@st.com>
 <20200731143152.8812-4-patrick.delaunay@st.com>
 <b6803501-1ff7-066e-e5aa-45957a98c2c0@st.com>
In-Reply-To: <b6803501-1ff7-066e-e5aa-45957a98c2c0@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <7A54E4C9EDFE564A8C7C89F44664E2EC@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_06:2020-08-13,
 2020-08-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 04/11] board: stm32mp1: use IS_ENABLED to
 prevent ifdef in sysconf_init
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


On 8/13/20 9:23 AM, Patrice CHOTARD wrote:
> Hi Patrick
>
> On 7/31/20 4:31 PM, Patrick Delaunay wrote:
>> Use IS_ENABLED to prevent ifdef in sysconf_init.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>  board/st/stm32mp1/stm32mp1.c | 11 +++--------
>>  1 file changed, 3 insertions(+), 8 deletions(-)

Applied on u-boot-stm/master

Thanks

>> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
>> index 3182f44598..a0a2f9978f 100644
>> --- a/board/st/stm32mp1/stm32mp1.c
>> +++ b/board/st/stm32mp1/stm32mp1.c
>> @@ -428,14 +428,11 @@ static int board_check_usb_power(void)
>>  
>>  static void sysconf_init(void)
>>  {
>> -#ifndef CONFIG_TFABOOT
>>  	u8 *syscfg;
>> -#ifdef CONFIG_DM_REGULATOR
>>  	struct udevice *pwr_dev;
>>  	struct udevice *pwr_reg;
>>  	struct udevice *dev;
>>  	u32 otp = 0;
>> -#endif
>>  	int ret;
>>  	u32 bootr, val;
>>  
>> @@ -453,7 +450,6 @@ static void sysconf_init(void)
>>  	bootr |= (bootr & SYSCFG_BOOTR_BOOT_MASK) << SYSCFG_BOOTR_BOOTPD_SHIFT;
>>  	writel(bootr, syscfg + SYSCFG_BOOTR);
>>  
>> -#ifdef CONFIG_DM_REGULATOR
>>  	/* High Speed Low Voltage Pad mode Enable for SPI, SDMMC, ETH, QSPI
>>  	 * and TRACE. Needed above ~50MHz and conditioned by AFMUX selection.
>>  	 * The customer will have to disable this for low frequencies
>> @@ -470,7 +466,7 @@ static void sysconf_init(void)
>>  	ret = uclass_get_device_by_driver(UCLASS_PMIC,
>>  					  DM_GET_DRIVER(stm32mp_pwr_pmic),
>>  					  &pwr_dev);
>> -	if (!ret) {
>> +	if (!ret && IS_ENABLED(CONFIG_DM_REGULATOR)) {
>>  		ret = uclass_get_device_by_driver(UCLASS_MISC,
>>  						  DM_GET_DRIVER(stm32mp_bsec),
>>  						  &dev);
>> @@ -507,7 +503,6 @@ static void sysconf_init(void)
>>  			debug("VDD unknown");
>>  		}
>>  	}
>> -#endif
>>  
>>  	/* activate automatic I/O compensation
>>  	 * warning: need to ensure CSI enabled and ready in clock driver
>> @@ -524,7 +519,6 @@ static void sysconf_init(void)
>>  	}
>>  
>>  	clrbits_le32(syscfg + SYSCFG_CMPCR, SYSCFG_CMPCR_SW_CTRL);
>> -#endif
>>  }
>>  
>>  #ifdef CONFIG_DM_REGULATOR
>> @@ -647,7 +641,8 @@ int board_init(void)
>>  	regulators_enable_boot_on(_DEBUG);
>>  #endif
>>  
>> -	sysconf_init();
>> +	if (!IS_ENABLED(CONFIG_TFABOOT))
>> +		sysconf_init();
>>  
>>  	if (CONFIG_IS_ENABLED(LED))
>>  		led_default_state();
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

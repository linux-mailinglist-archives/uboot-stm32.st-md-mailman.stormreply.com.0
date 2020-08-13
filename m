Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D28AB2437ED
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 11:49:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BDFAC36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 09:49:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3903DC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 09:49:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D8RkQl022529; Thu, 13 Aug 2020 11:49:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=SIpO/ycDIlhCobnMshHYFa7Y8X4iRDykJwftgww7yCM=;
 b=ZJlQr8kyGePPEMlX/xYkIXOGVpoGQABJh5GUv3wsOooHxr0NxjfemwciMXl2v9jo5nU9
 len2b8WUofB+4iM6qyvG8nlO5ISkxHChylGo1dn0ExokMl+LQxZVUIzM58Alk6SWsUBd
 9k3gOO5UnB9HH/lDGL6s2fCKny2URe3jdrJny+6VfP7uq4jnRDM62/f9fSFkRFlxKbBx
 6QrVigevVw7IzrWryRHN6Scnt5ry4pmVHfy+LoE7QUhzElYUmHDMQSgTh5Pw0uHpyyQn
 7D4ygJIWNPTqPBZbIVM4WhKXKU3vIWa4+eMhFofHqDrscx4y5P9zKxtOChS9CbY0k+tG fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32uj533ja3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 11:49:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0E0C710002A;
 Thu, 13 Aug 2020 11:49:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 04C5C2AAC17;
 Thu, 13 Aug 2020 11:49:06 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 11:49:05 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Aug 2020 11:49:05 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 01/11] board: stm32mp1: use IS_ENABLED to
 prevent ifdef in board_key_check
Thread-Index: AQHWcUaBn+VPNL777k6Sy634ZaBtqqk1qeEA
Date: Thu, 13 Aug 2020 09:49:05 +0000
Message-ID: <28d4d17d-da01-dbf6-c4fb-1a71570baa67@st.com>
References: <20200731143152.8812-1-patrick.delaunay@st.com>
 <8d341ec4-a292-e04e-90ba-55eb7c816553@st.com>
In-Reply-To: <8d341ec4-a292-e04e-90ba-55eb7c816553@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <4DBFB42F17EF9D4FB730C562B0FE1399@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_02:2020-08-11,
 2020-08-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 01/11] board: stm32mp1: use IS_ENABLED to
 prevent ifdef in board_key_check
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


On 8/13/20 9:51 AM, Patrice CHOTARD wrote:
> Hi Patrick
>
> On 7/31/20 4:31 PM, Patrick Delaunay wrote:
>> Use IS_ENABLED to prevent ifdef in board_key_check
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>  board/st/stm32mp1/stm32mp1.c | 52 ++++++++++++++++++------------------
>>  1 file changed, 26 insertions(+), 26 deletions(-)

Applied on u-boot-stm/master

Thanks

>>
>> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
>> index 1d274c3157..1ad41796fb 100644
>> --- a/board/st/stm32mp1/stm32mp1.c
>> +++ b/board/st/stm32mp1/stm32mp1.c
>> @@ -135,51 +135,51 @@ int checkboard(void)
>>  
>>  static void board_key_check(void)
>>  {
>> -#if defined(CONFIG_FASTBOOT) || defined(CONFIG_CMD_STM32PROG)
>>  	ofnode node;
>>  	struct gpio_desc gpio;
>>  	enum forced_boot_mode boot_mode = BOOT_NORMAL;
>>  
>> +	if (!IS_ENABLED(CONFIG_FASTBOOT) && !IS_ENABLED(CONFIG_CMD_STM32PROG))
>> +		return;
>> +
>>  	node = ofnode_path("/config");
>>  	if (!ofnode_valid(node)) {
>>  		debug("%s: no /config node?\n", __func__);
>>  		return;
>>  	}
>> -#ifdef CONFIG_FASTBOOT
>> -	if (gpio_request_by_name_nodev(node, "st,fastboot-gpios", 0,
>> -				       &gpio, GPIOD_IS_IN)) {
>> -		debug("%s: could not find a /config/st,fastboot-gpios\n",
>> -		      __func__);
>> -	} else {
>> -		if (dm_gpio_get_value(&gpio)) {
>> -			puts("Fastboot key pressed, ");
>> -			boot_mode = BOOT_FASTBOOT;
>> -		}
>> +	if (IS_ENABLED(CONFIG_FASTBOOT)) {
>> +		if (gpio_request_by_name_nodev(node, "st,fastboot-gpios", 0,
>> +					       &gpio, GPIOD_IS_IN)) {
>> +			debug("%s: could not find a /config/st,fastboot-gpios\n",
>> +			      __func__);
>> +		} else {
>> +			if (dm_gpio_get_value(&gpio)) {
>> +				puts("Fastboot key pressed, ");
>> +				boot_mode = BOOT_FASTBOOT;
>> +			}
>>  
>> -		dm_gpio_free(NULL, &gpio);
>> +			dm_gpio_free(NULL, &gpio);
>> +		}
>>  	}
>> -#endif
>> -#ifdef CONFIG_CMD_STM32PROG
>> -	if (gpio_request_by_name_nodev(node, "st,stm32prog-gpios", 0,
>> -				       &gpio, GPIOD_IS_IN)) {
>> -		debug("%s: could not find a /config/st,stm32prog-gpios\n",
>> -		      __func__);
>> -	} else {
>> -		if (dm_gpio_get_value(&gpio)) {
>> -			puts("STM32Programmer key pressed, ");
>> -			boot_mode = BOOT_STM32PROG;
>> +	if (IS_ENABLED(CONFIG_CMD_STM32PROG)) {
>> +		if (gpio_request_by_name_nodev(node, "st,stm32prog-gpios", 0,
>> +					       &gpio, GPIOD_IS_IN)) {
>> +			debug("%s: could not find a /config/st,stm32prog-gpios\n",
>> +			      __func__);
>> +		} else {
>> +			if (dm_gpio_get_value(&gpio)) {
>> +				puts("STM32Programmer key pressed, ");
>> +				boot_mode = BOOT_STM32PROG;
>> +			}
>> +			dm_gpio_free(NULL, &gpio);
>>  		}
>> -		dm_gpio_free(NULL, &gpio);
>>  	}
>> -#endif
>> -
>>  	if (boot_mode != BOOT_NORMAL) {
>>  		puts("entering download mode...\n");
>>  		clrsetbits_le32(TAMP_BOOT_CONTEXT,
>>  				TAMP_BOOT_FORCED_MASK,
>>  				boot_mode);
>>  	}
>> -#endif
>>  }
>>  
>>  #if defined(CONFIG_USB_GADGET) && defined(CONFIG_USB_GADGET_DWC2_OTG)
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

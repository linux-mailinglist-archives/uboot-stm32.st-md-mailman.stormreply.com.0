Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 616942437EE
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 11:49:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2661DC36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 09:49:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9612C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 09:49:29 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D9mOTs027027; Thu, 13 Aug 2020 11:49:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=53EsgaAgbAOfUma25pWFvC5J61CLMOh0VEu3XTmatI8=;
 b=eQzwKFU5EF2e1oreAyELK45lSBTbdbGk/pl63yBxQzhYt73dMdq1/CeTZfD5dgOJWIjm
 Toq5Q9By7DDSes7ZILBM65cN1wLkjYza2Wwmrwg/RmDCFRd1fDlB/YhqP6KZG1VUA2Yk
 eF3GGXxWhTMT9UV4bsbt/A8CBLbSkKbburm1qQKyH535xsa6+j7dOZ+JJMcKoN1kl05p
 q7xVWNdC3viR1L4NB9qZzedj0fZmoX5FR5dpQC4kJXKsWrej34xnPYtjTaerqsC1Ty/e
 5MgasbmrlPfDqLzPYW4ilknVAna2QllOaR+aSlbHkr3EnRrXvYKgTeXetclGIpc2Guit Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32smf9n1qj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 11:49:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DD2FE10002A;
 Thu, 13 Aug 2020 11:49:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D169D2AAC19;
 Thu, 13 Aug 2020 11:49:28 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 11:49:28 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Aug 2020 11:49:28 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 02/11] board: stm32mp1: use IS_ENABLED to
 prevent ifdef in g_dnl_board_usb_cable_connected
Thread-Index: AQHWcUJxmNuO3SU8u06CSzzseq+8zqk1qgSA
Date: Thu, 13 Aug 2020 09:49:28 +0000
Message-ID: <bc92019a-cd0f-0922-e9ba-fb7f7cf2ecf2@st.com>
References: <20200731143152.8812-1-patrick.delaunay@st.com>
 <20200731143152.8812-2-patrick.delaunay@st.com>
 <927cd46b-e896-abf8-9fab-3655501cc623@st.com>
In-Reply-To: <927cd46b-e896-abf8-9fab-3655501cc623@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <37CC3DDBA6B9BF42B0A8459DB001D0BC@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_06:2020-08-13,
 2020-08-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 02/11] board: stm32mp1: use IS_ENABLED to
 prevent ifdef in g_dnl_board_usb_cable_connected
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


On 8/13/20 9:22 AM, Patrice CHOTARD wrote:
> Hi Patrick
>
> On 7/31/20 4:31 PM, Patrick Delaunay wrote:
>> Use IS_ENABLED to prevent ifdef in g_dnl_board_usb_cable_connected
>> and in g_dnl_bind_fixup
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>  board/st/stm32mp1/stm32mp1.c | 15 +++++++++------
>>  1 file changed, 9 insertions(+), 6 deletions(-)

Applied on u-boot-stm/master

Thanks

>>
>> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
>> index 1ad41796fb..5c84b09c3e 100644
>> --- a/board/st/stm32mp1/stm32mp1.c
>> +++ b/board/st/stm32mp1/stm32mp1.c
>> @@ -182,13 +182,14 @@ static void board_key_check(void)
>>  	}
>>  }
>>  
>> -#if defined(CONFIG_USB_GADGET) && defined(CONFIG_USB_GADGET_DWC2_OTG)
>> -#include <usb/dwc2_udc.h>
>>  int g_dnl_board_usb_cable_connected(void)
>>  {
>>  	struct udevice *dwc2_udc_otg;
>>  	int ret;
>>  
>> +	if (!IS_ENABLED(CONFIG_USB_GADGET_DWC2_OTG))
>> +		return -ENODEV;
>> +
>>  	/* if typec stusb160x is present, means DK1 or DK2 board */
>>  	ret = stusb160x_cable_connected();
>>  	if (ret >= 0)
>> @@ -203,14 +204,17 @@ int g_dnl_board_usb_cable_connected(void)
>>  	return dwc2_udc_B_session_valid(dwc2_udc_otg);
>>  }
>>  
>> +#ifdef CONFIG_USB_GADGET_DOWNLOAD
>>  #define STM32MP1_G_DNL_DFU_PRODUCT_NUM 0xdf11
>>  #define STM32MP1_G_DNL_FASTBOOT_PRODUCT_NUM 0x0afb
>>  
>>  int g_dnl_bind_fixup(struct usb_device_descriptor *dev, const char *name)
>>  {
>> -	if (!strcmp(name, "usb_dnl_dfu"))
>> +	if (IS_ENABLED(CONFIG_DFU_OVER_USB) &&
>> +	    !strcmp(name, "usb_dnl_dfu"))
>>  		put_unaligned(STM32MP1_G_DNL_DFU_PRODUCT_NUM, &dev->idProduct);
>> -	else if (!strcmp(name, "usb_dnl_fastboot"))
>> +	else if (IS_ENABLED(CONFIG_FASTBOOT) &&
>> +		 !strcmp(name, "usb_dnl_fastboot"))
>>  		put_unaligned(STM32MP1_G_DNL_FASTBOOT_PRODUCT_NUM,
>>  			      &dev->idProduct);
>>  	else
>> @@ -218,8 +222,7 @@ int g_dnl_bind_fixup(struct usb_device_descriptor *dev, const char *name)
>>  
>>  	return 0;
>>  }
>> -
>> -#endif /* CONFIG_USB_GADGET */
>> +#endif /* CONFIG_USB_GADGET_DOWNLOAD */
>>  
>>  static int get_led(struct udevice **dev, char *led_string)
>>  {
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

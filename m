Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3B23DDCE8
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Aug 2021 17:56:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7957C597AE;
	Mon,  2 Aug 2021 15:56:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BB14C57B51
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Aug 2021 15:56:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 172FrOuG015681; Mon, 2 Aug 2021 17:56:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=m0usOOMx2FPtgW31t5xVqUoJ99z53saf7Dud+JWOCUw=;
 b=yxKbAg4aF25+PFBmQ870iPORb4z2FpxNmf/HFe3M4Rf9VQM+o44vD6yeaOecP21b8l6u
 jZJd/8FAOKarynkTacb/ktQxe0TqmQ4ijm4PqtmAqRBlwQ/3njdLMoww9E/KJ9+BU0Ar
 1YQQ8U+Zu4Dluh3kV9XLWvX0A5XAwu89PF7tRKmrGVDjcN09bxvBl1RMlqZSlilLdjGL
 LLDJE2fZDLBTtR/b8hwqBNXw/ZvLIygrMy1YRZbSBkRnJRmUuqzRNklDvuUUFtnHvrUO
 q5tke/KJp1uQ9/idthPWcNEYe+XgICML/H7q6IzudSup3e8bpeggb9zhsVKiu5ZKXNBL ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a6f0n9cge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 17:56:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1C069100034;
 Mon,  2 Aug 2021 17:56:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 29DE3233C9C;
 Mon,  2 Aug 2021 17:56:20 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 2 Aug
 2021 17:56:19 +0200
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
References: <20210419094534.9748-1-patrice.chotard@foss.st.com>
 <20210419094534.9748-3-patrice.chotard@foss.st.com>
 <ce16a34d-ac0c-2041-5aae-d755d33ff01e@foss.st.com>
Message-ID: <455f89ba-a396-bca9-182c-61cd4442e06a@foss.st.com>
Date: Mon, 2 Aug 2021 17:56:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ce16a34d-ac0c-2041-5aae-d755d33ff01e@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-02_07:2021-08-02,
 2021-08-02 signatures=0
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Lukasz Majewski <lukma@denx.de>,
 Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [Uboot-stm32] [PATCH v2 2/5] usb: gadget: Add bcdDevice for the
 DWC2 USB Gadget Controller
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

Hi Lukasz

Only this patch of this series is missing a reviewed-by for being accepted, can you have a look please ? 

Thanks
Patrice

On 6/18/21 8:55 AM, Patrice CHOTARD wrote:
> Hi Lukasz, Marek
> 
> Can you have a look a this patch please ?
> 
> Thanks
> Patrice
> 
> On 4/19/21 11:45 AM, Patrice Chotard wrote:
>> Add an entry in usb_gadget_controller_number() for the DWC2
>> gadget controller. It is used to bind the USB Ethernet driver.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> Reported-by: Herbert Poetzl <herbert@13thfloor.at>
>> Cc: Marek Vasut <marex@denx.de>
>> Cc: Herbert Poetzl <herbert@13thfloor.at>
>> ---
>>
>> (no changes since v1)
>>
>>  drivers/usb/gadget/gadget_chips.h | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/gadget_chips.h b/drivers/usb/gadget/gadget_chips.h
>> index 0cdf47c2dd..06e6a48949 100644
>> --- a/drivers/usb/gadget/gadget_chips.h
>> +++ b/drivers/usb/gadget/gadget_chips.h
>> @@ -167,6 +167,12 @@
>>  #define gadget_is_mtu3(g)        0
>>  #endif
>>  
>> +#ifdef CONFIG_USB_GADGET_DWC2_OTG
>> +#define gadget_is_dwc2(g)        (!strcmp("dwc2-udc", (g)->name))
>> +#else
>> +#define gadget_is_dwc2(g)        0
>> +#endif
>> +
>>  /**
>>   * usb_gadget_controller_number - support bcdDevice id convention
>>   * @gadget: the controller being driven
>> @@ -232,5 +238,7 @@ static inline int usb_gadget_controller_number(struct usb_gadget *gadget)
>>  		return 0x25;
>>  	else if (gadget_is_mtu3(gadget))
>>  		return 0x26;
>> +	else if (gadget_is_dwc2(gadget))
>> +		return 0x27;
>>  	return -ENOENT;
>>  }
>>
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

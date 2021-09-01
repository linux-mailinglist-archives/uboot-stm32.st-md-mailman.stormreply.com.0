Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4321B3FD643
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Sep 2021 11:13:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A19FFC5A4F3;
	Wed,  1 Sep 2021 09:13:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1FE4C5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Sep 2021 09:13:13 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1812hV0a003456;
 Wed, 1 Sep 2021 11:13:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=9w1DMVIZg1jiTgW7f8Hqdbky0tr505UmT7IL8XQpg+E=;
 b=CmhCfX+tOfpVOEAjlr2iFxmR1gRreiCfgdHfYNGHHvM/2nVbxOaX5fAkM7yacRsmYpxo
 th/ZLONI6k0xADslBMLAMOXSpEdR3/XsPigaRw/lFNhn1feEc5w5fGLjJjN0gE6Ha7PR
 TzYOdh0PPJ9XAr5r1MpUKp/L/jevoU1vlNSgNUrQesrXOsEsREWeby1L3f1eH9msuJkr
 TyByLVhe/tlGrBf6YeTPgADrGVYM6JG7sL10IIAB97VEgTLzEJQ4zB6REFguTqOAuImk
 zUrsj+v4V1IHZWy8UzF2aF7s2wb7gBt4wGIQvoBioXTNFaJ2NgnGuwVATqhYjZnveT3A ZQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3at101a3qv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 11:13:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2FDF910002A;
 Wed,  1 Sep 2021 11:12:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0CE51217B83;
 Wed,  1 Sep 2021 11:12:59 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep
 2021 11:12:58 +0200
To: <u-boot@lists.denx.de>, Lukasz Majewski <lukma@denx.de>
References: <20210419094534.9748-1-patrice.chotard@foss.st.com>
 <20210419094534.9748-3-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <e40dd394-2524-7fea-7766-f63bfb783534@foss.st.com>
Date: Wed, 1 Sep 2021 11:12:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210419094534.9748-3-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-01_03,2021-08-31_01,2020-04-07_01
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

Can you add your reviewed-by on this patch ?
This patch, and the other 4 patches of this serie, are still blocked on patchwork since April.

Thanks ;-)
Patrice

On 4/19/21 11:45 AM, Patrice Chotard wrote:
> Add an entry in usb_gadget_controller_number() for the DWC2
> gadget controller. It is used to bind the USB Ethernet driver.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reported-by: Herbert Poetzl <herbert@13thfloor.at>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Herbert Poetzl <herbert@13thfloor.at>
> ---
> 
> (no changes since v1)
> 
>  drivers/usb/gadget/gadget_chips.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/gadget/gadget_chips.h b/drivers/usb/gadget/gadget_chips.h
> index 0cdf47c2dd..06e6a48949 100644
> --- a/drivers/usb/gadget/gadget_chips.h
> +++ b/drivers/usb/gadget/gadget_chips.h
> @@ -167,6 +167,12 @@
>  #define gadget_is_mtu3(g)        0
>  #endif
>  
> +#ifdef CONFIG_USB_GADGET_DWC2_OTG
> +#define gadget_is_dwc2(g)        (!strcmp("dwc2-udc", (g)->name))
> +#else
> +#define gadget_is_dwc2(g)        0
> +#endif
> +
>  /**
>   * usb_gadget_controller_number - support bcdDevice id convention
>   * @gadget: the controller being driven
> @@ -232,5 +238,7 @@ static inline int usb_gadget_controller_number(struct usb_gadget *gadget)
>  		return 0x25;
>  	else if (gadget_is_mtu3(gadget))
>  		return 0x26;
> +	else if (gadget_is_dwc2(gadget))
> +		return 0x27;
>  	return -ENOENT;
>  }
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

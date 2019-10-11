Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D72D4423
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Oct 2019 17:27:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A55B7C36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Oct 2019 15:27:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBC58C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 15:27:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9BF1lCM021014; Fri, 11 Oct 2019 17:27:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=INOVTx1Oqh7k3dc+kiYeufQl2LkY0Ghx7tiAMh7ZEfs=;
 b=aOreUOsRFr1tvm3WOHjFs+LncEI/9X83+nW471AQjqwVB/CoMe1OuflXmgYI0gOjOiNE
 AABrEbvUcczBc3RUcZ8qv69FsnoK0VoFVEw0GmMs6EAUW6WO0VcO7B1YSqpNdTveasiD
 XD41e6PRRyCE/OXPBxbnjL8wwhW1Xkd0qYxVW1AbCpgqJDLjUOQYQSqRwRfh/x2QPvt4
 428YxrhnUB63ZUDXEnf4lXtGfhl0sPG9ToRcqpFGB8DNG4+aeKyVgohPbpZr/OFt+JoK
 Wo7KVLzsmA6KimTB56Uhb6D9xC2e3gnvXZuxVaGA5/H5hsKInM1WOez/4WSvYZu0C7LI VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vegahkecw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2019 17:27:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1D77310002A;
 Fri, 11 Oct 2019 17:27:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 142FD2BA472;
 Fri, 11 Oct 2019 17:27:11 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Oct
 2019 17:27:10 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 11 Oct 2019 17:27:10 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] board: stm32mp1: fixup the usb product id
 for USB download gadget
Thread-Index: AQHVgEhZ66Y2rcEY5kKPP+p7IIGzxw==
Date: Fri, 11 Oct 2019 15:27:10 +0000
Message-ID: <0d6a462f-a08b-1073-cddf-d98d1d0b8bbe@st.com>
References: <20190913132417.19206-1-patrick.delaunay@st.com>
In-Reply-To: <20190913132417.19206-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <2D1134F69304FE42BED8C3FB8C966D27@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-11_09:2019-10-10,2019-10-11 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] board: stm32mp1: fixup the usb product id
 for USB download gadget
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

On 9/13/19 3:24 PM, Patrick Delaunay wrote:
> Select the correct USB product id used by the download gadget
> for ST stm32mp1 boards.
>
> The board stm32mp1 select the correct product id, as defined in
> http://www.linux-usb.org/usb.ids for the STMicroelectronics
> vendor id = 0x0483 (CONFIG_USB_GADGET_VENDOR_NUM):
> - dfu = 0xdf11 : STM Device in DFU mode
>   it is the value used by ROM code and reused for stm32prog
>   command
> - fasboot = 0x0afb : Android Fastboot device
> - others = 0x5720 (CONFIG_USB_GADGET_PRODUCT_NUM)
>   Mass Storage Device
>   it is used for UMS command / usb_dnl_ums
>
> This patch avoid conflict when the same USB VID/PID is used for
> ums, fastboot or dfu command (two different protocols associated
> to the same PID).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/stm32mp1/stm32mp1.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 18f9b84876..126af30173 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -233,6 +233,23 @@ int g_dnl_board_usb_cable_connected(void)
>  
>  	return dwc2_udc_B_session_valid(dwc2_udc_otg);
>  }
> +
> +#define STM32MP1_G_DNL_DFU_PRODUCT_NUM 0xdf11
> +#define STM32MP1_G_DNL_FASTBOOT_PRODUCT_NUM 0x0afb
> +
> +int g_dnl_bind_fixup(struct usb_device_descriptor *dev, const char *name)
> +{
> +	if (!strcmp(name, "usb_dnl_dfu"))
> +		put_unaligned(STM32MP1_G_DNL_DFU_PRODUCT_NUM, &dev->idProduct);
> +	else if (!strcmp(name, "usb_dnl_fastboot"))
> +		put_unaligned(STM32MP1_G_DNL_FASTBOOT_PRODUCT_NUM,
> +			      &dev->idProduct);
> +	else
> +		put_unaligned(CONFIG_USB_GADGET_PRODUCT_NUM, &dev->idProduct);
> +
> +	return 0;
> +}
> +
>  #endif /* CONFIG_USB_GADGET */
>  
>  #ifdef CONFIG_LED

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

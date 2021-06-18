Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FC83AC450
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Jun 2021 08:56:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48974C59780;
	Fri, 18 Jun 2021 06:56:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 449CDC58D5D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jun 2021 06:56:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15I6lB2v002325; Fri, 18 Jun 2021 08:56:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8mLzsMQKIYsmbH7+ZxLdGsOoCjHi/W5+AwE/3lhD8o4=;
 b=CNxAfOq0YSTwrf3RbB/iORDOs0+7icCxKh6tCUGSfaw9m39TbSSrAH062ZBfCjjyoIy+
 wSUtf4gszSd7Uc6RnBGOf+u54HzGsoViFFrfxM9jMCdpN2b40TlxCxeSIeNhugSsn+/P
 mtSHpLQP1MeIgTmZaQI1WSKmjTtMXE58P/bSXfMNM4nUJdLo9+dIeUmZr38uCEI046uT
 PDSqJmSL5WeA4ZUfllihTy0lFWLSbogYNJvZJBSmS2v+CLGuDIfF7ZRYfuyypF1OW9+f
 53hbHT4gGH+qJvpXoy7b0T+BczGO0J8Oe22rX5eHb+naQzjlX6w4o8IEBFmq50EawE49 ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 398eghtcju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 08:56:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B25D3100034;
 Fri, 18 Jun 2021 08:56:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A391B217367;
 Fri, 18 Jun 2021 08:56:39 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 18 Jun
 2021 08:56:39 +0200
To: <u-boot@lists.denx.de>
References: <20210419094534.9748-1-patrice.chotard@foss.st.com>
 <20210419094534.9748-4-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <983c4d52-e9b3-6ee9-b5e7-bda4c5130c19@foss.st.com>
Date: Fri, 18 Jun 2021 08:56:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210419094534.9748-4-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_17:2021-06-15,
 2021-06-17 signatures=0
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Marek Vasut <marex@denx.de>,
 Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [Uboot-stm32] [PATCH v2 3/5] usb: sandbox: Add gadget callbacks
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

Hi Marek

Can you have a look a this patch please ?

Thanks
Patrice

On 4/19/21 11:45 AM, Patrice Chotard wrote:
> Add usb_gadget_handle_interrupts(), usb_gadget_register_driver()
> and usb_gadget_unregister_driver() to be able to test
> binding usb gadget.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Herbert Poetzl <herbert@13thfloor.at>
> ---
> 
> (no changes since v1)
> 
>  drivers/usb/host/usb-sandbox.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/usb/host/usb-sandbox.c b/drivers/usb/host/usb-sandbox.c
> index d7cc92aa54..d1103dcb2e 100644
> --- a/drivers/usb/host/usb-sandbox.c
> +++ b/drivers/usb/host/usb-sandbox.c
> @@ -9,6 +9,13 @@
>  #include <log.h>
>  #include <usb.h>
>  #include <dm/root.h>
> +#include <linux/usb/gadget.h>
> +
> +struct sandbox_udc {
> +	struct usb_gadget gadget;
> +};
> +
> +struct sandbox_udc *this_controller;
>  
>  struct sandbox_usb_ctrl {
>  	int rootdev;
> @@ -117,6 +124,27 @@ static int sandbox_submit_int(struct udevice *bus, struct usb_device *udev,
>  	return ret;
>  }
>  
> +int usb_gadget_handle_interrupts(int index)
> +{
> +	return 0;
> +}
> +
> +int usb_gadget_register_driver(struct usb_gadget_driver *driver)
> +{
> +	struct sandbox_udc *dev = this_controller;
> +
> +	return driver->bind(&dev->gadget);
> +}
> +
> +int usb_gadget_unregister_driver(struct usb_gadget_driver *driver)
> +{
> +	struct sandbox_udc *dev = this_controller;
> +
> +	driver->unbind(&dev->gadget);
> +
> +	return 0;
> +}
> +
>  static int sandbox_alloc_device(struct udevice *dev, struct usb_device *udev)
>  {
>  	struct sandbox_usb_ctrl *ctrl = dev_get_priv(dev);
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

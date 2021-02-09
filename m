Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7867314D34
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Feb 2021 11:40:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D42CC57B53;
	Tue,  9 Feb 2021 10:40:03 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF565C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 10:39:59 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DZfXt5TB4z1s1WP;
 Tue,  9 Feb 2021 11:39:58 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DZfXt4t87z1t5kk;
 Tue,  9 Feb 2021 11:39:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id SNSarn134YB7; Tue,  9 Feb 2021 11:39:57 +0100 (CET)
X-Auth-Info: hK21AsuEfnfrU5rmMX7QWx9wcncKmRlFVfzRv7es6kI=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue,  9 Feb 2021 11:39:57 +0100 (CET)
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210209111438.1.If6218391a7cf47afdeda5e5e6c79937b4e8ab085@changeid>
From: Marek Vasut <marex@denx.de>
Message-ID: <804006bd-a6bc-0352-374d-6d2b33e42db9@denx.de>
Date: Tue, 9 Feb 2021 11:39:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209111438.1.If6218391a7cf47afdeda5e5e6c79937b4e8ab085@changeid>
Content-Language: en-US
Cc: uboot-stm32@st-md-mailman.stormreply.com, Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] usb: dwc2: change compatible st,
 stm32mp1-hsotg to st, stm32mp15-hsotg
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 2/9/21 11:14 AM, Patrick Delaunay wrote:
Hi,

[...]

> diff --git a/drivers/usb/gadget/dwc2_udc_otg.c b/drivers/usb/gadget/dwc2_udc_otg.c
> index e3871e381e..ecac80fc11 100644
> --- a/drivers/usb/gadget/dwc2_udc_otg.c
> +++ b/drivers/usb/gadget/dwc2_udc_otg.c
> @@ -1176,7 +1176,7 @@ static int dwc2_udc_otg_remove(struct udevice *dev)
>   static const struct udevice_id dwc2_udc_otg_ids[] = {
>   	{ .compatible = "snps,dwc2" },
>   	{ .compatible = "brcm,bcm2835-usb" },
> -	{ .compatible = "st,stm32mp1-hsotg",
> +	{ .compatible = "st,stm32mp15-hsotg",
>   	  .data = (ulong)dwc2_set_stm32mp1_hsotg_params },

I have to point out the obvious, DT is ABI, this breaks ABI. However, do 
we care about out-of-tree DTs here ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

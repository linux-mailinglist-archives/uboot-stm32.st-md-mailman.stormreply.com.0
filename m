Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C48D6C18
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Oct 2019 01:36:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C68E6C36B0D
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 23:36:11 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B41FC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 23:36:10 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46sZgt0f84z1qrK2;
 Tue, 15 Oct 2019 01:36:10 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46sZgt0GPqz1qr9B;
 Tue, 15 Oct 2019 01:36:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id AFNtDIKsUlPa; Tue, 15 Oct 2019 01:36:09 +0200 (CEST)
X-Auth-Info: YcSaFy6J3YL0EVptnc+myBppmJ1NZVZhvA4Jdzg81+k=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 15 Oct 2019 01:36:09 +0200 (CEST)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20191014080025.11245-1-patrick.delaunay@st.com>
 <20191014080025.11245-4-patrick.delaunay@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <d4a847ac-b675-6a85-4320-c4f3800c18b1@denx.de>
Date: Tue, 15 Oct 2019 01:29:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014080025.11245-4-patrick.delaunay@st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>, Sven Schwermer <sven@svenschwermer.de>
Subject: Re: [Uboot-stm32] [RESEND PATCH 3/5] usb: host: dwc2: force reset
	assert
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

On 10/14/19 10:00 AM, Patrick Delaunay wrote:
> Assert reset before deassert in dwc2_reset;
> It should be more safe for DWC2.

Can you be more descriptive about this issue ? I have no idea what this
patch does or fixes from the description.

> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  drivers/usb/host/dwc2.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
> index 51023b0c2c..3086411fc4 100644
> --- a/drivers/usb/host/dwc2.c
> +++ b/drivers/usb/host/dwc2.c
> @@ -1149,6 +1149,8 @@ static int dwc2_reset(struct udevice *dev)
>  			return ret;
>  	}
>  
> +	reset_assert_bulk(&priv->resets);
> +	udelay(2);

Why is there a 2 uS delay ?

>  	ret = reset_deassert_bulk(&priv->resets);
>  	if (ret) {
>  		reset_release_bulk(&priv->resets);
> 

[...]
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F477198A27
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 04:51:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E816C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 02:51:46 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F6C1C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 02:51:44 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48rv3z5CfNz1rnrQ;
 Tue, 31 Mar 2020 04:51:43 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48rv3z4Ynjz1r0cK;
 Tue, 31 Mar 2020 04:51:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id AiBD7jCtGMO9; Tue, 31 Mar 2020 04:51:42 +0200 (CEST)
X-Auth-Info: xPWweJ/mwZ+DyKMdPNUuckjsWVCi2uRP78YejvI4LQk=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 31 Mar 2020 04:51:42 +0200 (CEST)
To: Patrice Chotard <patrice.chotard@st.com>, u-boot@lists.denx.de
References: <1546595706-31360-1-git-send-email-patrice.chotard@st.com>
 <1546595706-31360-3-git-send-email-patrice.chotard@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <f3e23915-c6ae-7c4d-7c5a-f725f726b5d4@denx.de>
Date: Tue, 31 Mar 2020 04:51:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1546595706-31360-3-git-send-email-patrice.chotard@st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v1 2/2] gpio: stm32f7: Fix SPL
	code size
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

On 1/4/19 10:55 AM, Patrice Chotard wrote:

Hi,

> @@ -215,7 +220,9 @@ U_BOOT_DRIVER(gpio_stm32) = {
>  	.id	= UCLASS_GPIO,
>  	.of_match = stm32_gpio_ids,
>  	.probe	= gpio_stm32_probe,
> +#ifndef CONFIG_SPL_BUILD
>  	.ops	= &gpio_stm32_ops,
> +#endif
>  	.flags	= DM_UC_FLAG_SEQ_ALIAS,
>  	.priv_auto_alloc_size	= sizeof(struct stm32_gpio_priv),
>  };

The U-Boot DM GPIO uclass code assumes the .ops is always non-NULL.
Hence, this patch breaks all GPIO access (actually crashes SPL) on STM32
in SPL.

-- 
Best regards,
Marek Vasut
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

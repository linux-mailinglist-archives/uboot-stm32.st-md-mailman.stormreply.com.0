Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E15619AAD1
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 13:32:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14846C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 11:32:19 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66628C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 11:32:18 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48skZB018Wz1qs0j
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 13:32:18 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48skZ970XZz1r0cS
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 13:32:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024) with ESMTP id UIaW0UZ7jXDB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 13:32:17 +0200 (CEST)
X-Auth-Info: 1Ennd6IIUPEWYIE8uFWl3kj/ZMxAk1I2pF1J9W042uM=
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 13:32:17 +0200 (CEST)
Received: by janitor.denx.de (Postfix, from userid 119)
 id C0ECEA2C44; Wed,  1 Apr 2020 13:32:16 +0200 (CEST)
Received: from gemini.denx.de (gemini.denx.de [10.4.0.2])
 by janitor.denx.de (Postfix) with ESMTPS id 22AEFA12F3;
 Wed,  1 Apr 2020 13:32:13 +0200 (CEST)
Received: from gemini.denx.de (localhost [IPv6:::1])
 by gemini.denx.de (Postfix) with ESMTP id C829924003E;
 Wed,  1 Apr 2020 13:32:12 +0200 (CEST)
To: Patrick Delaunay <patrick.delaunay@st.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <20200331180330.8.I15cb0a6245fb4cd5d23371683c2697f794adf306@changeid>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.8.I15cb0a6245fb4cd5d23371683c2697f794adf306@changeid>
Comments: In-reply-to Patrick Delaunay <patrick.delaunay@st.com>
 message dated "Tue, 31 Mar 2020 18:04:25 +0200."
Date: Wed, 01 Apr 2020 13:32:12 +0200
Message-Id: <20200401113212.C829924003E@gemini.denx.de>
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 08/16] board: stm32mp1: update management
	of boot-led
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

Dear Patrick Delaunay,

In message <20200331180330.8.I15cb0a6245fb4cd5d23371683c2697f794adf306@changeid> you wrote:
> Force boot-led ON and no more rely on default-state.
> This patch avoid device-tree modification for U-Boot.
...

> +#ifdef CONFIG_LED
>  	struct udevice *dev;
>  	int ret;
>  
> @@ -292,8 +294,10 @@ static int setup_led(enum led_state_t cmd)
>  
>  	ret = led_set_state(dev, cmd);
>  	return ret;
> -}
> +#else
> +	return 0;
>  #endif
> +}
>  
>  static void __maybe_unused led_error_blink(u32 nb_blink)
>  {
> @@ -648,8 +652,10 @@ int board_init(void)
>  
>  	sysconf_init();
>  
> -	if (CONFIG_IS_ENABLED(CONFIG_LED))
> +	if (CONFIG_IS_ENABLED(CONFIG_LED)) {
>  		led_default_state();
> +		setup_led(LEDST_ON);
> +	}

This is inconsistent, please use CONFIG_IS_ENABLED() everywhere
instead of #ifdef's.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Q:  Do you know what the death rate around here is?
A:  One per person.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

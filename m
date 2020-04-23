Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAED1B6592
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Apr 2020 22:39:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 795A6C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Apr 2020 20:39:44 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49111C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2020 20:39:41 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 497Tgc66P8z1s00r
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2020 22:39:40 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 497Tgc5TLNz1qr4H
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2020 22:39:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024) with ESMTP id t-bubg0jeyQB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2020 22:39:40 +0200 (CEST)
X-Auth-Info: Y2yDivnlopOmAHM6kD3wuaRw87Ugo3Apk5FhaBaO/uI=
Received: from janitor.denx.de (unknown [62.91.23.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2020 22:39:40 +0200 (CEST)
Received: by janitor.denx.de (Postfix, from userid 108)
 id BB5DBA09D5; Thu, 23 Apr 2020 22:39:39 +0200 (CEST)
Received: from gemini.denx.de (gemini.denx.de [10.4.0.2])
 by janitor.denx.de (Postfix) with ESMTPS id 10DBFA006F;
 Thu, 23 Apr 2020 22:39:35 +0200 (CEST)
Received: from gemini.denx.de (localhost [IPv6:::1])
 by gemini.denx.de (Postfix) with ESMTP id B536F2439C9;
 Thu, 23 Apr 2020 22:39:34 +0200 (CEST)
To: Patrick DELAUNAY <patrick.delaunay@st.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <8970fb86c1374d1999ff656c2a3272da@SFHDAG6NODE3.st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.6.I41a641a07fd12da45b392920fc3407e608926396@changeid>
 <20200401113019.73B6724003E@gemini.denx.de>
 <8970fb86c1374d1999ff656c2a3272da@SFHDAG6NODE3.st.com>
Comments: In-reply-to Patrick DELAUNAY <patrick.delaunay@st.com>
 message dated "Tue, 21 Apr 2020 16:05:43 -0000."
Date: Thu, 23 Apr 2020 22:39:34 +0200
Message-Id: <20200423203934.B536F2439C9@gemini.denx.de>
Cc: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 06/16] arm: stm32mp: spl: display error in
	board_init_f
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

Dear Patrick,

In message <8970fb86c1374d1999ff656c2a3272da@SFHDAG6NODE3.st.com> you wrote:
> 
> > > -	ret = uclass_get_device(UCLASS_CLK, 0, &dev);
> > > -	if (ret) {
> > > -		debug("Clock init failed: %d\n", ret);
> > > -		return;
> > > -	}
> > > +	clk = uclass_get_device(UCLASS_CLK, 0, &dev);
> > > +	if (clk)
> > > +		debug("%s: Clock init failed: %d\n", __func__, clk);
> > >
> > > -	ret = uclass_get_device(UCLASS_RESET, 0, &dev);
> > > -	if (ret) {
> > > -		debug("Reset init failed: %d\n", ret);
> > > -		return;
> > > -	}
> > > +	reset = uclass_get_device(UCLASS_RESET, 0, &dev);
> > > +	if (reset)
> > > +		debug("%s: Reset init failed: %d\n", __func__, reset);
> > >
> > > -	ret = uclass_get_device(UCLASS_PINCTRL, 0, &dev);
> > > -	if (ret) {
> > > -		debug("%s: Cannot find pinctrl device\n", __func__);
> > > -		return;
> > > -	}
> > > +	pinctrl = uclass_get_device(UCLASS_PINCTRL, 0, &dev);
> > > +	if (pinctrl)
> > > +		debug("%s: Cannot find pinctrl device: %d\n",
> > > +		      __func__, pinctrl);
> > >
> > >  	/* enable console uart printing */
> > >  	preloader_console_init();
> > >
> > > +	if (clk || reset || pinctrl)
> > > +		printf("%s: probe failed clk=%d reset=%d pinctrl=%d\n",
> > > +		       __func__, clk, reset, pinctrl);
> > > +
> > 
> > This change makes little sense to me/  If you want error messages, then just turn
> > above debug() into printf(), and be done with it.
> > As an additional benefit so see at once which step failed.
> 
> In this patch, I try to display error as soon as console is available
> (after preloader_console_init) , if after one driver initialization
> (clk, reset, pincontrol) failing.
> 
> Change debug to printf only works only if CONFIG_DEBUG_UART 
> is activated (not by default) and board_debug_uart_init() exist to configure
> the needed UART TX pins.

Maybe you can remember an error code so you can tell the user which
of the steps failed? That would be more useful, then.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
I know engineers. They love to change things.             - Dr. McCoy
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

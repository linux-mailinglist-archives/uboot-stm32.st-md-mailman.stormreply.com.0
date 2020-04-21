Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA221B2BE2
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 18:05:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8792C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 16:05:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FF30C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 16:05:48 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LFuvit013496; Tue, 21 Apr 2020 18:05:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=qunmScvu5auc4OHFb95txW3e/YKhYZFOi1zqg3snE8Y=;
 b=alk92c0qTQrFEHz3MkX8L4+9wcuRWawqzJta5eAx1I2PxWDDA8ee1VAdwGDZTmFIar9+
 Bd8yoNk1DzXjE/pBIkSyqCcZW0egILcQB8EM0i7fPJlJNI3syYn2siDJXp1UJX/Smw1L
 xDhUPSye0VdZQeggIUKcXMD7rRbcbnqctUJY5usHTaVNL2hI72uBQCFcOwHznoY6igS7
 wnPWMqtXJ1S3TaTA0p3psMuEHQUOAaag6P4HxGNoYc+7ooDHXuAu2lJ6i/V0yKOB30so
 2cO7xhH04CMCYX4BU9TVIa1gocnF1kYikQl3h9JiaKHUOUJ2UnTacew61FoF90kh9dPM kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fqaw93xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Apr 2020 18:05:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9B00B10002A;
 Tue, 21 Apr 2020 18:05:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8E75221E669;
 Tue, 21 Apr 2020 18:05:43 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Apr
 2020 18:05:43 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 21 Apr 2020 18:05:43 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Wolfgang Denk <wd@denx.de>
Thread-Topic: [PATCH 06/16] arm: stm32mp: spl: display error in board_init_f
Thread-Index: AQHWB3Ygtp+ajZQQTEW4+qouBTH5mahkAWWAgB/WMGA=
Date: Tue, 21 Apr 2020 16:05:43 +0000
Message-ID: <8970fb86c1374d1999ff656c2a3272da@SFHDAG6NODE3.st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.6.I41a641a07fd12da45b392920fc3407e608926396@changeid>
 <20200401113019.73B6724003E@gemini.denx.de>
In-Reply-To: <20200401113019.73B6724003E@gemini.denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_06:2020-04-20,
 2020-04-21 signatures=0
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

Dear Wolfgang,

> From: Wolfgang Denk <wd@denx.de>
> Sent: mercredi 1 avril 2020 13:30
> 
> Dear Patrick Delaunay,
> 
> In message
> <20200331180330.6.I41a641a07fd12da45b392920fc3407e608926396@changeid>
> you wrote:
> > Update board_init_f and try to display error message when console is
> > available.
> >
> > This patch adds trace to debug a spl boot issue when DEBUG and
> > DEBUG_UART is not activated, after uart probe.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> >  arch/arm/mach-stm32mp/spl.c | 33 ++++++++++++++++-----------------
> >  1 file changed, 16 insertions(+), 17 deletions(-)
> >
> > diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
> > index ca4231cd0d..dfdb5bb7e9 100644
> > --- a/arch/arm/mach-stm32mp/spl.c
> > +++ b/arch/arm/mach-stm32mp/spl.c
> > @@ -79,37 +79,36 @@ void spl_display_print(void)  void
> > board_init_f(ulong dummy)  {
> >  	struct udevice *dev;
> > -	int ret;
> > +	int ret, clk, reset, pinctrl;
> >
> >  	arch_cpu_init();
> >
> >  	ret = spl_early_init();
> >  	if (ret) {
> > -		debug("spl_early_init() failed: %d\n", ret);
> > +		debug("%s: spl_early_init() failed: %d\n", __func__, ret);
> >  		hang();
> >  	}
> >
> > -	ret = uclass_get_device(UCLASS_CLK, 0, &dev);
> > -	if (ret) {
> > -		debug("Clock init failed: %d\n", ret);
> > -		return;
> > -	}
> > +	clk = uclass_get_device(UCLASS_CLK, 0, &dev);
> > +	if (clk)
> > +		debug("%s: Clock init failed: %d\n", __func__, clk);
> >
> > -	ret = uclass_get_device(UCLASS_RESET, 0, &dev);
> > -	if (ret) {
> > -		debug("Reset init failed: %d\n", ret);
> > -		return;
> > -	}
> > +	reset = uclass_get_device(UCLASS_RESET, 0, &dev);
> > +	if (reset)
> > +		debug("%s: Reset init failed: %d\n", __func__, reset);
> >
> > -	ret = uclass_get_device(UCLASS_PINCTRL, 0, &dev);
> > -	if (ret) {
> > -		debug("%s: Cannot find pinctrl device\n", __func__);
> > -		return;
> > -	}
> > +	pinctrl = uclass_get_device(UCLASS_PINCTRL, 0, &dev);
> > +	if (pinctrl)
> > +		debug("%s: Cannot find pinctrl device: %d\n",
> > +		      __func__, pinctrl);
> >
> >  	/* enable console uart printing */
> >  	preloader_console_init();
> >
> > +	if (clk || reset || pinctrl)
> > +		printf("%s: probe failed clk=%d reset=%d pinctrl=%d\n",
> > +		       __func__, clk, reset, pinctrl);
> > +
> 
> This change makes little sense to me/  If you want error messages, then just turn
> above debug() into printf(), and be done with it.
> As an additional benefit so see at once which step failed.

In this patch, I try to display error as soon as console is available
(after preloader_console_init) , if after one driver initialization
(clk, reset, pincontrol) failing.

Change debug to printf only works only if CONFIG_DEBUG_UART 
is activated (not by default) and board_debug_uart_init() exist to configure
the needed UART TX pins.

At least I need to remove the return and change them to hang() to interrupt SPL
execution if one probe failed to detect issue

I spent some time for this kind of issue: clock probe failed without any trace.
 

> Best regards,
> 
> Wolfgang Denk
> 
> --

Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

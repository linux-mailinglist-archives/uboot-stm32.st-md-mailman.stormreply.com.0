Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D413262D9
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Feb 2021 13:44:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C8ACC57B59;
	Fri, 26 Feb 2021 12:44:53 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BE80C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 12:44:52 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id n4so6247745wmq.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 04:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=91CuTEW7j9/JaXG4GpBp4px7maWh3dDpOfhnYiFHfrY=;
 b=FjOOyyvTzBEF/6Pf+/XuNJhm29JZ8XB1vBR8La1sn2fnuj5mikI70cMbtx6nHNI+Dg
 TQ99jPtwUiaOK+oM97zLmLyyBxGMYbPmOugSJYwWuxroQUa8VmcOWnXEqJXpfUoYvytP
 ohrcLCTA3S8fYUtFPub8g71wS4vSaMX6h5TqvfKQ5ILC3tMe0VOqu69bqJTvphhJqwNj
 2kwdFZD2dyn54pFQIIORL67hDwmqM12JpV5WhFSnzfwjIsAhiqajolI4eA5NyPXIo9ku
 7dvED3eq0cvRjiLRZB6ksHmmSOZHchZdQ8psSOWxBxYI7+vdsccb+VAIMZfN0LBA9vU0
 RFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=91CuTEW7j9/JaXG4GpBp4px7maWh3dDpOfhnYiFHfrY=;
 b=Z8kUeGaa3Sjc1GMFxgR7xf8dqXoQJK+GNVUk1BMAdyK/hZUJHdX3qVrmtN7VeYhhB4
 sRjMIkcYKb1KYF+9uB8d7enEjMMYy6TJe1HaRl7IRvo46AUv6KWVt1kk+9Zac0jfdLnr
 z48N04rjyydweEqBOF2NsEYtSBUii+6oL1T58N3JL05eFR3P3g9BhCFTVZMqku/7qKjI
 E/BFl3oYByXze63lIoQCmztBr7XTdHXzyiEVm24xm7Kf+n6N+0LiX8ApXjn/46+ZLu7y
 qMFJc7MdM/BmlppwWONk9bM7yN4SsiiJaeAwH0eqyC1laMi9Y+Gj3dCeQ3ZE+o5FYNK1
 49IA==
X-Gm-Message-State: AOAM5320z8xO4KJHckB4DMPD1G90hAIk8n/zn5h1630yvBHzK/Yha4wP
 gfSWTfkvvNQJHOGBylZSnu5YjQ==
X-Google-Smtp-Source: ABdhPJzPhq+D2QL5S5E5+QlgqBW+mFOjXds30+XeZT2XbK1gHL1jtWh0KSsMMOr9IdNL5PnZ5ukzpQ==
X-Received: by 2002:a05:600c:4ba2:: with SMTP id
 e34mr2708187wmp.121.1614343492145; 
 Fri, 26 Feb 2021 04:44:52 -0800 (PST)
Received: from apalos.home (ppp-94-64-113-158.home.otenet.gr. [94.64.113.158])
 by smtp.gmail.com with ESMTPSA id
 k15sm11218296wmj.6.2021.02.26.04.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 04:44:51 -0800 (PST)
Date: Fri, 26 Feb 2021 14:44:49 +0200
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <YDjtQZAc8KlzaoLq@apalos.home>
References: <20210225193754.1898064-1-ilias.apalodimas@linaro.org>
 <6b05b88b-0a6a-8f13-6255-f9b19d0e848e@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6b05b88b-0a6a-8f13-6255-f9b19d0e848e@foss.st.com>
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 etienne.carriere@linaro.org
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp1: enable uefi related
	commands
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

On Fri, Feb 26, 2021 at 01:38:21PM +0100, Patrick DELAUNAY wrote:
> Hi Ilias
> 
> On 2/25/21 8:37 PM, Ilias Apalodimas wrote:
> > The board can boot with UEFI. With the latest changes in U-Boot's
> > EFI subsystem we also have support for EFI runtime variables, without
> > SetVariable support.  We can also store the EFI variables in a file on the
> > ESP partition and preserve them across reboots.
> > The env and efidebug commands are missing in order to configure
> > EFI variables and the efibootmgr though.  Since U-Boot's default config
> > enables other EFI related commands (e.g bootefi), let's add the env related
> > and efidebug commands and allow users to do that
> > 
> > Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > ---
> >   configs/stm32mp15_trusted_defconfig | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> > index da31b74cdeb6..107041119f1d 100644
> > --- a/configs/stm32mp15_trusted_defconfig
> > +++ b/configs/stm32mp15_trusted_defconfig
> > @@ -17,6 +17,7 @@ CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
> >   CONFIG_SYS_PROMPT="STM32MP> "
> >   CONFIG_CMD_ADTIMG=y
> >   CONFIG_CMD_ERASEENV=y
> > +CONFIG_CMD_NVEDIT_EFI=y
> >   CONFIG_CMD_MEMINFO=y
> >   CONFIG_CMD_MEMTEST=y
> >   CONFIG_CMD_ADC=y
> > @@ -32,6 +33,7 @@ CONFIG_CMD_USB=y
> >   CONFIG_CMD_USB_MASS_STORAGE=y
> >   CONFIG_CMD_BMP=y
> >   CONFIG_CMD_CACHE=y
> > +CONFIG_CMD_EFIDEBUG=y
> >   CONFIG_CMD_TIME=y
> >   CONFIG_CMD_TIMER=y
> >   CONFIG_CMD_PMIC=y
> > @@ -144,4 +146,5 @@ CONFIG_BMP_32BPP=y
> >   CONFIG_WDT=y
> >   CONFIG_WDT_STM32MP=y
> >   CONFIG_ERRNO_STR=y
> > +# CONFIG_HEXDUMP is not set
> >   CONFIG_FDT_FIXUP_PARTITIONS=y
> 
> 
> I am ok with tha added configs.
> 
> 
> But can you update also the stm32_basic_defconfig:
> 
> for STMicroelectronics boards, we want to have the the same
> 
> configuation between basic and trusted boot chain
> 
> (except SPL or OP-TEE related config).

Yea sure, 

Cheers
/Ilias
> 
> 
> Thanks
> 
> 
> Patrick
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

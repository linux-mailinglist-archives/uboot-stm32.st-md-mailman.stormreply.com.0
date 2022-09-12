Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 974355B5655
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Sep 2022 10:35:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A08FC03FD5;
	Mon, 12 Sep 2022 08:35:24 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E742AC03FC7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 08:35:22 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id e20so14097330wri.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 01:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foundries.io; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from:from:to
 :cc:subject:date;
 bh=s29l0wZzNZF8YyTkoEnvxt+MybTnCeKVppKqy7+Lexg=;
 b=mM+6stjjnKNrpjat/4eFUdCfFlotsJs+3xZoK9v5UNTGmz9kNwV9zmJCz6uQmzP/Jo
 WQ5GA/aA7TVcIkG7mTkMnIOEuiv+K6sojuVfNOWgpUGKwZdv5YcuSmkT83rJt+Lr/ZqE
 YEDTwfUBRaO4gCKifoygyZ3xAqXAJJQ41sDsc4ILq3fP+L+5/IQGwenb6499Eih9mMv+
 fJLm9p1gS+kPVrSOAvbxRc6oaOqDxtDk3f+5M2NegrZGas0jiNx12hygg5fuZSlQD4r+
 63OcsdBiVac4ZhMYGXb27hYESohJ4nwCcI+4+cGn3geTnOBOC1JynyNLGvFcuxtkqG+L
 EznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date;
 bh=s29l0wZzNZF8YyTkoEnvxt+MybTnCeKVppKqy7+Lexg=;
 b=feMDsK7HXWfTXuHnwphif5ACiPUyQryIpbe9UBg/QiZMPTH4qKinNaXdrBjg2Bjf7O
 QXITe4l3lM35OruCBHQAcabZUrjVV+rNBphGv4+1dzt4riMYwqaxHf17g3PNY/BxrPaP
 Qf6eK5sk9bmZMaDSJyJBfYEosZW7KjDxZru3iafG4p/VpXB2LLD95yIKIKGpJGRDefm/
 TXqYTcmZVHm+t56uwkNN1FK+ZDyD9wTY3oUC1/mBTHldLUXwCBfovTAwpQN7oTRBLxVS
 U5sgo+HktU6wFr7JegcXKj0iEPJQ/CD9pQrqO5ftLVSivysDI2pggzW66UEXQ5Z2uMnI
 +4cw==
X-Gm-Message-State: ACgBeo3SLwWIDxjQpNpIWtIEeF8r8xVnyC/CNYP+1uyB/MqjGmuNKpDn
 rREyyGDQeoywxMqET8sU2dhub6x99r2YmQ==
X-Google-Smtp-Source: AA6agR7rLVBw3wIrPRlD29m0AGzpwUcyh8eQjXUALvAGroxRLtpqgC2wN/cWfZc1+f7ZN9WdLUJMhw==
X-Received: by 2002:a05:6000:1a8f:b0:228:e3c3:679 with SMTP id
 f15-20020a0560001a8f00b00228e3c30679mr13522002wry.281.1662971722426; 
 Mon, 12 Sep 2022 01:35:22 -0700 (PDT)
Received: from trex (131.red-83-60-92.dynamicip.rima-tde.net. [83.60.92.131])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c038a00b003b2878b9e0dsm8836560wmd.20.2022.09.12.01.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 01:35:22 -0700 (PDT)
From: "Jorge Ramirez-Ortiz, Foundries" <jorge@foundries.io>
X-Google-Original-From: "Jorge Ramirez-Ortiz, Foundries" <JorgeRamirez-Ortiz>
Date: Mon, 12 Sep 2022 10:35:20 +0200
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20220912083520.GA168503@trex>
References: <20220909160627.1793406-1-alain.volmat@foss.st.com>
 <20220909160627.1793406-4-alain.volmat@foss.st.com>
 <ab83ad30-4cf2-8c6d-81ad-9edb47d646a2@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab83ad30-4cf2-8c6d-81ad-9edb47d646a2@foss.st.com>
Cc: u-boot@lists.denx.de, oleksandr.suvorov@foundries.io,
 uboot-stm32@st-md-mailman.stormreply.com, hs@denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 3/3] i2c: stm32: do not set the STOP
	condition on error
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 12/09/22, Patrick DELAUNAY wrote:
> Hi Alain,
> =

> On 9/9/22 18:06, Alain Volmat wrote:
> > Current function stm32_i2c_message_xfer is sending a STOP
> > whatever the result of the transaction is.  This can cause issues
> > such as making the bus busy since the controller itself is already
> > sending automatically a STOP when a NACK is generated.
> > =

> > Thanks to Jorge Ramirez-Ortiz for diagnosing and proposing a first
> > fix for this. [1]
> > =

> > [1] https://lore.kernel.org/u-boot/20220815145211.31342-2-jorge@foundri=
es.io/
> > =

> > Reported-by: Jorge Ramirez-Ortiz, Foundries <jorge@foundries.io>
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> >   drivers/i2c/stm32f7_i2c.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> > =

> > diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> > index 0ec67b5c12..2db7f44d44 100644
> > --- a/drivers/i2c/stm32f7_i2c.c
> > +++ b/drivers/i2c/stm32f7_i2c.c
> > @@ -483,9 +483,9 @@ static int stm32_i2c_message_xfer(struct stm32_i2c_=
priv *i2c_priv,
> >   		}
> >   	}
> > -	/* End of transfer, send stop condition */
> > -	mask =3D STM32_I2C_CR2_STOP;
> > -	setbits_le32(&regs->cr2, mask);
> > +	/* End of transfer, send stop condition if appropriate */
> > +	if (!ret && !(status & (STM32_I2C_ISR_NACKF | STM32_I2C_ISR_ERRORS)))
> > +		setbits_le32(&regs->cr2, STM32_I2C_CR2_STOP);
> >   	return stm32_i2c_check_end_of_message(i2c_priv);
> >   }
> =

> =

> =

> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Tested-by: Patrick Delaunay <patrick.delaunay@foss.st.com> [stm32mp157c-d=
k2]
> =

> No regression detection on ST Microelectonics board.
> =

> - No error trace on boot
> =

> - I2C probe command is OK
> =

> =A0 STM32MP> i2c probe
> =A0 Valid chip addresses: 28 33
> =

> - And other tests done with the 2 I2C devices STPMIC1 & STUSB1600 are ok:
> =A0 regulalor command
> =

> =A0 pmic status command
> =

> =A0 USB type C connection/deconnection
> =

> =

> @Jorge: can you test also for your use-case, thanks

yes I did test a few hours ago and it is good on my end.
can add my tested tag if needed

Tested-by: Jorge Ramirez-Ortiz <jorge@foundries.io>

btw I also sent a patch to fix the way some dts properties are handled.
shall I submit separately or will it be includeed in this set?


> =

> =

> Thanks
> Patrick
> =

> =

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

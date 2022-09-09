Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 856E55B31B7
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Sep 2022 10:30:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BE77C64112;
	Fri,  9 Sep 2022 08:30:41 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64796C6410E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Sep 2022 08:30:40 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id e20so1457316wri.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Sep 2022 01:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foundries.io; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date;
 bh=fBpCjizgmu50sDhjofNSK8n9JdwBT/AevOXrj9hPX4g=;
 b=UnFHY0H3zt6DAwIWc9giFmeCKzUtfzcg+fr2Ky0oclvHrOuYwXGQK3w3nJlESCrPDD
 7lOfh3SQhHqjUqfN28V42/A4b/ICJjXF3Bym6zT6wUGyI4iMCDCCKEyjwHDdgMAMhueS
 CqhIDA5HlpLPRuU+906tAn24a8lPzE8WDjanpO7FZHDVfjPrSvcJc2sDc9aWm2erxCzh
 lxbpgdIocqIoMLLgoSb4ko1Ps1JyhHk/AsxKtdeblcNkTvtCEaEEvNWVB+giG9YV4GOL
 TrGOaU8Q1sGT6+BKkGdjRw95IMhyua7NpAt0aWCaa54+0smppYuZ6N46unvh+mX3NUwx
 b3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date;
 bh=fBpCjizgmu50sDhjofNSK8n9JdwBT/AevOXrj9hPX4g=;
 b=7orzFAM6hooXcG9RjcRZvMJdSiCRzaOHeqwuOMFCcIphm1+eGlo4scl9LrwzogUm09
 lLgG0OJurCN6dkwVmYQcxo3T0BxKOStj5PDhEYZhSUr4XqK6MTTTiwYwTAgbFQejWIiK
 jHL63mBefSyRSFvP1OQ78wl9p20UBlczTWOGZ3eDhZP0TcdwzfpdqjHEx8QGyW74U4WQ
 VpTMT49T8UzE6Lbx4CoLuFyV7gSbxuN5pjV3nio7Bkx/sUS1/9tbQe4N2Rz8gqZf9nFv
 odIaJbXpfr6rJTrk0SsYHm0odHFHYfOZIGul89ewpGjcNNkQ56H0hGIKm970kdPEWRAw
 ByTQ==
X-Gm-Message-State: ACgBeo1aScRWtaQKZ7GHwAqxnS0mk2w/ubQNuxWg9VKmp0B5Cdygo0gN
 MznC0ljFNrA1/xBWJixPf8iMYQ==
X-Google-Smtp-Source: AA6agR5lehtMjLw5PKFA+dck+2mRGdnRP4KPXupasFf4nwUsvkcbNwOs10U+2rGaOxSkb/Bt1aY9Qg==
X-Received: by 2002:adf:e199:0:b0:228:60f6:f775 with SMTP id
 az25-20020adfe199000000b0022860f6f775mr7270497wrb.478.1662712239920; 
 Fri, 09 Sep 2022 01:30:39 -0700 (PDT)
Received: from trex (131.red-83-60-92.dynamicip.rima-tde.net. [83.60.92.131])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c1d8700b003b33de17577sm1402264wms.13.2022.09.09.01.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 01:30:39 -0700 (PDT)
From: "Jorge Ramirez-Ortiz, Foundries" <jorge@foundries.io>
X-Google-Original-From: "Jorge Ramirez-Ortiz, Foundries" <JorgeRamirez-Ortiz>
Date: Fri, 9 Sep 2022 10:30:38 +0200
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20220909083038.GA314457@trex>
References: <20220908105934.1764482-1-alain.volmat@foss.st.com>
 <20220908105934.1764482-4-alain.volmat@foss.st.com>
 <d7370841-4ba2-7e1f-596c-187de27e51b3@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d7370841-4ba2-7e1f-596c-187de27e51b3@foss.st.com>
Cc: u-boot@lists.denx.de, oleksandr.suvorov@foundries.io,
 uboot-stm32@st-md-mailman.stormreply.com, hs@denx.de
Subject: Re: [Uboot-stm32] [PATCH v2 3/3] i2c: stm32: only send a STOP upon
 transfer completion
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

On 08/09/22, Patrick DELAUNAY wrote:
> Hi,
> 
> On 9/8/22 12:59, Alain Volmat wrote:
> > Current function stm32_i2c_message_xfer is sending a STOP
> > whatever the result of the transaction is.  This can cause issues
> > such as making the bus busy since the controller itself is already
> > sending automatically a STOP when a NACK is generated.  This can
> > be especially seen when the processing get slower (ex: enabling lots
> > of debug messages), ending up send 2 STOP (one automatically by the
> > controller and a 2nd one at the end of the stm32_i2c_message_xfer
> > function).
> >

Cmon no need to thank me, that is kind of excessive :)
Just the sign-off or codevelop tags for reference


if you can wait before merging I will test the series before monday

thanks
Jorge

> > Thanks to Jorge Ramirez-Ortiz for diagnosing and proposing a first
> > fix for this. [1]
> > 
> > [1] https://lore.kernel.org/u-boot/20220815145211.31342-2-jorge@foundries.io/
> > 
> > Reported-by: Jorge Ramirez-Ortiz, Foundries <jorge@foundries.io>
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> >   drivers/i2c/stm32f7_i2c.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> > index 0ec67b5c12..8803979d3e 100644
> > --- a/drivers/i2c/stm32f7_i2c.c
> > +++ b/drivers/i2c/stm32f7_i2c.c
> > @@ -477,16 +477,16 @@ static int stm32_i2c_message_xfer(struct stm32_i2c_priv *i2c_priv,
> >   			if (ret)
> >   				break;
> > +			/* End of transfer, send stop condition */
> > +			mask = STM32_I2C_CR2_STOP;
> > +			setbits_le32(&regs->cr2, mask);
> > +
> >   			if (!stop)
> >   				/* Message sent, new message has to be sent */
> >   				return 0;
> >   		}
> >   	}
> > -	/* End of transfer, send stop condition */
> > -	mask = STM32_I2C_CR2_STOP;
> > -	setbits_le32(&regs->cr2, mask);
> > -
> >   	return stm32_i2c_check_end_of_message(i2c_priv);
> >   }
> 
> 
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> 
> Thanks
> Patrick
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

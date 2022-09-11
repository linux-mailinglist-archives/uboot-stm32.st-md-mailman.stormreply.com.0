Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF485B50C1
	for <lists+uboot-stm32@lfdr.de>; Sun, 11 Sep 2022 20:57:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72B5FC035BB;
	Sun, 11 Sep 2022 18:57:20 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98DC4C035A5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Sep 2022 18:57:19 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id h8so5115846wrf.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Sep 2022 11:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foundries.io; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date;
 bh=zM8BRonSym/Xp5kHXvi+mbWcDf8NxynpXaDKqnjJZLg=;
 b=YPybPfrixEO2opN6UN5GAMEe6FWhuOYHA4OZFqRffArOspvcpftMqyI+pVd5DUi/EU
 KsrFj3C3IaIzblpSXihGdruci4CSPr7zC9Rdiq8vZ9sYvGIV9vH5fIOIh80uYsDQ0jfJ
 rlPs5P3gs/GNgLR8Q+IWOoNbhimSI+QwgU977QPQWq5r4HbJkb0kUPGDkNOSCJgiyTCo
 Y6lk+HPRz+REOV4Ej9pN/IuyJj4MVuDUMXhdR1QGE/s5lb1DnjNEGEvrdQOoJZM/ZLcM
 ewwqPqluPvUasXpn7KXMFFElW341CH9v5ETtYr0lHe9JmN/BF8T7NxIYZFZoaHn2CuUR
 f6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date;
 bh=zM8BRonSym/Xp5kHXvi+mbWcDf8NxynpXaDKqnjJZLg=;
 b=1nEthu3ruucqRlJdohUOzhIrzWf0ahqDy6jKpWMA83eVssqSyn4DzM4jKRs2L6OA4Z
 /igpdkZF5Ce5iYDlQ5+6wY7aaSxU6/NmGQYA2BzSmgbdZMxbYlMK4Jn8PSIV9UsPx0YU
 6q/bmT2UNyCVPeXZAc+TIX0l0xzn7M1TsYIKuUbBBl2oX/TzG1RrfYpn3H/MsiQZaB4B
 xgqnA1gdaaLlsBLKGmUegi89VBzjvXv6lALTP4GKs0BZtYucAzzwgxeD/S9fegebDUCG
 W6B06gIU1wCKhhS1mdxHin2NE190uDtGhsEZEgy/HfMrkPprVdpGJBuvkY2D1xCS9Eug
 jBOw==
X-Gm-Message-State: ACgBeo009TYIQ4ptlOwoBhcKl0UMZOluE8wQhk+q4zRXZf9foOTmmweG
 GoF5DOjZSyVEOcKZ6/VZI4lC6Q==
X-Google-Smtp-Source: AA6agR42TjK3cbSvRKUR4nJ2ShKktc3/v/+3BUdgVGyckIb3xARB0UXBCIpKHEEbixKr9mZpF/DTVA==
X-Received: by 2002:adf:f911:0:b0:21e:c0f6:fd26 with SMTP id
 b17-20020adff911000000b0021ec0f6fd26mr13106584wrr.361.1662922639083; 
 Sun, 11 Sep 2022 11:57:19 -0700 (PDT)
Received: from trex (131.red-83-60-92.dynamicip.rima-tde.net. [83.60.92.131])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a05600c12c800b003a844885f88sm6932765wmd.22.2022.09.11.11.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 11:57:18 -0700 (PDT)
From: "Jorge Ramirez-Ortiz, Foundries" <jorge@foundries.io>
X-Google-Original-From: "Jorge Ramirez-Ortiz, Foundries" <JorgeRamirez-Ortiz>
Date: Sun, 11 Sep 2022 20:57:17 +0200
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <20220911185717.GA896524@trex>
References: <20220908105934.1764482-1-alain.volmat@foss.st.com>
 <20220908105934.1764482-4-alain.volmat@foss.st.com>
 <c1685d62-5ce8-b652-a5e1-c3e2d0066128@foss.st.com>
 <20220909151711.GA1792417@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220909151711.GA1792417@gnbcxd0016.gnb.st.com>
Cc: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 oleksandr.suvorov@foundries.io,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, hs@denx.de
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

On 09/09/22, Alain Volmat wrote:
> Hi Patrick
> 
> On Fri, Sep 09, 2022 at 02:53:23PM +0200, Patrick DELAUNAY wrote:
> > Hi Alain
> > 
> > On 9/8/22 12:59, Alain Volmat wrote:
> > > Current function stm32_i2c_message_xfer is sending a STOP
> > > whatever the result of the transaction is.  This can cause issues
> > > such as making the bus busy since the controller itself is already
> > > sending automatically a STOP when a NACK is generated.  This can
> > > be especially seen when the processing get slower (ex: enabling lots
> > > of debug messages), ending up send 2 STOP (one automatically by the
> > > controller and a 2nd one at the end of the stm32_i2c_message_xfer
> > > function).
> > > 
> > > Thanks to Jorge Ramirez-Ortiz for diagnosing and proposing a first
> > > fix for this. [1]
> > > 
> > > [1] https://lore.kernel.org/u-boot/20220815145211.31342-2-jorge@foundries.io/
> > > 
> > > Reported-by: Jorge Ramirez-Ortiz, Foundries <jorge@foundries.io>
> > > Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
> > > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > > ---
> > >   drivers/i2c/stm32f7_i2c.c | 8 ++++----
> > >   1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> > > index 0ec67b5c12..8803979d3e 100644
> > > --- a/drivers/i2c/stm32f7_i2c.c
> > > +++ b/drivers/i2c/stm32f7_i2c.c
> > > @@ -477,16 +477,16 @@ static int stm32_i2c_message_xfer(struct stm32_i2c_priv *i2c_priv,
> > >   			if (ret)
> > >   				break;
> > > +			/* End of transfer, send stop condition */
> > > +			mask = STM32_I2C_CR2_STOP;
> > > +			setbits_le32(&regs->cr2, mask);
> > > +
> > >   			if (!stop)
> > >   				/* Message sent, new message has to be sent */
> > >   				return 0;
> > >   		}
> > >   	}
> > > -	/* End of transfer, send stop condition */
> > > -	mask = STM32_I2C_CR2_STOP;
> > > -	setbits_le32(&regs->cr2, mask);
> > > -
> > >   	return stm32_i2c_check_end_of_message(i2c_priv);
> > >   }
> > 
> > 
> > Boot on DK2 failed with the traces:
> 
> Ouch, I am very sorry about that. I think I might have made a mistake
> during testing / removing debug traces, leading to this mistake ;-(
> Very sorry about that, thanks a lot Patrick for the test.
> 

Just did a quick verification on my end and at least for my use case it is all
good.

My use case is enabling SCP03 on the NXP SE05x using the U-boot i2c driver from
OP-TEE via the trampoline.

Also, xould you mind also including the fix below in your series Alain? I think
it is better if you send them all together.

many thanks for steping up for these fixes

Jorge



Author: Jorge Ramirez-Ortiz <jorge@foundries.io>
Date:   3 minutes ago

    i2c: stm32: fix usage of rise/fall device tree properties
    
    These two device tree properties were not being applied.
    
    Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>

diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
index 505d27afe8..5231055be0 100644
--- a/drivers/i2c/stm32f7_i2c.c
+++ b/drivers/i2c/stm32f7_i2c.c
@@ -910,17 +910,18 @@ static int stm32_of_to_plat(struct udevice *dev)
 {
        const struct stm32_i2c_data *data;
        struct stm32_i2c_priv *i2c_priv = dev_get_priv(dev);
-   u32 rise_time, fall_time;
        int ret;
 
        data = (const struct stm32_i2c_data *)dev_get_driver_data(dev);
        if (!data)
                return -EINVAL;
 
-   rise_time = dev_read_u32_default(dev, "i2c-scl-rising-time-ns",
+ i2c_priv->setup.rise_time = dev_read_u32_default(dev,
+                                  "i2c-scl-rising-time-ns",
                                         STM32_I2C_RISE_TIME_DEFAULT);
 
-   fall_time = dev_read_u32_default(dev, "i2c-scl-falling-time-ns",
+ i2c_priv->setup.fall_time = dev_read_u32_default(dev,
+                                 "i2c-scl-falling-time-ns",
                                         STM32_I2C_FALL_TIME_DEFAULT);
 
        i2c_priv->dnf_dt = dev_read_u32_default(dev, "i2c-digital-filter-width-ns", 0);
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

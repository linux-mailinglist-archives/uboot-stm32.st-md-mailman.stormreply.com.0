Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDC15B565C
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Sep 2022 10:36:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F18CC03FD5;
	Mon, 12 Sep 2022 08:36:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62A18C03FC7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 08:36:17 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C6k4vU007891;
 Mon, 12 Sep 2022 10:36:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=9tcwbiUbOEDg39A6isE7mF2j5mdBrpU5iCIgXs6FG3k=;
 b=IHcHczWQ7gZuJnNIiuBuFsylQtFIDICw+wz8qPhj7g5jH2vYn1XxF5EhJ2fNnR4h49n0
 DgbZfVAcR7OGgeA1rs5+iyvGao1K687k9/V6P6bVlssbMYY/iLdSKUy8VUpgwXwXdu2C
 2cBItA0p1EnPHu65g7eJ9X9JoZEPiWZTBBGJxL2naLuN5yVg2CwGHeQTPRNDG+EULMqf
 zLX7LQe/mhUI3I2IGj+gr3qqPCEQjNRR0XbgI0eS9qMpJ03p+RjgRK6n6LbzlrCqYfdg
 N9UQ4vh9iIZd7zQpAy93OOIFt8h6x12sWM41AmfMFuifebV3ID1AkSlJNV3UrLrAolwV oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jgjvjs3kh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 10:36:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0B66F10002A;
 Mon, 12 Sep 2022 10:36:14 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 028A2217B87;
 Mon, 12 Sep 2022 10:36:14 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.117) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 12 Sep
 2022 10:36:13 +0200
Date: Mon, 12 Sep 2022 10:36:07 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: "Jorge Ramirez-Ortiz, Foundries" <jorge@foundries.io>
Message-ID: <20220912083539.GA1826050@gnbcxd0016.gnb.st.com>
References: <20220908105934.1764482-1-alain.volmat@foss.st.com>
 <20220908105934.1764482-4-alain.volmat@foss.st.com>
 <c1685d62-5ce8-b652-a5e1-c3e2d0066128@foss.st.com>
 <20220909151711.GA1792417@gnbcxd0016.gnb.st.com>
 <20220911185717.GA896524@trex>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220911185717.GA896524@trex>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.117]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_04,2022-09-09_01,2022-06-22_01
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

Hi Jorge

On Sun, Sep 11, 2022 at 08:57:17PM +0200, Jorge Ramirez-Ortiz, Foundries wrote:
> On 09/09/22, Alain Volmat wrote:
> > Hi Patrick
> > 
> > On Fri, Sep 09, 2022 at 02:53:23PM +0200, Patrick DELAUNAY wrote:
> > > Hi Alain
> > > 
> > > On 9/8/22 12:59, Alain Volmat wrote:
> > > > Current function stm32_i2c_message_xfer is sending a STOP
> > > > whatever the result of the transaction is.  This can cause issues
> > > > such as making the bus busy since the controller itself is already
> > > > sending automatically a STOP when a NACK is generated.  This can
> > > > be especially seen when the processing get slower (ex: enabling lots
> > > > of debug messages), ending up send 2 STOP (one automatically by the
> > > > controller and a 2nd one at the end of the stm32_i2c_message_xfer
> > > > function).
> > > > 
> > > > Thanks to Jorge Ramirez-Ortiz for diagnosing and proposing a first
> > > > fix for this. [1]
> > > > 
> > > > [1] https://lore.kernel.org/u-boot/20220815145211.31342-2-jorge@foundries.io/
> > > > 
> > > > Reported-by: Jorge Ramirez-Ortiz, Foundries <jorge@foundries.io>
> > > > Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
> > > > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > > > ---
> > > >   drivers/i2c/stm32f7_i2c.c | 8 ++++----
> > > >   1 file changed, 4 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> > > > index 0ec67b5c12..8803979d3e 100644
> > > > --- a/drivers/i2c/stm32f7_i2c.c
> > > > +++ b/drivers/i2c/stm32f7_i2c.c
> > > > @@ -477,16 +477,16 @@ static int stm32_i2c_message_xfer(struct stm32_i2c_priv *i2c_priv,
> > > >   			if (ret)
> > > >   				break;
> > > > +			/* End of transfer, send stop condition */
> > > > +			mask = STM32_I2C_CR2_STOP;
> > > > +			setbits_le32(&regs->cr2, mask);
> > > > +
> > > >   			if (!stop)
> > > >   				/* Message sent, new message has to be sent */
> > > >   				return 0;
> > > >   		}
> > > >   	}
> > > > -	/* End of transfer, send stop condition */
> > > > -	mask = STM32_I2C_CR2_STOP;
> > > > -	setbits_le32(&regs->cr2, mask);
> > > > -
> > > >   	return stm32_i2c_check_end_of_message(i2c_priv);
> > > >   }
> > > 
> > > 
> > > Boot on DK2 failed with the traces:
> > 
> > Ouch, I am very sorry about that. I think I might have made a mistake
> > during testing / removing debug traces, leading to this mistake ;-(
> > Very sorry about that, thanks a lot Patrick for the test.
> > 
> 
> Just did a quick verification on my end and at least for my use case it is all
> good.
> 
> My use case is enabling SCP03 on the NXP SE05x using the U-boot i2c driver from
> OP-TEE via the trampoline.
> 
> Also, xould you mind also including the fix below in your series Alain? I think
> it is better if you send them all together.

Sure, just added it in my tree and will put the serie v4 in few seconds.
Thanks a lot for the patch.

Alain

> 
> many thanks for steping up for these fixes
> 
> Jorge
> 
> 
> 
> Author: Jorge Ramirez-Ortiz <jorge@foundries.io>
> Date:   3 minutes ago
> 
>     i2c: stm32: fix usage of rise/fall device tree properties
>     
>     These two device tree properties were not being applied.
>     
>     Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
> 
> diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> index 505d27afe8..5231055be0 100644
> --- a/drivers/i2c/stm32f7_i2c.c
> +++ b/drivers/i2c/stm32f7_i2c.c
> @@ -910,17 +910,18 @@ static int stm32_of_to_plat(struct udevice *dev)
>  {
>         const struct stm32_i2c_data *data;
>         struct stm32_i2c_priv *i2c_priv = dev_get_priv(dev);
> -   u32 rise_time, fall_time;
>         int ret;
>  
>         data = (const struct stm32_i2c_data *)dev_get_driver_data(dev);
>         if (!data)
>                 return -EINVAL;
>  
> -   rise_time = dev_read_u32_default(dev, "i2c-scl-rising-time-ns",
> + i2c_priv->setup.rise_time = dev_read_u32_default(dev,
> +                                  "i2c-scl-rising-time-ns",
>                                          STM32_I2C_RISE_TIME_DEFAULT);
>  
> -   fall_time = dev_read_u32_default(dev, "i2c-scl-falling-time-ns",
> + i2c_priv->setup.fall_time = dev_read_u32_default(dev,
> +                                 "i2c-scl-falling-time-ns",
>                                          STM32_I2C_FALL_TIME_DEFAULT);
>  
>         i2c_priv->dnf_dt = dev_read_u32_default(dev, "i2c-digital-filter-width-ns", 0);
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

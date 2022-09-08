Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE445B1834
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Sep 2022 11:17:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91591C63327;
	Thu,  8 Sep 2022 09:17:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD401C03FCD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Sep 2022 09:17:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2887K3g5018694;
 Thu, 8 Sep 2022 11:17:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=PAhFsfcqgYuED2OMLItnCexi2BXCUHFNhSiYk7uETss=;
 b=43jMCXruKhNZcdkJyRBfH04fTKecoVdqaEBhsqu7EDz/o845XHWq5jFOhfBBrTCLqWmD
 c35wt7RaTrUndjwmgcCaBhkRqxNxAChlfYCi30Bb2gkfVwjqJlxetHWDHVQ65GcP3qld
 LQRkFrWxUnbSV8mhcUS0BsG56zR86h8Ouple2Smv/pb90tSJTVZgJyrkKPhSngKvf3fW
 SNXj8dzLxjNqxyGOsq2Ffrmy5JPUhRshPfZHH8zLwfrWiiCnwFK5hV62C0v3jCFSG7T+
 eLtqPDiAfXbqbFPidDO19dpO/y/wjhhT5M0kRatVyJ94ZfIQs5AEoB4NKrDwuUr4pDZM AA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jerfv7etq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Sep 2022 11:17:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5C4B810002A;
 Thu,  8 Sep 2022 11:17:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3F67421BF78;
 Thu,  8 Sep 2022 11:17:26 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Thu, 8 Sep 2022
 11:17:26 +0200
Date: Thu, 8 Sep 2022 11:17:13 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: "Jorge Ramirez-Ortiz, Foundries" <jorge@foundries.io>
Message-ID: <20220908091713.GA1762989@gnbcxd0016.gnb.st.com>
References: <20220908080627.1762034-1-alain.volmat@foss.st.com>
 <20220908080627.1762034-4-alain.volmat@foss.st.com>
 <20220908083622.GA117999@trex>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220908083622.GA117999@trex>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_06,2022-09-07_02,2022-06-22_01
Cc: u-boot@lists.denx.de, patrick.delaunay@foss.st.com,
 oleksandr.suvorov@foundries.io, uboot-stm32@st-md-mailman.stormreply.com,
 hs@denx.de
Subject: Re: [Uboot-stm32] [PATCH 3/3] i2c: stm32: only send a STOP upon
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

Hi Jorge,

On Thu, Sep 08, 2022 at 10:36:22AM +0200, Jorge Ramirez-Ortiz, Foundries wrote:
> On 08/09/22, Alain Volmat wrote:
> > Current function stm32_i2c_message_xfer is sending a STOP
> > whatever the result of the transaction is.  This can cause issues
> > such as making the bus busy since the controller itself is already
> > sending automatically a STOP when a NACK is generated.  This can
> > be especially seen when the processing get slower (ex: enabling lots
> > of debug messages), ending up send 2 STOP (one automatically by the
> > controller and a 2nd one at the end of the stm32_i2c_message_xfer
> > function).
> 
> um I debugged this - took me a couple of days - and I proposed a fix that has just
> been massaged a little in this PR.
> 
> IMO the best thing to do is either adding me - or to be fair yourself since you
> invested almost zero time on it - as a co-author. The hard bit was to find the
> issue in the first place.
> 
> what do you think?

I'm very sorry, it wasn't my intention at all but indeed I should have
taken more care to highlight your work.  Sorry about that.
I'm going to push a v2 for the serie, highlighting that and putting
your Signed-of first.

> 
> I'll try to find some time to test this.
> 
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> >  drivers/i2c/stm32f7_i2c.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> > index 0ec67b5c12..8803979d3e 100644
> > --- a/drivers/i2c/stm32f7_i2c.c
> > +++ b/drivers/i2c/stm32f7_i2c.c
> > @@ -477,16 +477,16 @@ static int stm32_i2c_message_xfer(struct stm32_i2c_priv *i2c_priv,
> >  			if (ret)
> >  				break;
> >  
> > +			/* End of transfer, send stop condition */
> > +			mask = STM32_I2C_CR2_STOP;
> > +			setbits_le32(&regs->cr2, mask);
> > +
> >  			if (!stop)
> >  				/* Message sent, new message has to be sent */
> >  				return 0;
> >  		}
> >  	}
> >  
> > -	/* End of transfer, send stop condition */
> > -	mask = STM32_I2C_CR2_STOP;
> > -	setbits_le32(&regs->cr2, mask);
> > -
> >  	return stm32_i2c_check_end_of_message(i2c_priv);
> >  }
> >  
> > -- 
> > 2.25.1
> > 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

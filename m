Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6075C5B1768
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Sep 2022 10:44:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0917AC63328;
	Thu,  8 Sep 2022 08:44:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EDE7C035BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Sep 2022 09:20:09 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2879EQlO031642;
 Wed, 7 Sep 2022 11:20:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=Z4zrY6oUicmqw2ti6GbS2pKSONsH20X/ID4/9OIKCDM=;
 b=mtAwgLxWvRJzmnZM4B7mXonAQFl8tNfJDaSWSpj3+Ik3sVeF0w6xBFAopWuSajdXQCNW
 vw84rYA+pJpC6Nv2+fFFY7YVOBNveJEh2E4wpAzCrkkx0LTTzEIugMDRDpF7RtOFmTnn
 pUyc0yXcMGjNA975iWpR7yTujHOg1em4O7N0cm4kmUredFCVB1+qginxUmlodISHmLeA
 pFoPAi4uv07FLKjOWj8tCBSOmb1fbkKAEbPvNEmfsyi0Zhf0wJJAECkze5dhKmYrp7eG
 ChPnadamIKtJVXCTUHWdESnPXc2MdWSFhrReZaH6SQYwUh2TaWNWYVqJWfD3105vJRSB AA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jergb01p7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 11:20:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B502610002A;
 Wed,  7 Sep 2022 11:20:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B5DD2194FF;
 Wed,  7 Sep 2022 11:20:06 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.45) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Wed, 7 Sep 2022
 11:20:06 +0200
Date: Wed, 7 Sep 2022 11:20:00 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <20220907092000.GA1713256@gnbcxd0016.gnb.st.com>
References: <20220815145211.31342-1-jorge@foundries.io>
 <20220815145211.31342-2-jorge@foundries.io>
 <80f7f6f4-22bf-7ece-2a6e-0ae34c493cd9@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <80f7f6f4-22bf-7ece-2a6e-0ae34c493cd9@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_04,2022-09-06_02,2022-06-22_01
X-Mailman-Approved-At: Thu, 08 Sep 2022 08:44:19 +0000
Cc: u-boot@lists.denx.de, oleksandr.suvorov@foundries.io,
 uboot-stm32@st-md-mailman.stormreply.com, patrick.delaunay@foss.st.com,
 hs@denx.de
Subject: Re: [Uboot-stm32] [PATCHv2 2/2] i2c: stm32f7: do not set the STOP
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

I confirm that a fix is necessary regarding this setting of the stop
condition.  As a matter of fact, the controller is already sending
the stop condition in case of NACK so there is no need to send the
stop condition.
However, this fix is not enough since the nack could be detected
few lines above 

	if (status & (STM32_I2C_ISR_NACKF | STM32_I2C_ISR_ERRORS))
		break;

and in this case the current check would not catch it.

I propose to set the STOP condition upon handling of the transfer
complete.

I've put this fix within a small 3 patches series that I'm going to
send, could you check it to confirm this fixes the issue ?

Regards,
Alain

On Thu, Aug 25, 2022 at 03:36:36PM +0200, Patrice CHOTARD wrote:
> +Alain (with the correct email address ;-))
> 
> Alain, can you have a look a this patch and give your feedback on it.
> 
> On my side i tested it on stm32mp157c-ev1 and stm32mp157c-dk2, i didn't see any regression
> but i prefer to get expert feedback 
> 
> Thanks
> Patrice
> 
> On 8/15/22 16:52, Jorge Ramirez-Ortiz wrote:
> > Sending the stop condition without waiting for transfer complete
> > has been found to lock the bus (BUSY) when NACKF is raised.
> > 
> > Tested accessing the NXP SE05X I2C device.
> > https://www.nxp.com/docs/en/application-note/AN12399.pdf
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
> > Reviewed-by: Oleksandr Suvorov <oleksandr.suvorov@foundries.io>
> > ---
> >  drivers/i2c/stm32f7_i2c.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> > index 3a727e68ac..14827e5cec 100644
> > --- a/drivers/i2c/stm32f7_i2c.c
> > +++ b/drivers/i2c/stm32f7_i2c.c
> > @@ -485,9 +485,11 @@ static int stm32_i2c_message_xfer(struct stm32_i2c_priv *i2c_priv,
> >  		}
> >  	}
> >  
> > -	/* End of transfer, send stop condition */
> > -	mask = STM32_I2C_CR2_STOP;
> > -	setbits_le32(&regs->cr2, mask);
> > +	if (!ret) {
> > +		/* End of transfer, send stop condition */
> > +		mask = STM32_I2C_CR2_STOP;
> > +		setbits_le32(&regs->cr2, mask);
> > +	}
> >  
> >  	return stm32_i2c_check_end_of_message(i2c_priv);
> >  }
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

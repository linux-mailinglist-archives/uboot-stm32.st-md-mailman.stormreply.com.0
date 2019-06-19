Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A200B4BC0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Jun 2019 16:51:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50F45C57170
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Jun 2019 14:51:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FDF3C5716F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 14:51:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JEhIBe023636; Wed, 19 Jun 2019 16:50:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=uXmPfu/R/IhFZ9PwJSxU9L2qN4VZiendKrX0+t2/tJA=;
 b=rUP86kEEHJNoRt+aIBBaAaReQ1SG2n0A3r2WdGi3evPppOWL7XqzPpNi4w+mLMf6PSiD
 8iFzQQ1RaM5lOKGE0YMqnIm11A8lwd3h0QqqFWYuYzZKdSxjVPJbLBEfYcXBQCXMipN8
 TZNloGnupw8zaBA/CIbNdMiXRwb4h6SmZqE7pQBUtGHdTGT/Kuxp9Py2TjTchc8ehAAn
 G6QIaR2ERwUA4hRDflERnkN80YX4Ml2tpaVJArC2/vFTbyPCS7VvTR15/5fbQv9xVNo7
 EZ/s5XZ+xd835UY82yT90LTiCMBE6F8H7y67flTnLgUwuw2d858am6JiO5RrF2RemrW+ Cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t7812vmnn-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 19 Jun 2019 16:50:58 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8579238;
 Wed, 19 Jun 2019 14:50:57 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5BB812AB4;
 Wed, 19 Jun 2019 14:50:57 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 19 Jun
 2019 16:50:56 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 19 Jun 2019 16:50:56 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Thread-Topic: [PATCH v2 1/3] usb: dwc2: correctly handle binding for
 g-tx-fifo-size
Thread-Index: AQHVJeYhJ75E66g/rEKRlcrQjtNpuKahfV6AgAGTSoA=
Date: Wed, 19 Jun 2019 14:50:56 +0000
Message-ID: <bb45f66747ea42c9831c8400adce5cf1@SFHDAG6NODE3.st.com>
References: <1560869838-22025-1-git-send-email-patrick.delaunay@st.com>
 <19c2894d-a526-da83-3f93-20de1605cbaa@denx.de>
In-Reply-To: <19c2894d-a526-da83-3f93-20de1605cbaa@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] usb: dwc2: correctly handle
 binding for g-tx-fifo-size
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

Hi Marek,

> From: Marek Vasut <marex@denx.de>
> Sent: mardi 18 juin 2019 18:46
> 
> On 6/18/19 4:57 PM, Patrick Delaunay wrote:
> > Manage g-tx-fifo-size as a array as specify in the binding.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> 
> Reviewed-by: Marek Vasut <marex@denx.de>
> 
> I'm missing 2/3 , although I think it might be better if you take this whole series
> through u-boot-stm .

Ok thanks,

We (Patrice or me) we will take the serie on u-boot-stm.

> > ---
> >
> > Changes in v2:
> > - move dt update in a separate patch
> > - remove unecessary temporary variable
> >
> >  drivers/usb/gadget/dwc2_udc_otg.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/gadget/dwc2_udc_otg.c
> > b/drivers/usb/gadget/dwc2_udc_otg.c
> > index 494ab53..023439c 100644
> > --- a/drivers/usb/gadget/dwc2_udc_otg.c
> > +++ b/drivers/usb/gadget/dwc2_udc_otg.c
> > @@ -1039,6 +1039,7 @@ static int dwc2_udc_otg_ofdata_to_platdata(struct
> udevice *dev)
> >  	int node = dev_of_offset(dev);
> >  	ulong drvdata;
> >  	void (*set_params)(struct dwc2_plat_otg_data *data);
> > +	int ret;
> >
> >  	if (usb_get_dr_mode(node) != USB_DR_MODE_PERIPHERAL) {
> >  		dev_dbg(dev, "Invalid mode\n");
> > @@ -1050,7 +1051,18 @@ static int dwc2_udc_otg_ofdata_to_platdata(struct
> udevice *dev)
> >  	platdata->rx_fifo_sz = dev_read_u32_default(dev, "g-rx-fifo-size", 0);
> >  	platdata->np_tx_fifo_sz = dev_read_u32_default(dev,
> >  						       "g-np-tx-fifo-size", 0);
> > -	platdata->tx_fifo_sz = dev_read_u32_default(dev, "g-tx-fifo-size", 0);
> > +
> > +	platdata->tx_fifo_sz_nb =
> > +		dev_read_size(dev, "g-tx-fifo-size") / sizeof(u32);
> > +	if (platdata->tx_fifo_sz_nb > DWC2_MAX_HW_ENDPOINTS)
> > +		platdata->tx_fifo_sz_nb = DWC2_MAX_HW_ENDPOINTS;
> > +	if (platdata->tx_fifo_sz_nb) {
> > +		ret = dev_read_u32_array(dev, "g-tx-fifo-size",
> > +					 platdata->tx_fifo_sz_array,
> > +					 platdata->tx_fifo_sz_nb);
> > +		if (ret)
> > +			return ret;
> > +	}
> >
> >  	platdata->force_b_session_valid =
> >  		dev_read_bool(dev, "u-boot,force-b-session-valid");
> >
> 
> 
> --
> Best regards,
> Marek Vasut
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

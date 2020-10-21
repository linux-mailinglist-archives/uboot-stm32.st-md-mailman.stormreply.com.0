Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A19FD294BEE
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 13:46:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E92FC3FAE0;
	Wed, 21 Oct 2020 11:46:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7426C3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 11:46:52 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LBfxrB015884; Wed, 21 Oct 2020 13:46:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=2MKjBBgvKg4X4KFpt/JWcpiqpJGNp8AzoP5k3zvN0UU=;
 b=Rcf+8LMCvw9UaSVgc26Z48huqZS3W4f3pUWBrYIPtRKTmGp91vZQ6NoyEU6ZQPIN8p+4
 z12pbM4AKZeQucrBzdFiu1oX96GwUjyEVmMgg2Rqql/2PiDCl6riLNubd+fjxpGuazxB
 663UISNySIFCAgnTGWr4afmO5lS57VM4bZ43+OtbrA1A7rqU5+P4ct+DHFME74zJ3aTA
 KvT+S35ULcjFrE0z86cLI0bkOQBNIlvjvI02RALEB/BDvfEojlOSBumcb0NPVQyu0cOw
 LL9OiuUdSBBjgDTlI4P2w74xotP5d8XkEEK7BkWR3ifN6gPw5TyfbmbwBlCUzH4E5DWg eQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347pcx1r52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 13:46:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8AF0210002A;
 Wed, 21 Oct 2020 13:46:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 71D732E082D;
 Wed, 21 Oct 2020 13:46:43 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 13:46:43 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 13:46:42 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] usb: dwc2: add "u-boot,force-vbus-detection" for stm32
Thread-Index: AQHWovGt9Y3AMtsM/0mEkuEc2BNk0amh2EMA
Date: Wed, 21 Oct 2020 11:46:42 +0000
Message-ID: <d1741e28-4d96-7739-6117-656d812760c6@st.com>
References: <20201015144856.1.I77269d852e0f410c31f9d1f869815c4328510c12@changeid>
In-Reply-To: <20201015144856.1.I77269d852e0f410c31f9d1f869815c4328510c12@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <A8BFC61E20FF87438211169A14559E8B@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Kever Yang <kever.yang@rock-chips.com>, Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] usb: dwc2: add "u-boot,
	force-vbus-detection" for stm32
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

Hi Patrick

On 10/15/20 2:49 PM, Patrick Delaunay wrote:
> On some board, the ID pin is not connected so the B session must be
> overridden with "u-boot,force_b_session_valid" but the VBus sensing
> must continue to be handle.
>
> To managed it, this patch adds a new DT field
> "u-boot,force-vbus-detection" to use with "u-boot,force_b_session_valid"
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/usb/gadget/dwc2_udc_otg.c      | 59 +++++++++++++++++---------
>  drivers/usb/gadget/dwc2_udc_otg_regs.h |  2 +
>  include/usb/dwc2_udc.h                 |  1 +
>  3 files changed, 41 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/usb/gadget/dwc2_udc_otg.c b/drivers/usb/gadget/dwc2_udc_otg.c
> index eaa5dcb9b1..d20ce6147e 100644
> --- a/drivers/usb/gadget/dwc2_udc_otg.c
> +++ b/drivers/usb/gadget/dwc2_udc_otg.c
> @@ -1014,6 +1014,9 @@ static int dwc2_udc_otg_ofdata_to_platdata(struct udevice *dev)
>  	platdata->force_b_session_valid =
>  		dev_read_bool(dev, "u-boot,force-b-session-valid");
>  
> +	platdata->force_vbus_detection =
> +		dev_read_bool(dev, "u-boot,force-vbus-detection");
> +
>  	/* force platdata according compatible */
>  	drvdata = dev_get_driver_data(dev);
>  	if (drvdata) {
> @@ -1106,31 +1109,45 @@ static int dwc2_udc_otg_probe(struct udevice *dev)
>  	if (ret)
>  		return ret;
>  
> -	if (CONFIG_IS_ENABLED(DM_REGULATOR) &&
> -	    platdata->activate_stm_id_vb_detection &&
> -	    !platdata->force_b_session_valid) {
> -		ret = device_get_supply_regulator(dev, "usb33d-supply",
> -						  &priv->usb33d_supply);
> -		if (ret) {
> -			dev_err(dev, "can't get voltage level detector supply\n");
> -			return ret;
> +	if (platdata->activate_stm_id_vb_detection) {
> +		if (CONFIG_IS_ENABLED(DM_REGULATOR) &&
> +		    (!platdata->force_b_session_valid ||
> +		     platdata->force_vbus_detection)) {
> +			ret = device_get_supply_regulator(dev, "usb33d-supply",
> +							  &priv->usb33d_supply);
> +			if (ret) {
> +				dev_err(dev, "can't get voltage level detector supply\n");
> +				return ret;
> +			}
> +			ret = regulator_set_enable(priv->usb33d_supply, true);
> +			if (ret) {
> +				dev_err(dev, "can't enable voltage level detector supply\n");
> +				return ret;
> +			}
>  		}
> -		ret = regulator_set_enable(priv->usb33d_supply, true);
> -		if (ret) {
> -			dev_err(dev, "can't enable voltage level detector supply\n");
> -			return ret;
> +
> +		if (platdata->force_b_session_valid &&
> +		    !platdata->force_vbus_detection) {
> +			/* Override VBUS detection: enable then value*/
> +			setbits_le32(&usbotg_reg->gotgctl, VB_VALOEN);
> +			setbits_le32(&usbotg_reg->gotgctl, VB_VALOVAL);
> +		} else {
> +			/* Enable VBUS sensing */
> +			setbits_le32(&usbotg_reg->ggpio,
> +				     GGPIO_STM32_OTG_GCCFG_VBDEN);
> +		}
> +		if (platdata->force_b_session_valid) {
> +			/* Override B session bits: enable then value */
> +			setbits_le32(&usbotg_reg->gotgctl, A_VALOEN | B_VALOEN);
> +			setbits_le32(&usbotg_reg->gotgctl,
> +				     A_VALOVAL | B_VALOVAL);
> +		} else {
> +			/* Enable ID detection */
> +			setbits_le32(&usbotg_reg->ggpio,
> +				     GGPIO_STM32_OTG_GCCFG_IDEN);
>  		}
> -		/* Enable vbus sensing */
> -		setbits_le32(&usbotg_reg->ggpio,
> -			     GGPIO_STM32_OTG_GCCFG_VBDEN |
> -			     GGPIO_STM32_OTG_GCCFG_IDEN);
>  	}
>  
> -	if (platdata->force_b_session_valid)
> -		/* Override B session bits : value and enable */
> -		setbits_le32(&usbotg_reg->gotgctl,
> -			     A_VALOEN | A_VALOVAL | B_VALOEN | B_VALOVAL);
> -
>  	ret = dwc2_udc_probe(platdata);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/usb/gadget/dwc2_udc_otg_regs.h b/drivers/usb/gadget/dwc2_udc_otg_regs.h
> index 2eda5c3720..9ca6f42375 100644
> --- a/drivers/usb/gadget/dwc2_udc_otg_regs.h
> +++ b/drivers/usb/gadget/dwc2_udc_otg_regs.h
> @@ -94,6 +94,8 @@ struct dwc2_usbotg_reg {
>  #define B_VALOEN			BIT(6)
>  #define A_VALOVAL			BIT(5)
>  #define A_VALOEN			BIT(4)
> +#define VB_VALOVAL			BIT(3)
> +#define VB_VALOEN			BIT(2)
>  
>  /* DWC2_UDC_OTG_GOTINT */
>  #define GOTGINT_SES_END_DET		(1<<2)
> diff --git a/include/usb/dwc2_udc.h b/include/usb/dwc2_udc.h
> index a2af381a66..aa37e957b4 100644
> --- a/include/usb/dwc2_udc.h
> +++ b/include/usb/dwc2_udc.h
> @@ -28,6 +28,7 @@ struct dwc2_plat_otg_data {
>  	unsigned int	tx_fifo_sz_array[DWC2_MAX_HW_ENDPOINTS];
>  	unsigned char   tx_fifo_sz_nb;
>  	bool		force_b_session_valid;
> +	bool		force_vbus_detection;
>  	bool		activate_stm_id_vb_detection;
>  };
>  

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5422D7BAD8
	for <lists+uboot-stm32@lfdr.de>; Wed, 31 Jul 2019 09:41:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04CCDC36B3F
	for <lists+uboot-stm32@lfdr.de>; Wed, 31 Jul 2019 07:41:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D557C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2019 07:41:36 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6V7b4Rv027793
 for <uboot-stm32@st-md-mailman.stormreply.com>; Wed, 31 Jul 2019 09:41:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=aBFlQ27cf1vqtKx8dcd8/NfECXe8FgLiUZUqsoG/zjM=;
 b=xBbCuB2bJttVzbso7CJtxREkDrfOaPe4uvDKrVP7OJ4sRr7ZmIEsX3sHtOYkrsynAdrF
 xZooNE4XlLLrhdqprJjgETpLZE24AubFpQKrZy5jJJmmkW6v1qmVAN8vixWL53TuxGdN
 x54D8rMZi5/D8obhMJI3EiVcd6i5cWz8baTaHfJJ0zmAlSdrfIZgbmF5Xpmj2SuMHTNZ
 REdJwGnVrS/9PiCk7tupOqVzybt+oi+r8SpA/CnEymv9JYbWSIv6iTHj4iaeaKwhaQNI
 U1SZ9J1WpL5jQNW9fUNwmiJwnSm7pElJA4QOAkv5TktOoOFH/hF3i29XMYBRVCwuOSa2 /g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u0c2yf0ws-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Wed, 31 Jul 2019 09:41:31 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 321E234
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2019 07:41:30 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1AA02136B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2019 07:41:30 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 31 Jul
 2019 09:41:29 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 31 Jul 2019 09:41:29 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Thread-Topic: [U-BOOT internal][PATCH 1/3] usb: host: dwc2: add phy support
Thread-Index: AQHVRuMYkQgmc9A2T0WRez+7uK8aAqbkN22A
Date: Wed, 31 Jul 2019 07:41:29 +0000
Message-ID: <85f54a28-dbda-8bcd-5363-480677555f50@st.com>
References: <1564496921-15594-1-git-send-email-patrick.delaunay@st.com>
 <1564496921-15594-2-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1564496921-15594-2-git-send-email-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <BA0B5F0AFAB2B44C98546DA7D9A4B9E8@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-31_03:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [U-BOOT internal][PATCH 1/3] usb: host: dwc2: add
	phy support
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


On 7/30/19 4:28 PM, Patrick Delaunay wrote:
> Use generic phy to initialize the PHY associated to the
> DWC2 device and available in the device tree.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/usb/host/dwc2.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
> index a62a2f8..a06efad 100644
> --- a/drivers/usb/host/dwc2.c
> +++ b/drivers/usb/host/dwc2.c
> @@ -7,6 +7,7 @@
>  #include <common.h>
>  #include <dm.h>
>  #include <errno.h>
> +#include <generic-phy.h>
>  #include <usb.h>
>  #include <malloc.h>
>  #include <memalign.h>
> @@ -35,6 +36,7 @@ struct dwc2_priv {
>  #ifdef CONFIG_DM_REGULATOR
>  	struct udevice *vbus_supply;
>  #endif
> +	struct phy phy;
>  #else
>  	uint8_t *aligned_buffer;
>  	uint8_t *status_buffer;
> @@ -1317,13 +1319,69 @@ static int dwc2_usb_ofdata_to_platdata(struct udevice *dev)
>  	return 0;
>  }
>  
> +static int dwc2_setup_phy(struct udevice *dev)
> +{
> +	struct dwc2_priv *priv = dev_get_priv(dev);
> +	int ret;
> +
> +	ret = generic_phy_get_by_index(dev, 0, &priv->phy);
> +	if (ret) {
> +		if (ret != -ENOENT) {
> +			dev_err(dev, "failed to get usb phy\n");
> +			return ret;
> +		}
> +		return 0;
> +	}
> +
> +	ret = generic_phy_init(&priv->phy);
> +	if (ret) {
> +		dev_err(dev, "failed to init usb phy\n");
> +		return ret;
> +	}
> +
> +	ret = generic_phy_power_on(&priv->phy);
> +	if (ret) {
> +		dev_err(dev, "failed to power on usb phy\n");
> +		return generic_phy_exit(&priv->phy);
> +	}
> +
> +	return 0;
> +}
> +
> +static int dwc2_shutdown_phy(struct udevice *dev)
> +{
> +	struct dwc2_priv *priv = dev_get_priv(dev);
> +	int ret;
> +
> +	if (!generic_phy_valid(&priv->phy))
> +		return 0;
> +
> +	ret = generic_phy_power_off(&priv->phy);
> +	if (ret) {
> +		dev_err(dev, "failed to power off usb phy\n");
> +		return ret;
> +	}
> +
> +	ret = generic_phy_exit(&priv->phy);
> +	if (ret) {
> +		dev_err(dev, "failed to power off usb phy\n");
> +		return ret;
> +	}
> +	return 0;

add a blank line before the return


> +}
> +
>  static int dwc2_usb_probe(struct udevice *dev)
>  {
>  	struct dwc2_priv *priv = dev_get_priv(dev);
>  	struct usb_bus_priv *bus_priv = dev_get_uclass_priv(dev);
> +	int ret;
>  
>  	bus_priv->desc_before_addr = true;
>  
> +	ret = dwc2_setup_phy(dev);
> +	if (ret)
> +		return ret;
> +
>  	return dwc2_init_common(dev, priv);
>  }
>  
> @@ -1336,6 +1394,8 @@ static int dwc2_usb_remove(struct udevice *dev)
>  	if (ret)
>  		return ret;
>  
> +	dwc2_shutdown_phy(dev);
> +
>  	dwc2_uninit_common(priv->regs);
>  
>  	reset_release_bulk(&priv->resets);
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

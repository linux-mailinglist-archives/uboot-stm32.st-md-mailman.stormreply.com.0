Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E327BAF6
	for <lists+uboot-stm32@lfdr.de>; Wed, 31 Jul 2019 09:51:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E826C36B3F
	for <lists+uboot-stm32@lfdr.de>; Wed, 31 Jul 2019 07:51:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAED0C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2019 07:51:49 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6V7kRfg002560
 for <uboot-stm32@st-md-mailman.stormreply.com>; Wed, 31 Jul 2019 09:51:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=FzYS59rFqBs6NtBwp5iMKSTuyAJtfUC1mEOjzuRjY1c=;
 b=bmZU8HsRY/b+Csfw5rzEEf/bp5Xo196O5q+DszM1WI9p1N1yQrLIGszqwdgcGH5syuWf
 +z49vG3dht+yBwzDVCj+6ZxLDswPvdr6T6ixPZ0AKdOvfGnD01Xei/3+sDM3rIRdWNlR
 t1B13Zocn6J4ccJTEFxzxSIHL77vjqjFLcbeiECMQDuT429jko3TNv1TxdnaLmuA73ji
 TZ5aijCGgj/0Rs06rnicRrGrtcAy+GrIbZdLndaQ2KQkNb/I86hcfRuStmMt16TNV5KV
 W32yt7X+tZp27dlijOWdMqSGYmtzYC1PKEV6I4+X2b7fDBrAaFaYP3SPz6NV1m3v35it YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u0c2yf2hx-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Wed, 31 Jul 2019 09:51:48 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0560E31
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2019 07:51:47 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DBB9E13A8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2019 07:51:47 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 31 Jul
 2019 09:51:47 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 31 Jul 2019 09:51:47 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Thread-Topic: [U-BOOT internal][PATCH 2/3] usb: host: dwc2: add support for
 reset and clk
Thread-Index: AQHVRuMZGDFdz3UqG0uScDgfdnb7N6bkOk6A
Date: Wed, 31 Jul 2019 07:51:47 +0000
Message-ID: <41f97cfb-3d27-fd63-5462-a24b4a86942b@st.com>
References: <1564496921-15594-1-git-send-email-patrick.delaunay@st.com>
 <1564496921-15594-3-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1564496921-15594-3-git-send-email-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <AE1D210F56465C46883C00D0319D3235@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-31_03:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [U-BOOT internal][PATCH 2/3] usb: host: dwc2: add
 support for reset and clk
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
> Add support for clock and reset with driver model.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/usb/host/dwc2.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
> index a06efad..06db8da 100644
> --- a/drivers/usb/host/dwc2.c
> +++ b/drivers/usb/host/dwc2.c
> @@ -5,13 +5,15 @@
>   */
>  
>  #include <common.h>
> +#include <clk.h>
>  #include <dm.h>
>  #include <errno.h>
>  #include <generic-phy.h>
> -#include <usb.h>
>  #include <malloc.h>
>  #include <memalign.h>
>  #include <phys2bus.h>
> +#include <reset.h>
> +#include <usb.h>
>  #include <usbroothubdes.h>
>  #include <wait_bit.h>
>  #include <asm/io.h>
> @@ -1370,6 +1372,48 @@ static int dwc2_shutdown_phy(struct udevice *dev)
>  	return 0;
>  }
>  
> +static int dwc2_reset_init(struct udevice *dev)
> +{
> +	struct reset_ctl_bulk	resets;
> +	int ret;
> +
> +	ret = reset_get_bulk(dev, &resets);
> +	if (ret == -ENOTSUPP || ret == -ENOENT)
> +		return 0;
> +	else if (ret)
> +		return ret;
> +
> +	reset_assert_bulk(&resets);
> +	udelay(2);
> +	ret = reset_deassert_bulk(&resets);
> +	if (ret) {
> +		reset_release_bulk(&resets);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dwc2_clk_init(struct udevice *dev)
> +{
> +	struct clk_bulk		clks;
> +	int ret;
> +
> +	ret = clk_get_bulk(dev, &clks);
> +	if (ret == -ENOSYS || ret == -ENOENT)
> +		return 0;
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_enable_bulk(&clks);
> +	if (ret) {
> +		clk_release_bulk(&clks);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int dwc2_usb_probe(struct udevice *dev)
>  {
>  	struct dwc2_priv *priv = dev_get_priv(dev);
> @@ -1378,6 +1422,14 @@ static int dwc2_usb_probe(struct udevice *dev)
>  
>  	bus_priv->desc_before_addr = true;
>  
> +	ret = dwc2_reset_init(dev);


in dwc2_init_common(), reset are already manged by dwc2_reset()

> +	if (ret)
> +		return ret;
> +
> +	ret = dwc2_clk_init(dev);
> +	if (ret)
> +		return ret;
> +
>  	ret = dwc2_setup_phy(dev);
>  	if (ret)
>  		return ret;
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

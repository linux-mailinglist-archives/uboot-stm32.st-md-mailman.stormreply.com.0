Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A965E9A14
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Sep 2022 09:07:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1FF8C03FC7;
	Mon, 26 Sep 2022 07:07:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18A80C035BA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 07:07:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28Q6n3vn004276;
 Mon, 26 Sep 2022 09:07:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=JTEZFj4r1gCzJA7BMAXafa2FtNbSnNEFU2QcqTy4j64=;
 b=dpB4IogrY8wQIuUmWdYloesLqASp62cOQwdN6hQLHm+WUmv2IZ0j92retHDvhFAQvHwL
 l/xnoTnBA3vV3snNVzlcE+tBFzQI0A6qaD30HaLCpFxfqlcWp0Fg4OqXFpDPvMnExuxO
 O2y0Io8qiUVTaccfl0atak3wTct9N1wXZ9qcSalb3jA+OmHA91BrOEZb2Aj0UC+PpXeM
 QoLaid2YnN5gjwvv3nOrUzGUvrpMQ3DnUqJVy+2MQnBY5qxrHiOKeg02GkXZPV1rtRyV
 NkTAJ5Bfthd89+C0hNwFzCuwO0NuVJKRGAu+22fL+K9cGfFn6OjCyUrVhcUa+IRWZfam TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsrsj9e4e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 09:07:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8C40010002A;
 Mon, 26 Sep 2022 09:07:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 760162132F7;
 Mon, 26 Sep 2022 09:07:01 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 09:07:01 +0200
Message-ID: <a133e873-d977-f1e7-71e2-31fcf6a28b3a@foss.st.com>
Date: Mon, 26 Sep 2022 09:07:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220920133954.1.Iff08cf94aa6c6d3678acb28a8dd012d466184b42@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220920133954.1.Iff08cf94aa6c6d3678acb28a8dd012d466184b42@changeid>
X-Originating-IP: [10.75.127.121]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_04,2022-09-22_02,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] phy: usbphyc: use
 regulator_set_enable_if_allowed for disabling vbus supply
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

On 9/20/22 13:39, Patrick Delaunay wrote:
> Use regulator_set_enable_if_allowed() api instead of regulator_set_enable()
> while disabling vbus supply. This way the driver doesn't see an error
> when it disable an always-on regulator for VBUS.
> 
> This patch is needed for STM32MP157C-DK2 board when the regulator
> v3v3: buck4 used as the phy vbus supply in kernel device tree
> is always on with the next hack for low power use-case:
> 
> &usbphyc_port0 {
>         ...
> 	/*
> 	 * Hack to keep hub active until all connected devices are suspended
> 	 * otherwise the hub will be powered off as soon as the v3v3 is disabled
> 	 * and it can disturb connected devices.
> 	 */
> 	connector {
> 		compatible = "usb-a-connector";
> 		vbus-supply = <&v3v3>;
> 	};
> };
> 
> Without this patch and the previous update in DT the command
> "usb stop" failed and the next command "usb start" cause a crash.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/phy/phy-stm32-usbphyc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/phy-stm32-usbphyc.c b/drivers/phy/phy-stm32-usbphyc.c
> index 9f0b7d71187..dcf2194e9a7 100644
> --- a/drivers/phy/phy-stm32-usbphyc.c
> +++ b/drivers/phy/phy-stm32-usbphyc.c
> @@ -375,7 +375,7 @@ static int stm32_usbphyc_phy_power_off(struct phy *phy)
>  		return 0;
>  
>  	if (usbphyc_phy->vbus) {
> -		ret = regulator_set_enable(usbphyc_phy->vbus, false);
> +		ret = regulator_set_enable_if_allowed(usbphyc_phy->vbus, false);
>  		if (ret)
>  			return ret;
>  	}
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DF160E19F
	for <lists+uboot-stm32@lfdr.de>; Wed, 26 Oct 2022 15:09:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B9B3C03FC6;
	Wed, 26 Oct 2022 13:09:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 301B6C035BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Oct 2022 13:09:27 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29QCMjj1020217;
 Wed, 26 Oct 2022 15:09:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=p0RpO7/mMRvyNhdbqhbn+0sjRnzlN1YIrv8jX80O7w0=;
 b=tdw33+WekrpPeI3s0njfnKTZBJ9hxJKsn5dw8hsXY+ClojJ6PD0DVoVFBoDINI5BcTwZ
 nwKPS4dC2jrsLw+VRwGwKnlLPiXklBuvH7JexcLkddJF84TRLJPNZVWnYQqGLNBrMQl5
 l4q64lwE3s77KP7NnfIfKXzvzgMtUivoQIiEwaueNjL8MILGumSU6RXjyjorP8Qy/6qr
 J0nLZfSrIpge4D7mFWmfYbJITSCnbv2WRs5OtNlWbT22bhYePK0QYfxCLcJjFx33W0Xw
 gmMfEq4uJ4ktKv/nc66Psq1K3EGDVf8Wcqayv5Y8GgppIqhidcoxjDg6hvQ96Ga6Ijlc YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kebqtt9wg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Oct 2022 15:09:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7CE4C10002A;
 Wed, 26 Oct 2022 15:09:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 78AD822788C;
 Wed, 26 Oct 2022 15:09:18 +0200 (CEST)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 26 Oct
 2022 15:09:15 +0200
Message-ID: <f895a545-158e-8ce1-c08e-0556841cd9e7@foss.st.com>
Date: Wed, 26 Oct 2022 15:09:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: <u-boot@lists.denx.de>, Marek Vasut <marex@denx.de>
References: <20220920133954.1.Iff08cf94aa6c6d3678acb28a8dd012d466184b42@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220920133954.1.Iff08cf94aa6c6d3678acb28a8dd012d466184b42@changeid>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-26_06,2022-10-26_01,2022-06-22_01
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Marek,

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
>          ...
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
>   drivers/phy/phy-stm32-usbphyc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/phy-stm32-usbphyc.c b/drivers/phy/phy-stm32-usbphyc.c
> index 9f0b7d71187..dcf2194e9a7 100644
> --- a/drivers/phy/phy-stm32-usbphyc.c
> +++ b/drivers/phy/phy-stm32-usbphyc.c
> @@ -375,7 +375,7 @@ static int stm32_usbphyc_phy_power_off(struct phy *phy)
>   		return 0;
>   
>   	if (usbphyc_phy->vbus) {
> -		ret = regulator_set_enable(usbphyc_phy->vbus, false);
> +		ret = regulator_set_enable_if_allowed(usbphyc_phy->vbus, false);
>   		if (ret)
>   			return ret;
>   	}


Can you reviewed this minor patch for v2023.01-rc1 ?


Thanks.


Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

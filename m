Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6071D316F
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 15:38:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C91BC36B10
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 13:38:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66993C36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 13:38:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04EDSTgC000745; Thu, 14 May 2020 15:37:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=3peIJADw0tga+drV5r0kvEbTfd5YqNfizvthmYoyfE4=;
 b=UCqccimRC5vs72u1OOYJ4h2609luLQtClXoxTn1j8ipuRKSMp84pqthmAIIUCmT/MtlW
 aC27zH/XiFckHlLAlZb9v+VOp1DzP4FT9KpTpUDMlhN7gjetOjf3inMQi7aLY5h1N2hq
 OkWIMdjFNLTCLQWolsRJ7fUZyS3m4WeEMCpk1TKqrGvBlXwx8DizHELOuh7xMMDcK9aP
 ACb4zPAnnnptGNIQ8c6NWED/4Dz+7c7fGGC0+lRv2AviHqyI+1xMHOI3phE2cN7+S/o4
 KDqVoNZ6HwD9migTvifWIEytTi3Z18OPL5yhUDpHIonb+cVJb8f8th+ISsZfdz4qp+zG ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vpkm0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 15:37:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D0B84100034;
 Thu, 14 May 2020 15:37:50 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BB73B2BE249;
 Thu, 14 May 2020 15:37:50 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 May
 2020 15:37:50 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 14 May 2020 15:37:50 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [RESEND PATCH] net: dwc_eth_qos: update the
 compatible supported for STM32
Thread-Index: AQHWKfTcMRki4Yd/7k2Mev+9vUTp6Q==
Date: Thu, 14 May 2020 13:37:49 +0000
Message-ID: <67aa9083-0f52-1b5f-9c5b-9a902dbf4a9a@st.com>
References: <20200514130023.15030-1-patrick.delaunay@st.com>
In-Reply-To: <20200514130023.15030-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <D89B6FD1DBF3DD49BE515AF9A666C7E4@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_04:2020-05-14,
 2020-05-14 signatures=0
Cc: Marek Vasut <marex@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe ROULLIER <christophe.roullier@st.com>,
 David Wu <david.wu@rock-chips.com>
Subject: Re: [Uboot-stm32] [RESEND PATCH] net: dwc_eth_qos: update the
 compatible supported for STM32
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

On 5/14/20 3:00 PM, Patrick Delaunay wrote:
> Update the compatible associated with the STM32 MPU glue
> in the DWC ethernet driver.
>
> The supported compatible is the specific "st,stm32mp1-dwmac"
> as indicated in Linux binding
> Documentation/devicetree/bindings/net/stm32-dwmac.txt
> and not the "snps,dwmac-4.20a" only used to the select IP
> version.
>
> This glue is implemented in Linux kernel in:
> drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
>
> For information in stm32mp151.dtsi, the 2 compatibles are
> supported:
>
> ethernet0: ethernet@5800a000 {
> 	compatible = "st,stm32mp1-dwmac", "snps,dwmac-4.20a";
> 	...
> };
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> RESEND with fix patman on Series-cc
>
>  drivers/net/dwc_eth_qos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
> index f67c5f4570..5e7ad6c658 100644
> --- a/drivers/net/dwc_eth_qos.c
> +++ b/drivers/net/dwc_eth_qos.c
> @@ -2166,7 +2166,7 @@ static const struct udevice_id eqos_ids[] = {
>  		.data = (ulong)&eqos_tegra186_config
>  	},
>  	{
> -		.compatible = "snps,dwmac-4.20a",
> +		.compatible = "st,stm32mp1-dwmac",
>  		.data = (ulong)&eqos_stm32_config
>  	},
>  	{

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

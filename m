Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9677E6ECD8C
	for <lists+uboot-stm32@lfdr.de>; Mon, 24 Apr 2023 15:24:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56351C6905A;
	Mon, 24 Apr 2023 13:24:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F7E1C65E4C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Apr 2023 13:24:31 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33O9fcKW010136; Mon, 24 Apr 2023 15:24:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=6L2Q8qPs6M2QDdO68wNAzM7z2SwDuhd7kWLJ2RNt3bI=;
 b=BymipvHnli/LY3zpc7N8E3VgIGd0iWhV4Z497e0XEr8Azkp5yQsd0VhLKVr7HJb+KEXc
 k0y9zZTmkCveuLrdcvQqil421NT7MLlosDlR9+bwXcXrd1GjHvDoC18eSH9NHu7Uyo/j
 fbXNCwPClBT8oo23WF3Y0CkMSMeuPnm5FEL1YSZ4XJEi2RU8ypIb/V/VOk6e3YTBgvhm
 i4wkdlQQTLidCoJC0zvqsQJS9wTxNRL9rS/Mm5glGgiG3HDXHbD1GlD19xZN7pLCMGEh
 JhtsbjngsFrCnDHbQtM41MKij9n/9x31ydrLCPdsJqB27blnBFSftzM6lp1krbIKMbgc lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q5qc31au2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 15:24:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9EAA8100038;
 Mon, 24 Apr 2023 15:24:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 985FE22FA37;
 Mon, 24 Apr 2023 15:24:28 +0200 (CEST)
Received: from [10.48.1.0] (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 24 Apr
 2023 15:24:27 +0200
Message-ID: <64773f53-d867-3af8-62dc-e9ea8265be5a@foss.st.com>
Date: Mon, 24 Apr 2023 15:24:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20230422140236.616419-1-dario.binacchi@amarulasolutions.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20230422140236.616419-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_07,2023-04-21_01,2023-02-09_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32f769-disco: remove the
 dsi_host node
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

Hi,

On 4/22/23 16:02, Dario Binacchi wrote:
> The node has become useless, as described in the
> commit 754815b854258 ("video: stm32: remove the compatible "synopsys, dw-mipi-dsi" support")
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>
>   arch/arm/dts/stm32f769-disco-u-boot.dtsi | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/arch/arm/dts/stm32f769-disco-u-boot.dtsi b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
> index b5198fddff7c..2c823cce98b4 100644
> --- a/arch/arm/dts/stm32f769-disco-u-boot.dtsi
> +++ b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
> @@ -28,11 +28,6 @@
>   		button-gpio = <&gpioa 0 0>;
>   	};
>   
> -	dsi_host: dsi_host {
> -		compatible = "synopsys,dw-mipi-dsi";
> -		status = "okay";
> -	};
> -
>   	led1 {
>   		compatible = "st,led1";
>   		led-gpio = <&gpioj 5 0>;




Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 085294264CC
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 08:43:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C16F4C597B3;
	Fri,  8 Oct 2021 06:43:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4CFCC597B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 06:43:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1984ZdI3022582; 
 Fri, 8 Oct 2021 08:43:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=tqX0V4d0wRwIfq2tHBAlC25glUGMj4xfTpBYSoA9yb0=;
 b=QOMFrM+x8GzcHRBwj9JqnduLZtW8NPc+C0BO8+GEm9J4Jx4862ViWEitltFfnaka9JE+
 lr+s1SER8/iGnlv5spQfeJtVxbPuiUD53FZbdXHdE333uZzUdYvzITcBjqr+roEQ3cVU
 zqWcfBdoPmDIOoQ6SIH1IM2RhGxVSs4Z18eW2rdqlaECqBChF2VhJPjWOY6Ounzdb1K+
 Ww+hl2Z9f0Z//KdU467pJtRyVU9qGTrTX6hYcNr5RxG2/Q6x35uWjXGmR2rlkGAO6EBR
 Rddr7gehfUtZBAp/7qz33YuF2mknWJPeZO3ViTTudNUJY0ggTzb4PpfE4zIgvcE4zMDL tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bjbjshq63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 08:43:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C503010002A;
 Fri,  8 Oct 2021 08:43:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BC5DD214D25;
 Fri,  8 Oct 2021 08:43:42 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 8 Oct
 2021 08:43:42 +0200
To: <u-boot@lists.denx.de>
References: <20210803100515.29383-1-patrice.chotard@foss.st.com>
 <20210803100515.29383-4-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <142541b4-fe8a-2af8-5602-a5ef7e61e07b@foss.st.com>
Date: Fri, 8 Oct 2021 08:43:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210803100515.29383-4-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_02,2021-10-07_02,2020-04-07_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 dillon min <dillon.minfei@gmail.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v1 3/7] arm: dts: stm32: Add
 i2c-analog-filter property in I2C nodes for stm32h743
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

Hi

On 8/3/21 12:05 PM, Patrice Chotard wrote:
> Add i2c-analog-filter property in I2C nodes to enable analog
> filter feature.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32h743.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32h743.dtsi b/arch/arm/dts/stm32h743.dtsi
> index ed6857512f..dbfebf07f2 100644
> --- a/arch/arm/dts/stm32h743.dtsi
> +++ b/arch/arm/dts/stm32h743.dtsi
> @@ -124,6 +124,7 @@
>  				     <32>;
>  			resets = <&rcc STM32H7_APB1L_RESET(I2C1)>;
>  			clocks = <&rcc I2C1_CK>;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> @@ -136,6 +137,7 @@
>  				     <34>;
>  			resets = <&rcc STM32H7_APB1L_RESET(I2C2)>;
>  			clocks = <&rcc I2C2_CK>;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> @@ -148,6 +150,7 @@
>  				     <73>;
>  			resets = <&rcc STM32H7_APB1L_RESET(I2C3)>;
>  			clocks = <&rcc I2C3_CK>;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> @@ -395,6 +398,7 @@
>  				     <96>;
>  			resets = <&rcc STM32H7_APB4_RESET(I2C4)>;
>  			clocks = <&rcc I2C4_CK>;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> 
Applied on u-boot-stm32 for next
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

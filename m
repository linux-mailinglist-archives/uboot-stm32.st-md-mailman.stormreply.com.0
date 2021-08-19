Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 226373F187A
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Aug 2021 13:47:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEE7DC58D58;
	Thu, 19 Aug 2021 11:47:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93E64C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Aug 2021 11:47:10 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17JBkIB8021234; Thu, 19 Aug 2021 13:47:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=XTjK3wAtfgh37oz9FdtTZ/0e4bauw+n+7WzxySuhhOM=;
 b=vTCb5kBd/AlKBOEE9+okOXRrDkmjc3LC0Mt4bx3xwwp4ZNbSt9rUy8BCIQe/HvTxyvaE
 bYvsxY9uyh5mm51dtoyf4w/MZPq5/Q3pbMceStcZKHm4H9kcH+YMIZXD/VjJJlH/hZ4x
 eesCL5+ZzaVSBSpvoe1VeP2ZI7oKH1QGwfYMPa+fUjmIvVVGEviHq4nrF9qzRYrQhEKj
 Xz+eyap9nnBkOKl8NIaIJ8hYk9Ofpk5o7mEIQ1VJ2CLglIru5gjBkd872GoZ9Gdww8Cy
 dTmbDW1SwILQpw6kUoNFuZ5iM+I7xe+Xqwvhil7uopI2JaIVmDjqW6wil/UDN7G9l1KF Lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3ah8re4791-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 13:47:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 58BD410002A;
 Thu, 19 Aug 2021 13:47:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4E92323146F;
 Thu, 19 Aug 2021 13:47:08 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 19 Aug
 2021 13:47:07 +0200
To: <u-boot@lists.denx.de>
References: <20210803100515.29383-1-patrice.chotard@foss.st.com>
 <20210803100515.29383-4-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <dff2df1c-57dc-5471-cf3e-4475dc4c4824@foss.st.com>
Date: Thu, 19 Aug 2021 13:47:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803100515.29383-4-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-19_04:2021-08-17,
 2021-08-19 signatures=0
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

Hi Patrick

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
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 647303F1879
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Aug 2021 13:47:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4C2DC58D58;
	Thu, 19 Aug 2021 11:47:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EE17C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Aug 2021 11:47:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17JBcAuj017509; Thu, 19 Aug 2021 13:46:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=u30pcSEXde4H5wkKpXUQQhwvc2NAkRyPKtIP/qFzOLA=;
 b=GWs8Qp4UEX3LLgWkgw1pkL0E44rTmE6yNTUxwokYgkyoYKy7g01V6kDB+Gn51bV7whgn
 l8Md10s55zDBFIYuUfEEO6ENBooLo25s1H7GdEiF2K4Zcori2f/gf1rGbvEQi588i4DG
 S6Y113ovXxZBfcfKaRhPpljBnLbEAZjlcwGEt7GBw1rYVSCgyqTPQEz+BK3R4ooIxgrR
 X3XNEIPnAzrcP47AczTo1LdpTk/O18vKXMlkiRBjLD9tLMSPos1wmb3/1MzArhHXM0Bn
 1Mw/8K4m1sQy3WutEx8As6SPNTmSZyvaTJaXH6yX3xzGXJ3F1/ZpWz4klj9gfoSD4CUf lA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3ahjva9n19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 13:46:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BF3F310002A;
 Thu, 19 Aug 2021 13:46:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF7F623146E;
 Thu, 19 Aug 2021 13:46:58 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 19 Aug
 2021 13:46:57 +0200
To: <u-boot@lists.denx.de>
References: <20210803100515.29383-1-patrice.chotard@foss.st.com>
 <20210803100515.29383-3-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <469cb39d-d362-4e26-3730-10d696872e41@foss.st.com>
Date: Thu, 19 Aug 2021 13:46:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803100515.29383-3-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-19_04:2021-08-17,
 2021-08-19 signatures=0
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v1 2/7] arm: dts: stm32: Add
 i2c-analog-filter property in I2C nodes for stm32f746
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
>  arch/arm/dts/stm32f746.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32f746.dtsi b/arch/arm/dts/stm32f746.dtsi
> index ba9b3cd03c..78facde2b5 100644
> --- a/arch/arm/dts/stm32f746.dtsi
> +++ b/arch/arm/dts/stm32f746.dtsi
> @@ -313,6 +313,7 @@
>  			clocks = <&rcc 1 CLK_I2C1>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> @@ -325,6 +326,7 @@
>  			clocks = <&rcc 1 CLK_I2C2>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> @@ -337,6 +339,7 @@
>  			clocks = <&rcc 1 CLK_I2C3>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> @@ -349,6 +352,7 @@
>  			clocks = <&rcc 1 CLK_I2C4>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
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

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A19C866796E
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Jan 2023 16:36:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6876CC65048;
	Thu, 12 Jan 2023 15:36:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 799C8C6334A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 15:36:24 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30CCHNJf017586; Thu, 12 Jan 2023 16:36:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=KfNJka+eIyyH212S/kZIRdcz9ehI/1X6WkZpT2iNoEo=;
 b=TLhNoxRh03mDiY+o0k9IvXCa5i5SSXMygP26TNCs+T6pfheuS58NA+9giOWw1raXMTy8
 bQiNVb9uQL/wG41yDt3w+8ogRPJoJ5pBqilXP+orW+HnPXeiS8G/9a3USlezfdskwNj7
 2Uf3R9qZdH4bTddE9Ez37PIjxVUWjUThehU6ocSbmNb1V4j8rtIQwies5wl/DqVV7XWv
 k8xZOXUo3ReMSmIFDOQsA5E2vVRLMzoEHCYQ1bGqkCq+3nU74fWiB/UAVJ9uA0i8mBKv
 biBLvpQzHDlNqka01ILL+ZwGzT1nQCc17cbCg0F6jJDSTgAiHoh4m/fW0wJyKD4ik2/a xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n1k43kkyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 16:36:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E942610002A;
 Thu, 12 Jan 2023 16:36:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E22DE218619;
 Thu, 12 Jan 2023 16:36:22 +0100 (CET)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 12 Jan
 2023 16:36:22 +0100
Message-ID: <aae967a4-529e-dc3f-986e-64b47163dd26@foss.st.com>
Date: Thu, 12 Jan 2023 16:36:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20221214162434.1.Ib96329f23b27691d7a9c091a6a88be2658143ddc@changeid>
 <20221214162434.2.Ie6e264286646c0b3a316fd10286ad3ffa78e5e08@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221214162434.2.Ie6e264286646c0b3a316fd10286ad3ffa78e5e08@changeid>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_08,2023-01-12_01,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] ARM: dts: stm32mp15: fix typo in
	stm32mp15xx-dkx.dtsi
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

On 12/14/22 16:25, Patrick Delaunay wrote:
> Remove unnecessary space in device tree stm32mp15xx-dkx.dtsi.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp15xx-dkx.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
> index 5a045d7156be..34af90195d12 100644
> --- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
> @@ -390,21 +390,21 @@
>  				regulator-always-on;
>  			};
>  
> -			 bst_out: boost {
> +			bst_out: boost {
>  				regulator-name = "bst_out";
>  				interrupts = <IT_OCP_BOOST 0>;
> -			 };
> +			};
>  
>  			vbus_otg: pwr_sw1 {
>  				regulator-name = "vbus_otg";
>  				interrupts = <IT_OCP_OTG 0>;
> -			 };
> +			};
>  
> -			 vbus_sw: pwr_sw2 {
> +			vbus_sw: pwr_sw2 {
>  				regulator-name = "vbus_sw";
>  				interrupts = <IT_OCP_SWOUT 0>;
>  				regulator-active-discharge = <1>;
> -			 };
> +			};
>  		};
>  
>  		onkey {
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D46B677E2A8
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Aug 2023 15:34:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C0AFC6B45E;
	Wed, 16 Aug 2023 13:34:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0928BC6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 13:34:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37G9HYUh006614; Wed, 16 Aug 2023 15:34:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=NLzTrEc2ZN8XRcNeG5kf8kNloXL+UZcs88SzEF5Vdpk=; b=YD
 ZFuFBXUK0w2rT6kYToJ0YQXMuj9LKVx/zQ1JrJt+WCgJDkJNiLacdbhQVdwE40Mf
 8VdU16l56Ph6YmXq6FO1G675ElmE/1Va+1q2EpJD8MuAb00rPNe3V6P2yl6KAVOh
 68CC8m3by+FfaUtDtlT3ypHb0IDOte0q0PeO/772PXAXsODtJXEEt9NjQtqZok7p
 LDLZTSoUe0MVBO0lHZ1oXwGkSfngPe8uOH+u7saDSPuTzy+6s43recReXzEvZKQk
 ygvFOBsA5OD5jbC9OPjPKHcoNZcBpv/6FqwSrpJi7kG2YemHtb7lz3sq1Um2XxwQ
 2avt35fs3pEbMdtyQltQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sguptseu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Aug 2023 15:34:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A7F010005D;
 Wed, 16 Aug 2023 15:34:02 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 321B2242ADE;
 Wed, 16 Aug 2023 15:34:02 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 16 Aug
 2023 15:34:01 +0200
Message-ID: <f6e407f3-0e6a-464d-38cb-3d2e2c5f39b0@foss.st.com>
Date: Wed, 16 Aug 2023 15:34:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230710104406.1.Icd397b21b510ba9fc2de7cd4b69835afb131dda7@changeid>
 <20230710104406.2.Ia58005c96c892d76d149dbad1aa51eb06f60f673@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230710104406.2.Ia58005c96c892d76d149dbad1aa51eb06f60f673@changeid>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_13,2023-08-15_02,2023-05-22_02
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 Etienne CARRIERE <etienne.carriere@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] ARM: dts: sm32mp13: remove shmem for
	scmi-optee
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



On 7/10/23 10:44, Patrick Delaunay wrote:
> CFG_STM32MP1_SCMI_SHM_SYSRAM will be disabled by default for STM32MP13x
> SoCs in next OP-TEE version and the OP-TEE SMCI server uses the OP-TEE
> native shared memory registered by clients.
> 
> To be compatible by default with this configuration this patch removes
> the shared memory in the SCMI configuration and the associated reserved
> memory in SRAM.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp13-u-boot.dtsi |  8 --------
>  arch/arm/dts/stm32mp131.dtsi       | 14 --------------
>  2 files changed, 22 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32mp13-u-boot.dtsi b/arch/arm/dts/stm32mp13-u-boot.dtsi
> index 726cd1a7e479..aa5cfc6e41d5 100644
> --- a/arch/arm/dts/stm32mp13-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp13-u-boot.dtsi
> @@ -108,14 +108,6 @@
>  	bootph-all;
>  };
>  
> -&scmi_shm {
> -	bootph-all;
> -};
> -
> -&scmi_sram {
> -	bootph-all;
> -};
> -
>  &syscfg {
>  	bootph-all;
>  };
> diff --git a/arch/arm/dts/stm32mp131.dtsi b/arch/arm/dts/stm32mp131.dtsi
> index d94ba2547267..f1810c9eb704 100644
> --- a/arch/arm/dts/stm32mp131.dtsi
> +++ b/arch/arm/dts/stm32mp131.dtsi
> @@ -40,7 +40,6 @@
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  			linaro,optee-channel-id = <0>;
> -			shmem = <&scmi_shm>;
>  
>  			scmi_clk: protocol@14 {
>  				reg = <0x14>;
> @@ -106,19 +105,6 @@
>  		interrupt-parent = <&intc>;
>  		ranges;
>  
> -		scmi_sram: sram@2ffff000 {
> -			compatible = "mmio-sram";
> -			reg = <0x2ffff000 0x1000>;
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -			ranges = <0 0x2ffff000 0x1000>;
> -
> -			scmi_shm: scmi-sram@0 {
> -				compatible = "arm,scmi-shmem";
> -				reg = <0 0x80>;
> -			};
> -		};
> -
>  		timers2: timer@40000000 {
>  			#address-cells = <1>;
>  			#size-cells = <0>;

Applied on stm32-master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E04A077E2A7
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Aug 2023 15:33:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90883C6B45E;
	Wed, 16 Aug 2023 13:33:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8439C6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 13:33:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37G9C2UQ021258; Wed, 16 Aug 2023 15:33:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=Q7QjqoUCKaYO4yiSJTgGY1yE1LlGDG6jyrYynjJuh0w=; b=cj
 ZouSVsPzszOxpUm7uY7PJmoSU8LUSqIHL5F8s4IpRYVskxdDizqiYyxBoTg1DVsI
 3AKwWjS1yivmyLJWALqIFP+0hSEnLu/37sk28uGOporC7PcsrlnG1Jzdrixh+IjH
 1Ss6Q0EJagst5o1dM108On+AwIudapVKfb8A3JP0xKyiyZDfWGZy5aGBnIcGYWQk
 56KzuzFr531yCdY/E0YHvuNVkLJj506WR4ZTz7Rb2K5ZfcGkehR6s3xhbJReyK5C
 Nt4j+HhO60zFAwD2+ehJTDfs6AhqsAQil4OmE85VkGLpo0JjjuFfXf4/LRmZYkXk
 34/rj6NK1C2IxW9x5DlA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sgum7hfj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Aug 2023 15:33:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E379E10005D;
 Wed, 16 Aug 2023 15:33:55 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DB115242ADE;
 Wed, 16 Aug 2023 15:33:55 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 16 Aug
 2023 15:33:55 +0200
Message-ID: <c4f32038-0291-9006-a63f-a95ffbcfc294@foss.st.com>
Date: Wed, 16 Aug 2023 15:33:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230710104406.1.Icd397b21b510ba9fc2de7cd4b69835afb131dda7@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230710104406.1.Icd397b21b510ba9fc2de7cd4b69835afb131dda7@changeid>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_13,2023-08-15_02,2023-05-22_02
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 Etienne CARRIERE <etienne.carriere@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] ARM: dts: sm32mp15: remove shmem for
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
> Since OP-TEE commit 89ba3422ee80 ("plat-stm32mp1: scmi_server: default
> use OP-TEE shared memory"), integrated in OP-TEE 3.22.0-rc1
> the default configuration for STM32MP15x SoCs changes,
> CFG_STM32MP1_SCMI_SHM_SYSRAM is disabled by default and the OP-TEE SMCI
> server uses ithe OP-TEE native shared memory registered by clients.
> 
> To be compatible by default with this configuration and the next OP-TEE
> version, this patch removes the SHMEM in the SCMI configuration and the
> associated reserved memory in the last 4KByte page of SRAM,
> in the STM32MP15 device tree.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp15-scmi.dtsi | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32mp15-scmi.dtsi b/arch/arm/dts/stm32mp15-scmi.dtsi
> index 543f24c2f4f6..ad2584213d99 100644
> --- a/arch/arm/dts/stm32mp15-scmi.dtsi
> +++ b/arch/arm/dts/stm32mp15-scmi.dtsi
> @@ -16,7 +16,6 @@
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  			linaro,optee-channel-id = <0>;
> -			shmem = <&scmi_shm>;
>  
>  			scmi_clk: protocol@14 {
>  				reg = <0x14>;
> @@ -60,21 +59,6 @@
>  			};
>  		};
>  	};
> -
> -	soc {
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
> -	};
>  };
>  
>  &reg11 {

Applied on stm32-master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B04BD66796B
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Jan 2023 16:36:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 513F6C65048;
	Thu, 12 Jan 2023 15:36:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1C67C6334A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 15:36:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30CD2pBn006462; Thu, 12 Jan 2023 16:36:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=wxDURB9Z79AivXVwCQRvP3yMNav/RmrnTE+5AqF6x8A=;
 b=lDhCXAL1gFB6gOZ5i5YuCvFAeKP0mvE/DDNMCKiVvPCiuO0ZrTf9MD7nLuvs1Dow/BbX
 CVpCADtSifBz6tQ4PvFE3/2oayuQKLJiruh39IgJ2UqZUlokiogwrreu2+qxaAGLUHC5
 3ojVGc+aAFxtPOicWAPa4xN6C9C7Jqxh+qqhbjk3DdNkP3+Jo+DlEDcb5g/F/2HGarA2
 hC5p4+X3MoRnoowZvFqSxOBCY7jl0O/W1kmVhdMF4NJU6AwoqdymczXICPHlO/gbICd/
 1WIBkU2AuswlNd8GaxDqyekrRkATxoz8M1dD3OPs+ULK1YS2noLXxRPd9nRpAVXJrTQB Rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n1tnmgyak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 16:36:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 26F7C10002A;
 Thu, 12 Jan 2023 16:36:08 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1CE66218619;
 Thu, 12 Jan 2023 16:36:08 +0100 (CET)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 12 Jan
 2023 16:36:07 +0100
Message-ID: <a6ce65e3-4541-be63-22e3-0fb8a5da2483@foss.st.com>
Date: Thu, 12 Jan 2023 16:36:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20221214162434.1.Ib96329f23b27691d7a9c091a6a88be2658143ddc@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221214162434.1.Ib96329f23b27691d7a9c091a6a88be2658143ddc@changeid>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_08,2023-01-12_01,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] ARM: dts: stm32mp15: remove clksrc
 include in SCMI dtsi file
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

On 12/14/22 16:24, Patrick Delaunay wrote:
> The include file stm32mp1-clksrc.h is not necessary for the SCMI STM32MP15
> dtsi files as the clock tree is not defined in the U-Boot SCMI device tree;
> these SCMI device tree only support TFABOOT with stm32mp15_defconfig,
> SPL with the basic boot defconfig is not supported.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi | 1 -
>  arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
> index 1209dfe009c9..92fdf0987200 100644
> --- a/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
> @@ -3,7 +3,6 @@
>   * Copyright : STMicroelectronics 2022
>   */
>  
> -#include <dt-bindings/clock/stm32mp1-clksrc.h>
>  #include "stm32mp15-scmi-u-boot.dtsi"
>  
>  / {
> diff --git a/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
> index c265745ff107..63948ef4930e 100644
> --- a/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
> @@ -3,7 +3,6 @@
>   * Copyright : STMicroelectronics 2022
>   */
>  
> -#include <dt-bindings/clock/stm32mp1-clksrc.h>
>  #include "stm32mp15-scmi-u-boot.dtsi"
>  
>  / {
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

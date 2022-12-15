Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4926064D77B
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Dec 2022 09:00:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA87FC65E46;
	Thu, 15 Dec 2022 08:00:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7C64C6334A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Dec 2022 08:00:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BF62Xjl021276; Thu, 15 Dec 2022 09:00:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=QyTo8PoVJGmceG/5lPrpGontF3v1rqICUaBC6U1Be6g=;
 b=q8+WI2ayTJt1JFz3Xu2VQcRLRzCzbkWacUJ8DJOIyJp7+hXyNmomuftFBh7j5Wdh7UV4
 hJKJgiaX0SO1qGcW/Ig+BAN3sQ/RZoYotRQlgr7WK4RLeW424H9G1gEYoxoEnsn7OSNF
 Xw0SYmAF7ud/izDLmq6RyKP0VO/hOtV7IrvaB+6QNi4XemXR24DFQcEOjs4mwMPQ+/j/
 9lWVHZrRc/yxaDJsIpX3ctB1l63dUTPVyuCsAZHrWiQe1+rfHQkJSoTHoFhCxMb/e6Ox
 3a+PTAVil+jbaYe5DceVvwg9tnOMh9GluG7Fobiv9zEc9mF+zBiTvSNBWt36cHZy0QRk Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mf6uws983-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 09:00:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8B08C100034;
 Thu, 15 Dec 2022 09:00:41 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7EEB22132EF;
 Thu, 15 Dec 2022 09:00:41 +0100 (CET)
Received: from [10.201.20.130] (10.201.20.130) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 15 Dec
 2022 09:00:40 +0100
Message-ID: <616b00ee-d119-6e00-74d0-ffe3c7c0395a@foss.st.com>
Date: Thu, 15 Dec 2022 09:00:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20221214162434.1.Ib96329f23b27691d7a9c091a6a88be2658143ddc@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221214162434.1.Ib96329f23b27691d7a9c091a6a88be2658143ddc@changeid>
X-Originating-IP: [10.201.20.130]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_03,2022-12-14_01,2022-06-22_01
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

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B269824783
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Jan 2024 18:33:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9F6DC6B476;
	Thu,  4 Jan 2024 17:33:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABA44C6B452
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jan 2024 17:33:17 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 404C5c4a009333; Thu, 4 Jan 2024 18:33:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=n+M5a+cQWOla9FoYRmINjgRvig23PVLVR0YbZ5gQY4U=; b=U0
 8wSAOx3QoE9w3S+awa3t3BErez0KTOScdMdzXcfsCVKC0989VwV9VAPgdiwnkxJ7
 1Xh2coVbj4bUBVuPeMFBEXuZEmL0Xr8tgOuX41pK9437cFkYZ17jbhGcGqKl5EUM
 /VcfGPY6inX/2+Q5YgS547UH5N6+TmMZfWFLYYYmT0r0nVVyP/HHTBcS5yjO3IxO
 bCBkqkpxcmZ6yA7xZhwIMsczGU16upMgmCkEXrF21r0pHknWrNv7qxkM1UToN96O
 Knl6eUwdl9pFcblfVkJiJWcLuBtQmbWZi22IsPcvAMGKWOQ+ncDLXyNqSiL+Xt8R
 yAcdVOcof7ORmWPcXjzA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vd9q1n3ct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jan 2024 18:33:14 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 578F710002A;
 Thu,  4 Jan 2024 18:33:13 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 50363209ED1;
 Thu,  4 Jan 2024 18:33:13 +0100 (CET)
Received: from [10.201.22.165] (10.201.22.165) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 18:33:12 +0100
Message-ID: <042cbd96-55f4-40c4-957a-58d5d1efdd6b@foss.st.com>
Date: Thu, 4 Jan 2024 18:33:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20240104123750.232991-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20240104123750.232991-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-04_10,2024-01-03_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Fix reset for usart1 in
 scmi configuration
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

On 1/4/24 13:37, Patrice Chotard wrote:
> In SCMI configuration, usart1 is secure, so all its resources are secured
> (clock and reset) and can't be set/unset by non-secure world but by OP-TEE.
>
> Fixes: 6cccc8d396bf ("ARM: dts: stm32: add SCMI version of STM32 boards (DK1/DK2/ED1/EV1)")
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   arch/arm/dts/stm32mp15-scmi-u-boot.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/dts/stm32mp15-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp15-scmi-u-boot.dtsi
> index 7c8fec6cbfb..79494ecad90 100644
> --- a/arch/arm/dts/stm32mp15-scmi-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp15-scmi-u-boot.dtsi
> @@ -135,7 +135,7 @@
>   };
>   
>   &usart1 {
> -	resets = <&rcc USART1_R>;
> +	resets = <&scmi_reset RST_SCMI_USART1>;
>   };
>   
>   &usart2 {


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

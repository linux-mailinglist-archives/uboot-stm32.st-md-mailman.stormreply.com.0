Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDA8A4B989
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Mar 2025 09:38:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D33DAC78F61;
	Mon,  3 Mar 2025 08:38:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E96E5C7803A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Mar 2025 08:38:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5237jljq000984;
 Mon, 3 Mar 2025 09:38:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 p51/ayo6h8fjeVE12eniaJkqLVzDHfu54vaf4to9Pko=; b=HNUznflbYuKezI6R
 Nk1JHp/OwPthv5r86DepYw7lf0yDLexEHpnfRNhHVBbKrnknIyc9x9hlfdKrpmAn
 mMw/cIFnsCTgtrN4fUJL2aV20VXutZ/BnPiGcyZY4DgF12A/f2FdyUMDFDr5hH8A
 QgZPoRLAIlciofDON3qoH9thLgZ6CObqFoGJXkBbI6XzyebWRURUWFhOLva6mNHD
 FpmsKEsl5VVURH/gtEqrWCbm1Sbchan+G2QyOYtWEMHVc5+lr7InyClmpn2JLk80
 f1RLEeYZtREkKjfpI2MuAHnLRjvhY2rVC5HryA+8BMxyxAmK90GE4gS8QbGaZqka
 ylia3w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 453t9mr6bx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Mar 2025 09:38:36 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C81B140068;
 Mon,  3 Mar 2025 09:37:26 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1271150D618;
 Mon,  3 Mar 2025 09:35:35 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Mar
 2025 09:35:34 +0100
Message-ID: <8631f15e-2bba-4f0a-b4d4-eb5c540f7716@foss.st.com>
Date: Mon, 3 Mar 2025 09:35:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20250302154429.65581-1-marex@denx.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250302154429.65581-1-marex@denx.de>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_03,2025-03-03_01,2024-11-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Add support for
 STM32MP13xx DHCOR SoM and DHSBC rev.200 board
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



On 3/2/25 16:43, Marek Vasut wrote:
> LDO2 is expansion connector supply on STM32MP13xx DHCOR DHSBC rev.200.
> LDO5 is carrier board supply on STM32MP13xx DHCOR DHSBC rev.200. Keep
> both regulators always enabled to make sure both the carrier board and
> the expansion connector is always powered on and supplied with correct
> voltage.
> 
> Describe ST33TPHF2XSPI TPM 2.0 chip reset lines.
> 
> This is a port of Linux kernel patch posted at:
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250302152605.54792-1-marex@denx.de/
> This change shall be removed when the Linux kernel DT change lands
> and Linux kernel DTs get synchronized with U-Boot DTs.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  .../dts/stm32mp135f-dhcor-dhsbc-u-boot.dtsi   | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp135f-dhcor-dhsbc-u-boot.dtsi b/arch/arm/dts/stm32mp135f-dhcor-dhsbc-u-boot.dtsi
> index d718aae16ca..eace94f5fa4 100644
> --- a/arch/arm/dts/stm32mp135f-dhcor-dhsbc-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp135f-dhcor-dhsbc-u-boot.dtsi
> @@ -23,3 +23,25 @@
>  &usbphyc {
>  	bootph-all;
>  };
> +
> +&st33htph {
> +	reset-gpios = <&gpioe 12 GPIO_ACTIVE_LOW>;
> +};
> +
> +/* LDO2 is expansion connector 3V3 supply on STM32MP13xx DHCOR DHSBC rev.200 */
> +&vdd_ldo2 {
> +	bootph-all;
> +	regulator-always-on;
> +	regulator-boot-on;
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +};
> +
> +/* LDO5 is carrier board 3V3 supply on STM32MP13xx DHCOR DHSBC rev.200 */
> +&vdd_sd {
> +	bootph-all;
> +	regulator-always-on;
> +	regulator-boot-on;
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +};

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

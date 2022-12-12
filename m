Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F54D649CE2
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Dec 2022 11:44:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F28E5C65E60;
	Mon, 12 Dec 2022 10:44:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2DCFC035BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Dec 2022 10:44:43 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCAaxvH004907; Mon, 12 Dec 2022 11:44:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=SpEMKE5aoJtZ3bkzQr4cEdd1fRRQ1DfPk22ASyRIM94=;
 b=QeI8BFpgHON0PizgCPCyQIs3s0ZhzqmsEYr+BIdxvy44VSMOa9IYqWM+IKQTXdmxzh5B
 2AVYA2tjEKgraJnnjEVMKWGYxLgXo8lkWAE8u7pcvAM5FcmHJqs5/ZERpJF9FI3fEXxG
 Wuvrqf96Hqmrufl2rj6174F8wc3XiOJM5ru3W8B+GJbD8Lsycf+zPcv8IlP5ViC9VqkV
 6qrglYSb775XCK4LJlnUvTb+5wi8iBKOZZRGutlq09XUtjJ3+SCTdp2ZRxGtLU396mSt
 lKtNJgY/Fs4gdgKcmC8RMXmf+RURnURyDNmTOmVI708TgMOnZRKU7Y4bMfjNhstqBfv+ 4w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mcg4r3agy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 11:44:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 89EE010002A;
 Mon, 12 Dec 2022 11:44:37 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D3FA21D3EF;
 Mon, 12 Dec 2022 11:44:37 +0100 (CET)
Received: from [10.201.20.130] (10.201.20.130) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Mon, 12 Dec
 2022 11:44:37 +0100
Message-ID: <e3e19969-084c-4686-6e6e-8cc2caf4ffbd@foss.st.com>
Date: Mon, 12 Dec 2022 11:44:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, <u-boot@lists.denx.de>
References: <20221212103242.14137-1-fabrice.gasnier@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221212103242.14137-1-fabrice.gasnier@foss.st.com>
X-Originating-IP: [10.201.20.130]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: update vbus-supply of
 usbphyc_port0 on stm32mp157c-ev1
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

Hi Fabrice

On 12/12/22 11:32, Fabrice Gasnier wrote:
> phy-stm32-usbphyc bindings uses a connector node with vbus-supply
> property.
> 
> [backport from linux 43e55d778a6b]
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp157c-ev1.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
> index 07bcd7c50672..2d5db41ed67b 100644
> --- a/arch/arm/dts/stm32mp157c-ev1.dts
> +++ b/arch/arm/dts/stm32mp157c-ev1.dts
> @@ -393,6 +393,10 @@
>  	st,tune-squelch-level = <3>;
>  	st,tune-hs-rx-offset = <2>;
>  	st,no-lsfs-sc;
> +	connector {
> +		compatible = "usb-a-connector";
> +		vbus-supply = <&vbus_sw>;
> +	};
>  };
>  
>  &usbphyc_port1 {

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

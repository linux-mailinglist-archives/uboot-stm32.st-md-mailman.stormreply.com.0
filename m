Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C73CE65C3FA
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Jan 2023 17:34:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 903F2C65E55;
	Tue,  3 Jan 2023 16:34:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0040FC65048
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 16:34:36 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 303GC45o011172; Tue, 3 Jan 2023 17:34:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=3O69PNx6Z/k3aQSJXrKCvhSruFF9FmDRnp5YjoHZUqg=;
 b=7MR6U9vfr8CyybdrVjrBCK4+RwkbxZEnHKVmzDpN1v6jlwF6s+EJMifbN6vkh529HrMo
 0uHPaNSYkzZJfabDeU1XF/t4xaOERNL6GdvVni3JDYCsi6H6fMLMGX9uXMmcz05hAvc2
 il26Rcq+7B8gRXMyLqVLZK9OklTSYk8wIU1E4HyOS63qK0Yq8qUAfoHENr6WJami9BBm
 1Gso7xWRGXv30r2BX76+SPGZfBs3op49YY7w0A2qqsRgbj2JLbkRtv/e9CdUHw5qalJT
 wWOibj79WCfPCglQ1SynM5Ct4/K8Zb8Vqm7UBNaalOLIsbe6Sm1fEJRGJk0em4+NQ2uO Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtda65xhb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 17:34:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A38AA10002A;
 Tue,  3 Jan 2023 17:34:34 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9969C22AFE2;
 Tue,  3 Jan 2023 17:34:34 +0100 (CET)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 3 Jan
 2023 17:34:34 +0100
Message-ID: <cf66bbb4-3b8c-8263-83ef-95b91f645fa3@foss.st.com>
Date: Tue, 3 Jan 2023 17:34:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, <u-boot@lists.denx.de>
References: <20221212104437.15838-1-fabrice.gasnier@foss.st.com>
 <20221212104437.15838-4-fabrice.gasnier@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221212104437.15838-4-fabrice.gasnier@foss.st.com>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_05,2023-01-03_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] ARM: dts: stm32: add support for
 USB2514B onboard hub on stm32mp157c-ev1
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

On 12/12/22 11:44, Fabrice Gasnier wrote:
> Add support for USB2514B onboard hub on stm32mp157c EV1 board. The HUB
> is supplied by a 3v3 PMIC regulator.
> 
> [backport from linux ad9591b01d24]
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp157c-ev1.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
> index d142dd30e16b..07bcd7c50672 100644
> --- a/arch/arm/dts/stm32mp157c-ev1.dts
> +++ b/arch/arm/dts/stm32mp157c-ev1.dts
> @@ -362,6 +362,14 @@
>  &usbh_ehci {
>  	phys = <&usbphyc_port0>;
>  	status = "okay";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	/* onboard HUB */
> +	hub@1 {
> +		compatible = "usb424,2514";
> +		reg = <1>;
> +		vdd-supply = <&v3v3>;
> +	};
>  };
>  
>  &usbotg_hs {

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

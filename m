Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 468C765C3E1
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Jan 2023 17:27:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7700C65048;
	Tue,  3 Jan 2023 16:27:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9913C64110
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 16:27:26 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 303E2wD5025822; Tue, 3 Jan 2023 17:27:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=yqmYfGUFRfcKfbXvx1xHuSoWwlX2jVXi8psqsQNmlxc=;
 b=aKTItf3kNzkzzRrD44OOlJ+EGNmOYmKtdmwKVAVN1pk1HnJBddI1Cgf9b0FDDyJU6JF5
 6WWIDuOYxSc1TsszFREvnjQNVhOIHTatsCd65vm1m/tHGkfvYd7vDpRbJyP6lwiiczBK
 BQKWJqaZR+TRaD0ldM4hIOOy/VpOnvW043hjNQbN6BNiKEjVb9nYWFfQWr/V7Fm5yToV
 E0tHPH9F2IUQ3JYXrsyZC1AFCQovP317FYNXgoOtqCAvzJgQNCS5b3PGwLEPwmhv8up2
 kW+f+dk2ZDVlFvxpBLRH0Xk4vPmB1RMz/qM/aRbBoYFCUfDFN4EEJboW3WdnSvjIJuqA QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtbcpx7vc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 17:27:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3B1C610002A;
 Tue,  3 Jan 2023 17:27:24 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F78822A6E8;
 Tue,  3 Jan 2023 17:27:24 +0100 (CET)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 3 Jan
 2023 17:27:23 +0100
Message-ID: <1daa0d96-7ea0-bd5a-2ba7-89cc00776f67@foss.st.com>
Date: Tue, 3 Jan 2023 17:27:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, <u-boot@lists.denx.de>
References: <20221212103242.14137-1-fabrice.gasnier@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20221212103242.14137-1-fabrice.gasnier@foss.st.com>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_05,2023-01-03_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 12/12/22 11:32, Fabrice Gasnier wrote:
> phy-stm32-usbphyc bindings uses a connector node with vbus-supply
> property.
>
> [backport from linux 43e55d778a6b]
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>
>   arch/arm/dts/stm32mp157c-ev1.dts | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/dts/stm32mp157c-ev1.dts b/arch/arm/dts/stm32mp157c-ev1.dts
> index 07bcd7c50672..2d5db41ed67b 100644
> --- a/arch/arm/dts/stm32mp157c-ev1.dts
> +++ b/arch/arm/dts/stm32mp157c-ev1.dts
> @@ -393,6 +393,10 @@
>   	st,tune-squelch-level = <3>;
>   	st,tune-hs-rx-offset = <2>;
>   	st,no-lsfs-sc;
> +	connector {
> +		compatible = "usb-a-connector";
> +		vbus-supply = <&vbus_sw>;
> +	};
>   };
>   
>   &usbphyc_port1 {



Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

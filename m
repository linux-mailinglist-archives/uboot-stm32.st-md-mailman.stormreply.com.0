Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2099F65C415
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Jan 2023 17:37:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF798C65E56;
	Tue,  3 Jan 2023 16:37:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D620C65E55
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 16:37:36 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 303GVuWa015497; Tue, 3 Jan 2023 17:37:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=XcozGHEl0MuKeEzKP03hUOVeN/coEP2bZ9UUd83t6Hc=;
 b=dIz8w4kCnYVQAh2k877Hy8God498xQnuTiZO0xnA72emAMeRXLO2v1o3JVx5r1hihvLv
 0QZxsP8DEYe2uxilhp4fo/NUsioM0mK/iodSupDuyW53g3gElaBTZ1J4XoPSqPm/HLEt
 unbLeZxSDwHvvR96zYabFtMq0d8apcnqNMtyMl6ESublZsoslAHdN/Bohj6zHEVnVd/h
 v+YNa5yezJ6KCJxQLIZ55MfdgQYTaLKTRiCmLs7Xtt9NFfMfaKNNiOizg9eiXP7mSeD0
 jsuvGoVmwHnfPO9z3S/DCnbJFn0J9FgW3+YK6TUI30+JM1Jm4uynBT3nN935BV+btH1c lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtda65xuf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 17:37:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7677D10002A;
 Tue,  3 Jan 2023 17:37:34 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 707BC22D162;
 Tue,  3 Jan 2023 17:37:34 +0100 (CET)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 3 Jan
 2023 17:37:33 +0100
Message-ID: <e25ffbf3-75b8-2485-1b6c-8898b7419c6d@foss.st.com>
Date: Tue, 3 Jan 2023 17:37:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, <u-boot@lists.denx.de>
References: <20221212103242.14137-1-fabrice.gasnier@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221212103242.14137-1-fabrice.gasnier@foss.st.com>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_05,2023-01-03_02,2022-06-22_01
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

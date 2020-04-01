Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E45E319A5F1
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 09:10:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EF48C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 07:10:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59847C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 07:10:50 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031782Vc031839; Wed, 1 Apr 2020 09:10:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=pI/ffRNC1TWkBLGIrI0wIbOSX5Pqn8gGyQbilzJQqe8=;
 b=B9nxN052gM1j6Dy+F3kaVB3KtwIxq2cd8lOay8QGvfE6lY1hEHE1i5cdvuYKM4YkE8Lp
 J/yKWNlDAnIxBzotu0IIBHnGwwhlyGkQUBLvi27RMre4A4rue896koZoLC23Eta9XL8J
 pgpe3Te2GI8IIZJpmO/0jrL4XfXT8mYJfqvOqgmuJH0t9XaBmOVvIWOikrIRSOVDD4bh
 +sHDP9tBMtODQydDcXm3UzCAiiCOVzHcHgjXAmW30DSxgiQMdDesOo+w41W2cXlcH7cZ
 t+uVBKsQqbGBFFSmu+xFqBfQEZGmSgaZbmPHBq+6JB8EA2XJmj8rIJ15OcbyRznYFvQA dQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301w813bd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 09:10:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 94D49100039;
 Wed,  1 Apr 2020 09:10:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 88CA82123B8;
 Wed,  1 Apr 2020 09:10:43 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Apr
 2020 09:10:42 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 1 Apr 2020 09:10:43 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 01/16] arm: stm32mp: update dependency for STM32_ETZPC
Thread-Index: AQHWB3YesgZaNzaf7k6K9hL/rIn9DqhjuNsA
Date: Wed, 1 Apr 2020 07:10:43 +0000
Message-ID: <06cc9ef2-46b7-6a77-95b8-a0fbb06724c4@st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
In-Reply-To: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <8DE8882AE2A705409E635B3FCB1EFB3D@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 01/16] arm: stm32mp: update dependency for
	STM32_ETZPC
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

On 3/31/20 6:04 PM, Patrick Delaunay wrote:
> Correct the dependency for STM32 ETZPC protection, linked to SOC
> STM32MP identified by CONFIG_STM32MP15x and not linked to
> CONFIG_TARGET_STM32MP1 (no more existing).
>
> This patch fix an issue introduced by commit 846254888e2e ("stm32mp1:
> split board and SOC support for STM32MP15x family").
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Acked-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>
>  arch/arm/mach-stm32mp/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index e4d621dee8..96153693a7 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -119,7 +119,7 @@ config SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION_MMC2
>  
>  config STM32_ETZPC
>  	bool "STM32 Extended TrustZone Protection"
> -	depends on TARGET_STM32MP1
> +	depends on STM32MP15x
>  	default y
>  	help
>  	  Say y to enable STM32 Extended TrustZone Protection

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

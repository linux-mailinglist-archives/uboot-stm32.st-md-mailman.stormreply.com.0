Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 064B71801A9
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Mar 2020 16:22:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADF72C36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Mar 2020 15:22:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D327C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2020 15:22:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02AFErLL010551; Tue, 10 Mar 2020 16:22:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=5j6Rtwf8ZqXupPzv20Zoh1Rwtsz4Bl6nJWWeSpZtgTw=;
 b=oenMJGNBKYamlO6EZw70HlJq9ljZhPY4dZ7AEznr2KppTXTd6Eu+JNlQtkc3naGrHCW4
 9IkSACwWOCc1pTYxS4GP6XSZwwyjEOb0mac+VUIWfpzvESabqHGDr5vvpbL4UDzetN+A
 h216kVYFhfFfsWY+Q+UBmxZiw/MHlgWJgfjGU6dSFV8JD7g5FYXtj018H7pjQPx5iTeJ
 TIUh42KyMSdSQtxtbyGskPCnkwjLZ7GEahnADLgvcYs74CHXJ6jWU/eLpNFZdWC+AGdi
 D29NI85Jl9R3SC03xoIQ+dDvLFHmjsA408EAwJfrRA7ljk7gYhKoZ9ZoUwZLVnSE0Vco cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ynecday0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Mar 2020 16:22:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 82115100038;
 Tue, 10 Mar 2020 16:22:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 790CD2BE25B;
 Tue, 10 Mar 2020 16:22:11 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 10 Mar
 2020 16:22:10 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 10 Mar 2020 16:22:11 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] stm32mp: update dependency for STM32_ETZPC
Thread-Index: AQHV9u1hb6gwbo3kNkyXP/Y2A/vK46hB4LcA
Date: Tue, 10 Mar 2020 15:22:11 +0000
Message-ID: <26b27ece-2680-0131-f00b-c59952358305@st.com>
References: <20200310160529.1.I6462afb2ec36ada8350ac4a7d4c36d2d99639d39@changeid>
In-Reply-To: <20200310160529.1.I6462afb2ec36ada8350ac4a7d4c36d2d99639d39@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <0DA605B79C47D3409D89FEA7004610B0@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-10_08:2020-03-10,
 2020-03-10 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: update dependency for STM32_ETZPC
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

On 3/10/20 4:05 PM, Patrick Delaunay wrote:
> Correct the dependency for STM32 ETZPC protection, linked to SOC
> STM32MP identified by CONFIG_STM32MP15x and not linked to
> CONFIG_TARGET_STM32MP1 (no more existing).
>
> This patch fix an issue introduced by commit 846254888e2e ("stm32mp1:
> split board and SOC support for STM32MP15x family").
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
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

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0975AE2B9
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Sep 2022 10:34:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9F84C01E99;
	Tue,  6 Sep 2022 08:34:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7600C01E98
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Sep 2022 08:34:47 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2867QP59015815;
 Tue, 6 Sep 2022 10:34:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : cc : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ozhn340QNZ4djESMI9TO8d0RhTDxnUQYYGOiV+N5a48=;
 b=IfAuFPQ+rQVmnGANFPwp09y0rPueczO/6RlOMh4G44PgJp1ZmGIBxYalg5sJ8llhpHFi
 ddvBPdrmd/XrOfRG7dhJbnST7bQibzYebCsX9JwsOVV+sPi9VV/eoct0mBCXFSKCCJrV
 Yqn7xwc+GSWAQhHfMArAEoh5IRJKJIlN9reUtOdiZpZqXcyD14f40NwwxUt1y593OCir
 0R/6kTMk+qG+by4BZwh1HyBrgWTfSIPKB59UEpTFouXa8Dhf02PQ0+Bd34I3OnhmP6Ye
 TdJleYN4Wu71RatjyXlhcIGyWHL+s+oCrVJ0UvYnxttFYFyUl21O8XhHRHqVSSJ+74D2 Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jbx91ey3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 10:34:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7898410002A;
 Tue,  6 Sep 2022 10:34:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5ED7F21A22F;
 Tue,  6 Sep 2022 10:34:43 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.51) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 6 Sep
 2022 10:34:42 +0200
Message-ID: <04ba2a69-9c29-dd84-547c-76043b017e0b@foss.st.com>
Date: Tue, 6 Sep 2022 10:34:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jorge Ramirez-Ortiz <jorge@foundries.io>, <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>,
 <cryosay@gmail.com>
References: <20220905173357.2231466-1-jorge@foundries.io>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220905173357.2231466-1-jorge@foundries.io>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_03,2022-09-05_03,2022-06-22_01
Cc: alain.volmat@foss.st.com, Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp*: fix system reset
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

On 9/5/22 19:33, Jorge Ramirez-Ortiz wrote:
> Enabling CONFIG_SYSRESET_PSCI prevents CONFIG_RESET_SCMI
> from executing.
>
> The side effect observed are I2C devices no longer being
> accessible from U-boot after a soft reset.
>
> Fixes: 11517ccc8c52 ("configs: add stm32mp13 defconfig")
> Fixes: 17aeb589fa9d ("stm32mp15: remove configs dependency on
>                        CONFIG_TFABOOT")
>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
> ---
>   configs/stm32mp13_defconfig         | 1 -
>   configs/stm32mp15_defconfig         | 1 -
>   configs/stm32mp15_trusted_defconfig | 1 -
>   3 files changed, 3 deletions(-)


The reset driver (used to managed Hardware device reset with RCC)

based on RCC register or on SCMI for 'system' / 'secured' ressource

and the sysret for global platform based on PSCI are indendent.

Deactivate CONFIG_SYSRESET_PSCI only prevent soft reset support
with the command reset or after crash.


I don't think it is the correct solution if the I2C devices is no longer accessible
after SW reset.

i think that it is more a bug / problem for reinit of I2C in STM32 driver
so the configuration is not correct after a SW reset.


We have not detect this issue for I2C communication to PMIC after SW reset.


Can you provide more information for your use-case, for reproduction on 
my side

- platform used (STM32MP13 or STM32MP15), board used

- I2C instance used and I2C device connected

- version of TF-A / OP-TEE used


Patrick


> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
> index 673b468d31..44cee2e656 100644
> --- a/configs/stm32mp13_defconfig
> +++ b/configs/stm32mp13_defconfig
> @@ -69,7 +69,6 @@ CONFIG_RNG_OPTEE=y
>   CONFIG_DM_RTC=y
>   CONFIG_RTC_STM32=y
>   CONFIG_SERIAL_RX_BUFFER=y
> -CONFIG_SYSRESET_PSCI=y
>   CONFIG_TEE=y
>   CONFIG_OPTEE=y
>   # CONFIG_OPTEE_TA_AVB is not set
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index e5a2996c2c..2ad02f3652 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -133,7 +133,6 @@ CONFIG_SPI=y
>   CONFIG_DM_SPI=y
>   CONFIG_STM32_QSPI=y
>   CONFIG_STM32_SPI=y
> -CONFIG_SYSRESET_PSCI=y
>   CONFIG_TEE=y
>   CONFIG_OPTEE=y
>   # CONFIG_OPTEE_TA_AVB is not set
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index e14668042f..9e24e82920 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -134,7 +134,6 @@ CONFIG_SPI=y
>   CONFIG_DM_SPI=y
>   CONFIG_STM32_QSPI=y
>   CONFIG_STM32_SPI=y
> -CONFIG_SYSRESET_PSCI=y
>   CONFIG_TEE=y
>   CONFIG_OPTEE=y
>   # CONFIG_OPTEE_TA_AVB is not set
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

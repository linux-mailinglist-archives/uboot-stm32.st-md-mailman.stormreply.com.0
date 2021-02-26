Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8623262CD
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Feb 2021 13:38:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D00FC57B59;
	Fri, 26 Feb 2021 12:38:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F2DAC57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 12:38:27 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11QCbUcj002396; Fri, 26 Feb 2021 13:38:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=P487OIW//Y9TaVgesWj7L4J5ldMgckzCa6hflx3Ihc4=;
 b=GaPZq+4BUU0Ta7bWIsalamJu6tljDKCS5OK58ptthaeHBGx3AhXY9yoN8LC6Cy6lwY07
 VRCxlXFat/5RTq8znDd7rJHb08OL5K0axzgrV67M6LdwnaMNRIWtopU0Q1Po/EA1Q1jf
 erkL4egLLfcgOniN0wzBxanM7CVhu+38z72GnvW4Pbwi0SEcGW6uhR1uDcbnf6vqMOPw
 L3g+5mkUI5dnnbfX16OtmJ1ZaQ4Fv0yvgyAqzXDh1BZ7RrcJPnZUgHRnmhEE4edyaLMS
 SHnLb1cwTmntUYMa0W5PiLniljuT7Ap3cvOncMsUSEw2LUc7siLmKCg6vmprTiDnEOlz Lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66udesc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 13:38:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 454E810002A;
 Fri, 26 Feb 2021 13:38:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 37C1323209F;
 Fri, 26 Feb 2021 13:38:22 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Feb
 2021 13:38:21 +0100
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
References: <20210225193754.1898064-1-ilias.apalodimas@linaro.org>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <6b05b88b-0a6a-8f13-6255-f9b19d0e848e@foss.st.com>
Date: Fri, 26 Feb 2021 13:38:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210225193754.1898064-1-ilias.apalodimas@linaro.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-26_03:2021-02-24,
 2021-02-26 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 etienne.carriere@linaro.org
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp1: enable uefi related
	commands
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

Hi Ilias

On 2/25/21 8:37 PM, Ilias Apalodimas wrote:
> The board can boot with UEFI. With the latest changes in U-Boot's
> EFI subsystem we also have support for EFI runtime variables, without
> SetVariable support.  We can also store the EFI variables in a file on the
> ESP partition and preserve them across reboots.
> The env and efidebug commands are missing in order to configure
> EFI variables and the efibootmgr though.  Since U-Boot's default config
> enables other EFI related commands (e.g bootefi), let's add the env related
> and efidebug commands and allow users to do that
>
> Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> ---
>   configs/stm32mp15_trusted_defconfig | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index da31b74cdeb6..107041119f1d 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -17,6 +17,7 @@ CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
>   CONFIG_SYS_PROMPT="STM32MP> "
>   CONFIG_CMD_ADTIMG=y
>   CONFIG_CMD_ERASEENV=y
> +CONFIG_CMD_NVEDIT_EFI=y
>   CONFIG_CMD_MEMINFO=y
>   CONFIG_CMD_MEMTEST=y
>   CONFIG_CMD_ADC=y
> @@ -32,6 +33,7 @@ CONFIG_CMD_USB=y
>   CONFIG_CMD_USB_MASS_STORAGE=y
>   CONFIG_CMD_BMP=y
>   CONFIG_CMD_CACHE=y
> +CONFIG_CMD_EFIDEBUG=y
>   CONFIG_CMD_TIME=y
>   CONFIG_CMD_TIMER=y
>   CONFIG_CMD_PMIC=y
> @@ -144,4 +146,5 @@ CONFIG_BMP_32BPP=y
>   CONFIG_WDT=y
>   CONFIG_WDT_STM32MP=y
>   CONFIG_ERRNO_STR=y
> +# CONFIG_HEXDUMP is not set
>   CONFIG_FDT_FIXUP_PARTITIONS=y


I am ok with tha added configs.


But can you update also the stm32_basic_defconfig:

for STMicroelectronics boards, we want to have the the same

configuation between basic and trusted boot chain

(except SPL or OP-TEE related config).


Thanks


Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

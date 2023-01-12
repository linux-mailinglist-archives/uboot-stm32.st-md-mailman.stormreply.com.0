Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC456679AE
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Jan 2023 16:42:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10322C65048;
	Thu, 12 Jan 2023 15:42:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7814C6334A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 15:42:45 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30CDDi8t005697; Thu, 12 Jan 2023 16:42:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=OYJB8RP/4e416HV7WgYp2AxMFOdsrCL2eRSb23TlEWk=;
 b=1iKd8cBNTCJzKIt0dkyAOtc3/I7Z7+qhUMkQ6B70L+ZkcQ/iMr/cFy926EBj7BT4oXoA
 ti+E1wIcNkar30BmW157jZS7Qj4HwN8tKMtrpnZi7yPmle/ct8aQPGPb+bFgQMM84H01
 DIWKnpw+J3lGIp5k/0V8ljqIkDVnnQ33uTm7w2LR1pviPAyB6wg10Q90TwowiSijjN9h
 JsPnoISM7Ku1fr53AEL4YAL6g3mFsLmvjDih8JPvDYmtqo6Yr/hmK6tAO07yqeOxS3pL
 tzZ0zlZDuCgABfmzxg886CYc3/zHgUoDL4SnhmCnBzyxgxd8mhbZOGwUGqshdXdMiqnl 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n1tnmh0f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 16:42:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F0BE010003B;
 Thu, 12 Jan 2023 16:42:41 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EB38321B53A;
 Thu, 12 Jan 2023 16:42:41 +0100 (CET)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 12 Jan
 2023 16:42:41 +0100
Message-ID: <fe8d56f4-3028-7fd9-d41a-14afded23adb@foss.st.com>
Date: Thu, 12 Jan 2023 16:42:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230106122020.1110552-1-patrick.delaunay@foss.st.com>
 <20230106131952.4.I582a6a1b443ccf0fda42be911f52e814d4ddb616@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230106131952.4.I582a6a1b443ccf0fda42be911f52e814d4ddb616@changeid>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_08,2023-01-12_01,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Etienne CARRIERE <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 4/6] configs: stm32mp13: Activate
	CONFIG_CMD_FUSE
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

On 1/6/23 13:20, Patrick Delaunay wrote:
> Activate the command fuse to access on STM32MP13x OTP with
> the BSEC driver.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  configs/stm32mp13_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
> index af6b1839d039..f3d5e9812c6c 100644
> --- a/configs/stm32mp13_defconfig
> +++ b/configs/stm32mp13_defconfig
> @@ -26,6 +26,7 @@ CONFIG_CMD_MEMINFO=y
>  CONFIG_CMD_MEMTEST=y
>  CONFIG_CMD_UNZIP=y
>  CONFIG_CMD_CLK=y
> +CONFIG_CMD_FUSE=y
>  CONFIG_CMD_GPIO=y
>  CONFIG_CMD_I2C=y
>  CONFIG_CMD_LSBLK=y
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

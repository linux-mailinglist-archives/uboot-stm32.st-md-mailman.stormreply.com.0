Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E48FD65C40E
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Jan 2023 17:35:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8E88C65E56;
	Tue,  3 Jan 2023 16:35:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9C8AC65E55
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 16:35:47 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 303DrYSp019050; Tue, 3 Jan 2023 17:35:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=UB/hrz0cbIs4nNe1XtZSj2asRxpab7clEdQFXoEvi6o=;
 b=YBtM/0NKi/0so97I9s8MnO7NUWiyJZ9pralesSfRKa+AdPWqa5B8NaGRaNEk4P7HeKHa
 Yw2vYcbpn2O1BC/2C1KGxySb/rjXy60mAM9Xs04B7UFcO+l1KX240HYGqw1Hfd1Ci9ov
 Jb96PU6j7O6uiWknfBBe5fLb4PghG5yzQ1CXv/sPKFfndE+w8Ebd5iR6beEcc8xRe8z3
 2YXsVG5cAymzq6g623F7STZLEfu9M1FW1yuAoqAeyuxfUci7Wj720TvM0iHGVvD37mnN
 xsRx30be7/prhXJ3Zfoiq5fOHozWkGkhK6s2JEKfs5fisYG6cB8cOFcCpatiTa3FsZPg Hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtbcpx8xf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 17:35:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 949C810002A;
 Tue,  3 Jan 2023 17:35:46 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8E3DB22AFF9;
 Tue,  3 Jan 2023 17:35:46 +0100 (CET)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 3 Jan
 2023 17:35:46 +0100
Message-ID: <b17e8221-e143-f266-a887-da7f2dd5ed5f@foss.st.com>
Date: Tue, 3 Jan 2023 17:35:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, <u-boot@lists.denx.de>
References: <20221212104437.15838-1-fabrice.gasnier@foss.st.com>
 <20221212104437.15838-3-fabrice.gasnier@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20221212104437.15838-3-fabrice.gasnier@foss.st.com>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_05,2023-01-03_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] configs: stm32: enable USB onboard
	HUB driver
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

On 12/12/22 11:44, Fabrice Gasnier wrote:
> Activate the USB onboard HUB driver, that is used to enable the HUB supply
> on STM32MP15 EVAL, DK1 and DK2 boards.
> This avoids marking the 3v3 corresponding regulator as always-on.
>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>
>   configs/stm32mp15_basic_defconfig   | 1 +
>   configs/stm32mp15_defconfig         | 1 +
>   configs/stm32mp15_trusted_defconfig | 1 +
>   3 files changed, 3 insertions(+)
>
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 86ebbef0a6c8..4d2ac589931a 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -164,6 +164,7 @@ CONFIG_USB=y
>   CONFIG_DM_USB_GADGET=y
>   CONFIG_USB_EHCI_HCD=y
>   CONFIG_USB_EHCI_GENERIC=y
> +CONFIG_USB_ONBOARD_HUB=y
>   CONFIG_USB_GADGET=y
>   CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
>   CONFIG_USB_GADGET_VENDOR_NUM=0x0483
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index caa79e68834f..ccf65dd12223 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -140,6 +140,7 @@ CONFIG_USB=y
>   CONFIG_DM_USB_GADGET=y
>   CONFIG_USB_EHCI_HCD=y
>   CONFIG_USB_EHCI_GENERIC=y
> +CONFIG_USB_ONBOARD_HUB=y
>   CONFIG_USB_GADGET=y
>   CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
>   CONFIG_USB_GADGET_VENDOR_NUM=0x0483
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 3309c2e79246..a553038a42c5 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -140,6 +140,7 @@ CONFIG_USB=y
>   CONFIG_DM_USB_GADGET=y
>   CONFIG_USB_EHCI_HCD=y
>   CONFIG_USB_EHCI_GENERIC=y
> +CONFIG_USB_ONBOARD_HUB=y
>   CONFIG_USB_GADGET=y
>   CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
>   CONFIG_USB_GADGET_VENDOR_NUM=0x0483


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F310244C4CA
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Nov 2021 17:05:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B899CC5EC71;
	Wed, 10 Nov 2021 16:05:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D519C5EC70
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 16:05:11 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AABlFWt005018;
 Wed, 10 Nov 2021 17:04:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Rh1cqhn/NIswzmUxCE47DCM+hDxb6iRHwY0hl+hNHMI=;
 b=ASq0dsBck4gK/tAhu9PuvLqhpxS6mGoPwTa0QDtA0XSU8Cc95YtzwpcNjZfjgZ6vHXl0
 Euvm4PRmkHlRrQbUxE2fHn949TfZVsoDtHH0h1P+p0BNypcW2rwRV1r8SPBqvk2fC3gv
 8TrK0agf3qv/cLtJcuUJcgJVdzeWHaGn4oiWRc3LKu7rfXlyLFTedRe0m7RYN0brCm+q
 dNozi2sNKdq04UAhwTgzdjijtN/kDMFJQ95W5SYsUgEmDqvk/jBRKbwWf5qPvflg7g8H
 KQASZD8Wm0pwFFKHrykwjFu0775aXY8hw+d+P2lfCzLRD4f7JtbjyHqqWqe2jZX3Nb8f cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c87vsmm5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 17:04:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4C3F210002A;
 Wed, 10 Nov 2021 17:04:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 431B820A746;
 Wed, 10 Nov 2021 17:04:55 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 10 Nov
 2021 17:04:54 +0100
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>
References: <20211013151014.v2.1.I558b557c1bc3ca451e11dae245417c8bfecf33ad@changeid>
 <CAPnjgZ3ZVc94z6zgHwRU-iGcn40ibO__EiXPjDbzO2i8rHoT-w@mail.gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <6096b53f-18a7-c3ce-8cbe-718df015c055@foss.st.com>
Date: Wed, 10 Nov 2021 17:04:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ3ZVc94z6zgHwRU-iGcn40ibO__EiXPjDbzO2i8rHoT-w@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-10_06,2021-11-08_02,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 Jean-Philippe ROMAIN <jean-philippe.romain@st.com>, Ilias
 Apalodimas <ilias.apalodimas@linaro.org>, Rick Chen <rick@andestech.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH v2] stm32mp: add binman support for
	STM32MP15x
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

On 10/13/21 6:58 PM, Simon Glass wrote:
> On Wed, 13 Oct 2021 at 07:11, Patrick Delaunay
> <patrick.delaunay@foss.st.com> wrote:
>>
>> Use binman to add the stm32image header on SPL binary for basic boot
>> or on U-Boot binary when it is required, i.e. for TF-A boot without FIP
>> support, when CONFIG_STM32MP15x_STM32IMAGE is activated.
>>
>> The "binman" tool is the recommended tool for specific image generation.
>> This patch allows to suppress the config.mk file and it is a preliminary
>> step to manage FIT generation with binman.
>>
>> The init_r parsing of U-Boot device tree to search the binman
>> information is not required for STM32MP15, so the binman library
>> can be removed in U-Boot (CONFIG_BINMAN_FDT is deactivated).
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>> Changes in v2:
>> - deactivate CONFIG_BINMAN_FDT
>>
>>  arch/arm/dts/stm32mp15-u-boot.dtsi            | 29 +++++++++++++++++++
>>  arch/arm/mach-stm32mp/Kconfig                 |  1 +
>>  arch/arm/mach-stm32mp/config.mk               | 29 -------------------
>>  ...stm32mp15-icore-stm32mp1-ctouch2_defconfig |  1 +
>>  ...tm32mp15-icore-stm32mp1-edimm2.2_defconfig |  1 +
>>  ...-microgea-stm32mp1-microdev2-of7_defconfig |  1 +
>>  ...mp15-microgea-stm32mp1-microdev2_defconfig |  1 +
>>  configs/stm32mp15_basic_defconfig             |  1 +
>>  configs/stm32mp15_defconfig                   |  1 +
>>  configs/stm32mp15_dhcom_basic_defconfig       |  1 +
>>  configs/stm32mp15_dhcor_basic_defconfig       |  1 +
>>  configs/stm32mp15_trusted_defconfig           |  1 +
>>  12 files changed, 39 insertions(+), 29 deletions(-)
>>  delete mode 100644 arch/arm/mach-stm32mp/config.mk
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>
> 
> Suggest lower-case hex for the addresses though.
> 
Applied on u-boot-stm/master 
Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

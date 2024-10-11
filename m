Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A19099AABE
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Oct 2024 19:57:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DEF7C71290;
	Fri, 11 Oct 2024 17:57:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D818DC7128A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2024 17:57:17 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BBwVAI031027;
 Fri, 11 Oct 2024 19:57:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 nSyQFp4McbzOEzqVl8UHHovH5008402TSpw8ubQFXm8=; b=OTcLgIesHBPllr/M
 ZK/82lA/toMPfAc6tsy74RZDfLLi42sNv1dt3n0lpTYkIixk/2grQvvVk78KyK8R
 x8Faj/9wj8xwXow3DQ1NdCV5TwgxAj3fYbstGj9xsUxwWOT66ENLUdnPUhWgQsR0
 B3errd99Ges2gRgsqiBj1qxOI+3cQnOqIJ47hn1mLinwQXYKc4h9Qxip126UGcjx
 KCRaDNymwGiTquzQTuPVOUZVJmD7e6FR0CXoTNVgcehCaFRmI8FaqC8kgEq/Gzg3
 ejlZK6uQgc1ynID85KByJsbQ6IHizP954OaoiSVTpcq3tuj20N1YhUq06ONoK18Q
 5QbAyA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 425q5wdgaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2024 19:57:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AEF204004B;
 Fri, 11 Oct 2024 19:56:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DCCB92A9887;
 Fri, 11 Oct 2024 19:54:18 +0200 (CEST)
Received: from [10.48.86.243] (10.48.86.243) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 11 Oct
 2024 19:54:18 +0200
Message-ID: <1d544619-8155-4254-83ff-7c88468f738f@foss.st.com>
Date: Fri, 11 Oct 2024 19:54:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20241005011647.436456-1-marex@denx.de>
 <20241005011647.436456-2-marex@denx.de>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20241005011647.436456-2-marex@denx.de>
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2 2/3] ARM: dts: stm32: Switch to using
 upstream DT on DH STM32 DHSOM
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

On 10/5/24 03:15, Marek Vasut wrote:
> Enable OF_UPSTREAM to use upstream DT and add st/ prefix to the
> DEFAULT_DEVICE_TREE. And thereby directly build DTB from dts/upstream/src/
> including *-u-boot.dtsi from arch/$(ARCH)/dts/ directory.
>
> The previous setup used generic SoC prefix like stm32mp15xx-dhco* for
> generic DTs which could be used on any STM32MP15xx DHSOM variant. The
> new setup uses specific SoC prefix stm32mp157c-dhco* to match Linux DT
> names. Since the hardware present on STM32MP153 and STM32MP157 is not
> enabled in the board configuration and not supported by U-Boot except
> for the DSI host, using the existing Linux DTs poses no issue even on
> plain STM32MP151A based SoMs.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Sean Anderson <seanga2@gmail.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
> V2: - Drop arch/arm/dts/Makefile entries
>      - Convert stm32mp135f-dhcom-dhsbc
> ---
>   arch/arm/dts/Makefile                         |   9 +-
>   arch/arm/dts/stm32mp135f-dhcor-dhsbc.dts      | 383 ------------
>   ...> stm32mp151a-dhcor-testbench-u-boot.dtsi} |   0
>   ...si => stm32mp153c-dhcom-drc02-u-boot.dtsi} |   0
>   ...stm32mp153c-dhcor-drc-compact-u-boot.dtsi} |   0
>   ...> stm32mp157a-dhcor-avenger96-u-boot.dtsi} |   0
>   ...tsi => stm32mp157c-dhcom-pdk2-u-boot.dtsi} |   0
>   ... => stm32mp157c-dhcom-picoitx-u-boot.dtsi} |   0
>   arch/arm/dts/stm32mp15xx-dhcom-drc02.dts      |  17 -
>   arch/arm/dts/stm32mp15xx-dhcom-drc02.dtsi     | 169 ------
>   arch/arm/dts/stm32mp15xx-dhcom-pdk2.dts       |  17 -
>   arch/arm/dts/stm32mp15xx-dhcom-pdk2.dtsi      | 329 -----------
>   arch/arm/dts/stm32mp15xx-dhcom-picoitx.dts    |  17 -
>   arch/arm/dts/stm32mp15xx-dhcom-picoitx.dtsi   | 151 -----
>   arch/arm/dts/stm32mp15xx-dhcom-som.dtsi       | 544 ------------------
>   arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts  |  20 -
>   arch/arm/dts/stm32mp15xx-dhcor-avenger96.dtsi | 437 --------------
>   .../arm/dts/stm32mp15xx-dhcor-drc-compact.dts |  18 -
>   .../dts/stm32mp15xx-dhcor-drc-compact.dtsi    | 326 -----------
>   arch/arm/dts/stm32mp15xx-dhcor-io1v8.dtsi     |  28 -
>   arch/arm/dts/stm32mp15xx-dhcor-som.dtsi       | 221 -------
>   arch/arm/dts/stm32mp15xx-dhcor-testbench.dts  | 180 ------
>   .../dh_stm32mp1/u-boot-dhcom.its              |  18 +-
>   .../dh_stm32mp1/u-boot-dhcor.its              |  12 +-
>   configs/stm32mp13_dhcor_defconfig             |   3 +-
>   configs/stm32mp15_dhcom_basic_defconfig       |   5 +-
>   configs/stm32mp15_dhcor_basic_defconfig       |   5 +-
>   27 files changed, 24 insertions(+), 2885 deletions(-)
>   delete mode 100644 arch/arm/dts/stm32mp135f-dhcor-dhsbc.dts
>   rename arch/arm/dts/{stm32mp15xx-dhcor-testbench-u-boot.dtsi => stm32mp151a-dhcor-testbench-u-boot.dtsi} (100%)
>   rename arch/arm/dts/{stm32mp15xx-dhcom-drc02-u-boot.dtsi => stm32mp153c-dhcom-drc02-u-boot.dtsi} (100%)
>   rename arch/arm/dts/{stm32mp15xx-dhcor-drc-compact-u-boot.dtsi => stm32mp153c-dhcor-drc-compact-u-boot.dtsi} (100%)
>   rename arch/arm/dts/{stm32mp15xx-dhcor-avenger96-u-boot.dtsi => stm32mp157a-dhcor-avenger96-u-boot.dtsi} (100%)
>   rename arch/arm/dts/{stm32mp15xx-dhcom-pdk2-u-boot.dtsi => stm32mp157c-dhcom-pdk2-u-boot.dtsi} (100%)
>   rename arch/arm/dts/{stm32mp15xx-dhcom-picoitx-u-boot.dtsi => stm32mp157c-dhcom-picoitx-u-boot.dtsi} (100%)
>   delete mode 100644 arch/arm/dts/stm32mp15xx-dhcom-drc02.dts
>   delete mode 100644 arch/arm/dts/stm32mp15xx-dhcom-drc02.dtsi
>   delete mode 100644 arch/arm/dts/stm32mp15xx-dhcom-pdk2.dts
>   delete mode 100644 arch/arm/dts/stm32mp15xx-dhcom-pdk2.dtsi
>   delete mode 100644 arch/arm/dts/stm32mp15xx-dhcom-picoitx.dts
>   delete mode 100644 arch/arm/dts/stm32mp15xx-dhcom-picoitx.dtsi
>   delete mode 100644 arch/arm/dts/stm32mp15xx-dhcom-som.dtsi
>   delete mode 100644 arch/arm/dts/stm32mp15xx-dhcor-avenger96.dts
>   delete mode 100644 arch/arm/dts/stm32mp15xx-dhcor-avenger96.dtsi
>   delete mode 100644 arch/arm/dts/stm32mp15xx-dhcor-drc-compact.dts
>   delete mode 100644 arch/arm/dts/stm32mp15xx-dhcor-drc-compact.dtsi
>   delete mode 100644 arch/arm/dts/stm32mp15xx-dhcor-io1v8.dtsi
>   delete mode 100644 arch/arm/dts/stm32mp15xx-dhcor-som.dtsi
>   delete mode 100644 arch/arm/dts/stm32mp15xx-dhcor-testbench.dts
>

Nice.



Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

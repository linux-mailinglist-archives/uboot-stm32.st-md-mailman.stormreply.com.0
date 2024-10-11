Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A194E99AAEC
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Oct 2024 20:17:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3942BC71290;
	Fri, 11 Oct 2024 18:17:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20F41C7128A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2024 18:17:46 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BC8tOl019689;
 Fri, 11 Oct 2024 20:17:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 wbI7ehi6VmsCuN61BvZShBdMN5lf8Lhu1hpdpUpoHYk=; b=IwTuYjnJBH8WawPy
 jbCBNF7OBB/ntQFOIN4D4tW4f8f/RXPnNUK5ZQqlCD5kvGfHIMiyrwgv42dnFe+M
 QKBIGzUxd4aiHsL//xtfqYOv2MZF3lFyM8aq4lu3HOH7AZvs7Q/c5HKEzeZ6xtDW
 9fYEmPjZnUEhIV78lqoIwg2mRtFN7O5D98h3b9QhyEIMCE0KjxKQR04kIARoRo6J
 tOyoN+uup/QtuWUbxFZBzR9qugJP9Pk4E1+dOR0VJa0FmhSgiboQ8U8lo1EjDWEI
 SWRoVSf6mMJf4JC4yM3K2KmwLDD32q77aYEyfxw2a7lnRiElBJNdjHIjDj1lqKu7
 WmMsUw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 426343a9kg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2024 20:17:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 93CF54005C;
 Fri, 11 Oct 2024 20:16:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C0612A438D;
 Fri, 11 Oct 2024 20:16:01 +0200 (CEST)
Received: from [10.48.86.243] (10.48.86.243) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 11 Oct
 2024 20:16:00 +0200
Message-ID: <55842cb0-5199-429a-8e92-5bac71dea67c@foss.st.com>
Date: Fri, 11 Oct 2024 20:15:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20241005011647.436456-1-marex@denx.de>
 <20241005011647.436456-3-marex@denx.de>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20241005011647.436456-3-marex@denx.de>
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2 3/3] ARM: dts: stm32: Generate
 u-boot.itb using binman on DH STM32 DHSOM
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
> Describe the u-boot.its generation in stm32mp15xx-dhsom-u-boot.dtsi
> binman {} DT node as a replacement for current CONFIG_SPL_FIT_SOURCE
> use, dispose of both u-boot-dhcom.its and u-boot-dhcor.its.
>
> Use fdt-SEQ/config-SEQ to generate a list of fdt-N fitImage images {} and
> matching configuration {} node entries. The configuration node entry names
> no longer encode _somrevN_boardrevN suffix, which was never really used, so
> drop this functionality by default. Rework board_fit_config_name_match() to
> match on the new configuration node entry names.
>
> Users who do need the match on _somrevN_boardrevN can either replace the
> fdt-SEQ/config-SEQ with fixed fdt-N/config-N nodes which each encode the
> matching 'description = "NAME_somrevN_boardrevN"' to restore the old
> behavior verbatim, or better use SPL DT overlays for U-Boot control DT
> the same way e.g. i.MX8MP DHCOM does to support multiple SoM and board
> variants.
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
> V2: No change
> ---
>   arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi    |  1 +
>   arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi    |  1 +
>   arch/arm/dts/stm32mp15xx-dhsom-u-boot.dtsi    | 53 +++++++++++
>   board/dhelectronics/dh_stm32mp1/board.c       | 19 +++-
>   .../dh_stm32mp1/u-boot-dhcom.its              | 91 -------------------
>   .../dh_stm32mp1/u-boot-dhcor.its              | 70 --------------
>   configs/stm32mp15_dhcom_basic_defconfig       |  2 -
>   configs/stm32mp15_dhcor_basic_defconfig       |  2 -
>   8 files changed, 70 insertions(+), 169 deletions(-)
>   create mode 100644 arch/arm/dts/stm32mp15xx-dhsom-u-boot.dtsi
>   delete mode 100644 board/dhelectronics/dh_stm32mp1/u-boot-dhcom.its
>   delete mode 100644 board/dhelectronics/dh_stm32mp1/u-boot-dhcor.its
>

Nice,
I discover the binman FIT Substitutions with N / SEQ


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick




_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

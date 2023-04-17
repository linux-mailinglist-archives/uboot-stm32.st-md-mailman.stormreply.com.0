Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC626E4D53
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Apr 2023 17:32:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E9CEC65E70;
	Mon, 17 Apr 2023 15:32:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 759B9C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 15:32:20 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33HE184N018668; Mon, 17 Apr 2023 17:32:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=0EGvVnSbPr6nN2A7mqYHMbqEM8VDbhCHApOTYWqzvJ8=;
 b=HqkrTl2K055yn3HCtcuu6XBWv42PSXlu+vB+59jDeHw7m0ZKUPvX+e0guZMc4FNStumo
 YditLYD+YeSzQKHALCBO5faf3Tr+0Lm8DsUkQYlMj/JtFi0C4qhh5CE7nWXLca76AirI
 +ZPlH7ClmOSq/fZN10nzODX7dHcr8lXid3qlhBdZnoaNrGCU+Vpl/M5Uqs4GnGxSgExa
 vZkXsS97dWLrB81MCOLBg6UnPY/toFhaBRBty1/QTvkxJS7y+Sd+ujsliWnGAfMMh6lV
 K2UzEH1flsUdAmp2C9Lar2JGhpisL0uAl0hfBpK7iKkgfT/d/zwfEXWqpoeKq1Qo6/ZH Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q10vdufva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 17:32:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DFEBB10002A;
 Mon, 17 Apr 2023 17:32:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BBB59229A89;
 Mon, 17 Apr 2023 17:32:16 +0200 (CEST)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 17 Apr
 2023 17:32:16 +0200
Message-ID: <b3abb949-cca2-744d-017b-8715cf193cd0@foss.st.com>
Date: Mon, 17 Apr 2023 17:32:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20230403060444.224091-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20230403060444.224091-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_10,2023-04-17_01,2023-02-09_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH] spi: stm32_qspi: Remove useless struct
	stm32_qspi_flash
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

On 4/3/23 08:04, Patrice Chotard wrote:
> Currently, in stm32_qspi_claim_bus(), QSPI_CR and QSPI_DCR registers
> are saved in stm32_ospi_flash struct on first flash memory initialization
> and restored on each flash accesses.
>
> As the logic of spi-uclass.c changed since 'commit 741280e9accd
> ("spi: spi-uclass: Fix spi_claim_bus() speed/mode setup logic")'
> set_speed() and set_mode() callbacks are called systematically when bus
> speed or bus mode need to be updated, QSPI_CR and QSPI_DCR registers are
> set accordingly.
>
> So stm32_qspi_claim_bus() can be updated by removing QSPI_CR and QSPI_DCR
> save/restore code and struct stm32_ospi_flash can be removed as well.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   drivers/spi/stm32_qspi.c | 27 +++------------------------
>   1 file changed, 3 insertions(+), 24 deletions(-)
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF15D3CB439
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jul 2021 10:30:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87A98C59781;
	Fri, 16 Jul 2021 08:30:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60598C57B6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jul 2021 08:30:34 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16G8SnxK000940; Fri, 16 Jul 2021 10:30:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=OQOXI/d/VcUy6uVFz6d0vu7QLtGYE/2BUGOKO5Cnpd4=;
 b=8DRYsX6V7H2Gy6B7D7Jhx+3ZxLhVPIeUk+mMrmomK1AKcBuSsLDzbrN5Dtoysw8c+PVM
 EOqpt16bWgFB6CFl1z3Rkf4jVPkufgaWGTnAajNUFESiYh80jTxk1lhdHO1UT5jHEE4h
 prk0UhI8SuZamLiOrVO1C8l3UOwVYE8ssVqoR/8RGpjwENGQaCqo1lYgq8rG237Wwhve
 oP2x4TnkHA/RTGYAG1670zppsH4c5OFHLW3rGxIgUTx4l3aeca3PlUMUo/Ar7OlNH2MZ
 GLtImeUA/YF5GnUGU2Lwfo/On8lQHqKx48cSt327wqA9HeOoe/HV8d/tMg5Wh7wbVi1e OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39tw1uamwh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 10:30:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2289110002A;
 Fri, 16 Jul 2021 10:30:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 19B9D218CB5;
 Fri, 16 Jul 2021 10:30:32 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Jul
 2021 10:30:31 +0200
To: <u-boot@lists.denx.de>
References: <20210629120824.1.Ie6808c79e8d3fc567c03ce44ff9dbfc44ee105d3@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <55e772cc-9738-7aa9-6b6f-edc07ac3bd66@foss.st.com>
Date: Fri, 16 Jul 2021 10:30:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629120824.1.Ie6808c79e8d3fc567c03ce44ff9dbfc44ee105d3@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_02:2021-07-16,
 2021-07-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp1: activate command rng
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

On 6/29/21 12:08 PM, Patrick Delaunay wrote:
> Activate the command rng with CONFIG_CMD_RNG, used to test
> the rng driver
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   configs/stm32mp15_basic_defconfig   | 2 +-
>   configs/stm32mp15_trusted_defconfig | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
Applied to u-boot-stm/master, thanks!

Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

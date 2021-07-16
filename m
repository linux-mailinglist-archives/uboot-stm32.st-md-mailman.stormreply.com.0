Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D922E3CB43E
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jul 2021 10:31:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3A76C59783;
	Fri, 16 Jul 2021 08:31:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4347DC59781
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jul 2021 08:31:29 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16G8SnVq000928; Fri, 16 Jul 2021 10:31:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=kiocvWQangkWlceM2l5fImQkPQG2oaAOxYk/Yv2UjUw=;
 b=iFUQym+nvXe6fPcgOAs7MAxqGUGFayx+UjwfVB6CSeDkF+sdUWbD/EtYyh5N725ag53K
 Qmu9otMiYtlax8l5k7+p5gCdIZd3Blc4wl0YkIZNkQClR2DwDDNy8ppI0gFTjAjVBgWx
 2JnXAcApWtmGA9NcBeQJbtLc0ihhj5T91qFA+pLSTNosoYaAZrUBmR7/ZctQM9HyxMBo
 iBGuq9O0qGR9yWTss9IYJqXWZNq5Sf/9fZrCEGm2/+Atz/tnypLLfl7dw7tGsV3/Rck8
 j7KlmzE5tIrEfY4su21HvXWdQckUxe+EzsBL9iTKbCfKuhKZsECpvEGPlDqRX+kulXIR Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39tw1uan2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 10:31:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 623A410002A;
 Fri, 16 Jul 2021 10:31:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 53307218CB9;
 Fri, 16 Jul 2021 10:31:27 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Jul
 2021 10:31:26 +0200
To: <u-boot@lists.denx.de>
References: <20210706171943.1.Ie853cf4b81d27d0393e45bb183368c1318a5712e@changeid>
 <20210706171943.2.I273d18dde276f6579a08f4755940468325e5f3e8@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <3f91ee65-c3c4-ebfa-19be-90f164c6e267@foss.st.com>
Date: Fri, 16 Jul 2021 10:31:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706171943.2.I273d18dde276f6579a08f4755940468325e5f3e8@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_02:2021-07-16,
 2021-07-16 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] ARM: dts: stm32mp15: remove mmc alias
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

On 7/6/21 5:19 PM, Patrick Delaunay wrote:
> Remove the mmc alias no more required as the sequence number
> of mmc device is used for boot_instance.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 1 -
>   arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi | 2 --
>   2 files changed, 3 deletions(-)
>

Applied to u-boot-stm/master, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

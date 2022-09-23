Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D43DA5E7AD0
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Sep 2022 14:32:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D8FEC0D2C2;
	Fri, 23 Sep 2022 12:32:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F1C7C03FD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 12:32:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28NADpLQ018740;
 Fri, 23 Sep 2022 14:32:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=+FilQhwgPJeIp+ug0aGg2cH68M/gUzNOMsfE6DZasM8=;
 b=TnYHRW1PEFTOVcZGiBTwR89EyRefH29sKPF2XK509uWgYH4neeVghfO+Rrb1eBQbF2EO
 jPF7mf8sC0TYN7PxB+jQNpBZDvU0itSBrGqAngAh/qNCiAirUXqlNew58ezMVVsKZGrm
 H6UPSV+Uc9f59dNWnoyLTEgT+H+ZONJoePVUcaWUb4ldxdW0c7I/FHmbNLxG6jPtdDdp
 UTUzsbWRTfwUo/SCeTKIlMLsubBQgxHkASwublbM4NKvtRQmQgWfLTi8djdPmJpwcesR
 YSgiR4APxHK2FdbTbRc28uJyJ6LuU9Gm7HwLFoj6l0fBA6k/xSlV4/TG9fy2CXupn/S/ tQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jr11xfmby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Sep 2022 14:32:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6359C10002A;
 Fri, 23 Sep 2022 14:32:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 578E42291CC;
 Fri, 23 Sep 2022 14:32:15 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 23 Sep
 2022 14:32:15 +0200
Message-ID: <46bd73e1-bcff-72ae-3afe-8d31a5a2aaf6@foss.st.com>
Date: Fri, 23 Sep 2022 14:32:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220915161141.301299-1-patrick.delaunay@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220915161141.301299-1-patrick.delaunay@foss.st.com>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-23_04,2022-09-22_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 0/4] arm: stm32mp: adapt the command
 stm32key for STM32MP13x
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


On 9/15/22 18:11, Patrick Delaunay wrote:
> 
> And support the 2 keys for STM32MP13x
> - PKHTH : Hash of the 8 ECC Public Keys Hashes Table
>           (ECDSA is the authentication algorithm)
> - EDMK : Encryption/Decryption Master Key
> 
> Only one key is supported for STM32MP15x
> - PKH : Hash of the ECC Public Key
>         (ECDSA is the authentication algorithm)
> 
> This STM32KEY command is used in STM32MP SoCs to provision the
> keys in the correct OTP needed to activate secure boot features:
> authentication and encryption.
> 
> See [1] for details
> 
> [1] STM32 MPU wiki
> https://wiki.st.com/stm32mpu/wiki/How_to_use_U-Boot_stm32key_command
> 
> 
> 
> Patrick Delaunay (4):
>   arm: stm32mp: add defines for BSEC_LOCK status in stm32key command
>   arm: stm32mp: introduced read_close_status function in stm32key
>     command
>   arm: stm32mp: support several key in command stm32key
>   arm: stm32mp: adapt the command stm32key for STM32MP13x
> 
>  arch/arm/mach-stm32mp/cmd_stm32key.c | 331 ++++++++++++++++++++-------
>  1 file changed, 249 insertions(+), 82 deletions(-)
> 
For the series:

Applied on u-boot-stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

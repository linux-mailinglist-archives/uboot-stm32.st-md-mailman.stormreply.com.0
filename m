Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3313D71B7
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 Jul 2021 11:10:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A42EFC597AB;
	Tue, 27 Jul 2021 09:10:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D01AC5719C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jul 2021 09:10:29 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16R981EQ023041; Tue, 27 Jul 2021 11:10:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ma8z5gkT3SqD+b5mdTPzOeaHDzYQuAPX9FcguyaTRus=;
 b=N6lg/+Bt1ACnlZ/HI6lGH/zlDVcLPioUHc5ilS3RURB3T5OtvHTjUbAlNoCaAW8YLOcq
 9iujUdFl/GTcK3UZG/9TorE2PNfkDb3rD8rHbaa3Rhwcs3yHbUDLZynwviFvopceZ40P
 jxXmdCBuSwcB1H665MJEO04YfqPhbYLdfjiyhwHrkScgFgLEBqYXhTYF7dxzyYROAz4z
 cTIviIlrjUp2PP3mTSyY9mN/J4EcpuZzMg0PVBYHoxQHsQhEoD9yM4sp9Up4DYBsG5R0
 TW5j6EvAp8G0XijVY9UWeBCFT1y/NQX+ArTxBmqTy/3iagPjU5GdZ3OijRIF/AMLqLX2 Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a235gb9yh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 11:10:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0366010002A;
 Tue, 27 Jul 2021 11:10:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ECF0021BF4A;
 Tue, 27 Jul 2021 11:10:27 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 27 Jul
 2021 11:10:27 +0200
To: <u-boot@lists.denx.de>
References: <20210709095322.1.I3841c4ea8add371529df3e03de5439659a69f38b@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <28476c14-e185-2425-733c-fcf26b55c352@foss.st.com>
Date: Tue, 27 Jul 2021 11:10:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709095322.1.I3841c4ea8add371529df3e03de5439659a69f38b@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-27_06:2021-07-27,
 2021-07-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp1: add pull-up for gpio button
	PA13 and PA14
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

On 7/9/21 9:53 AM, Patrick Delaunay wrote:
> When a push-button is released and PA13/PA14 are defined as input (high-Z)
> the LED should not be active as the circuit is open but a small current
> leak through PCB or push-button close the circuit and allows a small LED
> bias giving erroneous level voltage.
>
> So it is recommended to activate an internal pull-up in order to clearly
> fix the voltage at PA13/PA14 when button is released and to wait
> a short delay before to read the GPIO value only when the pull-up is
> correctly configured.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 4 ++--
>   arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi | 4 ++--
>   board/st/stm32mp1/stm32mp1.c             | 2 ++
>   3 files changed, 6 insertions(+), 4 deletions(-)
>

Applied to u-boot-stm/master, thanks!

Regards
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

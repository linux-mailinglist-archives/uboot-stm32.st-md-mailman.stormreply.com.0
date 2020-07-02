Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1081211C87
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:18:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87141C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:18:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5702FC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:18:03 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0627E185008817; Thu, 2 Jul 2020 09:18:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=eeJOLp5Xjv6bNgaPRSgDzNz0F6UCMCdvObZ0WU6srYI=;
 b=wNGtDAaOej31aFmyhJjPUhrT7p8oYI7xwtMmoRUp5nKHZSBOhLQyBtslUTMjd66tKThw
 +rnqHYxbknC0EPK+kZbZRsVeyyLDp1NaMWBrvyth8antIJo5MbUdPp7pcqMtGAN6r5FL
 wAAsRlqDOGeSmlPEjLAX5mEk4GIPYF6/VWQoEPOqNgQyfFac4Yo2AbXHXHFsSLzzbT5f
 uBAj0j6aV/dFluYALUGg8o71bJ7Tl5upgjR+MlV250npq/pW0l4/tXasR9vnt2PmWDBX
 dn0lbk6723RDQdBpyby8paDcBDfV6zeGa+cirymzx4TaPRfp3OaFbtyJ6hO0u7kKSsrU Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuk1pens-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:18:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D7D0D10002A;
 Thu,  2 Jul 2020 09:18:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD63721CA63;
 Thu,  2 Jul 2020 09:18:01 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 2 Jul
 2020 09:18:01 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:18:01 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] board: st: stm32mp1: increase teed
 partition
Thread-Index: AQHWQ/nvyZiD23Y1WUiCSVfANFxawajz2FoA
Date: Thu, 2 Jul 2020 07:18:01 +0000
Message-ID: <487ee45b-1210-65b1-7ffa-e044f2a441a0@st.com>
References: <20200616181919.1.I835f0c06bfc195456c3b4a0ff8e427013f9fe097@changeid>
In-Reply-To: <20200616181919.1.I835f0c06bfc195456c3b4a0ff8e427013f9fe097@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <EE223234CB7EFD4BA5EEEA05A5B8EF89@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] board: st: stm32mp1: increase teed
 partition
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

On 6/16/20 6:19 PM, Patrick Delaunay wrote:
> With TEE 3.7.0, the partition teed (OP-TEE pageable
> code and data) need to increase up to 512KB in NOR device.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/common/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
> index 015ba40939..750dbb6451 100644
> --- a/board/st/common/Kconfig
> +++ b/board/st/common/Kconfig
> @@ -39,7 +39,7 @@ config MTDPARTS_NOR0_BOOT
>  
>  config MTDPARTS_NOR0_TEE
>  	string "mtd tee partitions for nor0"
> -	default "256k(teeh),256k(teed),256k(teex)"
> +	default "256k(teeh),512k(teed),256k(teex)"
>  	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
>  	help
>  	  This define the tee partitions added in mtparts dynamically

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

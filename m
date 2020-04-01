Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0EA19A622
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 09:19:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0DB6C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 07:19:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B8E7C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 07:19:31 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0317HvKr013448; Wed, 1 Apr 2020 09:19:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=wY0Kbt6OETLL5thnuTviuHXqN2s8RX8drD88SenOGeA=;
 b=FPAJT6yZ6A9TLAlDv+AliA1f5H+a4Q1/D4Z6PIclEZXpg88Gwq8l1OxGh8p3CjC6iS6R
 lLWfuIbLq9v36G0arIZVhI9YHFlFHQhzcywhmQG7AOtusdSPZoZTEEYi4oMUPh1BqfBL
 rwlOuGpein0bWOkWuO7MyGsuGIu3v2LVfU/mOIDqLRNW5YauhvF8xZR9t8wR2rCSpP5N
 HDMQ6NhQQwmU9VXAWQxnyqnufrm49fxJ6QaS0iFVBkSgw8EjkAxzXE01p3IHoJ6XbE+h
 FzuOp3Y3J+H1hMpgzjFXIxwIFz5Gv5NMbjG/b15IJH1Ujrmhj26R5LaMewY0UUhTNXqC 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301w813d0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 09:19:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8D20C100034;
 Wed,  1 Apr 2020 09:19:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 820C52123C7;
 Wed,  1 Apr 2020 09:19:22 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Apr
 2020 09:19:22 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 1 Apr 2020 09:19:22 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 02/16] arm: stm32mp: remove dependency for STM32KEY
Thread-Index: AQHWB3YeFqzo9ojtrEC4c33WfZAaa6hju0aA
Date: Wed, 1 Apr 2020 07:19:22 +0000
Message-ID: <2d871881-549f-012f-2276-946f9693a9f0@st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.2.Ibb1f76c9bdf50f4f21793461d3a76b4f3ef479fd@changeid>
In-Reply-To: <20200331180330.2.Ibb1f76c9bdf50f4f21793461d3a76b4f3ef479fd@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <839BD9DFF3EDCA4AB1A1A9795194748A@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 02/16] arm: stm32mp: remove dependency for
	STM32KEY
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

HI Patrick

On 3/31/20 6:04 PM, Patrick Delaunay wrote:
> This command is not more depending on fuse command, but have
> direct access to BSEC misc driver, so the dependency wuth
> can be removed CMD_FUSE

s/wuth/with

rephrase "the dependency wuth can be removed CMD_FUSE" by " "the dependency with CMD_FUSE can be removed"

>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/Kconfig | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
> index 96153693a7..032facff31 100644
> --- a/arch/arm/mach-stm32mp/Kconfig
> +++ b/arch/arm/mach-stm32mp/Kconfig
> @@ -127,12 +127,10 @@ config STM32_ETZPC
>  config CMD_STM32KEY
>  	bool "command stm32key to fuse public key hash"
>  	default y
> -	depends on CMD_FUSE
>  	help
>  		fuse public key hash in corresponding fuse used to authenticate
>  		binary.
>  
> -
>  config PRE_CON_BUF_ADDR
>  	default 0xC02FF000
>  

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

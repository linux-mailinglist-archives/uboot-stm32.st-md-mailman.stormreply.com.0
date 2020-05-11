Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E11B1CDC27
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 15:54:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDF2FC36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 13:54:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EB37C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 13:54:50 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BDS8dU024993; Mon, 11 May 2020 15:54:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=fTq3fS3EtnXOZZ4UIb6/FhDzQczLr3p/RUti9GdFVJg=;
 b=U4Tm8WAUFXMTaNAjhOce6mMkSiiV+1MbgFylIJJnH/09u9/R7Qyl8l5PMkqY0yhFlbS2
 bV71MbGmkXvAo2Il/+F8cuUo4xfM5RhU9EL7B/lUVuAcreLe6wcvpeODgundiuSospqa
 UdUTwJOLB0eEesMfZtSTlVX7QwGqkZChjXYHlBqrF9mZELMgXN5nxxw4ybF2bIl+A6y2
 cW9Of0CnW7G3LAaDy7T8JJ6JOlVNyFJlZewa2yEPXnPmW15OCbAJyzeh7HJtwtibMfYF
 BkwIsRh+yNs1zHhEjuvUrg1I9X0hxDipA01bt6UU9KS88JbycgCheDtJv1sF77mKgMW2 dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30wj9wauga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 15:54:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 02DB0100034;
 Mon, 11 May 2020 15:54:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ED29D2A9770;
 Mon, 11 May 2020 15:54:47 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 May
 2020 15:54:47 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 11 May 2020 15:54:47 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 8/9] board: stm32mp1: update vddcore in SPL
Thread-Index: AQHWF+8zgzTneYzgtUOyilXxV+o3hqii5g8A
Date: Mon, 11 May 2020 13:54:47 +0000
Message-ID: <478c1cd9-272a-92c6-b616-b8e437e855ec@st.com>
References: <20200421151128.18072-1-patrick.delaunay@st.com>
 <20200421171123.8.I6f11a8bc7a6681ab18c3bbbc1ac73cbdac030982@changeid>
In-Reply-To: <20200421171123.8.I6f11a8bc7a6681ab18c3bbbc1ac73cbdac030982@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <44F6AFFF2253244A858953956BAA42C8@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_06:2020-05-11,
 2020-05-11 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 8/9] board: stm32mp1: update vddcore in SPL
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

On 4/21/20 5:11 PM, Patrick Delaunay wrote:
> For board using STPMIC1, the vddcore is provided by BUCK1 of STMPIC1
> and need to be updated for 800MHz support and only after the clock
> tree initialization.
>
> The VDDCORE voltage value in provide by clock driver, saved in global
> variable  opp_voltage_mv and udpated SPL in board_early_init_f().
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/stm32mp1/spl.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/board/st/stm32mp1/spl.c b/board/st/stm32mp1/spl.c
> index e65ff288ea..616fb1d6f2 100644
> --- a/board/st/stm32mp1/spl.c
> +++ b/board/st/stm32mp1/spl.c
> @@ -12,6 +12,26 @@
>  #include <power/pmic.h>
>  #include <power/stpmic1.h>
>  #include <asm/arch/ddr.h>
> +#include "../common/stpmic1.h"
> +
> +/* board early initialisation in board_f: need to use global variable */
> +#if defined(CONFIG_PMIC_STPMIC1) && defined(CONFIG_SPL_POWER_SUPPORT)
> +static u32 opp_voltage_mv __section(".data");
> +
> +void board_vddcore_init(u32 voltage_mv)
> +{
> +	opp_voltage_mv = voltage_mv;
> +}
> +#endif
> +
> +int board_early_init_f(void)
> +{
> +#if defined(CONFIG_PMIC_STPMIC1) && defined(CONFIG_SPL_POWER_SUPPORT)
> +	stmpic_buck1_set(opp_voltage_mv);
> +#endif
> +
> +	return 0;
> +}
>  
>  void spl_board_init(void)
>  {

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

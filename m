Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2451CDBD1
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 15:51:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47D29C36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 13:51:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D9BAC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 13:51:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BDQbdv032453; Mon, 11 May 2020 15:51:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=DswMb3spIYL24cGLdowFeavpLIkrG0usNx3gmV+hqaY=;
 b=G4ynRdwpp1RipYD9UTxhO+cFKsJYTyX9FYVVHJziHzFbYmA4MqhHTEwg+Qjg5d1s6oCP
 Lu6FOFAtbiJmi76TaDVmyGXuXtBXaUyeGh5f6S/pkyJmlXXqbvEBsppkLqf2xJ8vhclq
 TzX/R4b5fLFRjGWK8lMwmkU4n4vS+4WTMW2usAfuarCb0KYuxfB7v24bxF2QaGq+L3Ck
 6clnE6mUUox6ktUWyaTgIizB2GkL8sPksunG1eWYa8JG+IjGmwZmjrIqe06VaXLzvw5z
 hCmLyc7rSr9zXdwsS6VCx7nJdGq1Ujosh/z6PZZzFsVY8eSMWj6lfgnAQof2cmFkgrEE hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30wkdgtdhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 15:51:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3CBD310002A;
 Mon, 11 May 2020 15:51:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 305BE212664;
 Mon, 11 May 2020 15:51:41 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 May
 2020 15:51:40 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 11 May 2020 15:51:40 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 5/9] ARM: stm32: Add board_early_init_f() to SPL
Thread-Index: AQHWF+8uU6Xm1sEtnU+uc1etGOi3Fqii5TIA
Date: Mon, 11 May 2020 13:51:40 +0000
Message-ID: <a6372de6-65de-3f0f-657e-d266916a1a2c@st.com>
References: <20200421151128.18072-1-patrick.delaunay@st.com>
 <20200421151128.18072-2-patrick.delaunay@st.com>
In-Reply-To: <20200421151128.18072-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <A1EFE5A894FC7E4F8618B4BAFA4B1519@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_06:2020-05-11,
 2020-05-11 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>, U-Boot
 STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 5/9] ARM: stm32: Add board_early_init_f()
	to SPL
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
> From: Marek Vasut <marex@denx.de>
>
> Add weak implementation of board_early_init_f() hook into the
> STM32MP1 SPL. This can be used to read out e.g. configuration
> straps before initializing the DRAM.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/spl.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
> index ca4231cd0d..cd14d1065e 100644
> --- a/arch/arm/mach-stm32mp/spl.c
> +++ b/arch/arm/mach-stm32mp/spl.c
> @@ -76,6 +76,11 @@ void spl_display_print(void)
>  }
>  #endif
>  
> +__weak int board_early_init_f(void)
> +{
> +	return 0;
> +}
> +
>  void board_init_f(ulong dummy)
>  {
>  	struct udevice *dev;
> @@ -110,6 +115,12 @@ void board_init_f(ulong dummy)
>  	/* enable console uart printing */
>  	preloader_console_init();
>  
> +	ret = board_early_init_f();
> +	if (ret) {
> +		debug("board_early_init_f() failed: %d\n", ret);
> +		hang();
> +	}
> +
>  	ret = uclass_get_device(UCLASS_RAM, 0, &dev);
>  	if (ret) {
>  		printf("DRAM init failed: %d\n", ret);

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

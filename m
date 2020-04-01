Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF29419A6CC
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 10:07:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76EBEC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 08:07:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 778A6C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 08:07:08 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03182r4b016886; Wed, 1 Apr 2020 10:07:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=x/F2weetohv5rrW92Roerv+TR2LJEYvb7lWdafHLh7s=;
 b=OMunZuwn5oc0UrRBCxo8i1lhPD56V89bCWDRDQfkcOKUUANJGEMBnr/LxH1vVaLtXBKQ
 j+a7GBH0669u8LNNjGETrzEBcT5wyjNlgHHPdP0a5uIGr8aCOAYcFyc297UIkKurJ2yw
 XsrwrxB2HvWdmkKY48KozBguxfLmxUmblDRMVTFnYIf4up3+gRGOuhb2ZxZERBWV22rl
 L55uuqI8PMxxFel3YvomqOSvPlChFhossPOV+RCctirEcvgADDqNmp8rvFSxFgPIICc5
 ndv7wYi+qE0O98yP1VU+QcEI2L6dN5CoeCkjEhUiyctyP5Gu9L6StyuU0BRs0rO5eAsP Kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 302y53wtkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 10:07:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 167B4100034;
 Wed,  1 Apr 2020 10:07:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0AF492126A2;
 Wed,  1 Apr 2020 10:07:06 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Apr
 2020 10:07:05 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 1 Apr 2020 10:07:05 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 12/16] board: stm32mp1: add timeout for I/O
 compensation ready
Thread-Index: AQHWB/yIVvqUUIAVnkWxhwhf89i5Pw==
Date: Wed, 1 Apr 2020 08:07:05 +0000
Message-ID: <5fce35b0-a45f-284d-8d8a-9330c44a197a@st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.12.Ia5fd6d6f4787d69ef9b4b5cebb334e5f2dc81ed3@changeid>
In-Reply-To: <20200331180330.12.Ia5fd6d6f4787d69ef9b4b5cebb334e5f2dc81ed3@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <AE2079C7463A3540B281DD2D463F126D@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 12/16] board: stm32mp1: add timeout for
 I/O compensation ready
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

On 3/31/20 6:04 PM, Patrick Delaunay wrote:
> This patch avoids infinite loop when I/O compensation failed,
> it adds a 1s timeout to detect error.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/stm32mp1/stm32mp1.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index fff4cef2c2..75aac6d66c 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -35,6 +35,7 @@
>  #include <asm/arch/sys_proto.h>
>  #include <jffs2/load_kernel.h>
>  #include <linux/err.h>
> +#include <linux/iopoll.h>
>  #include <power/regulator.h>
>  #include <usb/dwc2_udc.h>
>  
> @@ -473,10 +474,10 @@ static void sysconf_init(void)
>  	struct udevice *pwr_dev;
>  	struct udevice *pwr_reg;
>  	struct udevice *dev;
> -	int ret;
>  	u32 otp = 0;
>  #endif
> -	u32 bootr;
> +	int ret;
> +	u32 bootr, val;
>  
>  	syscfg = (u8 *)syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
>  
> @@ -553,8 +554,15 @@ static void sysconf_init(void)
>  	 */
>  	writel(SYSCFG_CMPENSETR_MPU_EN, syscfg + SYSCFG_CMPENSETR);
>  
> -	while (!(readl(syscfg + SYSCFG_CMPCR) & SYSCFG_CMPCR_READY))
> -		;
> +	/* poll until ready (1s timeout) */
> +	ret = readl_poll_timeout(syscfg + SYSCFG_CMPCR, val,
> +				 val & SYSCFG_CMPCR_READY,
> +				 1000000);
> +	if (ret) {
> +		pr_err("SYSCFG: I/O compensation failed, timeout.\n");
> +		led_error_blink(10);
> +	}
> +
>  	clrbits_le32(syscfg + SYSCFG_CMPCR, SYSCFG_CMPCR_SW_CTRL);
>  #endif
>  }

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

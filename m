Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB182A5FB1
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Nov 2020 09:36:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19F3FC36B35;
	Wed,  4 Nov 2020 08:36:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16FC7C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Nov 2020 08:36:31 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A48Vwh4019671; Wed, 4 Nov 2020 09:36:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Mbf8LjxRLAtPyisYAFJMwSUmvusF1OIaPfac/VOPjAI=;
 b=XObdBTjT+V396xEk+QoiuMlWsUiKDUKJ/vBpWm7871bvvOoOcUlAw6V4BNXKE1z/YgyB
 xpfPBvw0HDNXwN0wmeBUaMdos87GHG3ntcIpk65XRGyCWVQe4eXYRmEvydEjNcoEyPgH
 lLZorMK76SRPX0uQ/mlHScFdV7o2j8utYYDp3sQ9HLDzc1fp4JbVU6mGWvZSzZhr1hE7
 ueMY1oDqb3BIQBKV9sx0Njn2epwgo3PZSQyNtd8AbWrHhwXHNZxycm4kjiAdO1M0WSHY
 VzWXO5ZI7y2ocTLguBnlmCGN/ULpvYRj6l5djlzGcyupRN69ZMl3PsOIb10eNiraqPaO UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gyw1dpgv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Nov 2020 09:36:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4982E10002A;
 Wed,  4 Nov 2020 09:36:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4084C233E80;
 Wed,  4 Nov 2020 09:36:27 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Nov
 2020 09:36:26 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 4 Nov 2020 09:36:26 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/2] pinctrl: stmfx: update pin name
Thread-Index: AQHWrQ/7LIW3zzu5fkecdk+MI8zKHKm3oEcA
Date: Wed, 4 Nov 2020 08:36:26 +0000
Message-ID: <0f2b3231-f0e5-8e04-4092-755c694f2224@st.com>
References: <20201028095157.11327-1-patrick.delaunay@st.com>
 <20201028095157.11327-2-patrick.delaunay@st.com>
In-Reply-To: <20201028095157.11327-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <2E1011AAECB53B449B57E5DD18C91BE7@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-04_06:2020-11-04,
 2020-11-04 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 2/2] pinctrl: stmfx: update pin name
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

On 10/28/20 10:51 AM, Patrick Delaunay wrote:
> Update pin name to avoid duplicated name with SOC GPIO
> gpio0...gpio15 / agpio0....agpio7: add a stmfx prefix.
>
> This pin name can be used in pinmux command.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/pinctrl/pinctrl-stmfx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
> index b789f3686c..a62be44d2d 100644
> --- a/drivers/pinctrl/pinctrl-stmfx.c
> +++ b/drivers/pinctrl/pinctrl-stmfx.c
> @@ -343,8 +343,8 @@ static int stmfx_pinctrl_get_pins_count(struct udevice *dev)
>  }
>  
>  /*
> - * STMFX pins[15:0] are called "gpio[15:0]"
> - * and STMFX pins[23:16] are called "agpio[7:0]"
> + * STMFX pins[15:0] are called "stmfx_gpio[15:0]"
> + * and STMFX pins[23:16] are called "stmfx_agpio[7:0]"
>   */
>  #define MAX_PIN_NAME_LEN 7
>  static char pin_name[MAX_PIN_NAME_LEN];
> @@ -352,9 +352,9 @@ static const char *stmfx_pinctrl_get_pin_name(struct udevice *dev,
>  					      unsigned int selector)
>  {
>  	if (selector < STMFX_MAX_GPIO)
> -		snprintf(pin_name, MAX_PIN_NAME_LEN, "gpio%u", selector);
> +		snprintf(pin_name, MAX_PIN_NAME_LEN, "stmfx_gpio%u", selector);
>  	else
> -		snprintf(pin_name, MAX_PIN_NAME_LEN, "agpio%u", selector - 16);
> +		snprintf(pin_name, MAX_PIN_NAME_LEN, "stmfx_agpio%u", selector - 16);
>  	return pin_name;
>  }
>  

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 798ED211D33
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:42:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4051DC36B25
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:42:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0D10C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:42:14 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0627W2Yi001653; Thu, 2 Jul 2020 09:42:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=MAA9OKLeEv1cbQSuY8URLylNVRgrn5ORwJH6G4fgah0=;
 b=vLv7vOre43JyoPg2fhuRi+Dv7mds9KFod0bGC6t98nGYs/Qhja7XUP1w4KDw5Sy6DBZ9
 jLjk8yRqKHqg7tLSzz5B8TRfS0hQY52ox5JZWCG5gQH9Q+HZvrPrd1IzMU/RocA30k56
 kMOfEZ7m5A53kVXpoWoXO/NnIxQbCk5t/nzvW3Wa4AC6l26Mes3LjWY9m1D9/rQJ/J70
 +nqhG2auwk33amwvs96m1K+xXdEcird4YHUn+Y+giPpy+lWW5jvy+oTLRqr5/vMXhSFE
 puyqwOhO9KsUH+Tn0IEkVAa3YQ7PQsgNaLH+oJNwEXVBPu2Y1K18fsvhlZ4s0OFZks2I OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuk1pjsp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:42:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D8C3410002A;
 Thu,  2 Jul 2020 09:42:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CFA1F210F7B;
 Thu,  2 Jul 2020 09:42:13 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Jul
 2020 09:42:13 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:42:13 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH v2 02/11] board: stm32mp1: update the gpio
 hog support
Thread-Index: AQHWUERNs2DiGomdukOa6yOuBl7QVA==
Date: Thu, 2 Jul 2020 07:42:13 +0000
Message-ID: <f5bd0dd7-1443-69b2-2ed7-46526ae5b64f@st.com>
References: <20200604123033.25499-1-patrick.delaunay@st.com>
 <20200604123033.25499-2-patrick.delaunay@st.com>
In-Reply-To: <20200604123033.25499-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <3450648F5E7EC74ABB30AF671040A66E@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 02/11] board: stm32mp1: update the gpio
 hog support
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

On 6/4/20 2:30 PM, Patrick Delaunay wrote:
> This patch updates the current gpio hog implementation and uses
> the new API gpio_hog_probe_all(), activated with CONFIG_GPIO_HOG.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2: None
>
>  board/st/stm32mp1/stm32mp1.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 4553329b25..f4a032f781 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -664,17 +664,11 @@ static void board_ev1_init(void)
>  /* board dependent setup after realloc */
>  int board_init(void)
>  {
> -	struct udevice *dev;
> -
>  	/* address of boot parameters */
>  	gd->bd->bi_boot_params = STM32_DDR_BASE + 0x100;
>  
> -	/* probe all PINCTRL for hog */
> -	for (uclass_first_device(UCLASS_PINCTRL, &dev);
> -	     dev;
> -	     uclass_next_device(&dev)) {
> -		pr_debug("probe pincontrol = %s\n", dev->name);
> -	}
> +	if (CONFIG_IS_ENABLED(DM_GPIO_HOG))
> +		gpio_hog_probe_all();
>  
>  	board_key_check();
>  

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

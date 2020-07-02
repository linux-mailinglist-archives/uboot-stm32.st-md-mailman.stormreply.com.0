Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A67211DB9
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 10:04:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48B36C36B25
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 08:04:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC662C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 08:04:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0627xHja007053; Thu, 2 Jul 2020 10:04:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=9XnoWv6O0qCoTxLAMhLjrNR96d8A6vW+J/IKvCh6stQ=;
 b=g42/Ix8aD4yDKueNd3geqUIlW4uxOeLrJYFChwsDVcr3cmVbnpnrhJ2mj+J+EyD+/DrN
 iSoAqPVcwxL/TLW6YJtW7eQ6WW4w+v38aThV7H+B+DZUTvxbbv0xar74gVAbCjYdkocd
 fThS2asvghqPJ4lp1BGkOyF4XNOHWwEL7snzINst9+HapEBebH9x1MxmKc2SUGwN+4KK
 ZxhiDSFD6ZvZEo/HlQ4qdKsNAaf7TxU28c5ZBYEOrrxoJXDX2UER0i0ZXzfd74uIPoK+
 799ePDl0EzOSnCezeedHX4yvkaj+E6raxZ/4hGP3l/IJ2hsGj+NXDjDf6KIig1EGIIUp 4w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wu89y4av-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 10:04:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 22284100039;
 Thu,  2 Jul 2020 10:04:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E03321F69A;
 Thu,  2 Jul 2020 10:04:52 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Jul
 2020 10:04:51 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 10:04:51 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] board: dh_stm32mp1: update the gpio hog
 support
Thread-Index: AQHWUEd2rD+Py1WeikGEUuh2fgJh5g==
Date: Thu, 2 Jul 2020 08:04:51 +0000
Message-ID: <da2ffab6-e99d-424b-1ef4-95cdf5a77ff4@st.com>
References: <20200529163325.30892-1-patrick.delaunay@st.com>
In-Reply-To: <20200529163325.30892-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <3F56287F52A86542BA07A84C798820DC@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] board: dh_stm32mp1: update the gpio hog
 support
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

On 5/29/20 6:33 PM, Patrick Delaunay wrote:
> This patch update the current gpio hog implementation with
> the new API gpio_hog_probe_all() actviated with CONFIG_GPIO_HOG.
s/actviated/activated
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/dhelectronics/dh_stm32mp1/board.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
> index 26e827bc38..ac9dc4b52c 100644
> --- a/board/dhelectronics/dh_stm32mp1/board.c
> +++ b/board/dhelectronics/dh_stm32mp1/board.c
> @@ -513,17 +513,11 @@ static void board_init_fmc2(void)
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

You can add my reviewed-by with the typo fixed

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

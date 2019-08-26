Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 262509D0FD
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Aug 2019 15:47:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74742C36B3F
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Aug 2019 13:47:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 747D4C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2019 13:47:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7QDlOgn018353; Mon, 26 Aug 2019 15:47:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=kCzk6OL4dQ+yqLISw6ASdLY1ivc32u0L819jHbX62fY=;
 b=t/3BphIwyKWVouFE6fFeR5GSjVNnUDN7p5WYPkjzWbNLtE/AC6jcx2Zu8sDnUX7dOcXc
 2J+gQYd2zM0dijGgHz1JK9A72blXQnkJ3FgygCMFYY9i7YLuFPjnQFEVU33G8rX3tZAe
 kOujNFEg+F449nTEsvfixUkDrc9S0qoZbdpH423z1tdmnjgZZJzoP94o9ixqJGpzFzXg
 tgWG5rgToHWWq4HDIgbH2YyzK55isKTjZoFozzSrxzKBgwJ7O9F6fe4+PCJH7nt76pSe
 9/J+NhuVS+/tVdz42mrzP+rqVITwFIJQKudg0ag07HwESF9USzHiN5sUIdzbDdeIMrwf rQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2ujtcbc8kj-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 26 Aug 2019 15:47:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 37A3231;
 Mon, 26 Aug 2019 13:47:34 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B3AD2220CA;
 Mon, 26 Aug 2019 15:47:34 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 26 Aug
 2019 15:47:33 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 26 Aug 2019 15:47:33 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] mmc: stm32_sdmmc2: Increase SDMMC_BUSYD0END_TIMEOUT_US
Thread-Index: AQHVQHGZLPzSLkKNDUuM/PE1+Yyrv6cNhzWA
Date: Mon, 26 Aug 2019 13:47:33 +0000
Message-ID: <b5433bd2-0372-b03c-7df0-957930587830@st.com>
References: <20190722094110.7789-1-patrice.chotard@st.com>
In-Reply-To: <20190722094110.7789-1-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <D733E3A9F1EDA64EB869BA823E58A075@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-26_07:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Peng Fan <peng.fan@nxp.com>, Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] mmc: stm32_sdmmc2: Increase
	SDMMC_BUSYD0END_TIMEOUT_US
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


On 7/22/19 11:41 AM, Patrice Chotard wrote:
> Increase SDMMC_BUSYD0END_TIMEOUT_US from 1s to 2s to
> avoid timeout error during blocks erase on some sdcard
>
> Issue seen on Kingston 16GB :
>   Device: STM32 SDMMC2
>   Manufacturer ID: 27
>   OEM: 5048
>   Name: SD16G
>   Bus Speed: 50000000
>   Mode: SD High Speed (50MHz)
>   card capabilities: widths [4, 1] modes [SD Legacy, SD High Speed (50MHz)]
>   host capabilities: widths [4, 1] modes [MMC legacy, SD Legacy, MMC High Speed (26MHz), SD High Speed (50MHz), MMC High Speed (52MHz)]
>   Rd Block Len: 512
>   SD version 3.0
>   High Capacity: Yes
>   Capacity: 14.5 GiB
>   Bus Width: 4-bit
>   Erase Group Size: 512 Bytes
>
> Issue reproduced with following command:
>
> STM32MP> mmc erase 0 100000
>
> MMC erase: dev # 0, block # 0, count 1048576 ... mmc erase failed
> 16384 blocks erased: ERROR
>
> By by setting SDMMC_BUSYD0END_TIMEOUT_US at 2 seconds and by adding
> time measurement in stm32_sdmmc2_end_cmd() as shown below:
>
> 	+start = get_timer(0);
> 	/* Polling status register */
> 	ret = readl_poll_timeout(priv->base + SDMMC_STA,
> 				 status, status & mask,
>  				 SDMMC_BUSYD0END_TIMEOUT_US);
>
> 	+printf("time = %ld ms\n", get_timer(start));
>
> We get the following trace:
>
> STM32MP> mmc erase 0  100000
>
> MMC erase: dev # 0, block # 0, count 1048576 ...
> time = 17 ms
> time = 1 ms
> time = 1025 ms
> time = 54 ms
> time = 56 ms
> time = 1021 ms
> time = 57 ms
> time = 56 ms
> time = 1020 ms
> time = 53 ms
> time = 57 ms
> time = 1021 ms
> time = 53 ms
> time = 57 ms
> time = 1313 ms
> time = 54 ms
> time = 56 ms
> time = 1026 ms
> time = 54 ms
> time = 56 ms
> time = 1036 ms
> time = 54 ms
> time = 56 ms
> time = 1028 ms
> time = 53 ms
> time = 56 ms
> time = 1027 ms
> time = 54 ms
> time = 56 ms
> time = 1024 ms
> time = 54 ms
> time = 56 ms
> time = 1020 ms
> time = 54 ms
> time = 57 ms
> time = 1023 ms
> time = 54 ms
> time = 56 ms
> time = 1033 ms
> time = 53 ms
> time = 57 ms
> ....
> time = 53 ms
> time = 57 ms
> time = 1021 ms
> time = 56 ms
> time = 56 ms
> time = 1026 ms
> time = 54 ms
> time = 56 ms
> 1048576 blocks erased: OK
>
> We see that 1 second timeout is not enough, we also see one measurement
> up to 1313 ms. Set the timeout to 2 second to keep a security margin.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>
>  drivers/mmc/stm32_sdmmc2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
> index 867ed569eb..0ade1b160e 100644
> --- a/drivers/mmc/stm32_sdmmc2.c
> +++ b/drivers/mmc/stm32_sdmmc2.c
> @@ -190,7 +190,7 @@ struct stm32_sdmmc2_ctx {
>  #define SDMMC_IDMACTRL_IDMAEN		BIT(0)
>  
>  #define SDMMC_CMD_TIMEOUT		0xFFFFFFFF
> -#define SDMMC_BUSYD0END_TIMEOUT_US	1000000
> +#define SDMMC_BUSYD0END_TIMEOUT_US	2000000
>  
>  static void stm32_sdmmc2_start_data(struct stm32_sdmmc2_priv *priv,
>  				    struct mmc_data *data,


Applied on STM32 tree

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

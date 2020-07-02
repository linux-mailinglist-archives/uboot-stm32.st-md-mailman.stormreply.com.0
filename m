Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 245D1211C6E
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:08:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4A62C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:08:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF81EC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:08:48 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 062749Rx028855; Thu, 2 Jul 2020 09:08:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=iLF/Tmc0x3mQyfiIpJUaRG6ZrCz6mucz2PANg7XlJAA=;
 b=YHG5PvPC/QfQm1IDPXB3ZGInL+QQ33ESiwLSv8lOOauK69FO/oLk6XuA0yW/p01WWjvV
 E+WMKMTeBtoh3BdAlilufdTRvw1yZ0GXHbsOxzzOryManI6wzzphTltDZ2OHoruPq25B
 7zFBCAGbP2kD5+Gr80QT0ulA/YrIatmTJ5dLT6DNBlMLKwr8yBZKZiqc/vCSzTclXak4
 OBP/4W19I8yjzMCfo0J36kCExvHJmpKrxDCVMnMz/IOp40giMUYWas9pj0bp95R/cm3r
 et9K2J7Sl61tIugSDMxtyFDUjtqT/ILnvOJ8CgiwRKFPb7tPo84RUDGKGy03yta1Klh8 Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuk1pd5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:08:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E95D710002A;
 Thu,  2 Jul 2020 09:08:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD52B2124D1;
 Thu,  2 Jul 2020 09:08:45 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 2 Jul
 2020 09:08:45 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:08:45 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] configs: stm32mp1: only support SD card
 after NOR in bootcmd_stm32mp
Thread-Index: AQHWUD+gCl4/wlbl/EaRhDIundm7qg==
Date: Thu, 2 Jul 2020 07:08:45 +0000
Message-ID: <f0de701b-dbef-05ca-af1b-07577919c27b@st.com>
References: <20200616183025.1.If8226d1def9705c94aa14c3d9cc8dac493ad4a5a@changeid>
In-Reply-To: <20200616183025.1.If8226d1def9705c94aa14c3d9cc8dac493ad4a5a@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <7F2A643BB3EC03408917BB993DADD037@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp1: only support SD card
 after NOR in bootcmd_stm32mp
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

Hi

On 6/16/20 6:30 PM, Patrick Delaunay wrote:
> In the boot command used in ST boards, bootcmd_stm32mp, only support
> the SD card as second stage, where is found the bootfs with DISTRO.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  include/configs/stm32mp1.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
> index f271b84a59..baaf2ff89c 100644
> --- a/include/configs/stm32mp1.h
> +++ b/include/configs/stm32mp1.h
> @@ -123,7 +123,7 @@
>   * for serial/usb: execute the stm32prog command
>   * for mmc boot (eMMC, SD card), boot only on the same device
>   * for nand or spi-nand boot, boot with on ubifs partition on UBI partition
> - * for nor boot, use the default order
> + * for nor boot, use SD card = mmc0
>   */
>  #define STM32MP_BOOTCMD "bootcmd_stm32mp=" \
>  	"echo \"Boot over ${boot_device}${boot_instance}!\";" \
> @@ -136,6 +136,8 @@
>  		"if test ${boot_device} = nand ||" \
>  		  " test ${boot_device} = spi-nand ;" \
>  		"then env set boot_targets ubifs0; fi;" \
> +		"if test ${boot_device} = nor;" \
> +		"then env set boot_targets mmc0; fi;" \
>  		"run distro_bootcmd;" \
>  	"fi;\0"
>  

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

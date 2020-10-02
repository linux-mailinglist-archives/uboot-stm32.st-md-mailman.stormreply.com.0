Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8469D281131
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Oct 2020 13:29:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39F9DC3FAFF;
	Fri,  2 Oct 2020 11:29:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD94CC3089F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 11:29:33 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 092BQi4V019746; Fri, 2 Oct 2020 13:29:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=HDEB0/E/feOS8h8+sLIqglcaPMxWZCFvaZIDH13/58s=;
 b=hOjHvVGP/aMk3q3qb4nAW6aWQII+g8+GS5UGQtetz0wBXDSUXB35TTBCOmb/DmtmDxcO
 TO3g3+anOILUwIXwC8cV2+bkHiE+NOs5C/0KPxRyzEc1IQtTc+/Duo2WP3UOqP7haEUK
 Euh4LfW7rNNL7rFwI01724in9dTHCmAJavoaEzG7pQ15wGttMYmpdkhwQSZ5B3EfE02L
 4QOJqJw9Z2h4s9FwZErmeyBrEZCdzMS34NgC3B4529MmbZnKsDZcQPhRJ3JFh+hluak/
 ypzfny0XLScvHzg6/E76sWM9rpMKeKm2+usLQS1nHtYMj+pbJkt579SGAsv168hJCYZH Xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33sts8bbsf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Oct 2020 13:29:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C4C1710002A;
 Fri,  2 Oct 2020 13:29:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB32D2B8A06;
 Fri,  2 Oct 2020 13:29:31 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 13:29:21 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 2 Oct 2020 13:29:21 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 3/4] configs: stm32mp1: enable the fastboot
 oem command partconf
Thread-Index: AQHWmK9Fc8tpq/qtmEK2XDRsFwo9xA==
Date: Fri, 2 Oct 2020 11:29:21 +0000
Message-ID: <64207a04-c574-3d08-102e-c07f57fcccee@st.com>
References: <20200909152426.1.Ie383431427f46a688dc1f0932522d8f34f3192a5@changeid>
 <20200909152426.3.Ifc72cc530e2479312583fe81352d9f58b63388fe@changeid>
In-Reply-To: <20200909152426.3.Ifc72cc530e2479312583fe81352d9f58b63388fe@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <1AF06F516FE9D140B08B83F89A4B98E9@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-02_06:2020-10-02,
 2020-10-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 3/4] configs: stm32mp1: enable the
 fastboot oem command partconf
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

On 9/9/20 3:24 PM, Patrick Delaunay wrote:
> Enable the fastboot oem command partconf, used to select the correct
> eMMC boot partition, with same format than 'mmc partconf'
> with parameter: boot_ack boot_partition
> On stm32mp1 family:
> - boot_ack = 1 (Boot Acknowledge is needed by ROM code)
> - boot_partition = 1 or 2 (Boot partition 1 / 2 enabled for boot)
>
> So on EV1 board the expected commands to select boot partition 1 or 2
> $> fastboot oem partconf:1 1
> $> fastboot oem partconf:1 2
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  configs/stm32mp15_basic_defconfig   | 1 +
>  configs/stm32mp15_trusted_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 0f705eccb2..6cbfbe5274 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -86,6 +86,7 @@ CONFIG_FASTBOOT_MMC_BOOT2_NAME="mmc1boot1"
>  CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
>  CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
>  CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
> +CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
>  CONFIG_DM_HWSPINLOCK=y
>  CONFIG_HWSPINLOCK_STM32=y
>  CONFIG_DM_I2C=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 3e9cca6a1e..cc114896df 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -66,6 +66,7 @@ CONFIG_FASTBOOT_MMC_BOOT2_NAME="mmc1boot1"
>  CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
>  CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
>  CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
> +CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
>  CONFIG_DM_HWSPINLOCK=y
>  CONFIG_HWSPINLOCK_STM32=y
>  CONFIG_DM_I2C=y

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

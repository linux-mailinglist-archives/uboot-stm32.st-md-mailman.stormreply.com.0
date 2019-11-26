Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0474109AAA
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 10:04:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 542C3C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 09:04:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA8AFC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2019 09:04:11 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQ93vXd002879; Tue, 26 Nov 2019 10:04:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=dnVo1RuXovg8yQd/rnreebjMQyiQUFNh0h0RNRWWDKA=;
 b=gcTdk3bZekKOMpwQCnjp2naYzHvhE5DmV0RAGOkse+DTaB2OJmq0xv/uZwkf6+vGJlBk
 80sVo/B1uwCUFm6yWVsVbg3cwS/wrbCAiSvHp+hnxcAjoujSYICtfd57sTt2Cistg9YL
 oM1VrLoCWBIWSMraPe4L+vkIxp6v9KJms8pJpIOXR02a1GV7f65q1dsvzsaQjUOIDyeE
 G0kvbpZCZRPnExd5E6CC6T3NkZrqEtcz92sfWKkIyOJETTzp5o4JJF8BgXBDV30NyD3K
 P5mQdbUlEptupelq3YaayPUxgz4jCibx71BwQKuvpWo5Yw5hOQn5DZilC4fdBpnpxU0+ 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2weu42e0tc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 10:04:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4B257100039;
 Tue, 26 Nov 2019 10:03:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 432102ACE7E;
 Tue, 26 Nov 2019 10:03:42 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 26 Nov
 2019 10:03:41 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 26 Nov 2019 10:03:41 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] configs: stih410-b2260: Enable DM_ETH flag
Thread-Index: AQHVm6Ny4XPDGthbsUCVMkDY4lQlkKedOQrQ
Date: Tue, 26 Nov 2019 09:03:41 +0000
Message-ID: <8f99b2f555f74d9992372eb7ab0a9664@SFHDAG6NODE3.st.com>
References: <20191115105703.27406-1-patrice.chotard@st.com>
In-Reply-To: <20191115105703.27406-1-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_01:2019-11-26,2019-11-26 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stih410-b2260: Enable DM_ETH flag
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

Hi Patrice,

> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: vendredi 15 novembre 2019 11:57
> 
> This patch allows to fix the following compilation warning:
> 
> ===================== WARNING ====================== This board
> does not use CONFIG_DM_ETH (Driver Model for Ethernet drivers). Please
> update the board to use CONFIG_DM_ETH before the v2020.07 release. Failure to
> update by the deadline may result in board removal.
> See doc/driver-model/migration.rst for more info.
> ====================================================
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

> ---
> 
>  configs/stih410-b2260_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/stih410-b2260_defconfig b/configs/stih410-b2260_defconfig
> index aeebeeca04..63eac131f9 100644
> --- a/configs/stih410-b2260_defconfig
> +++ b/configs/stih410-b2260_defconfig
> @@ -31,6 +31,7 @@ CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
> CONFIG_MISC=y  CONFIG_MMC_SDHCI=y  CONFIG_MMC_SDHCI_STI=y
> +CONFIG_DM_ETH=y
>  CONFIG_PHY=y
>  CONFIG_STI_USB_PHY=y
>  CONFIG_PINCTRL=y
> --
> 2.17.1

Regards
Parick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

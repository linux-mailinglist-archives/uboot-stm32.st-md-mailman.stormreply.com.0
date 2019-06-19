Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D864BC3E
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Jun 2019 17:03:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 864F4C5C2A4
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Jun 2019 15:03:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5693AC5C2A0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 15:03:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JF2aqu005329; Wed, 19 Jun 2019 17:03:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=5842EH8tjIsJqAbDl56PmDig1DQ0YQZdvCuMgaYCa6o=;
 b=HiB4Q/W+aGhNqHymivM9hOi0Fzz1snEZ8G2gqvRFAreXEpSeyTsTwuDmT3AdVsA7sgbo
 y8eyBBkV6r8V4YKI8szH5KI/jgah4u/fNCJKVVXClaq5inNuH47cM4GaeDRnLH5t4D36
 ISOrcvvZRw5MDM0admO16s0CEbOrotuaOaszb7RnrEPVOr5X2V+jLyGXJFXB1xx4XTlE
 eNZb+xRy6LOOq2oUAu7bEFQmhL1C9NG8mg+GAeTcGt/4N2HlBuI9rw8pMLqFIBCAJjCd
 w/P8fOakihoCuDQk6+u5uvMWTQ7c8N1pdGzp4ejeB9AVUyMg8lCWrpT8qLSnhVoPiRTF ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t7812vpnb-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 19 Jun 2019 17:03:32 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9EEEC34;
 Wed, 19 Jun 2019 15:03:31 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 861B62AE5;
 Wed, 19 Jun 2019 15:03:31 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 19 Jun
 2019 17:03:31 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 19 Jun 2019 17:03:31 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] configs: stm32mp15: Select correct Ethernet driver for
 trusted mode
Thread-Index: AQHVJOHqEtUgY8ejP0KISmZeLh4+Iaai9QQA
Date: Wed, 19 Jun 2019 15:03:31 +0000
Message-ID: <df4ffca0-b23c-108b-a57a-fadb78617316@st.com>
References: <20190617075431.13629-1-patrice.chotard@st.com>
In-Reply-To: <20190617075431.13629-1-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <0F8524E44B8BED4397F5738A95451BC5@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp15: Select correct
 Ethernet driver for trusted mode
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


On 6/17/19 9:54 AM, Patrice Chotard wrote:
> Select the correct Ethernet driver from Synopsis.
> Initially, "Synopsys Designware Ethernet MAC" driver was wrongly
> selected instead of "Synopsys DWC Ethernet QOS device" driver.
>
> Fixes: commit f90b3f5b68ed ("configs: stm32mp15: Enable Ethernet feature")
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>
>  configs/stm32mp15_trusted_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 66361c8715..5fe9477823 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -73,7 +73,7 @@ CONFIG_SPI_FLASH_WINBOND=y
>  # CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
>  CONFIG_SPI_FLASH_MTD=y
>  CONFIG_DM_ETH=y
> -CONFIG_ETH_DESIGNWARE=y
> +CONFIG_DWC_ETH_QOS=y
>  CONFIG_PHY=y
>  CONFIG_PHY_STM32_USBPHYC=y
>  CONFIG_PINCONF=y

Applied to u-boot-stm

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

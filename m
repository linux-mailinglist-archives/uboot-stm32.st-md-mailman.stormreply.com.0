Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D292A19A6DD
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 10:09:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E590C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 08:09:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60008C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 08:09:03 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03188qFN022511; Wed, 1 Apr 2020 10:09:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=EluYuU5cXgOGWy7K/72uZUNyXnc4Ta9rKz+JSpAG8rI=;
 b=G4fTiP+jg6R09RioAJDEy5YAu4n5qXP563WGn+HuVcK5diBnEFCBGvHRrv+w/3mZeHPj
 3HMfyZgQvv8jsmhlodI/d1YSzJhJfomrb7Mzwtct55qgnGQ4Jctyxq0KXJGyupqV1BsI
 ZRLRwnf4PTT6SD6+ZtcEKZM8DbyhxxNAtiKs98jwTrby9FRNJlQngJnn5mQLB2ZpCKl7
 kiP0qmEXTrVmBUALeLwk6tsJVO+LGY818PqvN208/LzS9rlsaY1LuBcj9ps9OOCCl7/1
 CgVZaPni9yCrmNbHkEXWPrcIi/xGa1K7DqO4a/JgPRSO0om60PyvJjT04qB5/heeuU23 FQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 302y53wu0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 10:09:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1978D100034;
 Wed,  1 Apr 2020 10:08:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D1A82126A1;
 Wed,  1 Apr 2020 10:08:57 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Apr
 2020 10:08:50 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 1 Apr 2020 10:08:50 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 15/16] configs: stm32mp1: activate Ethernet
 PHY Realtek
Thread-Index: AQHWB/zGkd2WiYWSuE6A5ChPNhW6oQ==
Date: Wed, 1 Apr 2020 08:08:50 +0000
Message-ID: <01d08fbd-9f56-b1b6-7035-75376bca736d@st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.15.I7cedf843510610b1a89f70db103e9f4c3e264560@changeid>
In-Reply-To: <20200331180330.15.I7cedf843510610b1a89f70db103e9f4c3e264560@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <FD06377B84E2F14BBFA8DD819F5341E9@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe ROULLIER <christophe.roullier@st.com>
Subject: Re: [Uboot-stm32] [PATCH 15/16] configs: stm32mp1: activate
 Ethernet PHY Realtek
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

HI Patrick

On 3/31/20 6:04 PM, Patrick Delaunay wrote:
> From: Christophe Roullier <christophe.roullier@st.com>
>
> Need Realtek driver to manage in RTL8211F the configuration of the LED.
> Initialize LCR (LED Control Register) to configure green LED for Link,
> yellow LED for Active
>
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  configs/stm32mp15_basic_defconfig   | 1 +
>  configs/stm32mp15_trusted_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 6d82365348..30cfb8d8e1 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -101,6 +101,7 @@ CONFIG_SPI_FLASH_WINBOND=y
>  # CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
>  CONFIG_SPI_FLASH_MTD=y
>  CONFIG_SPL_SPI_FLASH_MTD=y
> +CONFIG_PHY_REALTEK=y
>  CONFIG_DM_ETH=y
>  CONFIG_DWC_ETH_QOS=y
>  CONFIG_PHY=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 6928e9a65c..aefad2b109 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -86,6 +86,7 @@ CONFIG_SPI_FLASH_STMICRO=y
>  CONFIG_SPI_FLASH_WINBOND=y
>  # CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
>  CONFIG_SPI_FLASH_MTD=y
> +CONFIG_PHY_REALTEK=y
>  CONFIG_DM_ETH=y
>  CONFIG_DWC_ETH_QOS=y
>  CONFIG_PHY=y

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

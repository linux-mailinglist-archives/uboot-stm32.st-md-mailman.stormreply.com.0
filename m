Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDA8D43F3
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Oct 2019 17:15:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EAB9C36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Oct 2019 15:15:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AA36C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 15:15:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9BF6AX6012862; Fri, 11 Oct 2019 17:15:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=0w3Mdss44VYzyR11wJ4IedvOYBG/F+2RHZgJy6zpfyw=;
 b=dm4qSvce84cklBp4gKMLIJ/TeHkZZVk8f1V2UJWcL+7IjwYvWReoRmC3GbpJVChes4uJ
 xJlPpUThpN6qoqMeuOM+uYYRtZAB8vkc8CR5AnmF7coUnRoSGu8zYLXAirPUpwh7g4Q8
 2pQRgazqLdpuY3WTtHpQyktQSFrTVEDwGlQLRlxuxtH5+XQQRMmx+C7MpJB8sgTZfYCj
 YEJUIWUtlvMwGq4LfG0nOTalObns9aIbnXQzdNPkn7EqZbXFBMPyRtFk3JRw5uNA8NLa
 QygCEMnGG6iSq5CyZ9M8DoCRmRazBdIg9UimaV0VcCyFJ3H54ai9e18GpKuJP/1MZnT4 +Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vej2pu0ky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2019 17:15:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A118010002A;
 Fri, 11 Oct 2019 17:15:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 99BD92B6463;
 Fri, 11 Oct 2019 17:15:20 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Oct
 2019 17:15:19 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 11 Oct 2019 17:15:20 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 3/5] configs: stm32f469-discovery: Disable CONFIG_NET flag
Thread-Index: AQHVbS9My+UKWPXFz06oDbhMRSKEgqdVsuQw
Date: Fri, 11 Oct 2019 15:15:20 +0000
Message-ID: <2b0764c988394c7ab0772efdfe8af886@SFHDAG6NODE3.st.com>
References: <20190917080946.9593-1-patrice.chotard@st.com>
 <20190917080946.9593-4-patrice.chotard@st.com>
In-Reply-To: <20190917080946.9593-4-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-11_09:2019-10-10,2019-10-11 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 3/5] configs: stm32f469-discovery: Disable
	CONFIG_NET flag
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

Hi,

> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: mardi 17 septembre 2019 10:10
> 
> Network support was never added on this board, disable CONFIG_NET flag to
> avoid following warning:
> 
> ===================== WARNING ====================== This board
> does not use CONFIG_DM_ETH (Driver Model for Ethernet drivers). Please
> update the board to use CONFIG_DM_ETH before the v2020.07 release. Failure to
> update by the deadline may result in board removal.
> See doc/driver-model/migration.rst for more info.
> ====================================================

Acked-by: Patrick Delaunay <patrick.delaunay@st.com>

> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
> 
>  configs/stm32f469-discovery_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/stm32f469-discovery_defconfig b/configs/stm32f469-
> discovery_defconfig
> index dcd0697677..5cedb765d1 100644
> --- a/configs/stm32f469-discovery_defconfig
> +++ b/configs/stm32f469-discovery_defconfig
> @@ -18,12 +18,12 @@ CONFIG_CMD_GPT=y
>  CONFIG_CMD_MMC=y
>  CONFIG_CMD_SF=y
>  # CONFIG_CMD_SETEXPR is not set
> -# CONFIG_CMD_MII is not set
>  CONFIG_CMD_CACHE=y
>  CONFIG_CMD_TIMER=y
>  # CONFIG_ISO_PARTITION is not set
>  CONFIG_OF_CONTROL=y
>  CONFIG_DEFAULT_DEVICE_TREE="stm32f469-disco"
> +# CONFIG_NET is not set
>  CONFIG_DM_MMC=y
>  CONFIG_ARM_PL180_MMCI=y
>  CONFIG_MTD=y
> --
> 2.17.1

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

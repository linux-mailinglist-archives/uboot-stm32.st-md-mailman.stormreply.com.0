Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF115E79C2
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Sep 2022 13:38:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64CB3C03FE0;
	Fri, 23 Sep 2022 11:38:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 740B3C03FD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 11:38:48 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28N9a1lc019845;
 Fri, 23 Sep 2022 13:38:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=847SpBZU9GNOX0vv6CCakjpIY+Szj4yF3uwlBYFORT4=;
 b=KFOINM5bOFmGFopJdvjrs5MZWsUkZj2GCi/W7e33O2goHHi+jiasePCsA7FQ7aTRuSik
 X3UpLLxyEL1TRyC+b67PmChbGYDWgwhziRDozdKVuYHv9NpFF2H1hODJLh2Tg3rpInU5
 i06/3GtYfHCZ+jFB2r44gwI01D7wgFsj8G0SZ5PTx3YV1kMGNyThLAMqqNescXlWpJch
 WvfezHQzRvsayP+sGcKDZxJvg4ByqT7KhplAJOl6EP/pu/6J1YJir/G5h/sJdbOsjssc
 i1DcS+sOAMKjtjxnzogpg5K/7A7PHrPqzI7Srl3GTvLSEuuSQQm8Zs8giuBWWxMAge2H iQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsaaf8ph4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Sep 2022 13:38:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 33E1810002A;
 Fri, 23 Sep 2022 13:38:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F45F226FC9;
 Fri, 23 Sep 2022 13:38:47 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.50) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 23 Sep
 2022 13:38:46 +0200
Message-ID: <5245fb3f-76d1-82f8-4be5-a53cbb1b7e6e@foss.st.com>
Date: Fri, 23 Sep 2022 13:38:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220912174045.1.Iae28ab1a0be932b26f9cf8b17d870508efa88b79@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220912174045.1.Iae28ab1a0be932b26f9cf8b17d870508efa88b79@changeid>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-23_04,2022-09-22_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] board: st: stm32mp1: use of correct
 compatible string to add partitions
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

On 9/12/22 17:40, Patrick Delaunay wrote:
> From: Christophe Kerello <christophe.kerello@foss.st.com>
> 
> Current compatible string used to update SPI NAND and SPI NOR devices
> can lead to a wrong partitions update (for example, SPI NAND partitions
> added to SPI NOR node in the device tree). To avoid this wrong behavior,
> use jedec,spi-nor compatible string for SPI NOR devices and spi-nand
> compatible string for SPI NAND devices.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  board/st/stm32mp1/stm32mp1.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 8c162b42a59..7dc26f850ff 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -898,8 +898,8 @@ int mmc_get_env_dev(void)
>  int ft_board_setup(void *blob, struct bd_info *bd)
>  {
>  	static const struct node_info nodes[] = {
> -		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_NOR,  },
> -		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_SPINAND},
> +		{ "jedec,spi-nor",		MTD_DEV_TYPE_NOR,  },
> +		{ "spi-nand",			MTD_DEV_TYPE_SPINAND},
>  		{ "st,stm32mp15-fmc2",		MTD_DEV_TYPE_NAND, },
>  		{ "st,stm32mp1-fmc2-nfc",	MTD_DEV_TYPE_NAND, },
>  	};

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
